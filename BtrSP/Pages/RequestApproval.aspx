<%@ Reference VirtualPath="~masterurl/custom.master" %>
<%@ Page language="C#"   Inherits="Microsoft.SharePoint.Publishing.PublishingLayoutPage,Microsoft.SharePoint.Publishing,Version=16.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" meta:progid="SharePoint.WebPartPage.Document" %>
<asp:Content ContentPlaceholderID="PlaceHolderAdditionalPageHead" runat="server">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<!-- ================== BEGIN BASE CSS STYLE ================== -->

<!-- Optional theme -->
<link rel="stylesheet" href="../Content/loader.css" type="text/css" />
<link rel="stylesheet" href="../Content/main.css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.13/css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.1.1/css/responsive.bootstrap.min.css"/>

<!-- ================== END BASE CSS STYLE ================== -->
<style type="text/css">

.navbar-default, .navbar-nav>li>.dropdown-menu,.navbar-default .navbar-nav>li>a, .navbar-default .navbar-nav .open .dropdown-menu>li>a{
	background:#0D66A2;
	color:white;
}
.navbar-default .navbar-nav>li>a:hover, .navbar-default .navbar-nav .open .dropdown-menu>li>a:hover{
	color:black;
}
.navbar-default .navbar-nav>.open>a, .navbar-default .navbar-nav>.open>a:focus, .navbar-default .navbar-nav>.open>a:hover{
	background:#222;
	color:white;
}
.navbar-default .navbar-brand {
	color:white;
	float:none;
	text-align:center
}

html, body, .container-table {
    height: 100%;
    font-family:Verdana!important;
}
.statusDivPareent {
	float:left;
}
.statusDiv, .statusDivText {
	font-size:medium;
	font-weight:bold;
	float:left;
	margin-right:20px

}
.buttons {
	text-transform:uppercase;
	background-color:#323232!important;
	font-weight:bolder;
	width:150px;
	color:white!important;
	font-size:14px;
	line-height:15px;
	border:none;
	margin-left:10px;
	margin-right:10px;
}

.buttons .cancel {
	background-color:#red!important;
}
.navbar-default {
    background: #0D66A2;
}
.navbar-default .navbar-brand {
	color:white;
	float:none;
	text-align:center
}
.container-table {
    display: table;
}
.vertical-center-row {
    display: table-cell;
    vertical-align: middle;
}    


.scrollable-dropdown-menu .tt-dropdown-menu {
  max-height: 150px;
  overflow-y: auto;
}

.media-messaging .media, .widget {
	padding: 15px;
}
.result-list > li, .widget {
	border-radius: 3px;
	overflow: hidden;
}
.bg-purple {
	background: #727cb6!important;
}
.bg-blue {
	background: #348fe2!important;
}
.bg-green {
	background: #00acac!important;
}
.bg-black {
	background: #2d353c!important;
}
.bg-info {
    background: #38AFD3!important;
}
.widget {
    border: none;
    box-shadow: 0 2px 0 rgba(0, 0, 0, .07);
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    border-radius: 5px;
    margin-bottom: 20px;
    position: relative;
    background: #fff;
    padding: 20px;
    display: block
}

#s4-ribbonrow {
	display:none;
}

#s4-workspace {
	overflow:hidden;
}

    #contentBox  {margin-left: 20px !important;}
    #SearchBox {display:none;}
    #suiteBarTop {display:none !important;}
    #s4-ribbonrow{display:none !important;}

.glyphicon-ok {
	padding-left:5px;
	color:green
}


.glyphicon-flag {
	padding-left:5px;
	color:red
}


</style>
	
<!-- ================== BEGIN BASE JS ================== -->
<script src="https://code.jquery.com/jquery-2.1.4.min.js" type="text/javascript"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" type="text/javascript"></script>
<script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js" type="text/javascript"></script>   
<script src="../Scripts/Utils.js" type="text/javascript"></script>
<script src="../Scripts/EnvConfig.js" type="text/javascript"></script>


<!-- ================== END BASE JS ================== -->
	
</asp:Content>
<asp:Content ContentPlaceholderID="PlaceHolderPageTitle" runat="server">BTR 
	
	View Request Form</asp:Content>
<asp:Content ContentPlaceholderID="PlaceHolderMain" runat="server">
<div> <!-- Begining DIV -->


<!-- Page header  -->

