<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use yii\jui\DatePicker;
use yii\helpers\Url;
use yii\data\ActiveDataProvider;
use yii\grid\GridView;
use app\modules\business\models\CustomerDetails;
use app\modules\business\models\BalanceSheet;
use app\modules\business\models\Transactions;


$this->title = "Generate Bill";
$this->params['breadcrumbs'][] = ['label' => 'Bills', 'url'=>['/index']];
$this->params['breadcrumbs'][] = ['label' => $this->title];

?>
<div class="col-xs-12 col-lg-12">

<!------------Start Display Block Of Student Details----------->

  <div class="<?php echo $model->isNewRecord ? 'box-success' : 'box-info'; ?> box col-xs-12 col-lg-12 no-padding">
   <div class="box-header with-border">
	<h3 class="box-title"><i class="fa fa-user"></i><sub><i class="fa fa-info-circle"></i></sub> 
<?=CustomerDetails::$customerType[$model->customer_type]?> Payment Details</h3>
   </div>
   <div class="box-body no-padding">
    <table class="table">
	<col class="col-sm-2">
  	<col class="col-sm-2">
	<col class="col-sm-8">
	<?php 
            $imgData= Yii::getAlias('@web')."/data/stu_images/no-photo.png";
            $displayImg = Html::img($imgData, ['alt'=>'No Image', 'class'=>'img-circle edusec-img-disp']); ?> 
	<tr class="visible-xs text-center">
		<td colspan="2"><?= $displayImg ?></td>
	</tr>
	

	<tr>
		<th><?php echo $model->getAttributeLabel('name'); ?></th>
		<td><?php echo $model->name; ?></td>
	</tr>
	
	<tr>
		<th><?php echo $model->getAttributeLabel('place'); ?></th>
		<td><?php echo $model->place; ?></td>
	</tr>
	
	<tr>
		<th><?php echo $model->getAttributeLabel('address'); ?></th>
		<td><?php echo $model->address; ?></td>
	</tr>
	
	<tr>
		<th><?php echo $model->getAttributeLabel('account_details'); ?></th>
		<td><?php echo $model->account_details; ?></td>
	</tr>
	
	<tr>
		<th><?php echo $model->getAttributeLabel('phone'); ?></th>
		<td><?php echo $model->phone; ?></td>
	</tr>
	
	</tr>
    </table>
   </div>
  </div>
  
</div>

<!---End Display Block Of Student Details--->



<!---Start Display Block For Fees Collection Category Details--->
<div class="<?php echo $model->isNewRecord ? 'box-success' : 'box-info'; ?> box col-xs-12 col-lg-12 no-padding">
<div class="box-header with-border">
	<h3 class="box-title"><i class="fa fa-inr"></i><sub><i class="fa fa-info-circle"></i></sub> Generate Bill :  </h3>
	

</div>
<div class="box-body table-responsive">
<?php
	$form = ActiveForm::begin([
			'id'=>'fees-collect-form',
			'errorSummaryCssClass' => 'error-summary text-red',
			'fieldConfig' => [
			    'template' => "{label}{input}{error}",
			]]);
			
$closed_bill=Transactions::find()->where(['status'=>'closed','customer_id'=>$model->id])->orderBy(['id'=> SORT_DESC])->one();
$previous_balance = isset($closed_bill->balance)?$closed_bill->balance:0;
$totalAmount = $totalPay = $advance_total = 0;
$feesDetails = BalanceSheet::find()->where(['status' => 'open', 
'customer_id'=>$model->id])->all();
	echo '<table class="table table-bordered tbl-pay-fees">';
	echo '<col class="col-xs-1">';
  	echo '<col class="col-xs-9">';
	echo '<col class="col-xs-2">';
	echo '<tr>';
	echo '<th class="">SI No.</th>';
	echo '<th>Material</th>';
	echo '<th>Quantity</th>';
	echo '<th>Vehicle Number</th>';
	echo '<th width="10%">Date</th>';
