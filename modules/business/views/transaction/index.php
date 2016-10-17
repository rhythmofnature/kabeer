<?php

use yii\helpers\Html;
use yii\grid\GridView;
use app\modules\business\models\Transactions;

/* @var $this yii\web\View */
/* @var $searchModel app\modules\business\models\TransactionsSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Invoices';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="col-xs-12">
  <div class="col-lg-4 col-sm-4 col-xs-12 no-padding"><h3 class="box-title"><i class="fa fa-th-list"></i> <?= $this->title ?></h3></div>
  <div class="col-xs-4"></div>
  <div class="col-lg-4 col-sm-4 col-xs-12 no-padding" style="padding-top: 20px !important;">
	<div class="col-xs-4 left-padding">
	
	</div>
	<div class="col-xs-4 left-padding">
	
	</div>
	<div class="col-xs-4 left-padding">
	
	</div>
  </div>
</div>



<div class="transactions-index">

    

    
    
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>



    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
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
		'label' => 'User Type',
		'attribute' => 'user_type',
		'filter' => array(1=>'Merchant',2=>'Customer',3=>'Driver'),
		'value' => function ($model,$key,$index){
                    $type="";
                    if($model->user['customer_type']==1){
                        $type="Merchant";
                    }else if($model->user['customer_type']==2){
                        $type="Customer";
                    }else if($model->user['customer_type']==3){
                        $type="Driver";
                    }
		return $type;
		},
 	    ],
 	    
            'ivoice_amount',
            'previous_balance',
            'paid_amount',
            'status',
            // 'paid_date',
            // 'balance',
            // 'from_sheet_id',
            // 'to_sheet_id',
//             'created_on',
            [
		'label' => 'Generated',
		'attribute' => 'created_on',
		'filter' => true,
		'value' => function ($model,$key,$index){
		return date("d-m-Y",strtotime($model->created_on));
		
		},
 	    ],
            // 'updated_on',
            // 'status',

//             ['class' => 'yii\grid\ActionColumn'],
                 [
		    'class' => 'yii\grid\ActionColumn',
		    'template' => '{generate}',
		    'buttons' => [
			    'generate' => function ($url,$model,$key) {
                                 return Transactions::button($model->id);
                            },
		    ],
                ],
        ],
    ]); ?>

</div>
