<?php

namespace app\modules\business\models;

use Yii;

/**
 * This is the model class for table "bur_customer_material_price".
 *
 * @property integer $id
 * @property integer $customer_id
 * @property integer $material_id
 * @property double $price
 * @property string $status
 */
class CustomerMaterialPrice extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'bur_customer_material_price';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['customer_id', 'material_id', 'price', 'status'], 'required'],
            [['customer_id', 'material_id','status'], 'integer'],
            [['price'], 'number'],
//             [['status'], 'string', 'max' => 1]
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
            'material_id' => 'Material ID',
            'price' => 'Price',
            'status' => 'Status',
        ];
    }
    
    public static function getPrice($material_id,$customer_id){
	  $data = Self::findOne(['customer_id' => $customer_id,'material_id' => $material_id,]);
	  return isset($data->price)?$data->price:'';
    }
   
}
