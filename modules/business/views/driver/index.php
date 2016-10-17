<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $searchModel app\modules\business\models\DriverDetailsSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Driver Details';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="driver-details-index">

<div class="col-xs-12">
  <div class="col-lg-4 col-sm-4 col-xs-12 no-padding"><h3 class="box-title"><i class="fa fa-th-list"></i> <?= $this->title ?></h3></div>
  <div class="col-xs-4"></div>
  <div class="col-lg-4 col-sm-4 col-xs-12 no-padding" style="padding-top: 20px !important;">
	<div class="col-xs-4 left-padding">
        <?= Html::a('ADD', ['create'], ['class' => 'btn btn-block btn-success']) ?>
	</div>
	<div class="col-xs-4 left-padding">
	<?= Html::a('PDF', ['/export-data/export-to-pdf', 'model'=>get_class($searchModel)], ['class' => 'btn btn-block btn-warning', 'target'=>'_blank']) ?>
	</div>
	<div class="col-xs-4 left-padding">
	<?= Html::a('EXCEL', ['/export-data/export-excel', 'model'=>get_class($searchModel)], ['class' => 'btn btn-block btn-primary', 'target'=>'_blank']) ?>
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
            'place',
            'address:ntext',
		    [
				'label' => 'Vehice',
				'attribute' => 'vehicle',
				'value' => 'driverVehicle.name',
				'filter' => ArrayHelper::map(app\modules\business\models\VehicleDetails::find()->all(), 'id', 'name')
		    ],
            // 'customer_type',
            // 'phone',
            // 'vehicle',
            // 'earning_percentage',
            // 'status',

            ['class' => 'app\components\CustomActionColumn'],
        ],
    ]); ?>
	</div>
      </div>
    </div>
</div>

