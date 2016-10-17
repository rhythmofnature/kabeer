<?php

namespace app\modules\business\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\modules\business\models\VehicleParamDates;

/**
 * VehicleParamDatesSearch represents the model behind the search form about `app\modules\business\models\VehicleParamDates`.
 */
class VehicleParamDatesSearch extends VehicleParamDates
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['vehicle_id', 'param_id'], 'integer'],
            [['paid_date', 'renewal_date'], 'safe'],
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
        $query = VehicleParamDates::find();

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
            'vehicle_id' => $this->vehicle_id,
            'param_id' => $this->param_id,
            'paid_date' => $this->paid_date,
            'renewal_date' => $this->renewal_date,
        ]);

        return $dataProvider;
    }
}
