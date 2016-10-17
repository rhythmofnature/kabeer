<?php

namespace app\modules\business\models;

use Yii;
use yii\data\ActiveDataProvider;
/**
 * This is the model class for table "bur_balance_sheet".
 *
 * @property integer $id
 * @property integer $customer_id
 * @property integer $trip_id
 * @property double $amount
 * @property string $status
 * @property string $to_or_from
 * @property string $created_on
 * @property string $updated_on
 */
class BalanceSheet extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'bur_balance_sheet';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['customer_id', 'trip_id', 'amount', 'status', 'to_or_from', 'created_on'], 'required'],
            [['customer_id', 'trip_id'], 'integer'],
            [['amount'], 'number'],
            [['status', 'to_or_from'], 'string'],
            [['created_on', 'updated_on'], 'safe']
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
            'trip_id' => 'Trip ID',
            'amount' => 'Amount',
            'status' => 'Status',
            'to_or_from' => 'To Or From',
            'created_on' => 'Date',
            'updated_on' => 'Updated On',
        ];
    }
    
    public function getTrip()
	{
	    return $this->hasOne(Trips::className(), ['id' => 'trip_id']);
	}
	
	public function getUser()
	{
	    return $this->hasOne(CustomerDetails::className(), ['id' => 'customer_id']);
	}
	
	public function search($params){
	
            $query = self::find();

            $dataProvider = new ActiveDataProvider([
                'query' => $query,
                'sort' => [
                    'defaultOrder' => [
                        'created_on' => SORT_DESC,
                    //                     'title' => SORT_ASC, 
                    ],
                ],
                'pagination' => [
                    'pageSize' => 200,
                ],
            ]);
            $query->andFilterWhere([
            'customer_id' => $this->customer_id,
            'trip_id' => $this->trip_id,
            ]);
            return $dataProvider;
	}
}
