<?php

namespace app\modules\business\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\modules\business\models\MaterialTypes;
use kartik\builder\TabularForm;
use yii\helpers\Html;

/**
 * MaterialTypesSearch represents the model behind the search form about `app\modules\business\models\MaterialTypes`.
 */
class MaterialTypesSearch extends MaterialTypes
{

	public $price;
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'measurement_type'], 'integer'],
            [['name', 'description', 'price','status'], 'safe'],
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
        $query = MaterialTypes::find();

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
            'measurement_type' => $this->measurement_type,
        ]);

        $query->andFilterWhere(['like', 'name', $this->name])
            ->andFilterWhere(['like', 'description', $this->description])
            ->andFilterWhere(['like', 'status', $this->status]);

        return $dataProvider;
    }
    
    public function getFormAttribs() {

          return [
          
		'customer'=>[ // primary key attribute
          'type'=>TabularForm::INPUT_HIDDEN,
          'columnOptions'=>['hidden'=>true]
          ],
          
        'name'=>[ 'type'=>TabularForm::INPUT_STATIC, ],
        'measurement_type'=>[
		'type'=>TabularForm::INPUT_STATIC,
		'value' => function($m, $k, $i, $w) {
			return MaterialTypes::$measurementType[$m->measurement_type];
		}],
		'price'=>[
		'type'=>TabularForm::INPUT_RAW,
		'value' => function($m, $k, $i, $w) {
			return Html::textInput("price[".$k."]",CustomerMaterialPrice::getPrice($k,$this->customer) , ['class'=>'form-control']);
		}],
          
          ];
    }
}
