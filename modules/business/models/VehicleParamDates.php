<?php

namespace app\modules\business\models;

use Yii;

/**
 * This is the model class for table "bur_vehicle_param_dates".
 *
 * @property integer $vehicle_id
 * @property integer $param_id
 * @property string $paid_date
 * @property string $renewal_date
 *
 * @property BurVehicleDetails $vehicle
 * @property BurVehicleParams $param
 */
class VehicleParamDates extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'bur_vehicle_param_dates';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['vehicle_id', 'param_id'], 'required'],//, 'paid_date', 'renewal_date'
            [['vehicle_id', 'param_id'], 'integer'],
            [['paid_date', 'renewal_date'], 'safe']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'vehicle_id' => 'Vehicle ID',
            'param_id' => 'Param ID',
            'paid_date' => 'Paid Date',
            'renewal_date' => 'Renewal Date',
        ];
    }
    
	public function beforeSave($insert)
	{
		if (parent::beforeSave($insert)) {
			// ...custom code here...
			if($this->paid_date) {
			$date = date_create($this->paid_date);
			$this->paid_date = date_format($date,"Y-m-d");
			}
			if($this->renewal_date) { 
			$date = date_create($this->renewal_date);
			$this->renewal_date = date_format($date,"Y-m-d");	
			}
			
			return true;
		} else {
			return false;
		}
	}  
	

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getVehicle()
    {
        return $this->hasOne(VehicleDetails::className(), ['id' => 'vehicle_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getParam()
    {
        return $this->hasOne(VehicleParams::className(), ['id' => 'param_id']);
    }
}
