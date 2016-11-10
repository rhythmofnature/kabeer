<?php

namespace app\modules\business\controllers;

use Yii;
use app\modules\business\models\Trips;
use app\modules\business\models\TripsSearch;
use app\modules\business\models\MaterialTypes;
use app\modules\business\models\BalanceSheet;
use app\modules\business\models\TripProducts;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\data\ActiveDataProvider;


/**
 * TripsController implements the CRUD actions for Trips model.
 */
class TripsController extends Controller
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
     * Lists all Trips models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new TripsSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams,2);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Trips model.
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
     * Creates a new Trips model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
       $model = new Trips(['scenario' => Trips::SCENARIO_BUYER]);
        $tripProducts = new TripProducts();
        if (Yii::$app->request->post()) {
//                             print_r($_POST);exit;
                            $model = new Trips(['scenario' => Trips::SCENARIO_BUYER]);
                            $model->load(Yii::$app->request->post());
                            $model->date_of_travel = date("Y-m-d H:i:s",strtotime($model->date_of_travel));
                            $model->save();
//                             print_r($model->attributes);exit;
                            $tripId=$model->id;
                            foreach($_POST['TripProducts']['ProductDetails'] as $val){
                                $TripProducts = new TripProducts();
//                                 $TripProducts->product_id = $val->$val;
                                 $TripProducts->product_id = $val['product_id'];
                                 $TripProducts->unit_price = $val['unit_price'];
                                 $TripProducts->quantity = $val['quantity'];
                                 $TripProducts->price = $val['price'];
                                 $TripProducts->trip_id = $tripId;
                                 $TripProducts->save();

                            }
//                              print_r($_POST['TripProducts']);exit;

			
            	return $this->redirect(['index']);
			
        } else {
            return $this->render('create', [
                'model' => $model,'tripProducts'=>$tripProducts
            ]);
        }
    }
    
    /**
     * Creates a new Trips model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionShopping()
    {
        $model = new Trips(['scenario' => Trips::SCENARIO_MERCHANT]);

        if (Yii::$app->request->post()) {
                        $trip_count=$_POST['Trips']['trip_count'];
                        for($i=1;$i<=$trip_count;$i++){
                            $model = new Trips();
                            $model->load(Yii::$app->request->post());
                            $model->date_of_travel = date("Y-m-d H:i:s",strtotime($model->date_of_travel));
                            $model->save();
			}
			
            	return $this->redirect(['index']);
			
        } else {
            return $this->render('shopping', [
                'model' => $model,
            ]);
        }
    }    

    /**
     * Updates an existing Trips model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
     $count = BalanceSheet::find()->where(['trip_id'=>$id,'status'=>'closed'])->count();
     if($count > 0){
            Yii::$app->session->setFlash('delete',"Cannot update, Bill generated already for this trip ");
            return $this->redirect(['index']);
        }   
    
    
        $model = $this->findModel($id);
        $model->scenario = Trips::SCENARIO_BUYER;
        $tripProducts=TripProducts::find()->where(['trip_id'=>$id])->all();
 


		if (Yii::$app->request->post()) {
			$model->load(Yii::$app->request->post());
			BalanceSheet::deleteAll('trip_id = :trip_id', [':trip_id' => $model->id]);
			$model->date_of_travel = date("Y-m-d H:i:s",strtotime($model->date_of_travel));
			if($model->save( )){
                            $tripId=$model->id;
                            TripProducts::deleteAll('trip_id = :trip_id', [':trip_id' => $tripId]);
                            foreach($_POST['TripProducts']['ProductDetails'] as $val){
                                
                                 $TripProducts = new TripProducts();
                                 $TripProducts->product_id = $val['product_id'];
                                 $TripProducts->unit_price = $val['unit_price'];
                                 $TripProducts->quantity = $val['quantity'];
                                 $TripProducts->price = $val['price'];
                                 $TripProducts->trip_id = $tripId;
                                 $TripProducts->save();

                            }
                            return $this->redirect(['view', 'id' => $model->id]);
			}else{
				return $this->render('view', [
                'model' => $model,'tripProducts'=>$tripProducts
            ]);
			}

        //if ($model->load(Yii::$app->request->post()) && $model->save()) {
          //  return $this->redirect(['view', 'id' => $model->id]);
        } else {
        
            return $this->render('update', [
                'model' => $model,'tripProducts'=>$tripProducts
            ]);
        }
    }

    /**
     * Deletes an existing Trips model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        
        $count = BalanceSheet::find()->where(['trip_id'=>$id,'status'=>'closed'])->count();
        if($count==0){
            
            $this->findModel($id)->delete();
            BalanceSheet::deleteAll('trip_id = :trip_id', [':trip_id' => $id]);
            return $this->redirect(['index']);
            }else{
                Yii::$app->session->setFlash('delete',"Cannot delete, Bill generated already for this trip ");
                return $this->redirect(['index']);
            }
            
            
    }
    
    
    public function actionReturnList()
    {
        $searchModel = new TripsSearch();
        $dataProvider = $searchModel->searchReturn(Yii::$app->request->queryParams,2);

        return $this->render('returnlist', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }
    public function actionReturn(){
    
        
        $model = new Trips(['scenario' => Trips::SCENARIO_BUYER]);
        $tripProducts = new TripProducts();
        $balanceSheet = new BalanceSheet();
        if (Yii::$app->request->post()) {
//                             print_r($_POST);exit;
                            $model = new Trips(['scenario' => Trips::SCENARIO_BUYER]);
                            $model->load(Yii::$app->request->post());
                            $model->ready_buyer = 'no';
                            $model->date_of_travel = date("Y-m-d H:i:s",strtotime($model->date_of_travel));
                            $model->returns='yes';
                            $model->save();
//                             print_r($model->attributes);exit;
                            $tripId=$model->id;
                            
                           
           
           
                            foreach($_POST['TripProducts']['ProductDetails'] as $val){
                                $TripProducts = new TripProducts();
//                                 $TripProducts->product_id = $val->$val;
                                 $TripProducts->product_id = $val['product_id'];
                                 $TripProducts->unit_price = $val['unit_price'];
                                 $TripProducts->quantity = $val['quantity'];
                                 $TripProducts->price = $val['price'];
                                 $TripProducts->trip_id = $tripId;
                                 
                                 $TripProducts->save();

                            }
//                              print_r($_POST['TripProducts']);exit;

			
            	return $this->redirect(['return-list']);
			
        } else {
            return $this->render('return', [
                'model' => $model,'tripProducts'=>array()
            ]);
        }
        
    }

    /**
     * Finds the Trips model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Trips the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Trips::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
