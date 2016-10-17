<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\modules\business\models\BurExpenses */

$this->title = 'Create Bur Expenses';
$this->params['breadcrumbs'][] = ['label' => 'Bur Expenses', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="bur-expenses-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
