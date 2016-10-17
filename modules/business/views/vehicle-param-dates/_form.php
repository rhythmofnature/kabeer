<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\modules\business\models\VehicleParamDates */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="vehicle-param-dates-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'vehicle_id')->textInput() ?>

    <?= $form->field($model, 'param_id')->textInput() ?>

    <?= $form->field($model, 'paid_date')->textInput() ?>

    <?= $form->field($model, 'renewal_date')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
