<?php

namespace app\modules\business\models;

use Yii;

/**
 * This is the model class for table "bur_expenses".
 *
 * @property integer $id
 * @property integer $date
 * @property integer $vehicle_id
 * @property string $description
 * @property integer $amount
 */
class Expenses extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'bur_expenses';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['date', 'amount'], 'required'],
            [['vehicle_id', 'amount'], 'integer'],
            [['description'], 'string', 'max' => 100]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'date' => 'Date',
            'vehicle_id' => 'Vehicle',
            'description' => 'Description',
            'amount' => 'Amount',
        ];
    }
    
	public function getVehicles()
	{
	    return $this->hasOne(VehicleDetails::className(), ['id' => 'vehicle_id']);
	}    
}
