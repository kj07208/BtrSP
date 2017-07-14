<%@ Reference VirtualPath="~masterurl/custom.master" %>
<%@ Page language="C#"   Inherits="Microsoft.SharePoint.Publishing.PublishingLayoutPage,Microsoft.SharePoint.Publishing,Version=16.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" meta:progid="SharePoint.WebPartPage.Document" %>
<asp:Content ContentPlaceholderID="PlaceHolderAdditionalPageHead" runat="server">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<!-- ================== BEGIN BASE CSS STYLE ================== -->

<!-- Optional theme -->
<link rel="stylesheet" href="../SiteAssets/BTR/css/loader.css" type="text/css" />
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
.requiredFieldAsterisk {
	color:red;
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

</style>
	
<!-- ================== BEGIN BASE JS ================== -->
<script src="https://code.jquery.com/jquery-2.1.4.min.js" type="text/javascript"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" type="text/javascript"></script>
<script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js" type="text/javascript"></script>   
<script src="../SiteAssets/BTR/js/Utils.js" type="text/javascript"></script>


<!-- ================== END BASE JS ================== -->
	
</asp:Content>
<asp:Content ContentPlaceholderID="PlaceHolderPageTitle" runat="server">BTR 
	Approval Request Form</asp:Content>
<asp:Content ContentPlaceholderID="PlaceHolderMain" runat="server">
<div> <!-- Begining DIV -->


<!-- Page header  -->
<div id="header" class="header navbar navbar-default" style="border:thin;margin-bottom:0px">
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
	    	<div class="col-sm-12 col-lg-4 col-md-4"><a ui-sref="#" class="navbar-brand" href="#"><span id="userField"></span></a></div>
	    </div> <!-- end of row -->
	</div> <!-- end container-fluid --> 
</div>   	

<!-- Menu bar -->
<div class="container-fluid" style="padding-left:0;padding-right:0">
    <!-- Second navbar for profile settings -->
    
      <div class="row" >
      	<div class="col-lg-12">
      	<nav class="navbar navbar-default">
      		<ul class="nav navbar-nav navbar-left navbar-default">
            <!-- Menu Item -->
            <li><a href="../">Home</a></li>
            <!-- Menu Item -->
            <li><a href="#">Archive</a></li>
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
				<label>Budget #/Title:&nbsp;</label><span id="txtBTR_Id"></span>-<span id="txtBTR_Title"></span>
			</div>
			<div>
				<label>Budget Type:&nbsp;</label><span id="budgetType"></span>
			    <label style="padding-left:10px">Request By:</label><span id="txtBTR_Requestor" />
			    
				<input type="hidden" id="txtBTR_Guid">
				<span id="txtBTR_ApprovedDate"/>
				<input type="hidden" id="txtBTR_LifeCycle">
				<input type="hidden" id="txtBTR_InternalState">
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
	<div class="row" style="padding-top:25px;padding-bottom:25px">
			<div class="col-md-1" style=""><label>Attachments</label></div>
			<div class="col-md-10" style="">
				<label for="file-upload" class="custom-file-upload">
				    <i class="fa fa-cloud-upload"></i> Add Attachment (+)
				</label>
				<input id="file-upload" type="file" multiple="true" onchange="fileUploadControlChange(this);"/><p/>
				<div id="fileList">
				</div>
			</div>
			<div class="col-md-1" style="">	</div>
	</div>
    
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
								<tr class='primary'><th>ID</th><th>ID</th><th style="width:10%">
									Position</th><th>Index</th><th>Acount</th><th>
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
				<input type="submit" id="btnApproveTransfer" value="Approve Transfer" onclick="PostData(); return false;"/> 
				&nbsp;
				<input type="button" value="Close" onclick="CloseScreen(); return false;"/> 
				&nbsp;
				<!-- <input type="button" value="Post Data(Test)" onclick="PostData();"/> &nbsp; -->
			</div>
			<div class="col-md-1"></div>
	</div>

</div> <!-- Ending DIV -->

<script type="text/javascript">

	jQuery(document).ready(function () {
	   if (!window.FileReader) {
	        alert('This browser does not support the FileReader API.');
	    }
	});


	function fileUploadControlChange(x) {
	    debugger;
	    var txt = "";
	    if ('files' in x) {
	        if (x.files.length == 0) {
	            txt = "Select one or more files.";
	        } else {
	            for (var i = 0; i < x.files.length; i++) {
	                txt += "<br><strong>" + (i+1) + ". file</strong><br>";
	                var file = x.files[i];
	                if ('name' in file) {
	                    txt += "name: " + file.name + "<br>";
	                }
	                if ('size' in file) {
	                    txt += "size: " + file.size + " bytes <br>";
	                }
	                uploadFile(file);
	            }
	        }
	    } 
	    else {
	        if (x.value == "") {
	            txt += "Select one or more files.";
	        } else {
	            txt += "The files property is not supported by your browser!";
	            txt  += "<br>The path of the selected file: " + x.value; // If the browser does not support the files property, it will return the path of the selected file instead. 
	        }
	    }
	    document.getElementById("fileList").innerHTML = txt;		
	}
	//------------------------- Upload Function
	function uploadFile(file) {

	    // Define the folder path for this example.
	    var serverRelativeUrlToFolder = '/shared documents';

	    // Get test values from the file input and text input page controls.
	    // The display name must be unique every time you run the example.
	    var fileInput = jQuery('#getFile');
	    var newName = jQuery('#displayName').val();

	    // Initiate method calls using jQuery promises.
	    // Get the local file as an array buffer.
	    var getFile = getFileBuffer(file);
	    getFile.done(function (arrayBuffer) {

	        // Add the file to the SharePoint folder.
	        var addFile = addFileToFolder(arrayBuffer, file.name);
	        addFile.done(function (file, status, xhr) {
	
	            // Get the list item that corresponds to the uploaded file.
	            /*var getItem = getListItem(file.d.ListItemAllFields.__deferred.uri);
	            getItem.done(function (listItem, status, xhr) {
	                    alert('file uploaded and updated');
	            });
	            getItem.fail(onError);
	            */
	        });
	        addFile.fail(function(error) {
	        	debugger;
	        	var therewasanerror = error;
	        });
	    });
	    getFile.fail(onError);

	    // Get the local file as an array buffer.
	    function getFileBuffer(inputFile) {
	        var deferred = jQuery.Deferred();
	        var reader = new FileReader();
	        reader.onloadend = function (e) {
	            deferred.resolve(e.target.result);
	        }
	        reader.onerror = function (e) {
	            deferred.reject(e.target.error);
	        }
	        reader.readAsArrayBuffer(inputFile);
	        return deferred.promise();
	    }

	    // Add the file to the file collection in the Shared Documents folder.
	    function addFileToFolder(arrayBuffer,fullFileName) {
	
	        // Get the file name from the file input control on the page.
	       // var parts = fileInput[0].value.split('\\');
	       // var fileName = parts[parts.length - 1];
	       var fileName = fullFileName;
	
			var appWebUrl= 'https://teacherscollegecolumbia.sharepoint.com/tccu/btadev';
			var serverRelativeUrlToFolder = '/shared documents';
	
	        // Construct the endpoint.
	        var fileCollectionEndpoint = String.format("{0}/_api/web/getfolderbyserverrelativeurl('{1}')/files/add(overwrite=true, url='{2}')",
	            appWebUrl, serverRelativeUrlToFolder, fileName);
	
	        // Send the request and return the response.
	        // This call returns the SharePoint file.
	        return jQuery.ajax({
	            url: fileCollectionEndpoint,
	            type: "POST",
	            data: arrayBuffer,
	            processData: false,
	            headers: {
	                "accept": "application/json;odata=verbose",
	                "X-RequestDigest": jQuery("#__REQUESTDIGEST").val(),
	                "content-length": arrayBuffer.byteLength
	            }
	        });
	    }
	}


	function PostBTRUpdate()
	{
		var eTag = "*"; //quick fix for now
		var vActionValue = "Review";
		var jsonData = BTR.BudgetTransfer.DataItem.Create();	
		
		jsonData['LifeCycle'] = vActionValue;	

		console.log('JSon data:'+JSON.stringify(jsonData));
		BTR.BudgetTransfer.Update(_gForm_ID,jsonData,eTag,
			function(data){
				alert('Approval Complete');
				if (oItem.LifeCycle.toLowerCase() == "approval")
				{
					$("#btnApproveTransfer").attr("disabled", false);
				} 
				else
				{
					$("#btnApproveTransfer").removeAttr("disabled");
				}
			},
			function(error) {
				alert("Error: Updating BTR LifeCycle Status");
			}
		);
	}

	function PostTransferActivities()
	{
		var siteUrl = _spPageContextInfo.webAbsoluteUrl;
		var dataTypeName = "SP.Data.TransferActivitiesListItem";
		
		for(iCount=0; iCount < _gJsonTransferItems.length; iCount++)
		{
			var jsonData = {'__metadata': {}};		
			jsonData.__metadata['type'] = dataTypeName;
			jsonData['Title'] = 'TA';	

			//Read the timestamp for concurrent situations
			console.log('JSon data:'+JSON.stringify(jsonData));
			$.ajax({
					url: siteUrl + "/_api/web/lists/getbytitle('TransferActivities')/items",
					method: "POST",
					headers: {
								"Accept": "application/json;odata=verbose",
								"content-type": "application/json;odata=verbose",
								"X-RequestDigest": $("#__REQUESTDIGEST").val()
							},
					data:  JSON.stringify(jsonData),
					success: function (data) {
						//alert('Completed processing transfer activities');
					//	DisplayMessage('Processing Transfer Activities '+(iCount+1)+' of '+_gJsonTransferItems.length+"<p/>"+'Successfully added activity.');
						//return;
						//debugger;
					  },
					  error: function (data) {
						  debugger;
						  alert("Error: Could not process the request.");
						  console.error(data);
						  //debugger;
					 }
			});
		}
	}
	
	function PostData()
	{
	//debugger;
		PostBTRUpdate();
		//PostTransferActivities();
		//ReturnPage();
	}

	function SetBTRForm(oItem)
	{
		$('#txtBTR_Title').html(oItem.Title);
		$('#txtBTR_Id').html(oItem.Id);
		$('#txtBTR_ApprovedDate').html(oItem.Approved_x0020_Date);
		$('#txtBTR_ApprovalStatus').html(oItem.Approval_x0020_Status);
		$("#lblRequester").html(oItem.Requester);
		$("#txtBTR_Requestor").html(oItem.Requester);
		$('#budgetType').html(oItem.BudgetType);		
		$("#divStatus"+ oItem.LifeCycle).css('background-color','red').css('color','white');
		
		

		if (oItem.LifeCycle.toLowerCase() == "approval")
		{
			$("#btnApproveTransfer").attr("disabled", false);
		} 
		else
		{
			$("#btnApproveTransfer").removeAttr("disabled");
		}
	}	
	
	function SortCompareTransactions(a,b) {
		
	}
	
	function PopulateTransactionTable(transactions,tableObj) {
		if (transactions.length == 0) return;
		for (iCount=0; iCount < transactions.length; iCount ++) {
			
			oItem = transactions[iCount];
			if (oItem.TransferPosition.toLowerCase() == "from")
			{
				//debugger;
				tableObj.row.add([
									oItem.TransferPosition,
									oItem.Id, //Item Guid
									oItem.TransferPosition,
									oItem.IndexFullName,
									oItem.AccountFullName,
									'$'+oItem.Amount
								] ).draw( true );
			}

		}
		for (iCount=0; iCount < transactions.length; iCount ++) {
			
			oItem = transactions[iCount];
			if (oItem.TransferPosition.toLowerCase() == "to")
			{
				//debugger;
				tableObj.row.add([
									oItem.TransferPosition,
									oItem.Id, //Item Guid
									oItem.TransferPosition,
									oItem.IndexFullName,
									oItem.AccountFullName,
									'$'+oItem.Amount
								] ).draw( false );
			}

		}
	}
	
	
	function GetTransferActivitiesItems(btrID,tableObj)
	{
		BTR.BudgetTransfer.Item(btrID,
			function(dataArray) {
				var totalCount = dataArray.length;
				if (dataArray.length == 0) return;
				SetBTRForm(dataArray[0]);
					
				BTR.TransactionActivity.GetBTRAssociatedTransactions(_gForm_ID, 
					function(transactions) {
						PopulateTransactionTable(transactions,tableObj);
					},
					function(error) {
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
	var _gConst_Form_ModeNew= 1;
	var _gConst_Form_ModeEdit = 2;	
	var _gConstForm_TransferType_IntraDept = 1;
	var _gConstForm_TransferType_InterDept = 2;

	var _gUser_LoginName = _spPageContextInfo.userLoginName;
	var _gUser_CurrentUserId = _gUser_LoginName.match(/^(.+)@/)[1];
	
	var _gForm_ID = BTRUtils.GetParamByName("rID");
	var _gForm_Mode = ((_gForm_ID == null) ? 1 : 2); // Form Mode 1= New, 2=Edit
	var _gForm_IsDirty = false;

	var _gForm_Referrer = document.referrer;
	
	var _gDataTableTransferItems = null;
	var _gJsonTransferItems = [];
	
	
	$(document).ready(function() {
	
//		LoadUserInfromation(function() {
//			
//			LoadForm();
//		});
		BTR.BudgetTransfer.SiteUrl(_spPageContextInfo.webAbsoluteUrl);
		BTR.TransactionActivity.SiteUrl(_spPageContextInfo.webAbsoluteUrl);
	
		LoadDataGrid();
		$("#userField").html(_gUser_LoginName);

		GetTransferActivitiesItems(_gForm_ID,_gDataTableTransferItems); 
	});
</script>
    <script src="../SiteAssets/BTR/js/SP.BudgetTransfer.js?reload=2" type="text/javascript"></script>
    <script src="../SiteAssets/BTR/js/SP.TransactionActivity.js?reload=2" type="text/javascript"></script>
<!-- 
/*
AccountFullName, AccountID         AccountRowID  Account_Key      Amount     Approval
ApprovalStatus   AuthorId          BTRGuid       BTRID            Created    EditorId
GUID             ID                IndexFullName IndexID          IndexRowID Index_Key
ItemIndex        Modified          RequestDate   RequestSubmitted RowGuid    Row_x0020_ID
Title            TransferPosition  WrittenToDB
*/

-->    
</span></span></span>
</span>
</asp:Content>