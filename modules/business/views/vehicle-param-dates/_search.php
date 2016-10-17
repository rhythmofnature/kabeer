<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\modules\business\models\VehicleParamDatesSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="vehicle-param-dates-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'vehicle_id') ?>

    <?= $form->field($model, 'param_id') ?>

    <?= $form->field($model, 'paid_date') ?>

    <?= $form->field($model, 'renewal_date') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
