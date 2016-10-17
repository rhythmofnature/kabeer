<?php

namespace app\modules\business\models;

use Yii;

/**
 * This is the model class for table "bur_payments".
 *
 * @property integer $id
 * @property integer $customer_id
 * @property integer $trans_id
 * @property string $date
 * @property double $amount
 * @property string $to_or_from
 */
class Payments extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'bur_payments';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['customer_id', 'trans_id', 'date', 'amount', 'to_or_from'], 'required'],
            [['customer_id', 'trans_id'], 'integer'],
            [['date'], 'safe'],
            [['amount'], 'number'],
            [['to_or_from'], 'string']
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
            'trans_id' => 'Trans ID',
            'date' => 'Date',
            'amount' => 'Amount',
            'to_or_from' => 'To Or From',
        ];
    }
}
