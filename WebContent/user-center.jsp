<%@page pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<script type="text/javascript">
	var name= request.getParameter("name");
</script>
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
				  <li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown1"><i class="fa fa-user fa-fw"></i> <b> <%=session.getAttribute("name") %></b> <i class="material-icons right">arrow_drop_down</i></a></li>
            </ul>
        </nav>
		<!-- Dropdown Structure -->
<ul id="dropdown1" class="dropdown-content">
    <li><a href="#"><i class="fa fa-user fa-fw"></i> 个人信息</a>
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

</ul>

	   <!--/. NAV TOP  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
				
                    <li>
                        <a href="user-search.jsp" class="waves-effect waves-dark"><i class="fa fa-dashboard"></i> 图书查询</a>
                    </li>
                    <li>
                        <a href="user-borrow.jsp" class="waves-effect waves-dark"><i class="fa fa-dashboard"></i> 在借图书</a>
                    </li>
                    <li>
                        <a href="user-history.jsp" class="waves-effect waves-dark"><i class="fa fa-dashboard"></i> 借书历史</a>
                    </li>
                    <li>
                        <a href="user-update.jsp" class="waves-effect waves-dark"><i class="fa fa-desktop"></i> 修改信息</a>
                    </li>
                   
                </ul>

            </div>

        </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper">
		  <div class="header"> 
                        <h1 class="page-header">
                            <%=session.getAttribute("name") %> <small>欢迎来到图书信息管理系统.</small>
                        </h1>

									
		</div>
            <div id="page-inner">
				<div class="row">

					<div class="col-md-12">
						<div class="card">
							<iframe src="common/div-usercenter.jsp" id="iframepage"
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
