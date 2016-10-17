<?php

namespace app\modules\business\controllers;

use Yii;

use app\modules\business\models\CustomerDetails;
use app\modules\business\models\CustomerDetailsSearch;
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
use mPDF;

/**
 * CustomerController implements the CRUD actions for CustomerDetails model.
 */
class BillsController extends Controller
{

    public function actionIndex()
    {
        $searchModel = new CustomerDetailsSearch();
        
       $dataProvider = $searchModel->searchAll(Yii::$app->request->queryParams);
        $model = new CustomerDetailsSearch();
        $model->attributes = 
isset($_REQUEST['CustomerDetailsSearch'])?$_REQUEST['CustomerDetailsSearch']:'';
        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'model'=>$model,
        ]);
    }
    
    
     public function actionInvoices()
    {
        $searchModel = new CustomerDetailsSearch();
        
       $dataProvider = $searchModel->searchAll(Yii::$app->request->queryParams);
        $model = new CustomerDetailsSearch();
        $model->attributes = 
isset($_REQUEST['CustomerDetailsSearch'])?$_REQUEST['CustomerDetailsSearch']:'';
        return $this->render('invoices', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'model'=>$model,
        ]);
    }
    
    
    
    public function actionGenerate(){
       $id=$_REQUEST['id'];
        $model =new CustomerDetails();
        $customer_details = $this->findModel($id);
         if (Yii::$app->request->post()) {
           // echo "test";exit;
            $customer_id    =   $id;
            
            $feesDetails = BalanceSheet::find()->where(['status' => 'open','customer_id'=>$customer_details->id])->orderBy('trip_id')->all();
            $closed_bill=Transactions::find()->where(['status'=>'closed','customer_id'=>$customer_details->id])->orderBy(['id'=>SORT_DESC])->one();
//             echo "<pre>";print_r($closed_bill->attributes);exit;
//             $closed_bill=Transactions::findOne(['status'=>'open','customer_id'=>$customer_details->id]);
            $previous_balance = isset($closed_bill->balance)?$closed_bill->balance:0;
            $no=1;
           
            $invoice_amt= 0;
            $sheet_ids="";
            foreach($feesDetails as $key=>$value) {
                $sheet_ids.=$value['id'].",";
                $invoice_amt+=$value['amount'];
                $no++;
            }
            $sheet_ids = rtrim($sheet_ids,",");
            $invoice_amt = $invoice_amt+$previous_balance;
            $save_model= new Transactions();
            
            $save_model->customer_id = $id;
            $save_model->ivoice_amount = $invoice_amt;
            $save_model->previous_balance=$previous_balance;
            $save_model->sheet_ids=$sheet_ids;
            $save_model->created_on=date("Y-m-d");
            $save_model->status="open";
            $save_model->save();
//             print_r($save_model->getErrors());
//             exit;
              return $this->redirect(['view', 'id' =>$save_model->id]);
             exit;
            
         }
        return $this->render('generate', ['model' =>$customer_details]);
    }
    
     public function actionView($id){
        $transaction= new Transactions();
        $transaction = $transaction->findOne($id);
        $customer_id= $transaction['customer_id'];
        $model =new CustomerDetails();
        $customer_details = $this->findModel($customer_id);
        if (Yii::$app->request->post()) {
        
            if(isset($_POST['pay'])){
                /*if( $_POST['Transactions']['paid_amount']==0){
                    //$transaction->setError("");
                    return $this->render('view', ['model' =>$customer_details,'transaction'=>$transaction]);
                    exit;
                }*/
                $paid_date=date("Y-m-d",strtotime($_POST['Transactions']['paid_date']));
                $paid_amount=$_POST['Transactions']['paid_amount'];
                $transaction->paid_date = $paid_date;
                $transaction->paid_amount = $paid_amount;
                $transaction->balance = $transaction->ivoice_amount - $paid_amount;
                $transaction->status='closed';
                $sheet_ids=$transaction->sheet_ids?$transaction->sheet_ids:0;
                
                BalanceSheet::updateAll(array( 'status' => 'closed' ), "id in($sheet_ids) AND 
customer_id='$customer_details->id'" );
                $transaction->save();
                
                if($customer_details->customer_type==1 || $customer_details->customer_type==3){
                    $to_or_from="to";
                }else if($customer_details->customer_type==2){
                    $to_or_from="from";
                }
                $ob_payment = new Payments();
                $ob_payment->customer_id=$customer_details->id;
                $ob_payment->trans_id =$id;
                $ob_payment->date=$paid_date;
                $ob_payment->amount = $paid_amount;
                $ob_payment->to_or_from=$to_or_from;
                $ob_payment->save();
    
                 return $this->redirect(['index']);
                
                
                
            
            }
            
            if(isset($_POST['cancel'])){
//                     echo $id;exit;
                    $details=Transactions::findOne($id);
//                     print_r($details->attributes);exit;
                    $details->delete();
                    return $this->redirect(['index']);
            }
        }
        
        return $this->render('view', ['model' =>$customer_details,'transaction'=>$transaction]);
        
     }
    
    public function actionPrintInvoice(){
        $id = $_REQUEST['id'];
        $transaction= new Transactions();
        $transaction = $transaction->findOne($id);
        $id= $transaction['customer_id'];
        $model =new CustomerDetails();
        $customer_details = $this->findModel($id);
        $html = $this->renderPartial('print-invoice', ['model' =>$customer_details,'transaction'=>$transaction]);
        $imgSrc = Yii::$app->urlManager->createAbsoluteUrl('site/loadimage');
		$mpdf = new mPDF('utf-8', 'A4',0,'',15,15,25,16,4,9,'P');
		$mpdf->WriteHTML('<watermarkimage src='.$imgSrc.' alpha="0.33" size="50,30"/>');
		$mpdf->showWatermarkImage = false;
		$mpdf->WriteHTML($html);
		$mpdf->Output($title.'.pdf', "I");
    
    }
    protected function findModel($id)
    {
        if (($model = CustomerDetails::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
    
    public function actionPrintDues(){
        $id = $_REQUEST['id'];
        $command = Yii::$app->db->createCommand(
		  "SELECT 
		  id,name,place,phone
		  FROM bur_customer_details 
		  WHERE 
		  customer_type='$id' and status = 1 order by name");
		$data = $command->queryAll(); 
		if($data) {
		foreach($data as $key => $vals)
		{
		 $amount = Yii::$app->db->createCommand(
		  "SELECT sum(amount) FROM bur_balance_sheet where status='open' and customer_id={$vals['id']}");
		 $sum = $amount->queryScalar();		
		
		 $closed_bill=Transactions::find()->where(['status'=>'closed','customer_id'=>$vals['id']])->orderBy(['id'=>SORT_DESC])->one();
		 $previous_balance = isset($closed_bill->balance)?$closed_bill->balance:0;
		  
		 $pending = $sum + $previous_balance;
		 if($pending > 0) $data[$key]['amount'] = $pending;
		 else unset($data[$key]);
		}
		}		
		
        
       
        $html = $this->renderPartial('print-totals', ['data' =>$data]);
        $imgSrc = Yii::$app->urlManager->createAbsoluteUrl('site/loadimage');
		$mpdf = new mPDF('utf-8', 'A4',0,'',15,15,25,16,4,9,'P');
		$mpdf->WriteHTML('<watermarkimage src='.$imgSrc.' alpha="0.33" size="50,30"/>');
		$mpdf->showWatermarkImage = false;
		$mpdf->WriteHTML($html);
		$mpdf->Output($title.'.pdf', "I");
    
    }  

}

?>
