<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\modules\business\models\CustomerDetails */

$this->title = 'Update Customer Details: ' . ' ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Customer Details', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="col-xs-12">
  <div class="col-lg-4 col-sm-4 col-xs-12 no-padding"><h3 class="box-title"><i class="fa fa-edit"></i> <?= Html::encode($this->title) ?></h3></div>
  <div class="col-xs-4"></div>
  <div class="col-lg-4 col-sm-4 col-xs-12 no-padding" style="padding-top: 20px !important;">
	<div class="col-xs-4"></div>
	<div class="col-xs-4"></div>
	<div class="col-xs-4 left-padding">
	<?= Html::a('Back', ['index'], ['class' => 'btn btn-block btn-back']) ?>
	</div>
   </div>
</div>

<div class="customer-details-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
