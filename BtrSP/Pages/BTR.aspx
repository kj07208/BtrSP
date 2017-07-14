<%@ Reference VirtualPath="~masterurl/custom.master" %>
<%@ Page language="C#"   Inherits="Microsoft.SharePoint.Publishing.PublishingLayoutPage,Microsoft.SharePoint.Publishing,Version=16.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" meta:progid="SharePoint.WebPartPage.Document" %>
<%@ Register Tagprefix="SharePointWebControls" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<asp:Content ContentPlaceholderID="PlaceHolderAdditionalPageHead" runat="server">
	<SharePointWebControls:FieldValue id="PageStylesField" FieldName="HeaderStyleDefinitions" runat="server"/>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
<!-- ================== BEGIN BASE CSS STYLE ================== -->
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.13/css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.1.1/css/responsive.bootstrap.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/6.0.0/normalize.min.css">
<link rel="stylesheet" href="../Content/main.css"/>
<link rel="stylesheet" href="../Content/page_btr.css"/>

<style type="text/css">
    #contentBox  {margin-left: 20px !important;}
    #SearchBox {display:none;}
    #suiteBarTop {display:none !important;}
    #s4-ribbonrow{display:none !important;}
</style>
<!-- ================== END BASE CSS STYLE ================== -->
	
<!-- ================== BEGIN BASE JS ================== -->
<script src="https://code.jquery.com/jquery-2.1.4.min.js" type="text/javascript"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" type="text/javascript"></script>
<script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js" type="text/javascript"></script>    

<script src="https://cdn.datatables.net/1.10.13/js/dataTables.bootstrap.min.js" type="text/javascript"></script>    
<script src="https://cdn.datatables.net/responsive/2.1.1/js/dataTables.responsive.min.js" type="text/javascript"></script>    
<script src="https://cdn.datatables.net/responsive/2.1.1/js/responsive.bootstrap.min.js" type="text/javascript"></script>    

<script src="../Scripts/Utils.js" type="text/javascript"></script> <!-- this has to be after SharePoint JS files -->
<script src="../Scripts/EnvConfig.js" type="text/javascript"></script>
<script src="../Scripts/SP.User.js" type="text/javascript"></script>
<script src="../Scripts/BudgetTransfer.js" type="text/javascript"></script>
<script src="../Scripts/TransferActivity.js" type="text/javascript"></script>

<!-- ================== END BASE JS ================== -->
	
</asp:Content>
<asp:Content ContentPlaceholderID="PlaceHolderPageTitle" runat="server">BTR Home</asp:Content>
<asp:Content ContentPlaceholderID="PlaceHolderMain" runat="server">
<div>
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
          <li><a href="BTREdit_wizard.aspx?transfer_type=intradepartmental" style="color:blue">
			Within My Department</a></li>
          <li><a href="BTREdit_wizard.aspx?transfer_type=interdepartmental" style="color:blue">
			Outside My Department</a></li>
        </ul>
      </li>
      <li class="btn-group">
        <a href="#" class="disabled">Archive</a>
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



<!-- Toggle Buttons  -->

