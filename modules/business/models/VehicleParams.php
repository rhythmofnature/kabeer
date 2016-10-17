<?php

namespace app\modules\business\models;

use Yii;

/**
 * This is the model class for table "bur_vehicle_params".
 *
 * @property integer $id
 * @property string $name
 *
 * @property BurVehicleParamDates[] $burVehicleParamDates
 * @property BurVehicleDetails[] $vehicles
 */
class VehicleParams extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'bur_vehicle_params';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name'], 'required'],
            [['name'], 'string', 'max' => 120]
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
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBurVehicleParamDates()
    {
        return $this->hasMany(BurVehicleParamDates::className(), ['param_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getVehicles()
    {
        return $this->hasMany(BurVehicleDetails::className(), ['id' => 'vehicle_id'])->viaTable('bur_vehicle_param_dates', ['param_id' => 'id']);
    }
}
