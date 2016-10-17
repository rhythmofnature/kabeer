<?php

namespace app\modules\business\models;

use Yii;
use yii\helpers\Html;
/**
 * This is the model class for table "bur_transactions".
 *
 * @property integer $id
 * @property integer $customer_id
 * @property double $ivoice_amount
 * @property double $paid_amount
 * @property double $balance
 * @property integer $from_sheet_id
 * @property integer $to_sheet_id
 * @property string $created_on
 * @property string $updated_on
 * @property string $status
 */
class Transactions extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'bur_transactions';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['customer_id', 'ivoice_amount', 'created_on'], 'required'],
            [['customer_id', 'from_sheet_id', 'to_sheet_id'], 'integer'],
            [['ivoice_amount', 'paid_amount', 'balance','previous_balance'], 'number'],
            [['paid_date','created_on', 'updated_on','sheet_ids'], 'safe'],
            [['status'], 'string']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'customer_id' => 'Customer ID',
            'ivoice_amount' => 'Ivoice Amount',
            'paid_amount' => 'Paid Amount',
            'paid_date'=>'Paid Date',
            'balance' => 'Balance',
            'from_sheet_id' => 'From Sheet ID',
            'to_sheet_id' => 'To Sheet ID',
            'created_on' => 'Created On',
            'updated_on' => 'Updated On',
            'status' => 'Status',
        ];
    }
    
    public function getUser()
	{
	    return $this->hasOne(CustomerDetails::className(), ['id' => 'customer_id']);
	}
	
	public static function button($id){

        $balance=0;
        
        $closed_bill=Transactions::findOne(['id'=>$id]);
        
        if($closed_bill->status=="open"){
             return Html::a('<i class="btn btn-block btn-primary">View And Close</i>',['/business/bills/view','id'=>$closed_bill->id]);
        }else{
            return Html::a('<i class="btn btn-block btn-primary">View</i>',['/business/bills/view','id'=>$closed_bill->id]);
        }
    }
	
}
