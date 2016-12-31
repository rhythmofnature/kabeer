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
        $where_addon .= "and bur_trips.buyer='$model->buyer'";    
       if($model->date_of_travel)
        $where_addon .= "and bur_trips.date_of_travel='".date("Y-m-d",strtotime($model->date_of_travel))."'";          
    
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
       //$model->date_of_travel = date("d-m-Y");   
       if(isset($_REQUEST['Trips']['date_of_travel']))
        $model->date_of_travel = $_REQUEST['Trips']['date_of_travel'];
       if(isset($_REQUEST['Trips']['buyer']))
        $model->buyer = $_REQUEST['Trips']['buyer'];        
       
       
       if($model->buyer)
        $where_addon .= "and bur_trips.buyer='$model->buyer'";    
       if($model->date_of_travel)
        $where_addon .= "and bur_trips.date_of_travel='".date("Y-m-d",strtotime($model->date_of_travel))."'";          
    
       $trips = TripProducts::find()
       ->select([
                 'FROM_DAYS(TO_DAYS(bur_trips.date_of_travel) -MOD(TO_DAYS(bur_trips.date_of_travel) -1, 7)) AS date_of_travel',
                 'sum(quantity) as quantity',
                 'sum(price) as price',
                 'product_id'
                 ])
       ->joinWith('trip')
       ->groupBy(['FROM_DAYS(TO_DAYS(bur_trips.date_of_travel) -MOD(TO_DAYS(bur_trips.date_of_travel) -1, 7))','product_id'])
       ->orderBy(['bur_trips.date_of_travel'=>SORT_DESC])
       ->where("bur_trips.id != '".Yii::$app->params['tripId']."' and buyer > 0 $where_addon")
       //->limit(20)
       ->all();
        
       
       if($trips)
       {
		foreach($trips as $trip)
		{
		  $report[$trip->date_of_travel][$trip->product_id]['quantity'] = $trip->quantity;
		  $report[$trip->date_of_travel][$trip->product_id]['price'] = $trip->price;
		  $report[$trip->date_of_travel][$trip->product_id]['product'] = $trip->material->name;      
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
       //$model->date_of_travel = date("d-m-Y");   
       if(isset($_REQUEST['Trips']['date_of_travel']))
        $model->date_of_travel = $_REQUEST['Trips']['date_of_travel'];
       if(isset($_REQUEST['Trips']['buyer']))
        $model->buyer = $_REQUEST['Trips']['buyer'];        
       
       
       if($model->buyer)
        $where_addon .= "and bur_trips.buyer='$model->buyer'";    
       if($model->date_of_travel)
        $where_addon .= "and bur_trips.date_of_travel='".date("Y-m-d",strtotime($model->date_of_travel))."'";          
    
       $trips = TripProducts::find()
       ->select([
                 'DATE(DATE_FORMAT(bur_trips.date_of_travel, "%Y-%m-01")) AS date_of_travel',
                 'sum(quantity) as quantity',
                 'sum(price) as price',
                 'product_id'
                 ])
       ->joinWith('trip')
       ->groupBy(['DATE(DATE_FORMAT(bur_trips.date_of_travel, "%Y-%m-01"))','product_id'])
       ->orderBy(['bur_trips.date_of_travel'=>SORT_DESC])
       ->where("bur_trips.id != '".Yii::$app->params['tripId']."' and buyer > 0 $where_addon")
       //->limit(20)
       ->all();
        
       
       if($trips)
       {
		foreach($trips as $trip)
		{
		  $report[$trip->date_of_travel][$trip->product_id]['quantity'] = $trip->quantity;
		  $report[$trip->date_of_travel][$trip->product_id]['price'] = $trip->price;
		  $report[$trip->date_of_travel][$trip->product_id]['product'] = $trip->material->name;      
		}
       }

       return $this->render('vehiclem', [
            'report' => $report,
            'model' => $model,
        ]);
    }      
   
}
?>