<div id="header" class="header navbar navbar-default" style="border:thin;margin-bottom:0px;display:none">
    <!-- begin container-fluid -->
    <div class="container-fluid">
	    <div class="row">
	    	<div class="col-sm-6 col-lg-4 col-md-4">
	    		 <img src="../SiteAssets/BTR/images/TeacherCollegeLogo.png" class="img-responsive"/>
	    	</div>
	    	<div class="col-sm-6 col-lg-4 col-md-4">
	    		<div style="text-align:center"><span class="navbar-brand" style="text-align:center">
					BUDGET TRANSFER REQUEST</span></div>        
	    	</div>
	    	<div class="col-sm-12 col-lg-4 col-md-4"><a ui-sref="#" class="navbar-brand" href="#"></a></div>
	    </div> <!-- end of row -->
	</div> <!-- end container-fluid --> 
</div>   	

  <div class="container-fluid" id="top-nav">
    <div class="row">
      <div class="col-lg-12 col-md-10 col-sm-12 col-xs-12">
        <img src="../SiteAssets/BTR/images/logo.png" class="img-responsive">
      </div>
    </div>
  </div>

  <nav id="nav-bar" class="navigation navbar navbar-default list-inline" role="navigation">
    <!-- Creates the hamburgererererer -->
    <div class="navbar-header">
      	<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".hamburger">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      	</button>
    </div>
    <ul class="nav navbar-nav list-inline collapse navbar-collapse hamburger">
      <li><a href="../"><span class="glyphicon glyphicon-home">
    </span></a></li>
      <li class="btn-group">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Transfer 
		Requests<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="BTREdit.aspx?transfer_type=intradepartmental" style="color:blue">
			Within My Department</a></li>
          <li><a href="BTREdit.aspx?transfer_type=interdepartmental" style="color:blue">
			Outside My Department</a></li>
        </ul>
      </li>
      <li class="btn-group">
        <a href="#">Archive</a>
      </li>
    </ul>
    <!-- navbar-right is what creates extra padding so you have to target the pull-right class in the navbar and use float:right -->
    <ul class="nav navbar-nav pull-right list-inline collapse navbar-collapse hamburger">
      <li class="btn-group">
        <a href="#"><span id="userField"></span></a>
      </li>
    </ul>
  </nav>
  <!-- closing off the nav otherwise it encompases the entire page -->


<!-- Menu bar -->
<div class="container-fluid" style="padding-left:0;padding-right:0;display:none">
    <!-- Second navbar for profile settings -->
    
      <div class="row" >
      	<div class="col-lg-12">
      	<nav class="navbar navbar-default">
      		<ul class="nav navbar-nav navbar-left navbar-default">
            <!-- Menu Item -->
            <li><a href="BTR.aspx">Home</a></li>
          </ul>
      	</nav>
          
      	</div>
      </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
