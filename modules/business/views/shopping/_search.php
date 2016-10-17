<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\modules\business\models\TripsSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="trips-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'date_of_travel') ?>

    <?= $form->field($model, 'vehicle_id') ?>

    <?= $form->field($model, 'driver_id') ?>

    <?= $form->field($model, 'material_id') ?>

    <?php // echo $form->field($model, 'size') ?>

    <?php // echo $form->field($model, 'measurement_type') ?>

    <?php // echo $form->field($model, 'site_name') ?>

    <?php // echo $form->field($model, 'site_place') ?>

    <?php // echo $form->field($model, 'kilometre') ?>

    <?php // echo $form->field($model, 'vehicle_rent') ?>

    <?php // echo $form->field($model, 'driver_amount') ?>

    <?php // echo $form->field($model, 'merchant_amount') ?>

    <?php // echo $form->field($model, 'buyer_amount') ?>

    <?php // echo $form->field($model, 'buyer_amount_total') ?>

    <?php // echo $form->field($model, 'buyer_trip_sheet_number') ?>

    <?php // echo $form->field($model, 'seller_trip_sheet_number') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
