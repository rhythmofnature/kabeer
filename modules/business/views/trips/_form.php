<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use app\modules\business\models\MaterialTypes;
use app\modules\business\models\DriverDetails;
use app\modules\business\models\VehicleDetails;
use app\modules\business\models\CustomerDetails;
use kartik\widgets\DepDrop;
use yii\helpers\Url;
use kartik\widgets\Select2

/* @var $this yii\web\View */
/* @var $model app\modules\business\models\Trips */
/* @var $form yii\widgets\ActiveForm */
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
                    'placeholder' => $model->getAttributeLabel('date_of_travel'),'style'=>'width:500px'
                ],]) ?>
        </div>
        
        <div class="col-xs-12 col-sm-6 col-lg-6">
        <?php
            echo $form->field($model, 'merchant')->widget(Select2::classname(), [
            'data' => ArrayHelper::map(CustomerDetails::find()->where(['status'=>1,'customer_type'=>1])->orderBy('name')->all(), 'id', 'name'),
            'options' => ['placeholder' => 'Select Merchant ...','style'=>'width:500px','onChange'=>'merchantAmount();'],
            'pluginOptions' => [
            'allowClear' => true
            ],
            ]);
            ?>

        <?php /*echo  $form->field($model, 'merchant')
        ->dropDownList(
        ArrayHelper::map(CustomerDetails::find()->where(['status'=>1,'customer_type'=>1])->all(), 'id', 'name'),
        ['prompt'=>'Select Merchant','style'=>'width:500px','onChange'=>'merchantAmount();']
        );*/?>
        </div>
    </div>
      
    <div class="col-xs-12 col-lg-12 no-padding">
        <div class="col-xs-12 col-sm-6 col-lg-6">
         <?php
            echo $form->field($model, 'buyer')->widget(Select2::classname(), [
            'data' => ArrayHelper::map(CustomerDetails::find()->where(['status'=>1,'customer_type'=>2])->orderBy('name')->all(), 'id', 'name'),
            'options' => ['placeholder' => 'Select Customer ...','style'=>'width:500px','onChange'=>'buyerAmount();'],
            'pluginOptions' => [
            'allowClear' => true
            ],
            ]);
            ?>
            
            
        <?php /*echo  $form->field($model, 'buyer')
        ->dropDownList(
        ArrayHelper::map(CustomerDetails::find()->where(['status'=>1,'customer_type'=>2])->all(), 'id', 'name'),
        ['prompt'=>'Select Buyer','style'=>'width:500px','onChange'=>'buyerAmount();']
        );*/?>
        </div>
        <div class="col-xs-12 col-sm-6 col-lg-6">
        <?= $form->field($model, 'vehicle_id')
        ->dropDownList(
        ArrayHelper::map(VehicleDetails::find()->where(['status'=>1])->all(), 'id', 'name'),
        ['prompt'=>'Select Vehicle','style'=>'width:500px','id'=>'vehicle-id','onChange'=>'calculateKMA();']
        );?>
        </div>
    </div>
      
    <div class="col-xs-12 col-lg-12 no-padding">
        <div class="col-xs-12 col-sm-6 col-lg-6">
        <?php echo $form->field($model, 'driver_id')->widget(DepDrop::classname(), 
        [
        'options'=>['id'=>'driver_id','style'=>'width:500px'],
        'data'=> ArrayHelper::map(DriverDetails::find()->where(['status'=>1,'customer_type'=>3])->all(), 'id', 'name'),
        'pluginOptions'=>[
        'depends'=>['vehicle-id'],
        'placeholder'=>'Select driver',
        'url'=>Url::to(['/business/driver/driverlist'])
        ]
        ]);
        ?>   
        </div>
        <div class="col-xs-12 col-sm-6 col-lg-6">
        <?= $form->field($model, 'material_id')
        ->dropDownList(
        ArrayHelper::map(MaterialTypes::find()->where(['status'=>1])->all(), 'id', function($model, $defaultValue) {
        return $model->name.' - '.MaterialTypes::$measurementType[$model->measurement_type];
        }
        ),
        ['prompt'=>'Select Material','style'=>'width:500px','onChange'=>'merchantAmount();buyerAmount();changematerial()']
        );?>
        </div>
    </div>

    <div class="col-xs-12 col-lg-12 no-padding">
        <div class="col-xs-12 col-sm-6 col-lg-6">
        <?= $form->field($model, 'size')->textInput(['maxlength' => 100,'style'=>'width:500px','onChange'=>'merchantAmount();buyerAmount();']) ?>
        </div>
        <div class="col-xs-12 col-sm-6 col-lg-6">
        <?= $form->field($model, 'site_name')->textInput(['maxlength' => 250,'style'=>'width:500px']) ?>
        </div>
    </div>
    
    
    <div class="col-xs-12 col-lg-12 no-padding">
 
        <div class="col-xs-12 col-sm-6 col-lg-6">
        <?= $form->field($model, 'kilometre')->textInput(['maxlength' => 100,'style'=>'width:500px','onChange'=>'calculateKMA();']) ?>
        </div>
        <div class="col-xs-12 col-sm-6 col-lg-6">
        <?= $form->field($model, 'vehicle_rent')->textInput(['style'=>'width:500px','onChange'=>'driverRent();']) ?>
        </div>
    </div>

    <div class="col-xs-12 col-lg-12 no-padding">
        
        <div class="col-xs-12 col-sm-6 col-lg-6">
        <?= $form->field($model, 'driver_amount')->textInput(['maxlength' => 7,'style'=>'width:500px']) ?>
        </div>
        <div class="col-xs-12 col-sm-6 col-lg-6">
        <?= $form->field($model, 'merchant_amount')->textInput(['maxlength' => 7,'style'=>'width:500px']) ?>
        </div>
 
    </div>

    <div class="col-xs-12 col-lg-12 no-padding">
        
        <div class="col-xs-12 col-sm-6 col-lg-6">
        <?= $form->field($model, 'buyer_amount_total')->textInput(['maxlength' => 7,'style'=>'width:500px']) ?>
        <?php echo $form->field($model, 'buyer_amount')->textInput(['maxlength' => 7,'style'=>'width:500px'])->hiddenInput()->label(false) ?>
        </div>
        <div class="col-xs-12 col-sm-6 col-lg-6">
        <?= $form->field($model, 'buyer_trip_sheet_number')->textInput(['maxlength' => 20,'style'=>'width:500px']) ?>
        </div>
    </div>

    <div class="col-xs-12 col-lg-12 no-padding">
        
        <div class="col-xs-12 col-sm-6 col-lg-6">
        <?= $form->field($model, 'seller_trip_sheet_number')->textInput(['maxlength' => 20,'style'=>'width:500px']) ?>
        </div>
        <div class="col-xs-12 col-sm-6 col-lg-6">
         <?php 
         if($model->isNewRecord){
         if(!isset($model->ready_merchant))
            $model->trip_count='1';
            
             $range= array("1"=>'1',"2"=>'2',"3"=>'3',"4"=>'4',"5"=>'5',"6"=>'6',"7"=>'7',"8"=>8,"9"=>'9',"10"=>'10');
         echo $form->field($model, 'trip_count')
        ->dropDownList($range,
        ['prompt'=>'Trip Count','style'=>'width:500px']
        );
        }?>
        </div>
    </div>
    
    <div class="col-xs-12 col-lg-12 no-padding">
        
        <div class="col-xs-12 col-sm-6 col-lg-6">
        <?php 
        if(!isset($model->ready_merchant))
            $model->ready_merchant='no';
        echo $form->field($model, 'ready_merchant')
        ->dropDownList(array('no'=>'No','yes'=>'Yes'),
        ['prompt'=>'Is it ready cash payment?','style'=>'width:500px']
        ); ?>
        </div>
        <div class="col-xs-12 col-sm-6 col-lg-6">
         <?php 
         if(!isset($model->ready_buyer))
            $model->ready_buyer='no';
         echo $form->field($model, 'ready_buyer')
        ->dropDownList(array('no'=>'No','yes'=>'Yes'),
        ['prompt'=>'Is it ready cash payment','style'=>'width:500px']
        ); ?>
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
function changematerial(){
    var text = $("#trips-material_id option:selected").text();
    if (/load/i.test(text)){
       $("#trips-size").val(1);
    }
    

}
function merchantAmount(){	

  var material= $("#trips-material_id").val();
  var quantity = $("#trips-size").val();
  var merchant = $("#trips-merchant").val();
  if(material !="" && quantity !="" && merchant !=""){
  console.log(material);
  console.log(quantity);
   $.ajax({
    type     :'POST',
    cache    : false,
    data: {material: material, 'quantity': quantity,'customer':merchant},
    url  : '<?php echo \Yii::$app->getUrlManager()->createUrl('business/customer/gettripprice') ?>',
    success  : function(response) {
		$("#trips-merchant_amount").val(response);
       console.log(response);
    }
    });
  }

}
function buyerAmount(){	

  var material= $("#trips-material_id").val();
  var quantity = $("#trips-size").val();
  var merchant = $("#trips-buyer").val();
  if(material !="" && quantity !="" && merchant !=""){
  console.log(material);
  console.log(quantity);
   $.ajax({
    type     :'POST',
    cache    : false,
    data: {material: material, 'quantity': quantity,'customer':merchant},
    url  : '<?php echo \Yii::$app->getUrlManager()->createUrl('business/customer/gettripprice') ?>',
    success  : function(response) {
		$("#trips-buyer_amount").val(response);
		totalBuyersAmt();
       console.log(response);
    }
    });
  }

}

