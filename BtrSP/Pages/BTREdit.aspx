<%@ Reference VirtualPath="~masterurl/custom.master" %>
<%@ Page language="C#"   Inherits="Microsoft.SharePoint.Publishing.PublishingLayoutPage,Microsoft.SharePoint.Publishing,Version=16.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" meta:progid="SharePoint.WebPartPage.Document" %>
<asp:Content ContentPlaceholderID="PlaceHolderAdditionalPageHead" runat="server">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<!-- ================== BEGIN BASE CSS STYLE ================== -->

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
<link rel="stylesheet" href="../SiteAssets/BTR/css/loader.css" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/6.0.0/normalize.min.css">
<link rel="stylesheet" href="../SiteAssets/BTR/css/main.css"/>
<link rel="stylesheet" href="../SiteAssets/BTR/css/page_btredit.css" type="text/css"/>
<style type="text/css">
    #contentBox  {margin-left: 20px !important;}
    #SearchBox {display:none;}
    #suiteBarTop {display:none !important;}
    #s4-ribbonrow{display:none !important;}
</style>
	
<!-- ================== BEGIN BASE JS ================== -->
<script src="https://code.jquery.com/jquery-2.1.4.min.js" type="text/javascript"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" type="text/javascript"></script>
<script src="../SiteAssets/BTR/js/Utils.js" type="text/javascript"></script>
<script src="../SiteAssets/BTR/js/EnvConfig.js" type="text/javascript"></script>
<!-- ================== END BASE JS ================== -->
	
</asp:Content>
<asp:Content ContentPlaceholderID="PlaceHolderPageTitle" runat="server">BTR Edit</asp:Content>
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
      <li><a href="https://teacherscollegecolumbia.sharepoint.com/tccu/btadev/Pages/BTR.aspx"><span class="glyphicon glyphicon-home">
    </span></a></li>
      <li class="btn-group">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Transfer 
		Requests<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#" style="color:blue">Within My Department</a></li>
          <li><a href="#" style="color:blue">Outside My Department</a></li>
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
	<!-- Popup-Status Begin -->
  <!-- Modal -->
  <div class="modal fade" id="modalStatus" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" style="text-align:right">
			×</button>
          <h4 class="modal-title" id="modalStatustitle"></h4>
        </div>
        <div class="modal-body" style="text-align:center;height:200px" >
        	<div style="text-align:center;position:relative;width:50%;padding-left:70px" >
	        	<div style="position:absolute;display:none" id="loadingMessagePassed"><img src="../SiteAssets/BTR/images/checkmark100.png" alt=""/></div>
	        	<div style="position:absolute;display:none" id="loadingMessageFailed"><img src="../SiteAssets/BTR/images/redx100-1.png" alt=""/></div>
	        	<div style="position:absolute;display:none" id="loadingMessageText"></div>
	        	<div style="position:absolute;display:none" id="loadingMessageError"></div>
	       		<div style="position:absolute;"><div class="cssload-aim" id="loadingIcon"></div></div>
       		</div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="reloadForm();">
			Close</button>
        </div>
      </div>
    </div>
  </div> 	
	
	<!-- Popup-Status End -->


	<div class="row" >
        <div class="col-md-1"></div>
        <div class="col-md-10" style="background-color: rgb(229, 233, 236)">
			<head>
