﻿
<div class="clearfix">
</div>
<!-- BEGIN CONTAINER -->
<div class="page-container">
	<!-- BEGIN SIDEBAR -->
	<div class="page-sidebar-wrapper">
		<!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
		<!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
		<div class="page-sidebar navbar-collapse collapse">
			<!-- BEGIN SIDEBAR MENU -->
			<!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
			<!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
			<!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
			<!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
			<!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
			<!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->
			<ul class="page-sidebar-menu" data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">
				<!-- DOC: To remove the sidebar toggler from the sidebar you just need to completely remove the below "sidebar-toggler-wrapper" LI element -->
				<li class="sidebar-toggler-wrapper">
					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
					<div class="sidebar-toggler">
					</div>
					<!-- END SIDEBAR TOGGLER BUTTON -->
				</li>
				<!-- DOC: To remove the search box from the sidebar you just need to completely remove the below "sidebar-search-wrapper" LI element -->
				<li class="sidebar-search-wrapper">
					<!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
					<!-- DOC: Apply "sidebar-search-bordered" class the below search form to have bordered search box -->
					<!-- DOC: Apply "sidebar-search-bordered sidebar-search-solid" class the below search form to have bordered & solid search box -->
					<form class="sidebar-search " action="extra_search.html" method="POST">
						<a href="javascript:;" class="remove">
						<i class="icon-close"></i>
						</a>
						<div class="input-group">
							<input type="text" class="form-control" placeholder="Search...">
							<span class="input-group-btn">
							<a href="javascript:;" class="btn submit"><i class="icon-magnifier"></i></a>
							</span>
						</div>
					</form>
					<!-- END RESPONSIVE QUICK SEARCH FORM -->
				</li>
                
                <li <?php if($title == 'home') echo 'class="start active open"'; else echo 'class="start "';?>>
					<a href="javascript:;">
					<i class="icon-home"></i>
					<span class="title">الصفحة الرئيسية</span>
					<?php if($title == 'home')
					echo '<span class="selected"></span>
						  <span class="arrow open"></span>'; 
					else
						echo '<span class="arrow "></span>';
					?>
					</a>
					<ul class="sub-menu">
						<li <?php if($title == 'home') echo 'class="active"';?> >
							<a href="<?php echo base_url();?>home">
							<i class="icon-bar-chart"></i>
							الصفحة الرئيسية</a>
						</li>
					</ul>
				</li>
                <?php
				$res_menue = $this->session->userdata('menue');

					$menueid ='';
					$headmenue ='';
					$menuetitle = '';
					$submenue = '';
					$endmenue = '';
					
					$open_menue = '<li>';
					$menue_link = '<a href="javascript:;">';
					$menue_icon = '<i class="icon-home"></i>';
					$menue_name = '';
					$menue_arrow = '<span class="arrow"></span></a>';
					$open_sub_menue = '<ul class="sub-menu">';
					$sub_menue_item = '';
					$end_sub_menue = '</ul>';
					$end_menue = '</li>';
					
					foreach($res_menue as $row)
					{
						$url = explode("/", $row->page_url);
						$page = $url[1];
						
						if ($menueid == '')
						{
							$menueid = $row->menu_id;
							
							$menue_icon = '<i class="'.$row->menu_icon.'"></i>';
							$menue_name = '<span class="title">'.$row->menu_name.'</span>';
						}
						else if($row->menu_id != $menueid)
						{
							echo $open_menue;
							echo $menue_link;
							echo $menue_icon;
							echo $menue_name;
							echo $menue_arrow;
							echo $open_sub_menue;
							echo $sub_menue_item;
							echo $end_sub_menue;
							echo $end_menue;
							
							$menueid = $row->menu_id;
							$sub_menue_item = '';
							
							$open_menue = '<li>';
							$menue_arrow = '<span class="arrow"></span></a>';
							
							$menue_icon = '<i class="'.$row->menu_icon.'"></i>';
							$menue_name = '<span class="title">'.$row->menu_name.'</span>';
							
							/*$headmenue = ' <li>
											  <a href="javascript:;">
											  <i class="icon-home"></i>
											  <span class="title">'.$row->menu_name.'</span>
											  <span class="arrow "></span>
											  </a>
											  <ul class="sub-menu">';*/
						}
						
						if($title == $page)
						{
							$open_menue = '<li class="active open">';
							$menue_arrow = '<span class="selected"></span>
						  					<span class="arrow open"></span></a>';
							
							$sub_menue_item = $sub_menue_item.
											 '<li class="active">
												  <a href="'.base_url().$row->page_url.'">
												  <i class="'.$row->page_icon.'"></i>
												  '.$row->page_title.'</a>
											  </li>';
						}
						else
						{
							$sub_menue_item = $sub_menue_item.
											 '<li>
												  <a href="'.base_url().$row->page_url.'">
												  <i class="'.$row->page_icon.'"></i>
												  '.$row->page_title.'</a>
											  </li>';
						}
						
					}
					// Print Last Menu Item
					echo $open_menue;
					echo $menue_link;
					echo $menue_icon;
					echo $menue_name;
					echo $menue_arrow;
					echo $open_sub_menue;
					echo $sub_menue_item;
					echo $end_sub_menue;
					echo $end_menue;		
				?>
                <li class="start "> <!--Open Menue (class)-->
					<a href="javascript:;"> <!-- Open Menue Link (Static)-->
					<i class="icon-home"></i>	<!-- Icon -->
					<span class="title">Dashboard</span> <!-- Menue Name -->
					<span class="arrow "></span> <!-- Menue Arrow-->
					</a> <!-- Close Menue Link (Static)-->
					<ul class="sub-menu"> <!-- Open Sub Menu (Static) -->
						<li>
							<a href="index.html">
							<i class="icon-bar-chart"></i>
							Default Dashboard</a>
						</li>
						<li>
							<a href="index_2.html">
							<i class="icon-bulb"></i>
							New Dashboard #1</a>
						</li>
						<li>
							<a href="index_3.html">
							<i class="icon-graph"></i>
							New Dashboard #2</a>
						</li>
					</ul> <!-- Close Sub Menue (Static)-->
				</li> <!--Close Menue (class)-->
                
				
				<li <?php if($title == 'employees' || $title == 'empform') echo 'class="active open"';?>>
					<a href="javascript:;">
					<i class="icon-briefcase"></i>
					<span class="title">المـوظـفين</span>
					<?php if($title == 'employees' || $title == 'empform')
					echo '<span class="selected"></span>
						  <span class="arrow open"></span>'; 
					else
						echo '<span class="arrow "></span>';
					?>
					</a>
					<ul class="sub-menu">
						<li <?php if($title == 'employees') echo 'class="active open"';?>>
							<a href="<?php echo base_url();?>employee/employees">
							<i class="icon-home"></i>
							عـرض المـوظفيـن</a>
						</li>
						<li <?php if($title == 'empform') echo 'class="active open"';?>>
							<a href="<?php echo base_url();?>employee/empform">
							<i class="icon-basket"></i>
							اضــافة مـوظـف</a>
						</li>
					</ul>
				</li>
                <li <?php if($title == 'users' || $title == 'userform' || $title == 'usertypepermession') echo 'class="active open"';?>>
					<a href="javascript:;">
					<i class="icon-user"></i>
					<span class="title">المستخدمين</span>
					<?php if($title == 'users' || $title == 'userform' || $title == 'usertypepermession')
					echo '<span class="selected"></span>
						  <span class="arrow open"></span>'; 
					else
						echo '<span class="arrow "></span>';
					?>
					</a>
					<ul class="sub-menu">
						<li <?php if($title == 'users') echo 'class="active open"';?>>
							<a href="<?php echo base_url();?>user/users">
							عرض المستخدمين</a>
						</li>
						<li <?php if($title == 'userform') echo 'class="active open"';?>>
							<a href="<?php echo base_url();?>user/userform">
							اضـافـة مـستـخدم</a>
						</li>
						<li <?php if($title == 'usertypepermession') echo 'class="active open"';?>>
							<a href="<?php echo base_url();?>usertypeperm/usertypepermession">
							صـلاحيـات أنواع المـستـخدمين</a>
						</li>
					</ul>
				</li>
				<li <?php if($title == 'elderfile' || $title == 'elders') echo 'class="active open"';?>>
					<a href="javascript:;">
					<i class="icon-folder"></i>
					<span class="title">الأعضـــــــاء</span>
                    <?php if($title == 'elderfile' || $title == 'elders')
					echo '<span class="selected"></span>
						  <span class="arrow open"></span>'; 
					else
						echo '<span class="arrow "></span>';
					?>
					</a>
					<ul class="sub-menu">
						<!--<li <?php // if($title == 'openfile') echo 'class="active open"';?>>
							<a href="<?php //echo base_url();?>openfile">
							فتــح ملف جـديـد</a>
						</li>-->
						<li <?php if($title == 'elders') echo 'class="active open"';?>>
							<a href="<?php echo base_url();?>elder/elders">
							عــرض الأعــضاء</a>
						</li>
					</ul>
				</li>
				<li <?php if($title == 'survey' || $title == 'recomendation' || $title == 'viewsurvey') echo 'class="active open"';?>>
					<a href="javascript:;">
					<i class="icon-docs"></i>
					<span class="title">الاستـبـــانـة</span>
					<?php if($title == 'survey' || $title == 'recomendation' || $title == 'viewsurvey')
					echo '<span class="selected"></span>
						  <span class="arrow open"></span>'; 
					else
						echo '<span class="arrow "></span>';
					?>
					</a>
					<ul class="sub-menu">
						<li <?php if($title == 'survey') echo 'class="active open"';?>>
							<a href="<?php echo base_url();?>surveycont/survey">
							تعبــئة استــبانة</a>
						</li>
						<!--<li  <?php //if($title == 'recomendation') echo 'class="active open"';?>>
							<a href="<?php //echo base_url();?>	recomendation">
							تـوصيـات الادارة</a>
						</li>-->
						<li <?php if($title == 'viewsurvey') echo 'class="active open"';?>>
							<a href="<?php echo base_url();?>surveyviewcont/viewsurvey">
							عــرض الابحــاث الميـدانية</a>
						</li>
					</ul>
				</li>
				<!--<li <?php //if($title == 'addappointment' || $title == 'appointments') echo 'class="active open"';?>>
					<a href="javascript:;">
					<i class="icon-clock"></i>
					<span class="title">مــواعيد البحث الميداني</span>
					<?php /* if($title == 'addappointment' || $title == 'appointments')
					echo '<span class="selected"></span>
						  <span class="arrow open"></span>'; 
					else
						echo '<span class="arrow "></span>';*/
					?>
					</a>
					<ul class="sub-menu">
						<li <?php //if($title == 'addappointment') echo 'class="active open"';?>>
							<a href="addappointment">
							ادخال موعد</a>
						</li>
						<li <?php //if($title == 'appointments') echo 'class="active open"';?>>
							<a href="appointments">
							عـرض المواعيد</a>
						</li>
					</ul>
				</li>-->
				<li <?php if($title == 'constants') echo 'class="active open"';?> >
					<a href="javascript:;">
					<i class="icon-settings"></i>
					<span class="title">ثـوابـت النظـــام</span>
					<?php if($title == 'constants')
					echo '<span class="selected"></span>
						  <span class="arrow open"></span>'; 
					else
						echo '<span class="arrow "></span>';
					?>
					</a>
					<ul class="sub-menu">
						<li <?php if($title == 'constants') echo 'class="active open"';?> >
							<a href="<?php echo base_url();?>constant/constants">
							اضــافة ثـوابت النـظـام</a>
						</li>
					</ul>
				</li>
				<li <?php if($title == 'sendsms') echo 'class="active open"';?>>
					<a href="javascript:;">
					<i class="icon-envelope"></i>
					<span class="title">الـــرسـائل</span>
					<?php if($title == 'sendsms')
					echo '<span class="selected"></span>
						  <span class="arrow open"></span>'; 
					else
						echo '<span class="arrow "></span>';
					?>
					</a>
					<ul class="sub-menu">
						<li <?php if($title == 'sendsms') echo 'class="active open"';?>>
							<a href="<?php echo base_url();?>sendsms">
							ارسال رسالة</a>
						</li>
					</ul>
				</li>
				<li <?php if($title == 'elderinforpt' || $title == 'genderrpt' || $title == 'edurpt'  || $title == 'incomerpt' 
						  || $title == 'elderhomerpt' || $title == 'elderroomrpt' || $title == 'maintenancerpt' 
						  || $title == 'lifeimprovementrpt' || $title == 'aidrecomendationrpt' || $title == 'statisticalrpt'
						  || $title == 'familyelderrelationrpt') 
					echo 'class="active open"';?>>
					<a href="javascript:;">
					<i class="icon-bar-chart"></i>
					<span class="title">التقــارير</span>
					<?php if($title == 'elderinforpt' || $title == 'genderrpt' || $title == 'edurpt' || $title == 'incomerpt'
						  || $title == 'elderhomerpt'  || $title == 'elderroomrpt' || $title == 'maintenancerpt'
						  || $title == 'lifeimprovementrpt' || $title == 'aidrecomendationrpt' || $title == 'statisticalrpt'
						  || $title == 'familyelderrelationrpt')
					echo '<span class="selected"></span>
						  <span class="arrow open"></span>'; 
					else
						echo '<span class="arrow "></span>';
					?>
					</a>
					<ul class="sub-menu">
                        <li <?php if($title == 'elderinforpt') echo 'class="active open"';?>>
							<a href="<?php echo base_url();?>reports/elderinforpt">
                            <i class="icon-folder"></i>
							تقـرير أعضاء الجمعية</a>
						</li>
                        <li <?php if($title == 'genderrpt') echo 'class="active open"';?>>
							<a href="<?php echo base_url();?>reports/genderrpt">
                            <i class="icon-pie-chart"></i>
							تقـرير ديموغرافي بأعضاء الجمعية</a>
						</li>
                        <li <?php if($title == 'edurpt') echo 'class="active open"';?>>
							<a href="<?php echo base_url();?>reports/edurpt">
                            <i class="icon-graduation"></i>
							تقـرير المستوى التعليمي</a>
						</li>
                        <li <?php if($title == 'elderhealthrpt') echo 'class="active open"';?>>
							<a href="<?php echo base_url();?>reports/elderhealthrpt">
                            <i class="icon-heart"></i>
							تقرير الحالة الصحية</a>
						</li>
                        <li <?php if($title == 'incomerpt') echo 'class="active open"';?>>
							<a href="<?php echo base_url();?>reports/incomerpt">
                            <i class="icon-wallet"></i>
							تقرير مصــادر الدخل</a>
						</li>
						<li <?php if($title == 'elderhomerpt') echo 'class="active open"';?>>
							<a href="<?php echo base_url();?>reports/elderhomerpt">
                            <i class="icon-home"></i>
							تقرير وضع السكن</a>
						</li>
                        <li <?php if($title == 'elderroomrpt') echo 'class="active open"';?>>
							<a href="<?php echo base_url();?>reports/elderroomrpt">
                            <i class="icon-home"></i>
							تقرير وصف السكن</a>
						</li>
                        <li <?php if($title == 'maintenancerpt') echo 'class="active open"';?>>
							<a href="<?php echo base_url();?>reports/maintenancerpt">
                            <i class="icon-settings"></i>
							تقرير صيانة سكن كبير السن  </a>
						</li>
                        <li <?php if($title == 'familyelderrelationrpt') echo 'class="active open"';?>>
							<a href="<?php echo base_url();?>reports/familyelderrelationrpt">
                            <i class="icon-users"></i>
							تقرير حالة الأسرة مع المسن</a>
						</li>
                        <li <?php if($title == 'lifeimprovementrpt') echo 'class="active open"';?>>
							<a href="<?php echo base_url();?>reports/lifeimprovementrpt">
                            <i class="icon-docs"></i>
							تقرير التشغيل وتحسين مستوى الأسرة</a>
						</li>
                        <li <?php if($title == 'aidrecomendationrpt') echo 'class="active open"';?>>
							<a href="<?php echo base_url();?>reports/aidrecomendationrpt">
                            <i class="icon-pencil"></i>
							قـرارات وتـوصيات الادارة</a>
						</li>
                        <li <?php if($title == 'statisticalrpt') echo 'class="active open"';?>>
							<a href="<?php echo base_url();?>reports/statisticalrpt">
                            <i class="icon-graph"></i>
							تقرير احصائي</a>
						</li>
                        <li>
							<a href="charts_flotcharts.html">
                            <i class="icon-doc"></i>
							نموذج متـابعة الحـالة</a>
						</li>
                        <li>
							<a href="charts_flotcharts.html">
                            <i class="icon-pointer"></i>
							الزيارات الميدانية لعضو</a>
						</li>  
					</ul>
				</li>
			</ul>
			<!-- END SIDEBAR MENU -->
		</div>
	</div>
	<!-- END SIDEBAR -->