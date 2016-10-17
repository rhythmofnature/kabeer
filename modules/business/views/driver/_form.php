<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use app\modules\business\models\VehicleDetails;

/* @var $this yii\web\View */
/* @var $model app\modules\business\models\DriverDetails */
/* @var $form yii\widgets\ActiveForm */
?>
<div class="col-xs-12 col-lg-12">
  <div class="<?php echo $model->isNewRecord ? 'box-success' : 'box-info'; ?> box view-item col-xs-12 col-lg-12">
   <div class="driver-details-form">

    <?php $form = ActiveForm::begin([
			'id' => 'driver-details-form',
    ]); ?>
    
   <div class="col-xs-12 col-lg-12 no-padding">
    <div class="col-xs-12 col-sm-6 col-lg-6">
    <?= $form->field($model, 'name')->textInput(['maxlength' => 250]) ?>
    </div>

    <div class="col-xs-12 col-sm-6 col-lg-6">
       <?= $form->field($model, 'place')->textInput(['maxlength' => 250]) ?>
    </div>
   </div>  
   
   <div class="col-xs-12 col-lg-12 no-padding">
    <div class="col-xs-12 col-sm-6 col-lg-6">
        <?= $form->field($model, 'address')->textarea(['rows' => 6]) ?>
    </div>

    <div class="col-xs-12 col-sm-6 col-lg-6">
    <?= $form->field($model, 'account_details')->textarea(['rows' => 6]) ?>
    </div>
   </div>
   
   <div class="col-xs-12 col-lg-12 no-padding">
    <div class="col-xs-12 col-sm-6 col-lg-6">
         <?= $form->field($model, 'vehicle')
      ->dropDownList(
	  ArrayHelper::map(VehicleDetails::find()->where(['status'=>1])->all(), 'id', 'name'),
	  ['prompt'=>'Select Vehicle','id'=>'vehicle']
      );?> 
    </div>

    <div class="col-xs-12 col-sm-6 col-lg-6">
    <?= $form->field($model, 'phone')->textInput(['maxlength' => 15]) ?>
    </div>
   </div> 
   
   <div class="col-xs-12 col-lg-12 no-padding">
    <div class="col-xs-12 col-sm-6 col-lg-6">
      <?= $form->field($model, 'earning_percentage')->textInput(['maxlength' => 4]) ?>
    </div>

    <div class="col-xs-12 col-sm-6 col-lg-6">
    	 <?= $form->field($model, 'status', ['template' => "{input}"])->hiddenInput(['value' => 1]); ?>
    	 <?= $form->field($model, 'customer_type', ['template' => "{input}"])->hiddenInput(['value' => 3]); ?>
    </div>
   </div>
   
   
    <div class="form-group col-xs-12 col-sm-6 col-lg-4 no-padding">
	<div class="col-xs-6">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord  ? 'btn btn-block btn-success' : 'btn 
btn-block btn-info']) ?>
	</div>
	<div class="col-xs-6">
	<?= Html::a('Cancel', ['index'], ['class' => 'btn btn-default btn-block']) ?>
	</div>
    </div>     
    
    
    <?php ActiveForm::end(); ?>
</div>
</div>
</div>    

