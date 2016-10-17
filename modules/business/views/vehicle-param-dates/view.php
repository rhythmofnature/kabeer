<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\modules\business\models\VehicleParamDates */

$this->title = $model->vehicle_id;
$this->params['breadcrumbs'][] = ['label' => 'Vehicle Param Dates', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="vehicle-param-dates-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'vehicle_id' => $model->vehicle_id, 'param_id' => $model->param_id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'vehicle_id' => $model->vehicle_id, 'param_id' => $model->param_id], [
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
            'vehicle_id',
            'param_id',
            'paid_date',
            'renewal_date',
        ],
    ]) ?>

</div>
