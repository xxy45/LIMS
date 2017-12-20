<%@page pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title></title>

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="assets/materialize/css/materialize.min.css" media="screen,projection" />
    <!-- Bootstrap Styles-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Morris Chart Styles-->
    <link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="assets/css/custom-styles.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="assets/js/Lightweight-Chart/cssCharts.css">
</head>
<body>
<div id="wrapper">
    <nav class="navbar navbar-default top-navbar" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand waves-effect waves-dark" href="#"><i class="large material-icons">insert_chart</i> <strong>图书信息管理系统</strong></a>

            <div id="sideNav" href=""><i class="material-icons dp48">toc</i></div>
        </div>

        <ul class="nav navbar-top-links navbar-right">
            <li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown2"><i class="fa fa-bell fa-fw"></i> <i class="material-icons right">arrow_drop_down</i></a></li>
            <li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown1"><i class="fa fa-user fa-fw"></i> <b><%=session.getAttribute("name") %></b> <i class="material-icons right">arrow_drop_down</i></a></li>
        </ul>
    </nav>
    <!-- Dropdown Structure -->
    <ul id="dropdown1" class="dropdown-content">
        <li><a href="manager-center.jsp"><i class="fa fa-user fa-fw"></i> 个人信息</a>
        </li>
        <li><a href="Wopop.html"><i class="fa fa-sign-out fa-fw"></i> 注销</a>
        </li>
    </ul>
    <ul id="dropdown2" class="dropdown-content w250">
        <li>
            <a href="#">
                <div>
                    <i class="fa fa-comment fa-fw"></i> New Comment
                    <span class="pull-right text-muted small">4 min</span>
                </div>
            </a>
        </li>
        <li class="divider"></li>
        <li>
            <a href="#">
                <div>
                    <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                    <span class="pull-right text-muted small">12 min</span>
                </div>
            </a>
        </li>
        <li class="divider"></li>
        <li>
            <a href="#">
                <div>
                    <i class="fa fa-envelope fa-fw"></i> Message Sent
                    <span class="pull-right text-muted small">4 min</span>
                </div>
            </a>
        </li>
        <li class="divider"></li>
        <li>
            <a href="#">
                <div>
                    <i class="fa fa-tasks fa-fw"></i> New Task
                    <span class="pull-right text-muted small">4 min</span>
                </div>
            </a>
        </li>
        <li class="divider"></li>
        <li>
            <a href="#">
                <div>
                    <i class="fa fa-upload fa-fw"></i> Server Rebooted
                    <span class="pull-right text-muted small">4 min</span>
                </div>
            </a>
        </li>
        <li class="divider"></li>
        <li>
            <a class="text-center" href="#">
                <strong>See All Alerts</strong>
                <i class="fa fa-angle-right"></i>
            </a>
        </li>
    </ul>

    <!--/. NAV TOP  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">
                <li>
                    <a href="manager-book.jsp" class="waves-effect waves-dark"><i class="fa fa-dashboard"></i> 图书管理</a>
                 </li>
                <li>
                    <a href="manager-reader.jsp" class="waves-effect waves-dark"><i class="fa fa-desktop"></i> 读者管理</a>
                 
                </li>

                <li>
                    <a href="manager-lend.jsp" class="waves-effect waves-dark"><i class="fa fa-bar-chart-o"></i> 在借图书查询</a>
                </li>
                <li>
                    <a href="manager-history.jsp" class="waves-effect waves-dark"><i class="fa fa-qrcode"></i> 借书情况查询</a>
                </li>
                 <li>
                    <a href="manager-super.jsp" class="waves-effect waves-dark"><i class="fa fa-sitemap"></i> 超级管理员</a>
                </li>
            </ul>
        </div>

    </nav>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper">
        <div class="header">
            <h1 class="page-header">
                <%=session.getAttribute("name") %> <small>欢迎来到图书管理员界面.</small>
            </h1>


        </div>
        <div id="page-inner">

            <div class="row">

                <div class="col-md-12">
						<div class="card"
							style="background: url(images/1.jpg); background-size: 100%;">
							<div class="card-action">山东师范大学图书馆-长清湖校区</div>
							<div class="card-content">
								<p>&nbsp;</p>
								<p>&nbsp;</p>
								<p>&nbsp;</p>
								<p>&nbsp;</p>
								<p>&nbsp;</p>
								<p>&nbsp;</p>
								<p>&nbsp;</p>
								<p>&nbsp;</p>
								<p>&nbsp;</p>
								<p>&nbsp;</p>
								<p>&nbsp;</p>
								<p>&nbsp;</p>
								<p>&nbsp;</p>
								<p>&nbsp;</p>
								
								<div class="clearBoth">
									<br />
								</div>

							</div>

						</div>
						<div class="card">
							<div class="card-action">山东师范大学图书馆</div>
							<div class="card-content">
								<p>千佛山校区图书馆1986年建成使用，建筑面积13400平方米，设有7个书库，14个阅览室，1400多个阅览座。长清校区图书管理部，临时馆舍6270平方米，下设11个阅览室，1个基藏书库，1000多个阅览座位，另有地下书库和各院系资料室面积5200平方米，总计24870平方米。图书馆全部采用藏借阅一体的管理模式。</p>
								<p>长清湖校区新图书馆2015年启用，总建筑面积50934.67平方米，地上9层，半地下1层，建筑高度46.7米。设有八个空间（读者学习空间、特藏阅览空间、信息共享空间、综合服务空间、展览交流空间、学术与学习研修空间、中外文化交流空间和休闲交流空间）、二个区域（技术保障区和业务办公区）和三大书库（特藏书库、密集书库和样本书库）。半地下层主要用于业务办公区、特藏书库、密集书库；一层为综合服务空间、信息共享空间、展览交流空间和技术保障区；二至六层为读者学习空间，按照中图分类法兼顾学科分布特点，自上而下、由东向西呈“U”字型设10
									个图书藏阅服务区（包括15个相对封闭独立的，提供给学生读者的学习研修间）；七层为中外文化交流空间和休闲交流空间；八层为特藏阅览空间和办公区；九层为样本书库和为学校老师服务的学术研修空间。新图书馆将容纳纸质藏书200万册，提供阅览座位4300余个，还计划建有书店和咖啡吧等服务设施，以满足师生读者多样化的需求。</p>
								<div class="clearBoth">
									<br />
								</div>

							</div>

						</div>
					</div>
                <!-- /. PAGE INNER  -->
            </div>
            <!-- /. PAGE WRAPPER  -->
        </div>
        <!-- /. WRAPPER  -->
        <!-- JS Scripts-->
        <!-- jQuery Js -->
        <script src="assets/js/jquery-1.10.2.js"></script>

        <!-- Bootstrap Js -->
        <script src="assets/js/bootstrap.min.js"></script>

        <script src="assets/materialize/js/materialize.min.js"></script>

        <!-- Metis Menu Js -->
        <script src="assets/js/jquery.metisMenu.js"></script>
        <!-- Custom Js -->
        <script src="assets/js/custom-scripts.js"></script>



</body>

</html>
