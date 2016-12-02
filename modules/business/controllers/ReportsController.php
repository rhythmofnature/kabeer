<?php

namespace app\modules\business\controllers;

use Yii;

use app\modules\business\models\Trips;
use app\modules\business\models\TripProducts;
use app\modules\business\models\Expenses;


use app\modules\business\models\MaterialTypes;
use app\modules\business\models\MaterialTypesSearch;
use app\modules\business\models\CustomerMaterialPrice;
use app\modules\business\models\BalanceSheet;
use app\modules\business\models\Transactions;
use app\modules\business\models\Payments;

use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\data\ActiveDataProvider;

/**
 * CustomerController implements the CRUD actions for CustomerDetails model.
 */
class ReportsController extends Controller
{

    public function actionDaily()
    {
       $where_addon = '';$report = '';
       $model = new Trips;
      
       $model->attributes = isset($_REQUEST['Trips'])?$_REQUEST['Trips']:'';
       $model->date_of_travel = date("d-m-Y");   
       if(isset($_REQUEST['Trips']['date_of_travel']))
        $model->date_of_travel = $_REQUEST['Trips']['date_of_travel'];
       if(isset($_REQUEST['Trips']['buyer']))
        $model->buyer = $_REQUEST['Trips']['buyer'];        
       
       
       if($model->buyer)
        $where_addon = "and buyer='$model->buyer'";    
       if($model->date_of_travel)
        $where_addon = "and bur_trips.date_of_travel='".date("Y-m-d",strtotime($model->date_of_travel))."'";          
    
       $trips = TripProducts::find()
       ->select([
                 'sum(quantity) as quantity',
                 'sum(price) as price',
                 'product_id'
                 ])
       ->joinWith('trip')
       ->groupBy(['product_id'])
       ->orderBy(['bur_trips.date_of_travel'=>SORT_DESC])
       ->where("bur_trips.id != '".Yii::$app->params['tripId']."' $where_addon")
       //->limit(20)
       ->all();
        
       
       if($trips)
       {
		foreach($trips as $trip)
		{
		  $report[$trip->product_id]['quantity'] = $trip->quantity;
		  $report[$trip->product_id]['price'] = $trip->price;
		  $report[$trip->product_id]['product'] = $trip->material->name;      
		}
       }
 
       return $this->render('daily', [
            'report' => $report,
            'model' => $model,
        ]);
    }

    public function actionVehiclew()
    {
       $where_addon = '';$report = '';
       $model = new Trips;
       $model->attributes = isset($_REQUEST['Trips'])?$_REQUEST['Trips']:'';
       
       if($model->vehicle_id)
        $where_addon .= "and vehicle_id='$model->vehicle_id'";
        
       $expenses = Expenses::find()
       ->select(['sum(amount) as amount','FROM_DAYS(TO_DAYS(date) -MOD(TO_DAYS(date) -1, 7)) AS date'])
       ->groupBy(['FROM_DAYS(TO_DAYS(date) -MOD(TO_DAYS(date) -1, 7))'])
       ->orderBy(['date'=>SORT_DESC])
       ->where("1 $where_addon")
       ->limit(20)
       ->all();  
       
       if($model->buyer)
        $where_addon = "and buyer='$model->buyer'";  
       if($model->merchant)
        $where_addon = "and merchant='$model->merchant'";         
    
       $trips = Trips::find()
       ->select([
                 'sum(vehicle_rent) as vehicle_rent',
                 'FROM_DAYS(TO_DAYS(date_of_travel) -MOD(TO_DAYS(date_of_travel) -1, 7)) AS date_of_travel',
                 'count(*) as id',
                 'sum(driver_amount) as driver_amount',
                 'sum(merchant_amount) as merchant_amount',
                 'sum(buyer_amount_total) as buyer_amount',
                 ])
       ->groupBy(['FROM_DAYS(TO_DAYS(date_of_travel) -MOD(TO_DAYS(date_of_travel) -1, 7))'])
       ->orderBy(['date_of_travel'=>SORT_DESC])
       ->where("id != '".Yii::$app->params['tripId']."' $where_addon")
       ->limit(20)
       ->all();
       
       
       
       if($trips)
       {
		foreach($trips as $trip)
		{
		  $report[$trip->date_of_travel]['rent'] = $trip->vehicle_rent;
		  $report[$trip->date_of_travel]['driver'] = $trip->driver_amount;
		  $report[$trip->date_of_travel]['merchant'] = $trip->merchant_amount;
		  $report[$trip->date_of_travel]['customer'] = $trip->buyer_amount;
		  $report[$trip->date_of_travel]['no_trips'] = $trip->id;        
		}
       }
 
       if($expenses)
       { 
		foreach($expenses as $expense)
		{
		  if(isset($report[$expense->date])) {
			$report[$expense->date]['expense'] = $expense->amount;      
		  }
		}  
       }
       
       return $this->render('vehiclew', [
            'report' => $report,
            'model' => $model,
        ]);
    }
    
    public function actionVehiclem()
    {
       $where_addon = '';$report = '';
       $model = new Trips;
       $model->attributes = isset($_REQUEST['Trips'])?$_REQUEST['Trips']:'';
       
       if($model->vehicle_id)
        $where_addon .= "and vehicle_id='$model->vehicle_id'";
        
       $expenses = Expenses::find()
       ->select(['sum(amount) as amount','DATE(DATE_FORMAT(date, "%Y-%m-01")) AS date'])
       ->groupBy(['DATE(DATE_FORMAT(date, "%Y-%m-01"))'])
       ->orderBy(['date'=>SORT_DESC])
       ->where("1 $where_addon")
       ->limit(20)
       ->all();  
       
       if($model->buyer)
        $where_addon = "and buyer='$model->buyer'";  
       if($model->merchant)
        $where_addon = "and merchant='$model->merchant'";         
    
       $trips = Trips::find()
       ->select([
                 'sum(vehicle_rent) as vehicle_rent',
                 'DATE(DATE_FORMAT(date_of_travel, "%Y-%m-01")) AS date_of_travel',
                 'count(*) as id',
                 'sum(driver_amount) as driver_amount',
                 'sum(merchant_amount) as merchant_amount',
                 'sum(buyer_amount_total) as buyer_amount',
                 ])
       ->groupBy(['DATE(DATE_FORMAT(date_of_travel, "%Y-%m-01"))'])
       ->orderBy(['date_of_travel'=>SORT_DESC])
       ->where("id != '".Yii::$app->params['tripId']."' $where_addon")
       ->limit(12)
       ->all();
       
       
       
       if($trips)
       {
		foreach($trips as $trip)
		{
		  $report[$trip->date_of_travel]['rent'] = $trip->vehicle_rent;
		  $report[$trip->date_of_travel]['driver'] = $trip->driver_amount;
		  $report[$trip->date_of_travel]['merchant'] = $trip->merchant_amount;
		  $report[$trip->date_of_travel]['customer'] = $trip->buyer_amount;
		  $report[$trip->date_of_travel]['no_trips'] = $trip->id;        
		}
       }
 
       if($expenses)
       { 
		foreach($expenses as $expense)
		{
		  if(isset($report[$expense->date])) {
			$report[$expense->date]['expense'] = $expense->amount;      
		  }
		}  
       }
       
       return $this->render('vehiclem', [
            'report' => $report,
            'model' => $model,
        ]);
    }    
    
}
?>
