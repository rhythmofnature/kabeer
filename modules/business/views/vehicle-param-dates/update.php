<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\modules\business\models\VehicleParamDates */

$this->title = 'Update Vehicle Param Dates: ' . ' ' . $model->vehicle_id;
$this->params['breadcrumbs'][] = ['label' => 'Vehicle Param Dates', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->vehicle_id, 'url' => ['view', 'vehicle_id' => $model->vehicle_id, 'param_id' => $model->param_id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="vehicle-param-dates-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
