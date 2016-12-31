<?php 
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use app\modules\business\models\VehicleDetails;
use app\modules\business\models\CustomerDetails;
use kartik\widgets\DepDrop;
use yii\helpers\Url;
use kartik\widgets\Select2;

use miloschuman\highcharts\Highcharts;
use yii\web\JsExpression;

$this->title = Yii::t('app', 'Weekly Business report');

?>
<!---Start Select Fees Collection Category---> 
<div class="box-info box box-solid view-item col-xs-12 col-lg-12 no-padding">
    <div class="box-header with-border">
	<h3 class="box-title"><i class="fa fa-search"></i> Search with a condition</h3>
    </div>
    <div class="box-body no-padding">
	<?php $form = ActiveForm::begin([
		'id' => 'bill-collect-form',
		'method' => 'post',
		'fieldConfig' => [
			'template' => "{label}{input}{error}",
		],
	]); ?>


	
	<div class="col-md-5">
         <?php
            echo $form->field($model, 'buyer')->widget(Select2::classname(), [
            'data' => ArrayHelper::map(CustomerDetails::find()->where(['status'=>1,'customer_type'=>2])->all(), 'id', 'name'),
            'options' => ['placeholder' => 'Select Customer ...','style'=>'width:200px','onChange'=>'this.form.submit()'],
            'pluginOptions' => [
            'allowClear' => true
            ],
            ]);
            ?>
	</div>

	<div class="col-md-6">
	
	</div>

	<?php ActiveForm::end(); ?>
    </div>
</div>
<!---End Select Fees Collection Category---> 

<!---Vehicle Weekly Profit--->
<div class="col-md-4">
	<div class="box box-info">
	<div class="box-header with-border">
		<h3 class="box-title"><i class="fa fa-pie-chart"></i>Weekly Business Report</h3>
	</div>
	<div class="box-body">
<?php
 if($report)
 {
  $new_report = array();
  foreach($report as $date => $data)
  {
  foreach($data as $datum)
  {  
    @$new_report[$date] += $datum['price'];
  }
  }
  
  foreach($new_report as $date => $amount)
  {
   $chart_business[] = array(date("d-m-Y",strtotime($date)),$amount);
  }
 }else 
 {
 $chart_business = array();
 }

	echo Highcharts::widget([
		'options' => [	
			'exporting'=>[
			 	'enabled'=>false 
			],
			//'colors'=>['#F45B5B', '#F7A35C', '#2B908F'],
			'legend'=>[
			    'align'=>'center',
			    'verticalAlign'=>'bottom',
			    'layout'=>'horizontal',
			    'x'=>0,
			    'y'=>0,
			],
			'credits'=>[
    				'enabled'=>false
  			 ],
			'chart'=> [
				'type'=>'pie',
			],
			'title'=>[
				'text'=>'',
				'margin'=>0,
			],
			'plotOptions'=>[
				'pie'=>[
					'innerSize'=>80,
					'depth'=>45,
					'dataLabels'=>[
						'enabled'=>false
				    	 ],
					 'showInLegend'=>true,
				],	
				'series'=>[
					'pointPadding'=>0,
					'groupPadding'=>0,      
				 ],
			],
			'series'=> [
				[
					'name'=>'Amount',
					'data'=>$chart_business
				]
			]
		],
	]);
	?>
	</div>
   </div>
</div> 




<div class="row">
  <div class="col-xs-12">
     <div class="box box-primary">

       <div class="box-header">
	          <h3 class="box-title"><i class="fa fa-info-circle"></i> <?= $this->title ?></h3>
          <div class="box-tools pull-right">
          	
          </div> <!-- box-tools -->
        </div><!-- /.box-header -->

 <div class="box-body table-responsive no-padding">
 <table class ='table-bordered table table-striped'>
 <tr>
    <th class='text-center'>Week</th>
     <th class='text-center'>Product</th>
     <th class='text-center'>Quantity</th>
     <th class='text-center'>Amount (Rs)</th>
 </tr>
 <?php
 $total_price = 0;
 if($report)
 {
  foreach($report as $date => $data)
  {
  foreach($data as $product_id => $datum)
  {
  $total_price += $datum['price'];
  ?>
 <tr>
     <td class='text-center'><?php echo date("d-m-Y",strtotime($date));?></td> 
     <td class='text-center'><?php echo $datum['product'];?></td>
     <td class='text-center'><?php echo $datum['quantity'];?></td>
     <td class='text-center'><?php echo $datum['price'];?></td>
 </tr>  
  <?php
  }
  }
 }
 ?>
<tr>
     <td class='text-center'></td>
     <td class='text-center'></td>
     <td class='text-center'>Total </td>
     <td class='text-center'><?= $total_price ?></td>
 </tr> 
</table>
</div></div>
</div> <!---/end box-body--->
</div> <!---/end box--->