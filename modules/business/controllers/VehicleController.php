<?php

namespace app\modules\business\controllers;

use Yii;
use app\modules\business\models\VehicleDetails;
use app\modules\business\models\VehicleDetailsSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * VehicleController implements the CRUD actions for VehicleDetails model.
 */
class VehicleController extends Controller
{
//     public function behaviors()
//     {
//         return [
//             'verbs' => [
//                 'class' => VerbFilter::className(),
//                 'actions' => [
//                     'delete' => ['post'],
//                 ],
//             ],
//         ];
//     }

    /**
     * Lists all VehicleDetails models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new VehicleDetailsSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single VehicleDetails model.
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
     * Creates a new VehicleDetails model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new VehicleDetails();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing VehicleDetails model.
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
     * Deletes an existing VehicleDetails model.
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
     * Finds the VehicleDetails model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return VehicleDetails the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = VehicleDetails::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
    
    
    public function actionGetkmpprice(){
    $id = $_POST['vehicle'];
    $km = $_POST['km'];
    $vehicleDetails=$this->findModel($id);
	$pricePerKm=$vehicleDetails->charge_per_km;
	return $total =$pricePerKm*$km;
	

    }
}
