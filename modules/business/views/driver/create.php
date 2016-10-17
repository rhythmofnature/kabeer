<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\modules\business\models\DriverDetails */

$this->title = 'Create Driver Details';
$this->params['breadcrumbs'][] = ['label' => 'Driver Details', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="col-xs-12">
  <div class="col-lg-4 col-sm-4 col-xs-12 no-padding"><h3 class="box-title"><i class="fa fa-plus"></i> <?php echo $this->title;?></h3></div>
  <div class="col-xs-4"></div>
  <div class="col-lg-4 col-sm-4 col-xs-12 no-padding" style="padding-top: 20px !important;">
	<div class="col-xs-4"></div>
	<div class="col-xs-4"></div>
	<div class="col-xs-4 left-padding">
	<?= Html::a('Back', ['index'], ['class' => 'btn btn-block btn-back']) ?>
	</div>
   </div>
</div>

<div class="driver-details-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
