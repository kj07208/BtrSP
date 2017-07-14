var BTR = BTR || {};
BTR.Index = {};

	BTR.Index.ListIndexApiUrl = "/_api/web/lists/getbytitle('_lkIndex')";
	BTR.Index.WebApiUrlIndicesOwned= "/_api/web/lists/getbytitle('_lkIndexDenormalized')";
	BTR.Index.ODataSelect = "$select=Index_x0020_Full_x0020_Name,index_key";

	BTR.Index.SiteUrl = function(siteUrl) {
			this._siteUrl = siteUrl;
	};

//--------------------------------------------------------- Read  Item  ---------------------------------------------------------

//@Function GetIndicesOwnedByDept 
//@Description: Get all the indices owned by the user and filtered by department

	BTR.Index.GetIndicesOwnedByDept = function(uniID,dept_key,scb,fcb) {
		
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
		BTR.Index.Items(BTR.Index.WebApiUrlIndicesOwned,BTR.Index.ODataSelect,filter,scb,fcb);
	}


//@Function GetIndicesdByDept 
//@Description: Get all the indices filtered by department
	BTR.Index.GetIndicesByDept = function(dept_key,scb,fcb) {
		if ((dept_key == null) || (dept_key.length == 0)) {
			var dataError = {};
		  	dataError.StatusText = "Department key can not be blank";
		  	dataError.HttpStatus = "000";
		  	dataError.Url = '';
		  	dataError.Message = dataError.StatusText;
			fcb(dataError);
		}

		var filter = "filter=dept_key eq '"+ dept_key +"'";
		BTR.Index.Items(BTR.Index.WebApiUrlIndicesByDept,BTR.Index.ODataSelect,filter,scb,fcb);
	}

//@Function Items 
//@Description: Function used to call the web api to retieve the data
	
	BTR.Index.Items = function(webApiUrl,select,filter,scb,fcb) {
		if ((typeof this._siteUrl) == 'undefined') {
			fcb();
			return;
		}
		
		var queryString = "";
		if ((select != null) || (filter !=null))
		{
			queryString = "?" + BTR.Index.ODataSelect;
			if (filter != null)
			{
				queryString += "&" + filter;
			}
		}
		console.info('(BTR.Index.Items) - '+ select+filter);

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