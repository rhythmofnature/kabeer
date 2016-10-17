<?php

namespace app\modules\business\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\modules\business\models\VehicleDetails;

/**
 * VehicleDetailsSearch represents the model behind the search form about `app\modules\business\models\VehicleDetails`.
 */
class VehicleDetailsSearch extends VehicleDetails
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'type'], 'integer'],
            [['name', 'vehicle_number', 'size', 'charge_per_km', 'status'], 'safe'],
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
    public function search($params)
    {
        $query = VehicleDetails::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'type' => $this->type,
        ]);

        $query->andFilterWhere(['like', 'name', $this->name])
            ->andFilterWhere(['like', 'vehicle_number', $this->vehicle_number])
            ->andFilterWhere(['like', 'size', $this->size])
            ->andFilterWhere(['like', 'charge_per_km', $this->charge_per_km])
            ->andFilterWhere(['like', 'status', $this->status]);

        return $dataProvider;
    }
}
