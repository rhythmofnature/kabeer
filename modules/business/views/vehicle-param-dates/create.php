<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\modules\business\models\VehicleParamDates */

$this->title = 'Create Vehicle Param Dates';
$this->params['breadcrumbs'][] = ['label' => 'Vehicle Param Dates', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="vehicle-param-dates-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
