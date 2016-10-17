<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\modules\business\models\VehicleDetails;
/* @var $this yii\web\View */
/* @var $model app\modules\business\models\VehicleDetails */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="col-xs-12 col-lg-12">
  <div class="<?php echo $model->isNewRecord ? 'box-success' : 'box-info'; ?> box view-item col-xs-12 col-lg-12">
   <div class="vehicle-details-form">

    <?php $form = ActiveForm::begin([
			'id' => 'vehicle-details-form',
    ]); ?>
    
   <div class="col-xs-12 col-lg-12 no-padding">
    <div class="col-xs-12 col-sm-6 col-lg-6">
    <?= $form->field($model, 'name')->textInput(['maxlength' => 250]) ?>
    </div>

    <div class="col-xs-12 col-sm-6 col-lg-6">
        <?= $form->field($model, 'type')
        ->dropDownList(
             VehicleDetails::$type,
            ['prompt'=>'Select Type']
        );?>
    </div>
   </div>
   
   <div class="col-xs-12 col-lg-12 no-padding">
    <div class="col-xs-12 col-sm-6 col-lg-6">
    <?= $form->field($model, 'vehicle_number')->textInput(['maxlength' => 12]) ?>
    </div>

    <div class="col-xs-12 col-sm-6 col-lg-6">
       <?= $form->field($model, 'size')->textInput(['maxlength' => 250]) ?>
    </div>
   </div>

    <div class="col-xs-12 col-lg-12 no-padding">
    <div class="col-xs-12 col-sm-6 col-lg-6">
    <?= $form->field($model, 'charge_per_km')->textInput(['maxlength' => 15]) ?>
    </div>

    <div class="col-xs-12 col-sm-6 col-lg-6">
       <?= $form->field($model, 'status')
        ->dropDownList(
             VehicleDetails::$status,
            ['prompt'=>'Select status']
        );?>
    </div>
   </div>  
   
    <div class="form-group col-xs-12 col-sm-6 col-lg-4 no-padding">
	<div class="col-xs-6">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord  ? 'btn btn-block btn-success' : 'btn btn-block btn-info']) ?>
	</div>
	<div class="col-xs-6">
	<?= Html::a('Cancel', ['index'], ['class' => 'btn btn-default btn-block']) ?>
	</div>
    </div>   

    <?php ActiveForm::end(); ?>

</div>
</div>
</div>
