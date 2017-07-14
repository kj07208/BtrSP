var BTR = BTR || {};
BTR.Account = {};

	BTR.Account.ListIndexApiUrl = "/_api/web/lists/getbytitle('_lkIndex')";
	BTR.Account.WebApiUrlIndicesOwned= "/_api/web/lists/getbytitle('_lkIndexDenormalized')";
	BTR.Account.ODataSelect = "$select=Index_x0020_Full_x0020_Name,index_key";

	BTR.Account.SiteUrl = function(siteUrl) {
			this._siteUrl = siteUrl;
	};
/*
	function GetAllAccountsAndBalances(aryValues,cbFunction)

		var ajaxUrl = _spPageContextInfo.webAbsoluteUrl + "/_api/web/lists/getbytitle('_lkAccount')/items";
		var odataSelect = "?$select=index_key,account_key,Account_x0020_Full_x0020_Name,Balance&$filter=";

	function GetAccounts(controlId,filterValue,selectedValue)
		var ajaxUrl = _spPageContextInfo.webAbsoluteUrl + "/_api/web/lists/getbytitle('_lkAccount')/items";
		var odataSelect = "?$select=account_key,Account_x0020_Full_x0020_Name,Balance&$filter=index_key eq '"+filterValue+"'";


	function GetAccountBalance(controlId,filterValue)
	{
		var ajaxUrl = _spPageContextInfo.webAbsoluteUrl + "/_api/web/lists/getbytitle('_lkAccount')/items";
		var odataSelect = "?$select=account_key,Account_x0020_Full_x0020_Name,Balance&$filter=account_key eq '"+filterValue+"'";

*/
//--------------------------------------------------------- Read  Item  ---------------------------------------------------------

//@Function GetXXX 
//@Description: Get all the indices owned by the user and filtered by department

	BTR.Account.GetIndicesOwnedByDept = function(uniID,dept_key,scb,fcb) {
		
		var dataError = {};
	  	dataError.StatusText = '';
	  	dataError.HttpStatus = '000';
	  	dataError.Url = '';
		
		if ((dept_key == null) || (dept_key.length == 0) || (uni == null) || (uni.length == 0)) {
			var dataError = {};
		  	dataError.StatusText = "Department key or Uni ID can not be blank";
		  	dataError.Message = dataError.StatusText;
			fcb(dataError);
		}
		
		var filter = "$filter=Uni eq '"+uniID+"'" + " and filter=dept_key eq '"+ dept_key +"'";
		BTR.Account.Items(BTR.Account.WebApiUrlIndicesOwned,BTR.Account.ODataSelect,filter,scb,fcb);
	}



//@Function Items 
//@Description: Function used to call the web api to retieve the data
	
	BTR.Account.Items = function(webApiUrl,select,filter,scb,fcb) {
		if ((typeof this._siteUrl) == 'undefined') {
			fcb();
			return;
		}
		
		var queryString = "";
		if ((select != null) || (filter !=null))
		{
			queryString = "?" + BTR.Account.ODataSelect;
			if (filter != null)
			{
				queryString += "&" + filter;
			}
		}
		console.info('(BTR.Account.Items) - '+ select+filter);

		$.ajax({
				url: this._siteUrl + webApiUrl+ "/items"+queryString,
				method: "GET",
				headers: { "Accept": "application/json; odata=verbose" },
				success: function (data) {
				//debugger;
					scb(data.d.results.slice(0));
				  },
				  error: function (data) {
					fcb(data);
				 }
		});
	};