</div><!-- /.container-fluid -->
	
    <!-- My Requests -->
	<div class="row" >
		<div class="row">
		        <!-- begin panel -->
		    <div class="col-md-1"></div>
		    <div class="col-md-10"> 
		    <div style="width:100%" class="statusDivPareent" >
		    	<div id="divStatusNew"  class="statusDivText">NEW</div>
		    	<div class="statusDiv">-</div>
		    	<div id="divStatusDraft"  class="statusDivText">DRAFT</div>
		    	<div class="statusDiv">-</div>
		    	<div id="divStatusApproval" class="statusDivText">APPROVAL</div>
		    	<div class="statusDiv">-</div>
		    	<div id="divStatusReview" class="statusDivText">REVIEW</div>
		    	<div class="statusDiv">-</div>
		    	<div id="divStatusPosted" class="statusDivText">POSTED</div>
		    	</div>
		    </div>
		    <div class="col-md-1"></div>
		</div>
		<p/>
	</div>

    <div class="row" style="padding-top:15px">
    	<div class="col-lg-1"></div>
		<div class="col-lg-10" style="margin-left:2px">
			<div style="border-bottom:#337ab7 medium solid;color:black;font-size:16px">
				<span style="background-color:#337ab7;color:white;font-weight:bold;padding-left:5px;padding-right:5px">
				Budget Request Information</span>
			</div>
		</div>
    	<div class="col-lg-1"></div>
	</div>
	
    <div class="row" style="padding-top:10px;margin-left:5px;margin-right:5px">
		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<div>
			<!-- TODO: Make title bigger -->
				<label>Budget #:&nbsp;</label><span id="txtBTR_Id"></span><br>
			<br/>
				<label>Short Description:&nbsp;</label><span id="txtBTR_Title"></span>
			</div>
			<div>
				<label>Budget Type:&nbsp;</label><span id="budgetType"></span>
			    <label style="padding-left:10px">Request By:</label><span id="txtBTR_Requestor" />
			    
				<input type="hidden" id="txtBTR_Guid">
				<span id="txtBTR_ApprovedDate"/>
				<input type="hidden" id="txtBTR_LifeCycle">
				<input type="hidden" id="txtBTR_InternalState">
			</div>
			<div>
				<label>Modified by:&nbsp;</label><span id="modifiedby"></span>
				<label>Modified:&nbsp;</label><span id="modifieddate"></span>				
			</div>
			<div>
				<label>Created by:&nbsp;</label><span id="createdby"></span>
				<label>Created:&nbsp;</label><span id="createddate"></span>				
			</div>

		</div>
		<div class="col-lg-1"></div>
	</div>
	
    <div class="row" style="padding-top:30px">
    	<div class="col-lg-1"></div>
		<div class="col-lg-10" style="margin-left:2px">
			<div style="border-bottom:#337ab7 medium solid;color:black;font-size:16px">
				<span style="background-color:#337ab7;color:white;font-weight:bold;padding-left:5px;padding-right:5px">
				Budget Transfer Activities</span>
			</div>
		</div>
    	<div class="col-lg-1"></div>
	</div>
	
    <!-- Transfer Activities -->
    
	<div class="row" style="padding-top:15px;margin-left:5px;margin-right:5px"> 
			<div class="col-md-1"></div>
			<div class="col-md-10"> 
				<div class="panel panel-primary">
					<div class="panel-heading">
						<div class="panel-heading-btn">
							<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-grey" data-click="panel-reload"><i class="fa fa-repeat"></i></a>
						</div>
						<h4 class="panel-title">Transfer Activities</h4>
					</div>
					<div class="table-responsive" id="divData">
						<table class='table table-striped table-td-valign-middle' id='dataTableTransferItems' >
							<thead>
								<tr class='primary' style="width:10%"><th>ID</th><th>
									ID</th><th>JV</th><th style="width:10%">JV 
									Status</th><th>Index</th><th>Acount</th><th>
									Amount</th>
							</thead>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-1"></div>
	</div>


	<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
			<!-- 
				<input type="submit" id="btnApproveTransfer" value="Approve Transfer" onclick="PostData(); return false;"/>  -->
				&nbsp;
				<input type="button" value="Close" onclick="CloseScreen(); return false;"/> 
				&nbsp;
				<!-- <input type="button" value="Post Data(Test)" onclick="PostData();"/> &nbsp; -->
			</div>
			<div class="col-md-1"></div>
	</div>

</div> <!-- Ending DIV -->

