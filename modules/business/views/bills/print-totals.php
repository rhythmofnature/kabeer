<?php 
use yii\helpers\Html;
use app\modules\business\models\CustomerDetails;
use app\modules\business\models\BalanceSheet;
use app\modules\business\models\Transactions;
?>
<html>
<head>
<title>Invoice Details</title>
<link rel="stylesheet" type="text/css" href="<?php echo Yii::$app->request->baseUrl;?>/css/print-receipt.css" media="screen, print, projection" />
</head>
<body>

<div id="pcr">
<?php $orgData = \app\models\Organization::find()->asArray()->one(); ?>

<table class="table table-bordered table-main">
	<tr>
		<td colspan=3 class="text-left padding-left padding-right" style="border-bottom:1px solid #000;height:80px">
		<table>
			<tr>
				<td rowspan=2><?php echo Html::img(Yii::$app->urlManager->createUrl('/site/loadimage'), ['style'=>'width:70px; 
height:50px']); ?></td>
				<td class="text-left org-title"><?php echo $orgData['org_name']; ?></td>
			</tr>
			<tr><td class="text-left org-address"><?php echo $orgData['org_address_line1']; ?></td></tr>
		</table>
		</td>
	</tr>


        <tr>
        <th colspan=3 style="padding:1%;" class="border-none">Pending Payment Details</th>
        </tr>
        
        <tr>
		<td colspan=3 class="padding-left padding-right">
		
		
            <?php
            $totalAmount = 0;
            $sl_no = 0;
            echo '<table class="table table-border" style="width:100%;">';
            echo '<col class="col-xs-1">';
            echo '<col class="col-xs-9">';
            echo '<col class="col-xs-2">';
            echo '<tr>';
            echo '<th class="">SI No.</th>';
            echo '<th>Name</th>';
            echo '<th>Place</th>';
            echo '<th width="10%">Phone Number</th>';
            echo '<th>Amount</th>';
            echo '</tr>';
            if($data){
            foreach($data as $key=>$value) {
            echo '<tr>';
            echo '<td>'.++$sl_no.'</td>';	

            echo '<td>'.$value['name'].'</td>';
            echo '<td>'.$value['place'].'</td>';
            echo '<td>'.$value['phone'].'</td>';
            echo '<td>'.$value['amount'].'</td>';
            echo '</tr>';
            $totalAmount+=$value['amount'];
            }

            echo '<tr><th colspan="4" class="text-right col-md-9">Total</th><td>'.$totalAmount.'</td></tr>';
            }else{
            echo "<tr><td colspan=5> No pending amount to show</td></tr>";
            }
            echo '</table>';

            ?>
		

		
		
		
		</td>
	</tr>
        </table>
  
	
	
	
</div>
</body>
</html>
