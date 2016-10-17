<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\modules\business\models\VehicleParamDates */

$this->title = 'Manage Vehicle Related Dates';
$this->params['breadcrumbs'][] = ['label' => 'Vehicle Related Dates', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;

?>
<div class="col-xs-12">
  <div class="col-lg-4 col-sm-4 col-xs-12 no-padding"><h3 class="box-title"><i class="fa fa-plus"></i> <?php echo $this->title;?></h3></div>
  <div class="col-xs-4"></div>
  <div class="col-lg-4 col-sm-4 col-xs-12 no-padding" style="padding-top: 20px !important;">
	<div class="col-xs-4"></div>
	<div class="col-xs-4"></div>
	<div class="col-xs-4 left-padding">
	<?= Html::a('Back', ['index'], ['class' => 'btn btn-block btn-back']) ?>
	</div>
   </div>
</div>

<div class="col-xs-12">
  <div class="box box-primary view-item">
   <div class="courses-view">
   <?php $form = ActiveForm::begin([
			'id' => 'params',
			'fieldConfig' => [
			     'template' => "{input}{error}",
			],
    ]); ?>
   <table class="table  detail-view">
   <tr>
   <th></th>
   <?php 
   foreach($params as $param)
   {
   echo "<th>$param->name</th>";
   }
   ?>
   </tr>
   <?php
   foreach($vehicles as $vehicle)
   {
   ?>
   <tr>
   <th><?= $vehicle->name ?></th>
   <?php
   foreach($params as $param)
   {
   ?>
   <th><?php 
   /*if($vehicle_params[$vehicle->id][$param->id][0])
    if($vehicle_params[$vehicle->id][$param->id][0] == '0000-00-00') $selected_value = '';
    else $selected_value = $vehicle_params[$vehicle->id][$param->id][0];
   else $selected_value = '';
   
   echo yii\jui\DatePicker::widget([
    'name'  => 'paid_date['.$vehicle->id.']['.$param->id.']',
    'value'  => $selected_value,
    'clientOptions' =>[
                    'dateFormat' => 'dd-mm-yyyy',
                    'changeMonth'=> true,
                    'changeYear'=> true,
                    'autoSize'=>true,
                    'yearRange'=>'1900:'.(date('Y')+5)],
                    'options'=>[
                    'class'=>'form-control',
                    'placeholder' => $model->getAttributeLabel('paid_date'),
                    'style'=>'width:200px'
                ],    
    ]);*/
    
   if($vehicle_params[$vehicle->id][$param->id][1])
    if($vehicle_params[$vehicle->id][$param->id][1] == '0000-00-00') $selected_value = '';
    else $selected_value = $vehicle_params[$vehicle->id][$param->id][1];
   else $selected_value = '';    
    
   echo yii\jui\DatePicker::widget([
    'name'  => 'renewal_date['.$vehicle->id.']['.$param->id.']',
    'value'  => $selected_value,
    'clientOptions' =>[
                    'dateFormat' => 'dd-mm-yyyy',
                    'changeMonth'=> true,
                    'changeYear'=> true,
                    'autoSize'=>true,
                    'yearRange'=>'1900:'.(date('Y')+5)],
                    'options'=>[
                    'class'=>'form-control',
                    'placeholder' => $model->getAttributeLabel('renewal_date'),
                    'style'=>'width:200px'
                ],    
    ]);    
     
     ?>   
   </th>
   <?php
   }
   ?>   
   </tr>
   <?php
   }
   ?> 

   </table>
   
    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Save Dates' : 'Save Dates', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>   
   
   <?php ActiveForm::end(); ?>
   </div>
  </div>
</div>

