<?php
use \app\assets_b\AppAsset;
use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\web\NotFoundHttpException;

/* @var $this \yii\web\View */
/* @var $content string */

AppAsset::register($this);

Yii::$app->name = "Kabeer";
?>

<header class="header">

<?= Html::a(Html::img(Yii::$app->request->baseUrl.'/images/buraq.png', ['height'=>'90px','width'=>'120px','style'=>'padding-top:5px']), Yii::$app->homeUrl, ['class' => 
'logo']) ?>

<nav class="navbar navbar-static-top" role="navigation">

<a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
    <span class="sr-only">Toggle navigation</span>
    <span class="icon-bar"></span>
    <span class="icon-bar"></span>
    <span class="icon-bar"></span>
</a>
<div class="navbar-right">

<ul class="nav navbar-nav">


<?php
if (Yii::$app->user->isGuest) {
    ?>
    <li class="footer">
        <?= Html::a('Login', ['/site/login']) ?>
    </li>
<?php
} else {
	$isStudent = $isEmployee = '';

	if(!Yii::$app->user->isGuest) {
	      $isStudent = Yii::$app->session->get('stu_id');
	      $isEmployee = Yii::$app->session->get('emp_id');
	}
	if(isset($isStudent))
	{
		$stuMaster = app\modules\student\models\StuMaster::find()->andWhere(['stu_master_id' => $isStudent])->one();
	        $stuInfo = app\modules\student\models\StuInfo::findOne($stuMaster->stu_master_stu_info_id);
		$Photo = $stuInfo->getStuPhoto($stuInfo->stu_photo);
		$ProfileLink =  ['/student/stu-master/view', 'id' => $stuMaster->stu_master_id];
		$linkStyle = 'display:block'; // for profile link class
	}
	else if(isset($isEmployee))
	{
		$empMaster = app\modules\employee\models\EmpMaster::find()->andWhere(['emp_master_id' => $isEmployee])->one();
	        $empInfo = app\modules\employee\models\EmpInfo::findOne($empMaster->emp_master_emp_info_id);

		$Photo =  $empInfo->getEmpPhoto($empInfo->emp_photo);
		$ProfileLink =  ['/employee/emp-master/view', 'id' => $empMaster->emp_master_id];
		$linkStyle = 'display:block'; // for profile link class
	}
	else {
		$Photo = Yii::getAlias('@web'). '/data/emp_images/no-photo.png';
		$linkStyle = 'display:none'; // for profile link class
		$ProfileLink = $userPullL = '';
	}
    ?>
    <li class="dropdown user user-menu">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <i class="glyphicon glyphicon-user"></i>
            <span><?= @Yii::$app->user->identity->user_login_id ?> <i class="caret"></i></span>
        </a>
        <ul class="dropdown-menu" style="margin-right:10px">
            <!-- User image -->
            <li class="user-header bg-light-blue">
                <img src="<?= $Photo ?>" class="img-circle" alt="User Image"/>

                <p style="font-size: 18px;">
                    <?= @Yii::$app->user->identity->user_login_id ?>
                </p>
            </li>
            <!-- Menu Body -->
            <li class="user-body" style="<?= $linkStyle ?>">
                <div class="col-xs-6 no-padding">
		    <?= Html::a('View Profile', $ProfileLink, ['class' => 'btn btn-default btn-flat', 'style' => 'font-size:13px']) ?>
                </div>
            </li>
            <!-- Menu Footer-->
            <li class="user-footer">
                <div class="pull-left">
		    <?= Html::a('Change Password', ['/user/change'], ['class' => 'btn btn-default btn-flat', 'style' => 'font-size:12px']) ?>
                </div>
                <div class="pull-right">
                    <?= Html::a(
                            'Sign out',
                            ['/site/logout'],
                            ['data-method' => 'post','class'=>'btn btn-default btn-flat', 'style' => 'font-size:12px']
                        ) ?>
                </div>
            </li>
        </ul>
    </li><?php
}
?>
<!-- User Account: style can be found in dropdown.less -->

</ul>
</div>
</nav>
</header>
