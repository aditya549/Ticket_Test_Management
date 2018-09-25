<!DOCTYPE html>
<%@page import="userbean.Userbean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dao.ConnectionSteps"%>
<html lang="en">
<head>
    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="ThemeBucket">
    <link rel="shortcut icon" href="images/favicon.png">

    <title>Ticket&Test Management</title>

    <!--Core CSS -->
    <link href="bs3/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet" />

    <!-- Custom styles for this template -->
    <link href="css/style1.css" rel="stylesheet">
    <link href="css/style1-responsive.css" rel="stylesheet" />

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]>
    <script src="js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<style>
table {
  border-collapse: initial;
  border-spacing: 0;
  margin: 1em auto;
  width: 98%;
 }
thead, th {
	background: $header-background;
	color: $header-color;
	text-align: center;
	font-family: 'open_sans_semibold';
	font-size: 1.08em;
}
td {

	
	font-size: 1.03em;
	 
	  padding: 8px;
}
.registered_active {
	background-color: red;
}
.not_active {
	background-color: #FF0000;
}
</style>
<script type="text/javascript" language="javascript" src="jquery-2.1.1.js"></script>

<script type="text/javascript">

var addedrows = new Array();

$(document).ready(function() {
    $( "#sourcetable tbody tr" ).on( "click", function( event ) {
  
    var ok = 0;
    var theid = $( this ).attr('id').replace("sour","");	

	var newaddedrows = new Array();
	
    for	(index = 0; index < addedrows.length; ++index) {

		// if already selected then remove
		if (addedrows[index] == theid) {
			   
			$( this ).css( "background-color", "#FFFFFF" );
			
			// remove from second table :
			var tr = $( "#dest" + theid );
            tr.css("background-color","#FFFFFF");
            tr.fadeOut(400, function(){
                tr.remove();
            });
			
	        //addedrows.splice(theid, 1);	
    		
			//the boolean
			ok = 1;
		} else {
		
		    newaddedrows.push(addedrows[index]);
		} 
    }   
    
	addedrows = newaddedrows;
	
	// if no match found then add the row :
	if (!ok) {
		// retrieve the id of the element to match the id of the new row :
		
		
		addedrows.push( theid);
		
		$( this ).css( "background-color", "#cacaca" );
				
     	$('#destinationtable tr:last').after('<tr id="dest' + theid + '"><td><input type="text" name="testcaseid[]" readonly="readonly" value=' 
		                               + $(this).find("td").eq(0).html() + ' /></td><td><textarea rows="1" name="testdescription[]">' 
		                               + $(this).find("td").eq(1).html() + '</textarea></td><td><textarea rows="1" name="precondition[]">' 
		                               + $(this).find("td").eq(2).html() + '</textarea></td><td><textarea rows="1" name="testdesign[]">' 
		                               + $(this).find("td").eq(3).html() + '</textarea></td><td><textarea rows="1" name="expectedresult[]">'
		                               + $(this).find("td").eq(4).html() + '</textarea></td><td><textarea rows="1" name="actualresult[]">'
		                               + $(this).find("td").eq(5).html() + '</textarea></td><td><textarea rows="1" name="status[]">' 
		                               + $(this).find("td").eq(6).html() + '</textarea></td><td><textarea rows="1" name="comment[]">'
		                               + $(this).find("td").eq(7).html() + '</textarea></td><td style="display:none;"> <input type="text" name="id1[]" value ='
		                               + $(this).find("td").eq(8).html() + '></td></tr>');	 
		                            	   	  
		
	}

	
    });
});		
</script>		
</head>

<body>
<%
		Userbean user = (Userbean) session.getAttribute("session2");
String uname=request.getParameter("modifyusername");
if(uname==null){
	uname="none";
}
	%>
