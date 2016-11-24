<?php 
use yii\helpers\Html;
use app\modules\business\models\CustomerDetails;
use app\modules\business\models\BalanceSheet;
use app\modules\business\models\Transactions;
use app\modules\business\models\MaterialTypes;
?>
<html>
<head>
<title>Invoice Details</title>
<link rel="stylesheet" type="text/css" href="<?php echo Yii::$app->request->baseUrl;?>/css/print-receipt.css" media="screen, print, projection" />
</head>
<body>

<div id="pcr">
<?php $orgData = \app\models\Organization::find()->asArray()->one(); ?>

<table >
	<tr>
		<td colspan=3 class="text-left padding-left padding-right" style="border-bottom:1px solid #000;height:80px">
		<table>
			<tr>
				<td rowspan=2 width="25%"><?php echo Html::img(Yii::$app->urlManager->createUrl('/site/loadimage'), []); ?></td>
				<td class="text-left org-title"><?php echo $orgData['org_name']; ?></td>
			</tr>
			<tr><td class="text-left org-address"><?php echo $orgData['org_address_line1']; ?></td></tr>
		</table>
		</td>
	</tr>


	
        <tr>
        <td colspan=3 class="text-left padding-left"><?php echo "<b>".$model->getAttributeLabel('name')." : </b>".$model->name;?></td>
        </tr>
        
        <!--<tr>
        <td colspan=3 class="text-left padding-left"><?php echo "<b>".$model->getAttributeLabel('address')." : </b>".$model->address;?></td>
        </tr>-->
        
        <tr>
        <td class="text-left padding-left" colspan=3><?php echo "<b>".$model->getAttributeLabel('phone')." : </b>".$model->phone; ?></td>
        </tr>
        <tr>
        <th colspan=3 style="padding:1%;" class="border-none">Invoice Details</th>
        </tr>
        
        <tr>
		<td colspan=3 class="padding-left padding-right">
		
		
            <?php
            $sheet_from= $transaction->from_sheet_id;
            $sheet_to =$transaction->to_sheet_id;
            $sheet_ids=$transaction->sheet_ids;
            $trip_id =Yii::$app->params['tripId'];


            $previous_balance = isset($transaction->balance)?$transaction->previous_balance:0;
            $totalAmount = $totalPay = $advance_total =$return_total= 0;
            $sheet_ids =$sheet_ids?$sheet_ids:0;
            $feesDetails = BalanceSheet::find()->with(['materials','trip'])->where("id in($sheet_ids) AND customer_id='$model->id'")->all();
            echo '<table class="table table-border" style="width:100%;">';
            echo '<col class="col-xs-1">';
            echo '<col class="col-xs-9">';
            echo '<col class="col-xs-2">';
            echo '<tr>';
            echo '<th width="55px;">#</th>';
            echo '<th>Product</th>';
            
            
            echo '<th width="120px;">Date</th>';
            echo '<th>Amount</th>';
            echo '</tr>';
            if($feesDetails){
            foreach($feesDetails as $key=>$value) {
            //print_r($value->trip);
            echo '<tr>';
            echo '<td>'.($key+1).'</td>';	
            if($value->trip_id==$trip_id){
            echo '<td>Advance</td>';
            echo '<td>'.date("d-m-Y",strtotime($value['created_on'])).'</td>';                
            }else{
            
            $products = '';
            if($value->trip->returns=="yes"){
                       $products .="<b>Return :</b> ";
                       }
            if($value->materials)
            {
                foreach($value->materials as $material)
                {
                $products .= $material->material->name.' - '.$material['unit_price'].' X '.$material['quantity'].' = '.$material['price'].', ';
                }
                $products = rtrim($products,', ');
            }else $products = "Purchase";	            
            
            
             echo '<td>'.$products.'</td>';
             echo '<td>'.date("d-m-Y",strtotime($value['created_on'])).'</td>';
            }


            echo '<td  align="center">'.abs($value['amount']).'</td>';
            echo '</tr>';
            
           if($value['amount'] > 0) 
		{
		$totalAmount+=$value['amount'];
                }else{
                    if($value->trip->returns=="yes"){
                        $return_total += $value['amount'];
                    }else{
                        $advance_total += $value['amount'];
                    }
		}         
            }

            $colspan=3;

            echo '<tr><th colspan='.$colspan.' class="text-right col-md-9" align="left">Total</th><td  
align="center"><b>'.$totalAmount.'</b></td></tr>';
            }else{
            echo "<tr><td colspan=4> No trip to show</td></tr>";
            }
            $grandTotal = $totalAmount+$previous_balance;
            $colspan=3;

            echo '<tr><th colspan='.$colspan.' class="text-right col-md-9"  align="left">Previous Balance</th><td  
align="center">'.$previous_balance.'</td></tr>';

            echo '<tr><th colspan='.$colspan.' class="text-right col-md-9" align="left">Grand Amount</th><td  
align="center"><b>'.$grandTotal.'</b></td></tr>';

			if($advance_total)
			{
			echo '<tr><th colspan='.$colspan.' class="text-right col-md-9" align="left">Deducting Advance</th><td align="center">'.abs($advance_total).'</td></tr>';
			echo '<tr><th colspan='.$colspan.' class="text-right col-md-9" align="left">Effective Amount</th><td 
align="center">'.($grandTotal=$grandTotal + $advance_total).'</td></tr>';
			}
			
			 if($return_total)
    {
     echo '<tr><th colspan='.$colspan.' class="text-right col-md-9">Deducting Returns</th><td align="center">'.abs($return_total).'</td></tr>';
      echo '<tr><th colspan='.$colspan.' class="text-right col-md-9">Effective Amount</th><td align="center">'.($grandTotal=$grandTotal + 
$return_total).'</td></tr>';
    }	

            echo '</table>';

            ?>
		

		
		
		
		</td>
	</tr>
	
	<tr>
		<th class="border-none text-left padding-left" colspan=3 style="height:50px">Payment History</th>
	</tr>
	
	<tr>
		<td colspan=3 class="padding-left padding-right" style="padding-bottom:2%;">
		
		<?php $stuFeesData = app\modules\business\models\Payments::find()->where(['customer_id'=>$model->id])->asArray()->limit(1)->orderBy([
                    'id' => SORT_DESC,
	        ])->all(); ?>

		<table class="table table-border" style="width:100%;">
			<tr class="header">
				<th>SI.No</th>
				<th>Date</th>
				<th>Amount</th>
			</tr>
		<?php
		if($stuFeesData){
		foreach($stuFeesData as $key=>$value) {
				echo '<tr>';
				echo '<td class="text-center">'.($key+1).'</td>';
				echo '<td class="text-center">'.Yii::$app->formatter->asDate($value['date']).'</td>';
				echo '<td class="text-center">'.$value['amount'].'</td>';
				
				echo '</tr>';
		      } }else{
                        echo "<tr> <td colspan='3' align='center'> No data found.</td></tr>";
		      }?>
		</table>
		
		
		
		</td>
	</tr>
        </table>
  
	
	
	
</div>
</body>
</html>
