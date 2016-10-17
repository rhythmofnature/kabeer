<?php
$this->title = 'Manage Material Price';
$this->params['breadcrumbs'][] = $this->title;

use yii\helpers\Html;
use kartik\widgets\ActiveForm;
use kartik\builder\TabularForm;
use kartik\grid\GridView;
use kartik\widgets\TimePicker;
use yii\widgets\Pjax;
use kartik\widgets\DatePicker;

?>


<?php

$form = ActiveForm::begin();
Pjax::begin();
echo TabularForm::widget([
'gridSettings'=>[
  'pjax'=>true,
 'panel'=>[ 'type' => GridView::TYPE_PRIMARY,'heading'=>'Manage Material Price'],
 ],
'actionColumn'=>false,
'checkboxColumn'=>false,
'dataProvider'=>$dataProvider,
'form'=>$form,
'attributes'=>$searchModel->formAttribs
]);
Pjax::end();
// Add other fields if needed or render your submit button
echo '<div class="text-right">' .
Html::submitButton('Submit', ['class'=>'btn btn-primary']) .
'<div>';
ActiveForm::end();
?>
</div>