<section id="container" >
<!--header start-->
<header class="header fixed-top clearfix">
<!--logo start-->
<div class="clearfix">
<div class="brand">

    <a href="index.jsp" class="logo">
        <h4 style="color:white;"><b><i>Ticket&Test Management</i></b></h4>
    </a>
    <div class="sidebar-toggle-box">
        <div class="fa fa-bars"></div>
    </div>
</div>
<!--logo end-->


<h3 style="color:#fff;" align="center"><b>ModifyTestReport</b></h3>
<h5 align="right"><a style="color:white;" href="Logout.jsp"><i class="fa fa-key"></i><b> Log Out</b></a></h5>
</div>
</header>
<!--header end-->
<aside>
    <div id="sidebar" class="nav-collapse">
        <!-- sidebar menu start-->
        <div class="leftside-navigation">
            <ul class="sidebar-menu" id="nav-accordion">
                <li>
                    <a class="active" href="EditExecutiveProfile.jsp">
                        <i class="fa fa-pencil"></i>
                        <span>EditProfile</span>
                    </a>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-laptop"></i>
                        <span>Ticket Management</span>
                    </a>
                    <ul class="sub">
                        <li><a href="AddExecutiveTicket.jsp">Add Ticket</a></li>
                        <li><a href="EditExecutiveTicket.jsp">Edit Ticket</a></li>
                        <li><a href="ViewExecutiveTicket.jsp">View Ticket</a></li>
                    </ul>
                </li>


                 <%
                String desig=user.getDesignation();
				if((desig.equals("executivequalityanalyst"))) {
					%>
					  <li class="sub-menu">
	                    <a href="javascript:;">
	                        <i class="fa fa-check-square-o"></i>
	                        <span>Test Management</span>
	                    </a>
	                    <ul class="sub">
	                        <li><a href="ExecutiveTestReport.jsp">Prepare TestReport</a></li>
	                        <li><a href="ExecutiveTestData.jsp">Prepare TestData </a></li>
	                        <li><a href="ExecutiveBugReport.jsp">Prepare BugReport</a></li>
	                        <li><a href="ViewExecutiveTestReport.jsp">ViewTestReport</a></li>
							 <li><a href="ModifyExecutiveTestReport.jsp">ModifyTestReport</a></li>
							
	                    </ul>
	                </li>
				<% }
				
                %>

               <li>
                    <a href="ExecutiveNotifications.jsp">
                        <i class="fa fa-bell-o"></i>
                        <span>Notifications </span>
                    </a>
                </li>




            </ul>            </div>
        <!-- sidebar menu end-->
    </div>
</aside>
<!--sidebar end-->
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
        <!-- page start-->
<h4 align="center">Notification sent to Employee</h4>
<br><br>
			<form action="ModifyExecutiveTestReport.jsp" method="post">

                             <select name="modifyusername">
							<option value="none">Select Emp</option>
							
							<%
							ConnectionSteps steps = new ConnectionSteps();
							Connection conn = steps.connection();
					PreparedStatement pstmt = conn.prepareStatement("select * from testreporttable");
					ResultSet rs = pstmt.executeQuery();
					HashSet<String> hs = new HashSet();
					while(rs.next()){
						
						hs.add(rs.getString("username"));
					}
				Iterator<String> itr = hs.iterator();
				while(itr.hasNext()){
							%>
							
							<% String name=itr.next();%>
							<option value = <%=name %> ><%=name %></option>
							
							<%} %>
							</select>&emsp;

							<input type="submit" name="submit" />
</form>
<br>
<br>
<%if(uname.equals("none")){
	
}else{
	
	%>
<h5 style="color:blue;">Employee Name :: <%=uname %></h5>
<%} %>
<form action="ModifyTestReportServlet1" method="post">
<table  border="1" cellspacing="5"  id="sourcetable">
      <tr>
       <thead>
        <th>TestCase Id</th>
        <th>TestDescription</th>
		<th>Precondition</th>
		<th>TestDesign</th>
		<th>ExpectedResult</th>
		<th>ActualResult</th>
		<th>Status</th>
		<th>Comment</th>
