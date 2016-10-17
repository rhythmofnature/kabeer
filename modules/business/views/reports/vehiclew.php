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

$this->title = Yii::t('app', 'Vehicle weekly report');

?>
<!---Start Select Fees Collection Category---> 
<div class="box-info box box-solid view-item col-xs-12 col-lg-12 no-padding">
    <div class="box-header with-border">
	<h3 class="box-title"><i class="fa fa-search"></i> Search with a condition</h3>
    </div>
    <div class="box-body no-padding">
	<?php $form = ActiveForm::begin([
		'id' => 'bill-collect-form',
		'method' => 'get',
		'fieldConfig' => [
			'template' => "{label}{input}{error}",
		],
	]); ?>

    <div class="col-md-3">
		  <?= $form->field($model, 'vehicle_id')
        ->dropDownList(
            ArrayHelper::map(VehicleDetails::find()->where(['status'=>1])->all(), 'id', 'name'),
            ['prompt'=>'Select a vehicle','style'=>'width:200px','onchange'=>'this.form.submit()']
        );?>
	</div>
	
	<div class="col-md-3">	
	  <?php
	  echo $form->field($model, 'merchant')->widget(Select2::classname(), [
	  'data' => ArrayHelper::map(CustomerDetails::find()->where(['status'=>1,'customer_type'=>1])->orderBy('name')->all(), 'id', 'name'),
	  'options' => ['placeholder' => 'Select Merchant ...','style'=>'width:200px','onChange'=>'this.form.submit()'],
	  'pluginOptions' => [
	  'allowClear' => true
	  ],
	  ]);
	  ?>
	</div>
	
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
		<h3 class="box-title"><i class="fa fa-pie-chart"></i> Vehicle Weekly Profit</h3>
	</div>
	<div class="box-body">
<?php
 if($report)
 {
  foreach($report as $date => $data)
  {
    $data['expense'] = isset($data['expense'])? $data['expense']:0;
    $chart_vehicle[] = array(date("d-m",strtotime($date)),$data['rent'] - $data['driver'] - $data['expense']);
    $chart_business[] = array(date("d-m",strtotime($date)),$data['customer'] - $data['merchant'] - $data['rent']);
  }
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
					'name'=>'Weekly Profit',
					'data'=>$chart_vehicle
				]
			]
		],
	]);
	?>
	</div>
   </div>
</div> 


<!---Business Weekly Profit--->
<div class="col-md-4">
	<div class="box box-info">
	<div class="box-header with-border">
		<h3 class="box-title"><i class="fa fa-pie-chart"></i> Business Weekly Profit</h3>
	</div>
	<div class="box-body">
<?php
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
					'name'=>'Weekly Profit',
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
     <th class='text-center'>No. of trips</th>
     <th class='text-center'>Merchant</th>
     <th class='text-center'>Customer</th>
     <th class='text-center'>Rent</th>
     <th class='text-center'>Driver</th>
     <th class='text-center'>Expence</th>
     <th class='text-center'>Veh.Profit</th>
     <th class='text-center'>Business Profit</th>
 </tr>
 <?php
 if($report)
 {
  foreach($report as $date => $data)
  {
  ?>
 <tr>
     <td class='text-center'><?php echo date("d-m-Y",strtotime($date));?></td>
     <td class='text-center'><?php echo $data['no_trips'];?></td>
     <td class='text-center'><?php echo $data['merchant'];?></td>
     <td class='text-center'><?php echo $data['customer'];?></td>
     <td class='text-center'><?php echo $data['rent'];?></td>
     <td class='text-center'><?php echo $data['driver'];?></td>
     <td class='text-center'><?php 
     $data['expense'] = isset($data['expense'])? $data['expense']:0;
     echo $data['expense'];
     ?></td>
     <td class='text-center'><?php echo $data['rent'] - $data['driver'] - $data['expense'];?></td>
     <td class='text-center'><?php echo $data['customer'] - $data['merchant'] - $data['rent'];?></td>
 </tr>  
  <?php
  }
 }
 ?>
</table>
</div></div>
</div> <!---/end box-body--->
</div> <!---/end box--->