<?php 
use yii\helpers\Html;
use yii\helpers\Url;

$this->title = "Admin Dashboard"; 
$this->params['breadcrumbs'][] = $this->title;
?>
<script>
$(document).ready(function(){
    $('.tab-content').slimScroll({
        height: '300px'
    });
});
$(document).ready(function(){
    $('#coursList').slimScroll({
        height: '250px'
    });
});
</script>
<style>
.tab-content {
   padding:15px;
}
.box .box-body .fc-widget-header {
    background: none;
}
.popover{
    max-width:450px;   
}
</style>

<?php
$this->registerJs(
"$(function() {
	$('.noticeModalLink').click(function() {
		$('#NoticeModal').modal('show')
		.find('#NoticeModalContent')
		.load($(this).attr('data-value'));
	});
});");

$this->registerJs(
"$('body').on('click', function (e) {
    $('[data-toggle=\"popover\"]').each(function () {
        if (!$(this).is(e.target) && $(this).has(e.target).length === 0 && $('.popover').has(e.target).length === 0) {
            $(this).popover('hide'); 
        }
    });
});"
)
?>


                    <div class="row">
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-aqua">
                                <div class="inner">
                                    <h3>
<?php
$balance = 0;
$command = Yii::$app->db->createCommand(
"SELECT sum(amount) FROM bur_balance_sheet 
join bur_customer_details on bur_customer_details.id = bur_balance_sheet.customer_id
where bur_balance_sheet.status='open' and customer_type=2");
$sum = $command->queryScalar();

$customers = app\modules\business\models\CustomerDetails::find()->where(['status' => 1,'customer_type'=>2])->all();
foreach($customers as $customer)
{
  $closed_bill = app\modules\business\models\Transactions::find()->where(['status'=>'closed','customer_id'=>$customer->id])->orderBy(['id'=> SORT_DESC])->one();
  if(isset($closed_bill->balance)) $balance += $closed_bill->balance;
}

echo $sum + $balance;
?>
                                    </h3>
                                    <p>
                                        From Customers
                                    </p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-rupee"></i>
                                </div>
				<?= Html::a('More info <i class="fa fa-arrow-circle-right"></i>', ['/business/bills/print-dues?id=2'], ['target' => '_blank', 'class' => 'small-box-footer']); ?>
                            </div>
                        </div><!-- ./col -->
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-green">
                                <div class="inner">                                
                                   <h3>
<?php
$balance = 0;
$command = Yii::$app->db->createCommand(
"SELECT sum(amount) FROM bur_balance_sheet 
join bur_customer_details on bur_customer_details.id = bur_balance_sheet.customer_id
where bur_balance_sheet.status='open' and customer_type=1");
$sum = $command->queryScalar();

$customers = app\modules\business\models\CustomerDetails::find()->where(['status' => 1,'customer_type'=>1])->all();
foreach($customers as $customer)
{
  $closed_bill = app\modules\business\models\Transactions::find()->where(['status'=>'closed','customer_id'=>$customer->id])->orderBy(['id'=> SORT_DESC])->one();
  if(isset($closed_bill->balance)) $balance += $closed_bill->balance;
}

echo $sum + $balance;
?>             
                                    </h3>
                                    <p>
                                        To Merchants
                                    </p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-rupee"></i>
                                </div>
				<?= Html::a('More info <i class="fa fa-arrow-circle-right"></i>', ['/business/bills/print-dues?id=1'], ['target' => '_blank', 'class' => 'small-box-footer']); ?>
                            </div>
                        </div><!-- ./col -->
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-red">
                                <div class="inner">
                                    <h3>
                                        <?= app\modules\business\models\CustomerDetails::find()->where(['status' => 1,'customer_type'=>2])->count(); ?>
                                    </h3>
                                    <p>
                                        Active Customers
                                    </p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-sitemap"></i>
                                </div>
                                <?= Html::a('More info <i class="fa fa-arrow-circle-right"></i>', ['/business/customer/index'], ['class' => 'small-box-footer']); ?>
                            </div>
                        </div><!-- ./col -->
                    </div><!-- /.row haris-->
                    
                    <!-- Main row -->
                    <div class="row">
                        <!-- Left col -->
                        <section class="col-lg-7 connectedSortable">

			    <!-- Calendar -->
                            <div class="box box-info">
                                <div class="box-header with-border">
                                    <i class="fa fa-calendar"></i>
                                    <h3 class="box-title">Calendar</h3>
                                </div><!-- /.box-header -->
                                <div class="box-body">
                                    <!--The calendar -->
	<?php
	$JSEventClick = <<<EOF
		function(event, jsEvent, view) {
		    $('.fc-event').on('click', function (e) {
			$('.fc-event').not(this).popover('hide');
		    });
		}
EOF;
	$JsF = <<<EOF
		function (event, element) {
			var start_time = moment(event.start).format("DD-MM-YYYY, h:mm:ss a");
		    	var end_time = moment(event.end).format("DD-MM-YYYY, h:mm:ss a");

			element.clickover({
		            title: event.title,
		            placement: 'top',
		            html: true,
			    global_close: true,
			    container: 'body',
		            content: "<table class='table'><tr><th>Event Detail : </th><td>" + event.description + " </td></tr><tr><th> Event Type : </th><td>" + event.event_type + "</td></tr><tr><th> Start Time : </t><td>" + start_time + "</td></tr><tr><th> End Time : </th><td>" + end_time + "</td></tr></table>"
        		});
               }
EOF;
	?>
                            <?= \yii2fullcalendar\yii2fullcalendar::widget([
					'options' => ['language' => 'es',],
					'clientOptions' => [
						'fixedWeekCount' => false,
						'weekNumbers'=>true,
						'editable' => true,
						'eventLimit' => true,
						'eventLimitText' => 'more Events',
						'header' => [
							'left' => 'prev,next today',
							'center' => 'title',
							'right' => 'month,agendaWeek,agendaDay'
						],
						'eventClick' => new \yii\web\JsExpression($JSEventClick),
						'eventRender' => new \yii\web\JsExpression($JsF),
						'contentHeight' => 380,
						'timeFormat' => 'hh(:mm) A', 
					],
					'ajaxEvents' => yii\helpers\Url::toRoute(['/dashboard/events/view-events'])
				]);
			    ?>
				   <div class="row">
					<ul class="legend">
					    <li><span class="holiday"></span> Holiday</li>
					    <li><span class="importantnotice"></span> Important Notice</li>
					    <li><span class="meeting"></span> Meeting</li>
					    <li><span class="messages"></span> Messages</li>
					</ul>
				   </div>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->

                        </section><!-- /.Left col -->
                        <!-- right col (We are only adding the ID to make the widgets sortable)-->
                        <section class="col-lg-5 connectedSortable">

			   

			    <!-- TO DO List -->
  

                        </section><!-- right col -->
                    </div><!-- /.row (main row) -->                    
                    
                    



                </section><!-- /.content -->

