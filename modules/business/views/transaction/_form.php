<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\modules\business\models\Transactions */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="transactions-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'customer_id')->textInput() ?>

    <?= $form->field($model, 'ivoice_amount')->textInput() ?>

    <?= $form->field($model, 'previous_balance')->textInput() ?>

    <?= $form->field($model, 'paid_amount')->textInput() ?>

    <?= $form->field($model, 'paid_date')->textInput() ?>

    <?= $form->field($model, 'balance')->textInput() ?>

    <?= $form->field($model, 'from_sheet_id')->textInput() ?>

    <?= $form->field($model, 'to_sheet_id')->textInput() ?>

    <?= $form->field($model, 'created_on')->textInput() ?>

    <?= $form->field($model, 'updated_on')->textInput() ?>

    <?= $form->field($model, 'status')->dropDownList([ 'open' => 'Open', 'closed' => 'Closed', ], ['prompt' => '']) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
