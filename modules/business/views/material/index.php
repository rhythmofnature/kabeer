<?php

use yii\helpers\Html;
use yii\grid\GridView;
use app\modules\business\models\MaterialTypes;
/* @var $this yii\web\View */
/* @var $searchModel app\modules\business\models\MaterialTypesSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Products';
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
        <?= Html::a('ADD', ['create'], ['class' => 'btn btn-block btn-success']) ?>
	</div>	
  </div>
</div>

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
            'price',
            'description:ntext',
 
            [
			'label' => 'Measurement Type',
			'attribute' => 'measurement_type',
			'filter' => MaterialTypes::$measurementType,
						'value' => function ($model,$key,$index){
                return MaterialTypes::$measurementType[$model->measurement_type];			
			    },
 	        ],
 	        [
			'label' => 'Status',
			'attribute' => 'status',
			'filter' => MaterialTypes::$status,
						'value' => function ($model,$key,$index){
                return MaterialTypes::$status[$model->status];			
			    },
 	        ],

	    [
		    'class' => 'yii\grid\ActionColumn',
		    'template' => '{update} {delete}',
	    ],            
        ],
    ]); ?>
	</div>
      </div>
    </div>
</div>