</head>
<form style="padding-bottom:50px" name="frmBTR" method="get" action="">
		<div class="col-lg-12">
			<div class="form-inline">
				<label for="budgettitle">Title:<span class="requiredFieldAsterisk">*</span></label>
			    <input type="text" id="txtBTR_title" rel-field="BTR.title" style="width:350px">
				
				<label for="bugetType">Type:<span class="requiredFieldAsterisk">*</span></label>
				<select class="form-control" id="budgetType" width="30%" rel-field="BTR.budgetType" required name="Budget Type">
				<option selected="true">Select a budget type</option>
			      <option>Permanent</option>
			      <option>Temporary</option>
			    </select>
			    <label style="padding-left:20px">Request By:</label>
			    <input type="text" id="txtBTR_Requestor" rel-field="BTR.Requester" disabled="true">
				<input type="hidden" id="txtBTR_Guid">
				<input type="hidden" id="txtBTR_Id">
				<input type="hidden" id="txtBTR_ApprovedDate">
				<input type="hidden" id="txtBTR_life_cycle">
				<input type="hidden" id="txtBTR_internal_state">
				<input type="hidden" id="txtBTR_transfer_type">
			</div>
		</div>
			
				<!-- Hidden Element -->
				<div datatype="repeatingTemplate" id="fromTA_FXXXXX" style="display:none">
				
					<div id="fromTASection_FXXXXX" style="border:thin black solid;padding:5px;">
						
						<div class="form-inline" style="position:relative;float:right;vertical-align:top">
							<img src="../SiteAssets/BTR/images/icon-user.png" alt="" class="popupPositions_open" onclick="ShowPositions('fromTA_FXXXXX');" style="cursor:pointer;visibility:hidden">
							<img src="../SiteAssets/BTR/images/delete_2.png" style="padding-left:5px" onclick="DeleteTransferActivity('from','_FXXXXX');" >
						</div>
						<div class="form-inline" style="padding-bottom:5px" >
							<!-- Hidden Columns -->
							<input type="hidden" id="fromTAItemIndex_FXXXXX">
							<input type="hidden" id="fromTAListItemId_FXXXXX">
							<input type="hidden" id="fromTAItemAction_FXXXXX" value="create">
							<!-- Hidden Columns -->
							<label for="fromTAIndex_FXXXXX">Index:<span class="requiredFieldAsterisk">*</span></label>
								<select id="fromTAIndex_FXXXXX" rel="from.select.index" style="max-width:200px" _isrequired name="From Index">
								<option value="" selected>Select an Index</option></select>
							<label for="fromTAAccount_FXXXXX">Account:<span class="requiredFieldAsterisk">*</span></label>
							<select id="fromTAAccount_FXXXXX" rel="from.select.account" style="max-width:200px" _isrequired name="From Account">
								<option value="" selected>Select an Account</option>
							</select>
							
						</div>
						<div class="form-inline" style="padding-bottom:5px">
							<div style="display:inline-block;"><label>Balance $</label>
								<span id="fromTABalance_FXXXXX" rel="from.select.balance" style="padding-left:5px" >
								0</span>
							</div>
							<div style="display:inline-block;float:right">
								<label>Amount to Transfer ($):<span class="requiredFieldAsterisk">*</span></label>
						      <input type="text" class="form-control" id="fromTAAmountToTransfer_FXXXXX" rel="from.select.amounttotransfer" placeholder="Amount" required name="Amount To Transfer"/>
							</div>
						</div>
					</div>
				</div>
				<div datatype="repeatingTemplate" id="toTA_FXXXXX" style="display:none">
					<div id="toTASection_FXXXXX" style="border:thin black solid;padding:5px;">
						<div class="form-inline" style="position:relative;float:right;vertical-align:top">
							<img src="../SiteAssets/BTR/images/icon-user.png" onclick="ShowPositions('toTA_FXXXXX');" style="visibility:hidden">
							<img src="../SiteAssets/BTR/images/delete_2.png" style="padding-left:5px" onclick="DeleteTransferActivity('TO','_FXXXXX');"></div>
						<!-- Hidden Columns -->
						<input type="hidden" id="toTAItemIndex_FXXXXX">
						<input type="hidden" id="toTAListItemId_FXXXXX" >						
						<input type="hidden" id="toTAItemAction_FXXXXX" value="create">
						<!-- Hidden Columns -->
							
					
						<label for="toTAIndex_FXXXXX">Index:<span class="requiredFieldAsterisk">*</span></label> 
						<select id="toTAIndex_FXXXXX" rel="to.select.index" style="width:200px;max-width:390px"  _isrequired name="To Index"><option value="" selected>
						Select Index</option></select>
						&nbsp;&nbsp;<label for="toTAAccount_FXXXXX">Account:<span class="requiredFieldAsterisk">*</span></label> 
						<select  id="toTAAccount_FXXXXX" rel="to.select.account" style="width:200px;max-width:390px" _isrequired name="To Account"><option selected value="">
						Select Account</option></select>
						&nbsp;&nbsp;<div class="form-inline" style="padding-top:5px">
							<label>Amount to Receive ($):<span class="requiredFieldAsterisk">*</span></label>
					      <input type="text" class="form-control" id="toTAAmountToTransfer_FXXXXX" rel="to.select.amounttorecieve" placeholder="Amount" _isrequired name="Amount To Receive"/>
						</div>
					</div>
				</div>
				<!-- Hidden Element -->

				<div class="row" style="border-bottom:medium black solid;padding-bottom:10px" id="repeatingForm">
					<div class="row" style="margin-left:15px">
				
						<div class="col-md-6" style="">
							<b>FROM</b>
							<div id="fromColumn">
								<div>
									<div datalabel="header" style="display:block;"></div>
									<div class="row">
										<div class="col-md-11" datalabel="body" style="display:block;"></div>
									</div>
									<div datalabel="footer" ><div><a datalabel="dlAddNewRow" href='#'>
										Add new row</a></div></div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<b>TO</b>
							<div id="toColumn">
								<div>
									<div datalabel="header" sttotyle="display:block;"></div>
									<div class="row">
										<div class="col-md-11" datalabel="body" style="display:block"></div>
									</div>
									<div datalabel="footer" ><div><a datalabel="dlAddNewRow" href='#'>
										Add new row</a></div></div>
								</div>
							</div>
						</div>			
					</div>
					<div class="row" style="padding-top:20px">
						<div class="col-md-12">
							<div style="margin-left:30px;display:inline;"><label>
								Explanation</label></div>
							<div style="display:inline;">
								<textarea name="txtArea" rows="2" cols="20" id="txtexplanation" style="height:100%;width:80%;"></textarea>								
							</div>
							
						</div>
					</div>
				</div>
				<div class="row" style="padding-top:25px;padding-bottom:25px">
						<div class="col-md-1" style=""><label>Total</label></div>
						<div class="col-md-5" id="totalFromValue" style="border:thin black solid">
							$0.00</div>
						<div class="col-md-5" id="totalToValue" style="border:thin black solid">
							$0.00</div>
						<div class="col-md-1" ></div>

				</div>
