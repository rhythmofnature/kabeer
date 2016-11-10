<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use app\modules\business\models\MaterialTypes;
use app\modules\business\models\DriverDetails;
use app\modules\business\models\VehicleDetails;
use app\modules\business\models\CustomerDetails;
use app\modules\business\models\TripProducts;

use kartik\widgets\DepDrop;
use yii\helpers\Url;
use kartik\widgets\Select2;
use unclead\multipleinput\MultipleInput;
/* @var $this yii\web\View */
/* @var $model app\modules\business\models\Trips */

$this->title = 'Returns';
$this->params['breadcrumbs'][] = ['label' => 'Return', 'url' => ['return']];
$this->params['breadcrumbs'][] = $this->title;
?>




<div class="col-xs-12 col-lg-12">
<div class="<?php echo $model->isNewRecord ? 'box-success' : 'box-info'; ?> box view-item col-xs-12 col-lg-12">
   <div class="vehicle-details-form">


    <?php $form = ActiveForm::begin(); ?>
    
    <div class="col-xs-12 col-lg-12 no-padding">
        <div class="col-xs-12 col-sm-6 col-lg-6">
        <?php 
        if(!isset($model->date_of_travel)){
            $model->date_of_travel=date("d-m-Y");
        }
        echo $form->field($model, 'date_of_travel')->widget(yii\jui\DatePicker::className(),
        [
            'clientOptions' =>[
                    'dateFormat' => 'dd-mm-yyyy',
                    'changeMonth'=> true,
                    'changeYear'=> true,
                    'autoSize'=>true,
                    'yearRange'=>'1900:'.(date('Y')+1)],
                    'options'=>[
                    'class'=>'form-control',
                    'placeholder' => $model->getAttributeLabel('date_of_travel'),'style'=>'width:400px'
                ],]) ?>
        </div>
        
        <div class="col-xs-12 col-sm-6 col-lg-6">
        <?php
           echo $form->field($model, 'buyer')->widget(Select2::classname(), [
            'data' => ArrayHelper::map(CustomerDetails::find()->where(['status'=>1,'customer_type'=>2])->all(), 'id', 'name'),
            'options' => ['placeholder' => 'Select Customer ...','style'=>'width:400px','onChange'=>'buyerAmount();'],
            'pluginOptions' => [
            'allowClear' => true
            ],
            ]);
            ?>

        <?php /*echo  $form->field($model, 'merchant')
        ->dropDownList(
        ArrayHelper::map(CustomerDetails::find()->where(['status'=>1,'customer_type'=>1])->all(), 'id', 'name'),
        ['prompt'=>'Select Merchant','style'=>'width:400px','onChange'=>'merchantAmount();']
        );*/?>
        </div>
    </div>
      

    <?php
    $products= ArrayHelper::map(MaterialTypes::find()->where(['status'=>1])->all(), 'id', function($model, $defaultValue) {
                return $model->name.' - '.MaterialTypes::$measurementType[$model->measurement_type];
                }
                );
                

 $DataModel = new TripProducts();
?>
    <?= $form->field($DataModel, 'ProductDetails')->widget(MultipleInput::className(), [
    'max' => 100,
    'data'=>$tripProducts,
    'columns' => [
  
        [
            'name'  => 'product_id',
            'type'  => 'dropDownList',
            'title' => 'Products',
            'defaultValue' => 1,
             'options' => ['placeholder' => 'Select Customer 
...','style'=>'width:400px','onChange'=>'buyerAmount(this.value,this.id);','prompt'=>'Select'],
            'items' => 
              $products
            
        ],
        
        [
            'name'  => 'unit_price',
            'enableError' => true,
            'title' => 'Unit Price',
            'options' => [
                'class' => 'input-priority',
                'onChange'=>'getProductTotal(this.id);'
            ]
        ],
        
        [
            'name'  => 'quantity',
            'enableError' => true,
            'title' => 'Quantity',
            'options' => [
                'class' => 'input-priority',
                 'onChange'=>'getProductTotal(this.id);'
            ]
        ],
        [
            'name'  => 'price',
            'enableError' => true,
            'title' => 'Price',
            'options' => [
                'class' => 'input-priority price',
                 'onChange'=>'totalBuyersAmt();'
            ]
        ],
        
    ]
 ]);
?>

    <div class="col-xs-12 col-lg-12 no-padding">
        
        <div class="col-xs-12 col-sm-6 col-lg-6">
        <?= $form->field($model, 'buyer_amount_total')->textInput(['maxlength' => 7,'style'=>'width:400px']) ?>
        <?php echo $form->field($model, 'buyer_amount')->textInput(['maxlength' => 7,'style'=>'width:400px'])->hiddenInput()->label(false) ?>
        </div>
       
    </div>
    
    
    <div class="form-group col-xs-12 col-sm-6 col-lg-4 no-padding">
	<div class="col-xs-6">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord  ? 'btn btn-block btn-success' : 'btn 
btn-block btn-info']) ?>
	</div>
	<div class="col-xs-6">
	<?= Html::a('Cancel', ['index'], ['class' => 'btn btn-default btn-block']) ?>
	</div>
    </div>  
    
    
   

    <?php ActiveForm::end(); ?>

</div>
</div></div>
<script>

function buyerAmount(product_id,id){
  var splId=id.split("-"); 
  var idexId=splId[2];
  
  var material= product_id;
  var quantity = $("#tripproducts-productdetails-"+idexId+"-quantity").val();
  quantity =quantity ?quantity:0;

  var merchant = $("#trips-buyer").val();
  if(material){
   $.ajax({
    type     :'POST',
    cache    : false,
    data: {material: material,merchant:merchant},
    url  : '<?php echo \Yii::$app->getUrlManager()->createUrl('business/material/get-product-price') ?>',
    success  : function(response) {
		$("#tripproducts-productdetails-"+idexId+"-unit_price").val(response);
		$("#tripproducts-productdetails-"+idexId+"-price").val(response*quantity);
                 totalBuyersAmt();
    }
    });
  }

}




function totalBuyersAmt(){
    var grandTotal=0;
    $( ".price" ).each(function() {
        if(this.value)
          grandTotal = parseFloat(grandTotal)+parseFloat(this.value);
    });
    $("#trips-buyer_amount_total").val(grandTotal);
    $("#trips-buyer_amount").val(grandTotal);
}

function getProductTotal(id){
    var splId=id.split("-"); 
    var idexId=splId[2];
    var quantity = $("#tripproducts-productdetails-"+idexId+"-quantity").val();
    var unit_price=$("#tripproducts-productdetails-"+idexId+"-unit_price").val();
    $("#tripproducts-productdetails-"+idexId+"-price").val(unit_price*quantity);
    totalBuyersAmt();
}

</script>

