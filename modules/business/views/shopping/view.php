<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use app\modules\business\models\MaterialTypes;

/* @var $this yii\web\View */
/* @var $model app\modules\business\models\Trips */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Purchases', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="trips-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',	
            [
            'label'=>'Date',
            'attribute'=>"date_of_travel",
            'value' => date("Y-m-d",strtotime($model->date_of_travel))
            ],
            [
            'label'=>'Merchant',
            'attribute'=>"merchant",
            'value' => $model->merchants['name']
            ],
            'merchant_amount',
            'seller_trip_sheet_number',
            'site_name',
        ],
    ]) ?>

</div>
