<?php

namespace app\modules\business\models;

use Yii;

/**
 * This is the model class for table "trip_products".
 *
 * @property integer $id
 * @property integer $trip_id
 * @property integer $product_id
 * @property double $unit_price
 * @property integer $quantity
 * @property double $price
 */
class TripProducts extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'trip_products';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['trip_id', 'product_id', 'unit_price', 'quantity', 'price'], 'required'],
            [['trip_id', 'product_id', 'quantity'], 'integer'],
            [['unit_price', 'price'], 'number'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'trip_id' => 'Trip ID',
            'product_id' => 'Product ID',
            'unit_price' => 'Unit Price',
            'quantity' => 'Quantity',
            'price' => 'Price',
        ];
    }
    
    public function getMaterial()
    {
        return $this->hasOne(MaterialTypes::className(), ['id' => 'product_id']);
    }
    
    public function getTrip()
    {
        return $this->hasOne(Trips::className(), ['id' => 'trip_id']);
    }    
}

