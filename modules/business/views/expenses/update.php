<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\modules\business\models\BurExpenses */

$this->title = 'Update Bur Expenses: ' . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Bur Expenses', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="bur-expenses-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
