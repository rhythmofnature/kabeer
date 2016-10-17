<?php

namespace app\modules\business\models;

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
 * @property integer $vehicle
 * @property string $earning_percentage
 * @property string $status
 */
class DriverDetails extends \yii\db\ActiveRecord
{
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
            [['name', 'place', 'address', 'account_details', 'customer_type', 'phone', 'vehicle', 'earning_percentage'], 'required'],
            [['address', 'account_details'], 'string'],
            [['customer_type', 'vehicle'], 'integer'],
            [['earning_percentage'], 'number'],
            [['name', 'place'], 'string', 'max' => 250],
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
            'vehicle' => 'Vehicle',
            'earning_percentage' => 'Earning Percentage',
            'status' => 'Status',
        ];
    }
    
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDriverVehicle()
    {
        return $this->hasOne(VehicleDetails::className(), ['id' => 'vehicle']);
    }    
}
