<?php
use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use yii\helpers\Url;
use yii\bootstrap\Modal;
use app\modules\business\models\CustomerDetails;
use app\modules\business\models\CustomerDetailsSearch;

$this->title = "Fees Collection";
$this->params['breadcrumbs'][] = ['label' => 'Fees', 'url'=>['/fees']];
$this->params['breadcrumbs'][] = ['label' => $this->title, 'url'=>['collect']];

?>

<!---Start Select Fees Collection Category---> 
<div class="box-info box box-solid view-item col-xs-12 col-lg-12 no-padding">
    <div class="box-header with-border">
	<h3 class="box-title"><i class="fa fa-search"></i> Select User Type</h3>
    </div>
    <div class="box-body no-padding">
	<?php $form = ActiveForm::begin([
		'id' => 'bill-collect-form',
		'method' => 'get',
		'fieldConfig' => [
			'template' => "{label}{input}{error}",
		],
	]); ?>

    	<div class="col-md-6">
		  <?= $form->field($model, 'customer_type')
        ->dropDownList(
             CustomerDetailsSearch::$customerType,
            ['prompt'=>'Select user type','style'=>'width:300px','onchange'=>'this.form.submit()']
        );?>
	</div>

	<div class="col-md-6">
	
	</div>

	<?php ActiveForm::end(); ?>
    </div>
</div>
<!---End Select Fees Collection Category---> 


<div class="col-xs-12" style="padding-top: 10px;">
   <div class="box">
      <div class="box-body table-responsive">
	<div class="batches-index">
   <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            'name',
            [
		'label' => 'Total Unpaid Amount',
		'attribute' => 'customer_type',
		'filter' => false,
		'value' => function ($model,$key,$index){
		return CustomerDetails::getUnpaidamount($model->id);	
		
		},
 	    ],
 	    
 	    [
		'label' => 'Open Invoices',
		'attribute' => 'customer_type',
		'filter' => false,
		'value' => function ($model,$key,$index){
		return CustomerDetails::getUncolsedBill($model->id);	
		
		},
 	    ],
 	     [
		    'class' => 'yii\grid\ActionColumn',
		    'template' => '{generate}',
		    'buttons' => [
			    'generate' => function ($url,$model,$key) {
                                 return CustomerDetails::generateBill($model->id);
                            },
		    ],
	    ],
 	    
     
         
        ],
    ]); ?>
	</div>
      </div>
    </div>
</div>