<div class="row" >
        <div class="col-md-1"></div>
        <div class="col-md-10">
        	<div class="row">
		        <div class="col-md-3 col-xs-3">
		            <!-- begin widget -->
		            <div class="widget widget-stat bg-green widget-stat-right text-white" onclick="ShowAll();">
		                <div class="widget-stat-icon" ><span class="glyphicon glyphicon-file"></span></div>
		                <div class="widget-stat-info hidden-xs">
		                    <div class="widget-stat-title" >All</div>
		                    <div class="widget-stat-number" id="divStatsAllText"></div>
		                </div>
		            </div>
		            <!-- end widget -->
		        </div>
		        <!-- begin col-3 -->
		        <div class="col-md-3 col-xs-3">
		            <!-- begin widget -->
		            <div class="widget widget-stat bg-green widget-stat-right text-white" onclick="HideOrShow('Draft');">
		                <div class="widget-stat-icon" ><span class="glyphicon glyphicon-file"></span></div>
		                <div class="widget-stat-info  hidden-xs">
		                    <div class="widget-stat-title" >Draft Requests 
								(Open)</div>
		                    <div class="widget-stat-number" id="divStatsRequestsText"></div>
		                </div>
		            </div>
		            <!-- end widget -->
		        </div>
		        <!-- end col-3 -->
		        <!-- begin col-3 -->
		        <div class="col-md-3 col-xs-3">
		            <!-- begin widget -->
		            <div class="widget widget-stat widget-stat-right text-white bg-blue" onclick="HideOrShow('Transactions');">
		                <div class="widget-stat-icon" ><span class="glyphicon glyphicon-road"></span></div>
		                <div class="widget-stat-info  hidden-xs">
		                    <div class="widget-stat-title" >Transactions (Open)</div>
		            		<div class="widget-stat-number" id="divStatsTransferRequestsText"></div>
		
		                </div>
		            </div>
		            <!-- end widget -->
		        </div>
			    <!-- end col-3 -->
		        <!-- begin col-3 -->
		        <div class="col-md-3 col-xs-3">
		            <!-- begin widget -->
		            <div class="widget widget-stat widget-stat-right text-white bg-info" onclick="HideOrShow('Approvals');">
		                <div class="widget-stat-icon" ><span class="glyphicon glyphicon-list-alt"></span></div>
		                <div class="widget-stat-info  hidden-xs">
		                    <div class="widget-stat-title" >Approval Requests</div>
		                    <div class="widget-stat-number" id="divStatsRequestApprovalsText"></div>
		                </div>
		            </div>
		            <!-- end widget -->
		        </div>
		        <!-- end col-3 -->
        	</div> <!-- end of row -->
        </div> <!-- end of col 10 -->
        <div class="col-md-1"></div>
</div>

<!-- Data Tables  -->
		
<p/>
    <!-- My Requests -->
	<div class="row tbls" id="tblDraft">
	
				<!-- begin panel -->
			<div class="col-md-1"></div>
			<div class="col-md-10">            
				<div class="panel panel-primary">
					<div class="panel-heading" >
						<div class="panel-heading-btn">
						</div>
						<h4 class="panel-title" style="float:none">My Transfer 
						Requests</h4>
					</div>
					<div class="table-responsive" id="divDataRequests">
					<table class='table table-striped table-td-valign-middle table-bordered dt-responsive nowrap' cellspacing="0" width="100%" id='dtTransferDrafts' >
						<thead>
							<tr class='primary'>
							<th width="200px">ID</th>
							<th width="200px">Title</th>
							<th width="200px">Budget Type</th>
							<th width="200px">Transfer Amount</th>
							<th width="200px">Modified</th>
							<th width="200px">Modified By</th></tr>
							
						</thead>
						<tbody></tbody>
					</table>
					</div>
				</div>
			</div>
			<div class="col-md-1"></div>
	</div>
	
		<!-- Transfer Transactions -->
	<div class="row tbls" id="tblTransactions">
				<!-- begin panel -->

			<div class="col-md-1"></div>
			<div class="col-md-10">            
				<div class="panel panel-primary">
					<div class="panel-heading">
						<div class="panel-heading-btn">
							<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-grey" data-click="panel-expand"><i class="fa fa-expand"></i></a>
							<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-grey" data-click="panel-reload"><i class="fa fa-repeat"></i></a>
							<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-grey" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
							<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-grey" data-click="panel-remove"><i class="fa fa-times"></i></a>
						</div>
						<h4 class="panel-title">Transaction Approvals</h4>
					</div>

					<div class="table-responsive" id="divData">
					
					
					<table class='table table-striped table-td-valign-middle table-bordered dt-responsive nowrap' cellspacing="0" width="100%" id='dtTransactions' >
						<thead>
							<tr class='primary'>
								<th>ID</th><th>Modified</th>
								<th>Type</th><th>Index</th>
								<th>Account</th><th>Amount</th><th>Stage</th>
								<th>Approver</th><th>Approval</th>
							</tr>
						</thead>
					</table>
					</div>
				</div>
			</div>
			<div class="col-md-1"></div>

	</div>
	
	    <!-- My Approvals -->
	<div class="row tbls" id="tblApprovals">
				<!-- begin panel -->
			<div class="col-md-1"></div>
			<div class="col-md-10">            
				<div class="panel panel-primary">
					<div class="panel-heading">
						<div class="panel-heading-btn">
							<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-grey" data-click="panel-reload"><i class="fa fa-repeat"></i></a>
						</div>
						<h4 class="panel-title">My Approvals Requests</h4>
					</div>

					<div class="table-responsive" id="divDataRequests3">
					
					<!-- <table id='dataTableApprovals' class='table table-striped table-bordered dt-responsive nowrap table-td-valign-middle' cellspacing="0"  width="100%" > -->
					 <table id='dtTransferApprovals' class="table table-striped table-bordered table-td-valign-middle  table-bordered dt-responsive nowrap" cellspacing="0" width="100%" cellspacing="0"  width="100%" >
						<thead>
							<tr class='primary'>
							<th style="width:50px">ID</th>
							<th>Title</th>
							<th>Stage</th>
							<th>Budget Type</th>
							<th>JV Doc ID</th>
							<th>JV Sttaus</th>
							<th>Transfer Amount</th>
							<th>Modified</th>
							<th>Modified By</th></tr>
						</thead>
						<tbody></tbody>
					</table>
					</div>
				</div>
			</div>
			<div class="col-md-1"></div>
	</div>

