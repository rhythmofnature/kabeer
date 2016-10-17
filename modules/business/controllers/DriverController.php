<?php

namespace app\modules\business\controllers;
use yii\helpers\Json;
use Yii;
use app\modules\business\models\DriverDetails;
use app\modules\business\models\DriverDetailsSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\helpers\ArrayHelper;

/**
 * DriverController implements the CRUD actions for DriverDetails model.
 */
class DriverController extends Controller
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
     * Lists all DriverDetails models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new DriverDetailsSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single DriverDetails model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new DriverDetails model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new DriverDetails();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing DriverDetails model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing DriverDetails model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the DriverDetails model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return DriverDetails the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = DriverDetails::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
    public function actionDriverlist()
    {
	$out=DriverDetails::find()->where(['status'=>1,'customer_type'=>3])->all();
	    $selected='';
	    if (isset($_POST['depdrop_parents'])) {
	    $vehicle_id = $_POST['depdrop_parents'];
	    $driver_details = DriverDetails::find()->where(['vehicle'=>$vehicle_id])->One();
	    if($driver_details)
	    $selected=$driver_details->id;
	    }
        echo Json::encode(['output'=>$out, 'selected'=>$selected]);
        //return true;
    }
    
    
    public function actionGettripbata(){
	  $driver =$_POST['driverId'];
	  $toatlRent =$_POST['toatlRent'];
	  $driverDetails=$this->findModel($driver);
	  $earning_percentage=$driverDetails->earning_percentage;
	  $total_earning= ($toatlRent*$earning_percentage)/100;
	  echo $total_earning;
    
    }
    
}