<!-- Attachments -->
				<div class="row" style="padding-top:25px;padding-bottom:25px">
						<div class="col-md-1" style=""><label>Attachments</label></div>
						<div class="col-md-10" style="">
							<label for="file-upload" class="custom-file-upload">
							    <i class="fa fa-cloud-upload"></i> Add 
							Attachment (+)
							</label>
							<input id="file-upload" type="file"/>
						</div>
						<div class="col-md-1" style="">	</div>
				</div>

				<div class="row" style="padding-top:25px;padding-bottom:35px">
						<div class="col-md-1" style=""></div>
						<div class="col-md-10">
							<div id="divErrorPane" style="visibility:hidden;border:thin teal solid">
								<div style="background-color:teal;color:white"><span style="font-weight:bold">
									Form Error(s):</span></div>
								<div id="divErrorBody"></div>
							</div>
						</div>
						<div class="col-md-1" style="">	</div>
				</div>

<!-- buttons -->
				<div class="row">
						<div class="col-md-1" style="padding-bottom:25px"></div>
						<div class="col-md-10" style="">
							<div style="text-align:center">
							    <button id="btnSave" class="buttons" onClick="SaveForm('draft'); return false;">
								Save Draft</button>
							    <button id="btnSubmit" class="buttons" onClick="SaveForm('submit'); return false;">
								Submit</button>
							    <button class="buttons" onClick="CancelForm(true); return false;">
								Close</button>
							    <button class="buttons" onClick="CancelForm(false); return false;">
								Cancel</button>
							</div>
						<div class="col-md-1" style="">	</div>
					</div>
				</div>
<!-- buttons -->
				<div class="row" style="padding-top:25px">
						<div class="col-md-1" style=""></div>
						<div class="col-md-10" style="">
							<div style="text-align:center;font-weight:bolder;">
								<span style="border-bottom:medium maroon solid">
								For Budget Office Use Only</span>
							</div>
						<div class="col-md-1" style="">	</div>
					</div>
				</div>
				<div class="row" style="padding-top:15px">
						<div class="col-md-12" style="">
							<table style="width:100%;border-collapse:separate;border-spacing:10px 5px" >
								<tr>
									<th style=";color:#548dd4;border-bottom:medium black solid;text-align:center">
									Approval History</th>
									<th style="width:55%">explanation</th>
									<th>Rule Class</th>
									<th>Budget JV#</th>
								</tr>
								<tr>
									<td></td>
									<td><textarea name="txtAreaBO" rows="2" cols="20" id="txtAreaBO" style="height:100%;width:100%;"></textarea></td>
									<td><input type="text"></td>
									<td><input type="text"></td>
								</tr>
							</table>
							<div style="">
								
							</div>
					</div>
				</div>

				<!--
<input id="getFile" type="file"/><br />
<input id="displayName" type="text" value="Enter a unique name" /><br />
<input id="addFileButton" type="button" value="Upload" onclick="uploadFile()"/>
-->
		</form>
		</div>
        <div class="col-md-1"></div>
	</div>
</div> <!-- Ending DIV -->


<script src="../SiteAssets/BTR/js/Page.BtrEdit.js" type="text/javascript"></script>
<script src="../SiteAssets/BTR/js/SP.User.js" type="text/javascript"></script>
<script src="../SiteAssets/BTR/js/LookupValues.js" type="text/javascript"></script>
<script src="../SiteAssets/BTR/js/BudgetTransfer.js?reload=3" type="text/javascript"></script>
<script src="../SiteAssets/BTR/js/TransferActivity.js?reload=2" type="text/javascript"></script>
<script src="../SiteAssets/BTR/js/Index.js" type="text/javascript"></script>
<script src="../SiteAssets/BTR/js/Account.js" type="text/javascript"></script>   
<script src="../SiteAssets/BTR/js/waitdialog.js" type="text/javascript"></script>   
<script src="../SiteAssets/BTR/js/Banner.JV.js" type="text/javascript"></script>   
</asp:Content>