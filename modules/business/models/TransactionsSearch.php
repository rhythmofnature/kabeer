<?php

namespace app\modules\business\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\modules\business\models\Transactions;

/**
 * TransactionsSearch represents the model behind the search form about `app\modules\business\models\Transactions`.
 */
class TransactionsSearch extends Transactions
{
    /**
     * @inheritdoc
     */
       public $user_type;
    public function rules()
    {
        return [
            [['id', 'from_sheet_id', 'to_sheet_id'], 'integer'],
            [['ivoice_amount', 'previous_balance', 'paid_amount', 'balance'], 'number'],
            [['paid_date', 'created_on', 'updated_on', 'status','user_type','customer_id'], 'safe'],
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
        $query = Transactions::find();
        $query->joinWith(['user']);
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort' => [
                'defaultOrder' => [
                    'created_on' => SORT_DESC,
//                     'title' => SORT_ASC, 
                ]
            ],
             'pagination' => [
        'pageSize' => 100,
    ],
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            //'customer_id' => $this->customer_id,
            'ivoice_amount' => $this->ivoice_amount,
            'previous_balance' => $this->previous_balance,
            'paid_amount' => $this->paid_amount,
            'paid_date' => $this->paid_date,
            'balance' => $this->balance,
            'from_sheet_id' => $this->from_sheet_id,
            'to_sheet_id' => $this->to_sheet_id,
            'created_on' => $this->created_on,
            'updated_on' => $this->updated_on,
            'bur_customer_details.customer_type'=>$this->user_type
        ]);
        $query->andFilterWhere(['like', 'bur_customer_details.name', $this->customer_id]);
//          $query->andFilterWhere(['like', 'user.customer_type', $this->user_type]);
        $query->andFilterWhere(['like', 'status', $this->status]);
        

        return $dataProvider;
    }
}
