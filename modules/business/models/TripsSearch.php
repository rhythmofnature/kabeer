<?php

namespace app\modules\business\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\modules\business\models\Trips;

/**
 * TripsSearch represents the model behind the search form about `app\modules\business\models\Trips`.
 */
class TripsSearch extends Trips
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id','merchant','buyer','vehicle_id', 'driver_id', 'material_id', 'measurement_type'], 'integer'],
            [['date_of_travel', 'size', 'site_name', 'site_place', 'kilometre', 'buyer_trip_sheet_number', 
'seller_trip_sheet_number'], 'safe'],
            [['vehicle_rent', 'driver_amount', 'merchant_amount', 'buyer_amount', 'buyer_amount_total'], 'number'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params,$type='')
    {
        $query = Trips::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query, 'sort'=> ['defaultOrder' => ['id'=>SORT_DESC]],
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }
        
        if($type == 1) $query_addon = " and merchant > 0";
        else if($type == 2) $query_addon = " and buyer > 0";        
        $query->where('id != '.Yii::$app->params['tripId'].$query_addon);
        $query->andFilterWhere([
            'id' => $this->id,
            'date_of_travel' => $this->date_of_travel?date("Y-m-d",strtotime($this->date_of_travel)):$this->date_of_travel,
            'vehicle_id' => $this->vehicle_id,
            'merchant'=>$this->merchant,
            'buyer'=>$this->buyer,
            'driver_id' => $this->driver_id,
            'material_id' => $this->material_id,
            'measurement_type' => $this->measurement_type,
             'returns' => 'no',
//             'vehicle_rent' => $this->vehicle_rent,
//             'driver_amount' => $this->driver_amount,
//             'merchant_amount' => $this->merchant_amount,
//             'buyer_amount' => $this->buyer_amount,
//             'buyer_amount_total' => $this->buyer_amount_total,
        ]);

        $query->andFilterWhere(['like', 'size', $this->size])
            ->andFilterWhere(['like', 'site_name', $this->site_name])
            ->andFilterWhere(['like', 'buyer_amount', $this->buyer_amount])
            ->andFilterWhere(['like', 'buyer_amount_total', $this->buyer_amount_total])
            ->andFilterWhere(['like', 'merchant_amount', $this->merchant_amount])
            ->andFilterWhere(['like', 'vehicle_rent', $this->vehicle_rent])
            ->andFilterWhere(['like', 'driver_amount', $this->driver_amount])
             ->andFilterWhere(['like', 'site_place', $this->site_place])
            ->andFilterWhere(['like', 'kilometre', $this->kilometre])
            ->andFilterWhere(['like', 'buyer_trip_sheet_number', $this->buyer_trip_sheet_number])
            ->andFilterWhere(['like', 'seller_trip_sheet_number', $this->seller_trip_sheet_number]);

        return $dataProvider;
    }
    
    
    
     public function searchReturn($params,$type='')
    {
        $query = Trips::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query, 'sort'=> ['defaultOrder' => ['id'=>SORT_DESC]],
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }
        
        if($type == 1) $query_addon = " and merchant > 0";
        else if($type == 2) $query_addon = " and buyer > 0";        
        $query->where('id != '.Yii::$app->params['tripId'].$query_addon);
        $query->andFilterWhere([
            'id' => $this->id,
            'date_of_travel' => $this->date_of_travel?date("Y-m-d",strtotime($this->date_of_travel)):$this->date_of_travel,
            'vehicle_id' => $this->vehicle_id,
            'merchant'=>$this->merchant,
            'buyer'=>$this->buyer,
            'driver_id' => $this->driver_id,
            'material_id' => $this->material_id,
            'measurement_type' => $this->measurement_type,
            'returns' => 'yes',
//             'vehicle_rent' => $this->vehicle_rent,
//             'driver_amount' => $this->driver_amount,
//             'merchant_amount' => $this->merchant_amount,
//             'buyer_amount' => $this->buyer_amount,
//             'buyer_amount_total' => $this->buyer_amount_total,
        ]);

        $query->andFilterWhere(['like', 'size', $this->size])
            ->andFilterWhere(['like', 'site_name', $this->site_name])
            ->andFilterWhere(['like', 'buyer_amount', $this->buyer_amount])
            ->andFilterWhere(['like', 'buyer_amount_total', $this->buyer_amount_total])
            ->andFilterWhere(['like', 'merchant_amount', $this->merchant_amount])
            ->andFilterWhere(['like', 'vehicle_rent', $this->vehicle_rent])
            ->andFilterWhere(['like', 'driver_amount', $this->driver_amount])
             ->andFilterWhere(['like', 'site_place', $this->site_place])
            ->andFilterWhere(['like', 'kilometre', $this->kilometre])
            ->andFilterWhere(['like', 'buyer_trip_sheet_number', $this->buyer_trip_sheet_number])
            ->andFilterWhere(['like', 'seller_trip_sheet_number', $this->seller_trip_sheet_number]);

        return $dataProvider;
    }
    
}
