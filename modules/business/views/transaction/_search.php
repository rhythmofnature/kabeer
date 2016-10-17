<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\modules\business\models\TransactionsSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="transactions-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'customer_id') ?>

    <?= $form->field($model, 'ivoice_amount') ?>

    <?= $form->field($model, 'previous_balance') ?>

    <?= $form->field($model, 'paid_amount') ?>

    <?php // echo $form->field($model, 'paid_date') ?>

    <?php // echo $form->field($model, 'balance') ?>

    <?php // echo $form->field($model, 'from_sheet_id') ?>

    <?php // echo $form->field($model, 'to_sheet_id') ?>

    <?php // echo $form->field($model, 'created_on') ?>

    <?php // echo $form->field($model, 'updated_on') ?>

    <?php // echo $form->field($model, 'status') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