</thead>
      </tr>
       <tbody>
<%PreparedStatement pstmt1=conn.prepareStatement("select * from testreporttable where username=?");
pstmt1.setString(1, uname);
ResultSet rs1 = pstmt1.executeQuery();
int	i=0;
while(rs1.next()){
String value="sour"+i;
%>
	  <tr id=<%=value %>>
	
        <td name="testcaseid[]"><%=rs1.getString("testcaseid") %></td>
        <td  name="testdescription[]"><%=rs1.getString("testdescription") %></td>
		 <td  name="precondition[]"><%=rs1.getString("precondition") %></td>
		  <td name="testdesign[]"><%=rs1.getString("testdesign") %></td>
		   <td name="expectedresult[]"><%=rs1.getString("expectedresult") %></td>
		   <%if(rs1.getString("actualresult")==null){ %>
		   <td name="actualresult[]"></td>
		   <%}else{ %>
		    <td name="actualresult[]"><%=rs1.getString("actualresult") %></td>
		    <%} %>
		     <%if(rs1.getString("status")==null){ %>
		      <td name="status[]"></td>
		   <%}else{ %>
			 <td name="status[]"><%=rs1.getString("status") %></td>
			  <%} %>
		     <%if(rs1.getString("comments")==null){ %>
		      <td name="comment[]"></td>
		      <%}else{ %>
			 <td name="comment[]"><%=rs1.getString("comments") %></td>
			 <%} %>
			 <td style="display:none;"><%=rs1.getString("id")%></td>
			 
      <input type="hidden" name="id[]" value=<%=rs1.getString("id")%>>
      </tr>
  
      <%
   i++;
} %>
      <!-- This is our clonable table line -->
</tbody>
    </table>
    <p align="right">
  <input type="submit" name="approve"  value="Approve" />
  </p>
</form>


<%if(uname.equals("none")){
	
}else{
	%>	
	<form method="POST" action="ModifyTestReportServlet">
	

<table id="destinationtable" border="1">
	<thead>
		<tr>
		<th>TestCase Id</th>
        <th>TestDescription</th>
		<th>Precondition</th>
		<th>TestDesign</th>
		<th>ExpectedResult</th>
		<th>ActualResult</th>
		<th>Status</th>
		<th>Comment</th>
						
		</tr>
	</thead>

</table>
<p align="right">

	 <input type="submit" name=" submit "  value=" Submit" />
	</p>
</form>	

	<%} %>


   <!--  <input type="button" name="approve" class="btn btn-info" value="Approve" /> -->

        <div class="row">
            <div class="col-sm-12">

            </div>
        </div>
        <!-- page end-->
        </section>
    </section>
    <!--main content end-->
<!--right sidebar start-->
<div class="right-sidebar">
<div class="search-row">
    <input type="text" placeholder="Search" class="form-control">
