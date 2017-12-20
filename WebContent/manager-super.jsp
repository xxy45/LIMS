<%@page pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title></title>
<link href="assets/css/imput.css" rel="stylesheet" />
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
                    <a href="#" class="active-menu waves-effect waves-dark"><i class="fa fa-sitemap"></i> 超级管理员<span class="fa arrow"></span></a>
                    <% if(session.getAttribute("name").toString().equals("admin")){%>
                     <ul class="nav nav-second-level">
                        <li>
                            <a href="add_administrator.jsp" target="iframepage">权限管理</a>
                        </li>
                        <li>
                            <a href="do2.jsp" target="iframepage">一键备份 </a>
                        </li>
                       <li>
                            <a href="common/doview.jsp" target="iframepage">查看管理员</a>
                        </li>
                    </ul>
                    <%} %>
                </li>
            </ul>
        </div>

    </nav>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper">
        <div class="header">
            <h1 class="page-header">
              <small>欢迎来到超级管理员界面.</small>
            </h1>


        </div>
        <div id="page-inner">

            <div class="row">

                <div class="col-md-12">
                    <div class="card">
                        <div class="card-action">
                           <% 
                           if(session.getAttribute("name").toString().equals("admin")){
                           %>
                           	<h4>欢迎您，<%=session.getAttribute("name") %></h4>
                           <%}
                           else  {%>
                           
                           	<h4>您还不是超级管理员，无法使用此功能</h4>
                           <%} %>
                        </div>
                       <iframe id="iframepage"
								name="iframepage" frameBorder=0 scrolling=no width="100%"
								onLoad="iFrameHeight()"></iframe>
							<script type="text/javascript" language="javascript">
								function iFrameHeight() {
									var ifm = document
											.getElementById("iframepage");
									var subWeb = document.frames ? document.frames["iframepage"].document
											: ifm.contentDocument;
									if (ifm != null && subWeb != null) {
										ifm.height = subWeb.body.scrollHeight;

									}
								}
							</script>

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
