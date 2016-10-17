<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\modules\business\models\ExpensesSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = ' Expenses';
$this->params['breadcrumbs'][] = $this->title;
?>
<?php echo $this->render('_create', ['model' => $model]); ?>


<div class="box-header with-border">
<h3 class="box-title"><i class="fa fa-th-list"></i> Expense History</h3>
</div>

  <div class="col-xs-12 col-lg-12">
  <div class="box-info box view-item col-xs-12 col-lg-12">
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            'date',
			['label'=>'Vehicle',
			'attribute'=>"vehicle_id",
			'value' => 'vehicles.name'
			  ],
            'description',
            'amount',

            ['class' => 'yii\grid\ActionColumn',
            'template' => '{delete}',
            ],
        ],
    ]); ?>

</div></div>