</div>
<div class="right-stat-bar">
<ul class="right-side-accordion">
<li class="widget-collapsible">
    <a href="#" class="head widget-head red-bg active clearfix">
        <span class="pull-left">work progress (5)</span>
        <span class="pull-right widget-collapse"><i class="ico-minus"></i></span>
    </a>
    <ul class="widget-container">
        <li>
            <div class="prog-row side-mini-stat clearfix">
                <div class="side-graph-info">
                    <h4>Target sell</h4>
                    <p>
                        25%, Deadline 12 june 13
                    </p>
                </div>
                <div class="side-mini-graph">
                    <div class="target-sell">
                    </div>
                </div>
            </div>
            <div class="prog-row side-mini-stat">
                <div class="side-graph-info">
                    <h4>product delivery</h4>
                    <p>
                        55%, Deadline 12 june 13
                    </p>
                </div>
                <div class="side-mini-graph">
                    <div class="p-delivery">
                        <div class="sparkline" data-type="bar" data-resize="true" data-height="30" data-width="90%" data-bar-color="#39b7ab" data-bar-width="5" data-data="[200,135,667,333,526,996,564,123,890,564,455]">
                        </div>
                    </div>
                </div>
            </div>
            <div class="prog-row side-mini-stat">
                <div class="side-graph-info payment-info">
                    <h4>payment collection</h4>
                    <p>
                        25%, Deadline 12 june 13
                    </p>
                </div>
                <div class="side-mini-graph">
                    <div class="p-collection">
						<span class="pc-epie-chart" data-percent="45">
						<span class="percent"></span>
						</span>
                    </div>
                </div>
            </div>
            <div class="prog-row side-mini-stat">
                <div class="side-graph-info">
                    <h4>delivery pending</h4>
                    <p>
                        44%, Deadline 12 june 13
                    </p>
                </div>
                <div class="side-mini-graph">
                    <div class="d-pending">
                    </div>
                </div>
            </div>
            <div class="prog-row side-mini-stat">
                <div class="col-md-12">
                    <h4>total progress</h4>
                    <p>
                        50%, Deadline 12 june 13
                    </p>
                    <div class="progress progress-xs mtop10">
                        <div style="width: 50%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="20" role="progressbar" class="progress-bar progress-bar-info">
                            <span class="sr-only">50% Complete</span>
                        </div>
                    </div>
                </div>
            </div>
        </li>
    </ul>
</li>
<li class="widget-collapsible">
    <a href="#" class="head widget-head terques-bg active clearfix">
        <span class="pull-left">contact online (5)</span>
        <span class="pull-right widget-collapse"><i class="ico-minus"></i></span>
    </a>
    <ul class="widget-container">
        <li>
            <div class="prog-row">
                <div class="user-thumb">
                    <a href="#"><img src="images/avatar1_small.jpg" alt=""></a>
                </div>
                <div class="user-details">
                    <h4><a href="#">Jonathan Smith</a></h4>
                    <p>
                        Work for fun
                    </p>
                </div>
                <div class="user-status text-danger">
                    <i class="fa fa-comments-o"></i>
                </div>
            </div>
            <div class="prog-row">
                <div class="user-thumb">
                    <a href="#"><img src="images/avatar1.jpg" alt=""></a>
                </div>
                <div class="user-details">
                    <h4><a href="#">Anjelina Joe</a></h4>
                    <p>
                        Available
                    </p>
                </div>
                <div class="user-status text-success">
                    <i class="fa fa-comments-o"></i>
                </div>
            </div>
            <div class="prog-row">
                <div class="user-thumb">
                    <a href="#"><img src="images/chat-avatar2.jpg" alt=""></a>
                </div>
                <div class="user-details">
                    <h4><a href="#">John Doe</a></h4>
                    <p>
                        Away from Desk
                    </p>
                </div>
                <div class="user-status text-warning">
                    <i class="fa fa-comments-o"></i>
                </div>
            </div>
            <div class="prog-row">
                <div class="user-thumb">
                    <a href="#"><img src="images/avatar1_small.jpg" alt=""></a>
                </div>
                <div class="user-details">
                    <h4><a href="#">Mark Henry</a></h4>
                    <p>
                        working
                    </p>
                </div>
                <div class="user-status text-info">
                    <i class="fa fa-comments-o"></i>
                </div>
            </div>
            <div class="prog-row">
                <div class="user-thumb">
                    <a href="#"><img src="images/avatar1.jpg" alt=""></a>
                </div>
                <div class="user-details">
                    <h4><a href="#">Shila Jones</a></h4>
                    <p>
                        Work for fun
                    </p>
                </div>
                <div class="user-status text-danger">
                    <i class="fa fa-comments-o"></i>
                </div>
            </div>
            <p class="text-center">
                <a href="#" class="view-btn">View all Contacts</a>
            </p>
        </li>
    </ul>
