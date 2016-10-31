<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\modules\business\models\Trips */

$this->title = 'Update Sales: ' . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Sales', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="trips-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,'tripProducts'=>$tripProducts
    ]) ?>

</div>