</div>

<script type="text/javascript">
	function LaunchEditPage() 	{
	}
	
	function HideOrShow(title)
	{
		$('.tbls').hide();
		$('#tbl'+title).show();
	}
	function ShowAll() {
		$('.tbls').show();
	}

	function UpdateTransferPriority(thisRef, btrId, eTag, currentValue)
	{
	//debugger;
		var priorityFlag = !(currentValue == true); //this will handle nulls
		
		eTag = "*"; //quick fix for now
		var jsonData = BTR.BudgetTransfer.DataItem.Create();
		jsonData['priority_flag'] = priorityFlag ;	
		
		BTR.BudgetTransfer.Update(btrId,jsonData,eTag,
			function(data) {
				//GetTransactions();
				//toggle images instead of doing a data refresh
				priorityIcon = (priorityFlag) ? "star_selected.png" : "star_unselected.png";
				thisRef.childNodes[0].src = "../SiteAssets/BTR/images/"+priorityIcon;
			},
			function(errData) {
				console.log(errData);
				alert("Error: Updating Transaction "+listItemId);
			}
		);

	}
	
	function UpdateTransferActivityApprovalStatus(transfer_activity_key,action)
	{
		eTag = "*"; //quick fix for now
		var vActionValue = (action==1) ? "Approved":"Rejected";
		var jsonData = BTR.TransactionActivity.DataItem.Create();
		jsonData['ApprovalStatus'] = vActionValue;	
		
		BTR.TransactionActivity.Update(transfer_activity_key,jsonData,
			function(data) {
				//GetTransactions();
			},
			function(errData) {
				console.log(errData);
				alert("Error: Updating Transfer Activity ( "+transfer_activity_key +")");
			}
		);
	}
	
	function CountAll()
	{
		var val1 = Number($('#divStatsTransferRequestsText').text());
		var val2 = Number($('#divStatsRequestsText').text());
		var val3 = Number($('#divStatsRequestApprovalsText').text());		
		
		$('#divStatsAllText').text(val1 + val2 + val3);
	}

	function PopulateTableTransferActivities(data) {

		var count = data.length;
		$('#divStatsTransferRequestsText').text(count);
		
		_gTableTransferActivities.clear();
		$.each(data, function() {
			if ((this.approval_status_code== 'A') || (this.approval_status_code == 'R'))
			{
				btnUpdateStatus = '';
			}
			else
			{
				btnUpdateStatus = "<span><a href='#' class='ButtonApprove' onclick='UpdateTransferActivityApprovalStatus("+this.ID+",1); return false;'>Approve</a> <a href='#' class='ButtonReject' onclick='UpdateTransferActivityApprovalStatus("+this.ID+",0); return false;'>Reject</a></span>";
			}
			_gTableTransferActivities.row.add([
				this.btr_key+'-'+this.transfer_activity_key,
				BTRUtils.DateFormat(this.modified),
				this.position_type ,						
				this.index_number_description,
				this.account_number_description,
				'$'+this.amount,
				this.approval_status_key,
				this.approver_email,
				btnUpdateStatus
			] ).draw( false );					
		});
	}
	
	function GetTransferActivities()
	{
		BTR.TransferActivity.ReviewerOwned(BTR.User.uni_key, 
			function (data) {
				PopulateTableTransferActivities(data);
			},
			function (data) {
				console.log("Error(Getting Transfer Activities): "+ data.Message + '\n'+data.InnerError );
				alert("Error(Getting Transfer Activities): "+ data.Message + '\n'+data.InnerError );
			}
		);
	}
	
	function PopulateTableBudgetTransferRequests(data) {
		var countTotal = data.length;
		var countRequest = 0;
		var siteUrl = _spPageContextInfo.webAbsoluteUrl;
		
		var editUrl = siteUrl + '/Pages/BTREdit_wizard.aspx?';
		var editUrl2 = siteUrl + '/Pages/RequestApproval.aspx?';	
		var sourceUrl = "&Source=" +encodeURIComponent(siteUrl + '/Pages/BTR.aspx'); //TODO: fix this
		
		var prorityIcon;
		var transferType;
		var pageUrl;
		
		$.each(data, function() {
		
			prorityIcon = ((this.priority_flag != null) && (this.priority_flag)) ? "star_selected.png" : "star_unselected.png";
			pageUrl = "rID=" + this.btr_key + "&transfertype=" + this.transfer_type.toLowerCase() + sourceUrl;

			if (this.life_cycle.valueOf().toLowerCase() == "draft")
			{
				countRequest++;
				_gTableBTR_Drafts.row.add( [
				"<a href='"+editUrl + pageUrl+"'><img src='../SiteAssets/BTR/images/Black_Pencil_Icon.png'/></a>&nbsp;" + 
				"<a href='#' onclick='UpdateTransferPriority(this,"+this.btr_key+",*,"+this.priority_flag +"); return false;'><img src='../SiteAssets/BTR/images/"+prorityIcon+"'/></a>&nbsp;" +
				this.btr_key,
				this.title,
				this.budget_type,
				'$'+this.total_amount,
				BTRUtils.DateFormat(this.modified),
				this.modified_by_name
				] ).draw( false );	
			}
			else {	
				_gTableBTR_Approvals.row.add( [
				"<a href='"+editUrl2 + pageUrl + "'><img src='../SiteAssets/BTR/images/Black_Pencil_Icon.png'/></a>&nbsp;" +	
				"<a href='#' onclick='UpdateTransferPriority(this,"+this.btr_key+",*,"+this.priority_flag+"); return false;'><img src='../SiteAssets/BTR/images/"+prorityIcon+"'/></a>&nbsp;" +
				this.btr_key,
				this.title,
				this.life_cycle + "<span class='halflings halflings-adjust'></span> ",
				this.budget_type,
				this.jv_doc_id,
				this.jv_status_code,
				'$'+this.total_amount,
				BTRUtils.DateFormat(this.modified),
				this.modified_by_name
				] ).draw( false );	
			}
		});
		$('#divStatsRequestsText').text(countRequest);
		$('#divStatsRequestApprovalsText').text(countTotal-countRequest);					
	}
	
	function GetBudgetTransferRequests()
	{
		BTR.BudgetTransfer.ItemTableRecord(_spPageContextInfo.userId, 
			function (data) {
				PopulateTableBudgetTransferRequests(data);
				CountAll();
			}, 
			function (data) {
				console.log("Error(Getting Transfer Requests): "+ data.Message + '\n'+data.InnerError );
				alert("Error(Getting Transfer Requests): "+ data.Message + '\n'+data.InnerError );
			}
		);
	}

	var _gLoginName = _spPageContextInfo.userLoginName;
	var _gUni = BTRUtils.GetUniValue(_gLoginName);
	var _gTableBTR_Drafts = null;
	var _gTableBTR_Approvals = null;
	var _gTableTransferActivities = null;
	
	$(document).ready(function() {
		BTR.BudgetTransfer.SiteUrl(GlobalConfig.BTR.Rest_Api_Url);
		BTR.TransferActivity.SiteUrl(GlobalConfig.BTR.Rest_Api_Url);

		$("#userField").html(_gLoginName);
		_gTableBTR_Drafts = $('#dtTransferDrafts').DataTable();
		_gTableBTR_Approvals = $('#dtTransferApprovals').DataTable();
		_gTableTransferActivities = $('#dtTransactions').DataTable();

		BTR.User.SiteUrl(_spPageContextInfo.webAbsoluteUrl);
		BTR.User.Initialize(_gUni, 
			function() {
				GetBudgetTransferRequests(); 
				GetTransferActivities();
			},
			function() {
				alert('Error loading form');
			}
		);
	});
</script>
</asp:Content>