</li>
<li class="widget-collapsible">
    <a href="#" class="head widget-head purple-bg active">
        <span class="pull-left"> recent activity (3)</span>
        <span class="pull-right widget-collapse"><i class="ico-minus"></i></span>
    </a>
    <ul class="widget-container">
        <li>
            <div class="prog-row">
                <div class="user-thumb rsn-activity">
                    <i class="fa fa-clock-o"></i>
                </div>
                <div class="rsn-details ">
                    <p class="text-muted">
                        just now
                    </p>
                    <p>
                        <a href="#">Jim Doe </a>Purchased new equipments for zonal office setup
                    </p>
                </div>
            </div>
            <div class="prog-row">
                <div class="user-thumb rsn-activity">
                    <i class="fa fa-clock-o"></i>
                </div>
                <div class="rsn-details ">
                    <p class="text-muted">
                        2 min ago
                    </p>
                    <p>
                        <a href="#">Jane Doe </a>Purchased new equipments for zonal office setup
                    </p>
                </div>
            </div>
            <div class="prog-row">
                <div class="user-thumb rsn-activity">
                    <i class="fa fa-clock-o"></i>
                </div>
                <div class="rsn-details ">
                    <p class="text-muted">
                        1 day ago
                    </p>
                    <p>
                        <a href="#">Jim Doe </a>Purchased new equipments for zonal office setup
                    </p>
                </div>
            </div>
        </li>
    </ul>
</li>
<li class="widget-collapsible">
    <a href="#" class="head widget-head yellow-bg active">
        <span class="pull-left"> shipment status</span>
        <span class="pull-right widget-collapse"><i class="ico-minus"></i></span>
    </a>
    <ul class="widget-container">
        <li>
            <div class="col-md-12">
                <div class="prog-row">
                    <p>
                        Full sleeve baby wear (SL: 17665)
                    </p>
                    <div class="progress progress-xs mtop10">
                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                            <span class="sr-only">40% Complete</span>
                        </div>
                    </div>
                </div>
                <div class="prog-row">
                    <p>
                        Full sleeve baby wear (SL: 17665)
                    </p>
                    <div class="progress progress-xs mtop10">
                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 70%">
                            <span class="sr-only">70% Completed</span>
                        </div>
                    </div>
                </div>
            </div>
        </li>
    </ul>
</li>
</ul>
</div>
</div>
<!--right sidebar end-->

</section>

<!-- Placed js at the end of the document so the pages load faster -->





<!--Core js-->
<script src="js/jquery.js"></script>
<script src="bs3/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript" src="js/jquery.dcjqaccordion.2.7.js"></script>
<script src="js/jquery.scrollTo.min.js"></script>
<script src="js/jQuery-slimScroll-1.3.0/jquery.slimscroll.js"></script>
<script src="js/jquery.nicescroll.js"></script>
<!--Easy Pie Chart-->
<script src="js/easypiechart/jquery.easypiechart.js"></script>
<!--Sparkline Chart-->
<script src="js/sparkline/jquery.sparkline.js"></script>
<!--jQuery Flot Chart-->
<script src="js/flot-chart/jquery.flot.js"></script>
<script src="js/flot-chart/jquery.flot.tooltip.min.js"></script>
<script src="js/flot-chart/jquery.flot.resize.js"></script>
<script src="js/flot-chart/jquery.flot.pie.resize.js"></script>


<!--common script init for all pages-->
<script src="js/scripts.js"></script>
<script type="text/javascript">

$('#insert_form').on('submit', function(event){
	 
	  var error = '';

	 
	  var form_data = $(this).serialize();
	  if(error == '')
	  {
		 
	   $.ajax({
	    url:"ModifyServler.jsp",
	    method:"POST",
	    data:form_data,
	    success:function(data)
	    {
	    location.reload();
	    }
	   });
	
}
	  else
	  {
	   $('#error').html('<div class="alert alert-danger">'+error+'</div>');
	  }
	 });


</script>
</body>
</html>
