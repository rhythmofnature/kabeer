<?php

namespace app\modules\business\models;
use yii\helpers\Html;
use Yii;

/**
 * This is the model class for table "bur_customer_details".
 *
 * @property integer $id
 * @property string $name
 * @property string $place
 * @property string $address
 * @property string $account_details
 * @property integer $customer_type
 * @property string $phone
 * @property string $status
 */
class CustomerDetails extends \yii\db\ActiveRecord
{
    public static $customerType = array(        
        "1"=>"Merchant",
        "2"=>"Buyer"
    );
    public static $status = array(
        
        "1"=>"Active",
        "0"=>"In Active"
    );
    public $previous_balance;
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'bur_customer_details';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'place','customer_type', 'phone'], 'required'],
            [['address', 'account_details'], 'string'],
            [['customer_type','previous_balance'], 'integer'],
            [['name', 'place', 'address', 'account_details'], 'string', 'max' => 250],
            [['phone'], 'string', 'max' => 15],
            [['status'], 'string', 'max' => 1]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'place' => 'Place',
            'address' => 'Address',
            'account_details' => 'Account Details',
            'customer_type' => 'Customer Type',
            'phone' => 'Phone',
            'status' => 'Status',
            'previous_balance'=>'Previous Balance'
        ];
    }
    
    public static function getUnpaidamount($id){
            $command = Yii::$app->db->createCommand("SELECT sum(amount) 
        FROM bur_balance_sheet where status='open' AND customer_id='$id'");
        $sum = $command->queryScalar();
        $sum =isset($sum)?$sum:0;

        $balance=0;
        $closed_bill=Transactions::find()->where(['status'=>'closed','customer_id'=>$id])->orderBy(['id'=> SORT_DESC])->one();
        //$closed_bill=Transactions::findOne(['status'=>'closed','customer_id'=>$id]);
            if(isset($closed_bill->balance)){ 
                $balance = $closed_bill->balance;

            }
          
          return $sum+$balance;
    }
    
    
    public static function getUncolsedBill($id){

        $balance=0;
        
        $closed_bill=Transactions::findOne(['status'=>'open','customer_id'=>$id]);
        return isset($closed_bill->ivoice_amount)?$closed_bill->ivoice_amount.'( Date: '.$closed_bill->created_on.' invoice 
No:'.$closed_bill->id.')':'All 
Invoice are closed';
    }
    
    
     public static function generateBill($id){

        $balance=0;
        
        $closed_bill=Transactions::findOne(['status'=>'open','customer_id'=>$id]);
        
        if(isset($closed_bill->ivoice_amount)){
             return Html::a('<i class="btn btn-block btn-primary">View And Close</i>',['/business/bills/view','id'=>$closed_bill->id]);
        }else{
            return Html::a('<i class="btn btn-block btn-primary">Generate 
Invoice</i>',['/business/bills/generate','id'=>$id]);
        }
    }
    

    
    
}