function calculateKMA(){

  var vehicle = $("#vehicle-id").val();
  var km = $("#trips-kilometre").val();
  if(vehicle !="" && km !=""){
  console.log(vehicle);
  console.log(km);
   $.ajax({
    type     :'POST',
    cache    : false,
    data: {vehicle: vehicle, 'km': km},
    url  : '<?php echo \Yii::$app->getUrlManager()->createUrl('business/vehicle/getkmpprice') ?>',
    success  : function(response) {
		$("#trips-vehicle_rent").val(response);
        driverRent(response);
    }
    });
  }
  
}

function driverRent(toatlRent){



var driverId= $("#driver_id").val();


if(typeof(toatlRent) == "undefined"){
    toatlRent =  $("#trips-vehicle_rent").val();
}
console.log(driverId);
console.log(toatlRent);
if(typeof(toatlRent) != "undefined" && toatlRent !== null){
if(toatlRent !="" && driverId !=""){

   $.ajax({
    type     :'POST',
    cache    : false,
    data: {driverId: driverId, 'toatlRent': toatlRent},
    url  : '<?php echo \Yii::$app->getUrlManager()->createUrl('business/driver/gettripbata') ?>',
    success  : function(response) {
		$("#trips-driver_amount").val(response);
		totalBuyersAmt();
       
    }
    });
  }
}
}


function totalBuyersAmt(){
var material_price =$("#trips-buyer_amount").val();
var vehicle_rent =$("#trips-vehicle_rent").val();
if(material_price !="" && vehicle_rent !=""){
  var gTotal= parseFloat(material_price)+parseFloat(vehicle_rent);
  $("#trips-buyer_amount_total").val(gTotal);
}

}

</script>