<script type="text/javascript">

	function SetBTRForm(oItem)
	{
	
		$('#txtBTR_Title').html(oItem.title);
		$('#txtBTR_Id').html(oItem.btr_key);
//		$('#txtBTR_ApprovedDate').html(oItem.Approved_x0020_Date);
//		$('#txtBTR_ApprovalStatus').html(oItem.Approval_x0020_Status);
		$("#lblRequester").html(oItem.requestor_uni_code);
		$("#txtBTR_Requestor").html(oItem.requestor_uni_code);
		$('#budgetType').html(oItem.budget_type);		
		$("#divStatus"+ oItem.life_cycle).css('background-color','red').css('color','white');
		$('#createddate').html(oItem.created);		
		$('#createdby').html(oItem.created_by_name);		
		$('#modifiedby').html(oItem.modified_by_name);		
		$('#modifieddate').html(oItem.modified);		

//		explanation

//transfer_type
/*
		if (oItem.LifeCycle.toLowerCase() == "approval")
		{
			$("#btnApproveTransfer").attr("disabled", false);
		} 
		else
		{
			$("#btnApproveTransfer").removeAttr("disabled");
		}
*/
	}	
	function JvMessage(oItem)
	{
		var message='';
		if (((typeof oItem.complete_jv_status_message) != 'undefined') && (oItem.complete_jv_status_message != null))
		{
			message += oItem.complete_jv_status_message;
			
		}
		if (((typeof oItem.create_jv_error_message) != 'undefined' ) && (oItem.create_jv_error_message != null))
		{
			message += ((message.length > 0) ? '<br/>' : '') + '(Err) - ' + oItem.create_jv_error_message.substring(1,10) + '...';
			
		}
		return message;
	}
	
	function JvDocId(oItem)
	{
		return ((oItem.jv_doc_id != null) ? oItem.jv_doc_id : '')  + ((oItem.jv_complete == 1) ? '<span class="glyphicon glyphicon-ok">' : '') + ((oItem.create_jv_error_message != null) ? '<span class="glyphicon glyphicon-flag">' : '');
	}
	
	function PopulateTransferActivityTable(transferActivities,tableObj) {
//<span class="glyphicon glyphicon-flag"></span>
		if (transferActivities.length == 0) return;
		for (iCount=0; iCount < transferActivities.length; iCount ++) {
			
			oItem = transferActivities[iCount];
			if (oItem.position_type.toLowerCase() == "from")
			{
				//debugger;
				tableObj.row.add([
									oItem.position_type,
									oItem.transfer_activity_key , //Item Guid
									JvDocId(oItem),
									JvMessage(oItem),
									oItem.index_number_description,
									oItem.account_number_description,
									'$'+oItem.amount
								] ).draw( true );
			}

		}
		for (iCount=0; iCount < transferActivities.length; iCount ++) {
			
			oItem = transferActivities[iCount];
			if (oItem.position_type.toLowerCase() == "to")
			{
				//debugger;
				tableObj.row.add([
									oItem.position_type,
									oItem.transfer_activity_key, //Item Guid
									JvDocId(oItem),
									JvMessage(oItem),
									oItem.index_number_description,
									oItem.account_number_description,
									'$'+oItem.amount
								] ).draw( false );
			}

		}
	}
	
	
	function GetTransferActivitiesItems(btrID,tableObj)
	{
		BTR.BudgetTransfer.Item(btrID,
			function(btrObj) {
				if (btrObj == null) return;
				SetBTRForm(btrObj);
					
				BTR.TransferActivity.GetBTRAssociatedTransferActivities(_gForm_ID, 
					function(transferActivities) {
						PopulateTransferActivityTable(transferActivities,tableObj);
					},
					function(error) {
						alert('Error getting transfer activities.');
						
					}
				);
			},
			function (data) {
				  alert("Error: "+ data);
			}
		);
	}

	function LoadDataGrid() {
		_gDataTableTransferItems = $('#dataTableTransferItems').DataTable({
			"columnDefs": [{
				"targets":[0],
				"visible":false,
				"searchable":false
			}],
			"drawCallback": function ( settings ) {
				var api = this.api();
				var rows = api.rows( {page:'current'} ).nodes();
				var last=null;
	 
				api.column(0, {page:'current'} ).data().each( function ( group, i ) {
					if ( last !== group ) {
						$(rows).eq( i ).before('<tr class="group"><td colspan="5" style="font-weight:bold">'+group+'</td></tr>');
						last = group;
					}
				});
			}
       });
	}

	function CancelScreen() {
		window.location.href = "../";
	}
	
	function CloseScreen() {
		window.location.href = "../";
	}

//Global Variables
	var _gUserLoginName = _spPageContextInfo.userLoginName;
	var _gUserUni = BTRUtils.GetUniValue(_gUserLoginName);
	
	var _gForm_ID = BTRUtils.GetParamByName("rID");

	var _gForm_Referrer = document.referrer;
	
	var _gDataTableTransferItems = null;
	var _gJsonTransferItems = [];
	
	
	$(document).ready(function() {
	
//		LoadUserInfromation(function() {
//			
//			LoadForm();
//		});
		BTR.BudgetTransfer.SiteUrl(GlobalConfig.BTR.Rest_Api_Url);
		BTR.TransferActivity.SiteUrl(GlobalConfig.BTR.Rest_Api_Url);
	
		LoadDataGrid();
		$("#userField").html(_gUserLoginName);

		GetTransferActivitiesItems(_gForm_ID,_gDataTableTransferItems); 
	});
</script>
<script src="../Scripts/BudgetTransfer.js" type="text/javascript"></script>
<script src="../Scripts/TransferActivity.js" type="text/javascript"></script>
</asp:Content>