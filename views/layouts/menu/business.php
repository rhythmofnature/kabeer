<?php
use yii\helpers\Html;
?>
<li class="treeview active">
	<?= Html::a('<i class="fa fa-cogs"></i> <span>Configuration</span> <i class="fa fa-angle-left pull-right"></i>', ['/default/index'])  ?>
        <ul class="treeview-menu">
        <li>
		<?= Html::a('<i class="fa fa-angle-double-right"></i> Product Details',['/business/material'])  ?>
		<?= Html::a('<i class="fa fa-angle-double-right"></i> Customer Details',['/business/customer'])  ?>
		<?= Html::a('<i class="fa fa-angle-double-right"></i> Manage Events',['/dashboard/events'])  ?>
		<?= Html::a('<i class="fa fa-angle-double-right"></i> DB Backup',['/site/backup'])  ?>
        </li>
        </ul>
</li>

<li class="treeview active">
	<?= Html::a('<i class="fa fa-dashboard"></i> <span>Business</span> <i class="fa fa-angle-left pull-right"></i>', ['#'])  ?>
        <ul class="treeview-menu">
        <li>
		<?= Html::a('<i class="fa fa-angle-double-right"></i> Purchase Info',['/business/shopping'])  ?>
		<?= Html::a('<i class="fa fa-angle-double-right"></i> Selling Info',['/business/trips'])  ?>
		<?= Html::a('<i class="fa fa-angle-double-right"></i> Returns',['/business/trips/return-list'])  ?>
		<?= Html::a('<i class="fa fa-angle-double-right"></i> Bill Generation',['/business/bills'])  ?>
		<?= Html::a('<i class="fa fa-angle-double-right"></i> Invoices',['/business/transaction'])  ?>
		<?= Html::a('<i class="fa fa-angle-double-right"></i> Advances',['/business/customer/collectadvance'])  ?>
		<?= Html::a('<i class="fa fa-angle-double-right"></i> Expenses',['/business/expenses'])  ?>
	    </li>
	
        </ul>
</li>

<li class="treeview active">
	<?= Html::a('<i class="fa fa-bar-chart"></i> <span>Report Center</span> <i class="fa fa-angle-left pull-right"></i>', ['#'])  ?>
        <ul class="treeview-menu">
        <li>
		<?= Html::a('<i class="fa fa-angle-double-right"></i> Business in a day',['/business/reports/daily'])  ?>
		<?= Html::a('<i class="fa fa-angle-double-right"></i> Business in a week',['/business/reports/vehiclew'])  ?>
		<?= Html::a('<i class="fa fa-angle-double-right"></i> Business in a month',['/business/reports/vehiclem'])  ?>
	    </li>
	
        </ul>
</li>
