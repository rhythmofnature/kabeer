<?php

namespace app\modules\business\controllers;

use Yii;
use app\modules\business\models\VehicleParams;
use app\modules\business\models\VehicleParamDates;
use app\modules\business\models\VehicleParamDatesSearch;
use app\modules\business\models\VehicleDetails;
use app\modules\business\models\VehicleDetailsSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * VehicleParamDatesController implements the CRUD actions for VehicleParamDates model.
 */
class VehicleParamDatesController extends Controller
{
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                ],
            ],
        ];
    }

    /**
     * Lists all VehicleParamDates models.
     * @return mixed
     */
    public function actionIndex()
    {
       $vehicle_params = '';$saved_params = '';
       $model = new VehicleParamDates();
       $searchModel = new VehicleParamDatesSearch();
       $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
       
       if (Yii::$app->request->post()) {
          $model->deleteAll();
          $paid_dates = $_POST['renewal_date'];
          foreach($paid_dates as $vehicle_id => $param_date)
          {
           foreach($param_date as $param => $date)
           {  
             $save_model = new VehicleParamDates();
             $save_model->param_id = $param;
             $save_model->vehicle_id = $vehicle_id;
             $save_model->paid_date = $date;
             $save_model->renewal_date = $_POST['renewal_date'][$vehicle_id][$param];
             
             if(!$save_model->paid_date) $save_model->paid_date = '0';
             if(!$save_model->renewal_date) $save_model->renewal_date = '0';
             $save_model->save();
           }
          }
        }   
        
       $saved_params_obj = VehicleParamDates::find()->all(); 
       if($saved_params_obj)
       {
		foreach($saved_params_obj as $saved_params_vals)
		{
		 $saved_params[$saved_params_vals->vehicle_id][$saved_params_vals->param_id]['paid_date'] = $saved_params_vals->paid_date;
		 $saved_params[$saved_params_vals->vehicle_id][$saved_params_vals->param_id]['renewal_date'] = $saved_params_vals->renewal_date;
		}
       }        
       
       
                
       $vehicles = VehicleDetails::find()
       ->orderBy(['name'=>SORT_ASC])
       ->where("type != 3 and status=1")
       ->all(); 
       
       $params = VehicleParams::find()
       ->orderBy(['name'=>SORT_ASC])
       ->all();        
       
       if($vehicles)
       {
		foreach($vehicles as $vehicle)
		{
		 foreach($params as $param)
		 {  
		  $vehicle_params[$vehicle->id][$param->id] = 
		  array(
		  isset($saved_params[$vehicle->id][$param->id]['paid_date'])?$saved_params[$vehicle->id][$param->id]['paid_date']:0,
		  isset($saved_params[$vehicle->id][$param->id]['renewal_date'])?$saved_params[$vehicle->id][$param->id]['renewal_date']:0
		  );
		 }
		}
       }  
             

        return $this->render('index', [
            'vehicles' => $vehicles,
            'params' => $params,
            'vehicle_params' => $vehicle_params,
            'model' => $model,
        ]);
    }

    /**
     * Displays a single VehicleParamDates model.
     * @param integer $vehicle_id
     * @param integer $param_id
     * @return mixed
     */
    public function actionView($vehicle_id, $param_id)
    {
        return $this->render('view', [
            'model' => $this->findModel($vehicle_id, $param_id),
        ]);
    }

    /**
     * Creates a new VehicleParamDates model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new VehicleParamDates();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'vehicle_id' => $model->vehicle_id, 'param_id' => $model->param_id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing VehicleParamDates model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $vehicle_id
     * @param integer $param_id
     * @return mixed
     */
    public function actionUpdate($vehicle_id, $param_id)
    {
        $model = $this->findModel($vehicle_id, $param_id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'vehicle_id' => $model->vehicle_id, 'param_id' => $model->param_id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing VehicleParamDates model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $vehicle_id
     * @param integer $param_id
     * @return mixed
     */
    public function actionDelete($vehicle_id, $param_id)
    {
        $this->findModel($vehicle_id, $param_id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the VehicleParamDates model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $vehicle_id
     * @param integer $param_id
     * @return VehicleParamDates the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($vehicle_id, $param_id)
    {
        if (($model = VehicleParamDates::findOne(['vehicle_id' => $vehicle_id, 'param_id' => $param_id])) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
