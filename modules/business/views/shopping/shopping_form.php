<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use app\modules\business\models\MaterialTypes;
use app\modules\business\models\DriverDetails;
use app\modules\business\models\VehicleDetails;
use app\modules\business\models\CustomerDetails;
use kartik\widgets\DepDrop;
use yii\helpers\Url;
use kartik\widgets\Select2

/* @var $this yii\web\View */
/* @var $model app\modules\business\models\Trips */
/* @var $form yii\widgets\ActiveForm */
?>


<div class="col-xs-12 col-lg-12">
<div class="<?php echo $model->isNewRecord ? 'box-success' : 'box-info'; ?> box view-item col-xs-12 col-lg-12">
   <div class="vehicle-details-form">


    <?php $form = ActiveForm::begin(); ?>
    
    <div class="col-xs-12 col-lg-12 no-padding">
        <div class="col-xs-12 col-sm-6 col-lg-6">
        <?php 
        if(!isset($model->date_of_travel)){
            $model->date_of_travel=date("d-m-Y");
        }
        echo $form->field($model, 'date_of_travel')->widget(yii\jui\DatePicker::className(),
        [
            'clientOptions' =>[
                    'dateFormat' => 'dd-mm-yyyy',
                    'changeMonth'=> true,
                    'changeYear'=> true,
                    'autoSize'=>true,
                    'yearRange'=>'1900:'.(date('Y')+1)],
                    'options'=>[
                    'class'=>'form-control',
                    'placeholder' => $model->getAttributeLabel('date_of_travel'),'style'=>'width:400px'
                ],]) ?>
        </div>
        
        <div class="col-xs-12 col-sm-6 col-lg-6">
        <?php
            echo $form->field($model, 'merchant')->widget(Select2::classname(), [
            'data' => ArrayHelper::map(CustomerDetails::find()->where(['status'=>1,'customer_type'=>1])->orderBy('name')->all(), 'id', 'name'),
            'options' => ['placeholder' => 'Select Merchant ...','style'=>'width:400px'],
            'pluginOptions' => [
            'allowClear' => true
            ],
            ]);
            ?>

        <?php /*echo  $form->field($model, 'merchant')
        ->dropDownList(
        ArrayHelper::map(CustomerDetails::find()->where(['status'=>1,'customer_type'=>1])->all(), 'id', 'name'),
        ['prompt'=>'Select Merchant','style'=>'width:400px','onChange'=>'merchantAmount();']
        );*/?>
        </div>
    </div>
      
    <div class="col-xs-12 col-lg-12 no-padding">
        <div class="col-xs-12 col-sm-6 col-lg-6">
        <?= $form->field($model, 'merchant_amount')->textInput(['maxlength' => 7,'style'=>'width:400px']) ?>
        </div>
        <div class="col-xs-12 col-sm-6 col-lg-6">
        <?= $form->field($model, 'seller_trip_sheet_number')->textInput(['maxlength' => 20,'style'=>'width:400px']) ?> 
        </div>
    </div>
      
    <div class="col-xs-12 col-lg-12 no-padding">
        <div class="col-xs-12 col-sm-6 col-lg-6">
        <?php 
        if(!isset($model->ready_merchant))
            $model->ready_merchant='no';
        echo $form->field($model, 'ready_merchant')
        ->dropDownList(array('no'=>'No','yes'=>'Yes'),
        ['prompt'=>'Is it ready cash payment?','style'=>'width:400px']
        ); ?>
        </div>
        <div class="col-xs-12 col-sm-6 col-lg-6">
        <?= $form->field($model, 'site_name')->textArea(['rows'=>10,'style'=>'width:400px']) ?>
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
</div></div>

