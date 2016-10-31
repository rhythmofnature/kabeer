<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use app\modules\business\models\VehicleDetails;
?>
<div class="box-header with-border">
<h3 class="box-title"><i class="fa fa-plus"></i> Add Expenses</h3>
</div>
<div class="col-xs-12 col-lg-12">
  <div class="box-info box view-item col-xs-12 col-lg-12">
   <div class="fees-category-details-form">
    <?php $form = ActiveForm::begin([
			'id' => 'fees-category-details-form',
			'fieldConfig' => [
			     'template' => "{input}{error}",
			],
    ]); ?>
    
    
   

    <div class="col-xs-12 col-sm-6 col-lg-6">
    <?php
        echo $form->field($model, 'date')->widget(yii\jui\DatePicker::className(),
        [
            'clientOptions' =>[
                    'dateFormat' => 'dd-mm-yyyy',
                    'changeMonth'=> true,
                    'changeYear'=> true,
                    'autoSize'=>true,
                    'yearRange'=>'1900:'.(date('Y')+1)],
                    'options'=>[
                    'class'=>'form-control',
                    'placeholder' =>'Spend date','style'=>'width:300px'
                ],]) ?>
    
    </div>
    
   <div class="col-xs-12 col-sm-6 col-lg-6">
    <?= $form->field($model,'description')->textInput(['maxlength' => 10, 'placeholder' => 
'description','style'=>'width:300px']) 
    ?>
    </div>   
    

    <div class="col-xs-12 col-sm-6 col-lg-6">
    <?= $form->field($model,'amount')->textInput(['maxlength' => 10, 'placeholder' => 
'amount','style'=>'width:300px']) 
?>
    </div>

   

    <div class="form-group col-xs-12 col-sm-6 col-lg-4 no-padding">
	<div class="col-xs-6">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord  ? 'btn btn-block btn-success' 
: 'btn 
btn-block btn-info']) ?>
	</div>
	<div class="col-xs-6">
	    <?= Html::a('Cancel', ['customer/collectadvance'], ['class' => 'btn btn-default btn-block']) ?>
	</div>
    </div>

    <?php ActiveForm::end(); ?>
    
    
   </div>
   
   
  </div>

</div>