<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use app\modules\business\models\CustomerDetails;
use yii\grid\GridView;
use kartik\widgets\DepDrop;
use yii\helpers\Url;
use kartik\widgets\Select2;

/* @var $this yii\web\View */
/* @var $model app\modules\business\models\CustomerDetails */
/* @var $form yii\widgets\ActiveForm */


$this->title = 'Advance';
$this->params['breadcrumbs'][] = ['label' => 'Advances', 'url' => ['advance']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="box-header with-border">
<h3 class="box-title"><i class="fa fa-plus"></i> Advance Recieved</h3>
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
	  echo $form->field($balanceSheet, 'customer_id')->widget(Select2::classname(), [
	  'data' => ArrayHelper::map(CustomerDetails::find()->where(['status'=>1])->orderBy('name')->all(), 'id', 'name'),
	  'options' => ['placeholder' => 'Select from whom','style'=>'width:300px'],
	  'pluginOptions' => [
	  'allowClear' => true
	  ],
	  ]);
	  ?>
    
    </div>   
    

    <div class="col-xs-12 col-sm-6 col-lg-6">
    <?php
        echo $form->field($balanceSheet, 'created_on')->widget(yii\jui\DatePicker::className(),
        [
            'clientOptions' =>[
                    'dateFormat' => 'dd-mm-yyyy',
                    'changeMonth'=> true,
                    'changeYear'=> true,
                    'autoSize'=>true,
                    'yearRange'=>'1900:'.(date('Y')+1)],
                    'options'=>[
                    'class'=>'form-control',
                    'placeholder' =>'Paid date','style'=>'width:300px'
                ],]) ?>
    
    </div>

    <div class="col-xs-12 col-sm-6 col-lg-6">
    <?= $form->field($balanceSheet,'amount')->textInput(['maxlength' => 10, 'placeholder' => 
'amount','style'=>'width:300px']) 
?>
    </div>

   

    <div class="form-group col-xs-12 col-sm-6 col-lg-4 no-padding">
	<div class="col-xs-6">
        <?= Html::submitButton($balanceSheet->isNewRecord ? 'Create' : 'Update', ['class' => $balanceSheet->isNewRecord  ? 'btn btn-block btn-success' 
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

<div class="box-header with-border">
<h3 class="box-title"><i class="fa fa-th-list"></i> Advance History</h3>
</div>

  <div class="col-xs-12 col-lg-12">
  <div class="box-info box view-item col-xs-12 col-lg-12">
   <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => false,
        'columns' => [
        ['class' => 'yii\grid\SerialColumn'],
        [
		'label' => 'Name',
		'attribute' => 'customer_id',
		'filter' => true,
		'value' => function ($model,$key,$index){
		return $model->user['name'];		
		},
 	    ],
        [
		'label' => 'Amount',
		'attribute' => 'amount',
		'value' => function ($model,$key,$index){
		return $model->amount*-1;			
		},
 	    ],
        'status',
		[
		'class' => 'yii\grid\ActionColumn',
		'template' => '{delete}',
		'buttons' => [
			'delete' => function ($url,$model,$key) {
			if($model->status == "open")
			 return Html::a('<i class="glyphicon glyphicon-trash"></i>',['/business/customer/advance-delete','id'=>$model->id]);
			},
			],
		],        
        ],
    ]); ?>
    </div></div>