// 	if($model->customer_type==1){
//             echo '<th>Trip Sheet No: </th>';
// 	}
	if($model->customer_type==3){
            echo '<th>To </th>';
	}
	if($model->customer_type==3 || $model->customer_type==2){
            echo '<th>Site Name </th>';
//              echo '<th>Trip Sheet No: </th>';
	}
	
	echo '<th>Amount</th>';
	echo '</tr>';
	if($feesDetails){
	 $trip_id =Yii::$app->params['tripId'];
	foreach($feesDetails as $key=>$value) {
                //print_r($value->trip);
		echo '<tr>';
		echo '<td>'.($key+1).'</td>';	
		if($value->trip_id==$trip_id){
                    echo '<td >Advance</td>';
                    echo '<td>-</td>';
                    echo '<td>-</td>';
                    echo '<td>'.date("d-m-Y",strtotime($value['created_on'])).'</td>';     
                    if($model->customer_type==3 || $model->customer_type==2) echo '<td>-</td>';
                    if($model->customer_type==3) echo '<td>-</td>';               
		}else{
                    echo '<td>'.$value->trip->material['name'].'</td>';
                    echo '<td>'.$value->trip['size'].'</td>';
                    echo '<td>'.$value->trip->vehicles['vehicle_number'].'</td>';
                    echo '<td>'.date("d-m-Y",strtotime($value['created_on'])).'</td>';
		}
		

		if($model->customer_type==3){
                    if($value->trip_id==$trip_id){
                       
                    }else{
                        echo '<td>'.$value->trip->buyers['name'].'</td>';
                   }
                }
                if($model->customer_type==3 || $model->customer_type==2){
                    if($value->trip_id==$trip_id){
                       
                    }else{
                        echo '<td>'.$value->trip['site_name'].'</td>';
                    }
//                     echo '<td>'.$value->trip['seller_trip_sheet_number'].'</td>';
                }
                
		echo '<td>'.abs($value['amount']).'</td>';
		echo '</tr>';
		
		if($value['amount'] > 0) $totalAmount+=$value['amount'];
		else $advance_total += $value['amount'];		
		
		
	}
	$grandTotal = $totalAmount+$previous_balance;
	$colspan=5;
	if($model->customer_type==2){
	$colspan=6;
	}
	if($model->customer_type==3){
	$colspan=7;
	}
	
	echo '<tr><th colspan='.$colspan.' class="text-right col-md-9">Total</th><td>'.$totalAmount.'</td></tr>';
	}else{
            echo "<tr><td colspan=7> No trip to show</td></tr>";
	}
	$grandTotal = $totalAmount+$previous_balance;
	$colspan=5;
	if($model->customer_type==2){
	$colspan=6;
	}
	if($model->customer_type==3){
	$colspan=7;
	}
	echo '<tr><th colspan='.$colspan.' class="text-right col-md-9">Previous Balance</th><td>'.$previous_balance.'</td></tr>';
	
	echo '<tr><th colspan='.$colspan.' class="text-right col-md-9">Grand Amount</th><td>'.$grandTotal.'</td></tr>';
	
    if($advance_total)
    {
     echo '<tr><th colspan='.$colspan.' class="text-right col-md-9">Deducting Advance</th><td>'.abs($advance_total).'</td></tr>';
     echo '<tr><th colspan='.$colspan.' class="text-right col-md-9">Effective Amount</th><td>'.($grandTotal + $advance_total).'</td></tr>';
    }	
	
	
$open_bill=Transactions::findOne(['status'=>'open','customer_id'=>$model->id]);
 //if(!isset($open_bill->balance) && $grandTotal>0){
        echo '<tr><th colspan=8  class="text-right col-md-9">'. Html::submitButton('<i class="fa fa-plus-circle"></i> Generate Bill', ['class' => 
'btn btn-primary' ]).'</td></tr>';
//}

// 	
	echo '</table>';
	
	
?>	
<?php ActiveForm::end() ?>

    
</div></div>
