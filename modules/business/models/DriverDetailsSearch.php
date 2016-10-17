<?php

namespace app\modules\business\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\modules\business\models\DriverDetails;

/**
 * DriverDetailsSearch represents the model behind the search form about `app\modules\business\models\DriverDetails`.
 */
class DriverDetailsSearch extends DriverDetails
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'customer_type', 'vehicle'], 'integer'],
            [['name', 'place', 'address', 'account_details', 'phone', 'status'], 'safe'],
            [['earning_percentage'], 'number'],
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
        $query = DriverDetails::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }
		$query->where(['=','customer_type',3]);
        $query->andFilterWhere([
            'id' => $this->id,
            'customer_type' => $this->customer_type,
            'vehicle' => $this->vehicle,
            'earning_percentage' => $this->earning_percentage,
        ]);

        $query->andFilterWhere(['like', 'name', $this->name])
            ->andFilterWhere(['like', 'place', $this->place])
            ->andFilterWhere(['like', 'address', $this->address])
            ->andFilterWhere(['like', 'account_details', $this->account_details])
            ->andFilterWhere(['like', 'phone', $this->phone])
            ->andFilterWhere(['like', 'status', $this->status]);

        return $dataProvider;
    }
}
