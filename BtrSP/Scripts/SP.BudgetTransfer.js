var BTR = BTR || {};
BTR.BudgetTransfer = {};

BTR.BudgetTransfer.ListBaseApiUrl = "/_api/web/lists/getbytitle('Budget Transfer Request')";

BTR.BudgetTransfer.HttpHeaders = {
	Build : function(xMethod,xRequestDigest,eTag)
	{
		var baseHeaders = {"Accept": "application/json; odata=verbose",
	                       "content-type": "application/json;odata=verbose"
	                       };

	    if (typeof xMethod != 'undefined')
	    {
	    	baseHeaders["X-HTTP-Method"] = xMethod;
	    }
	    if (typeof xRequestDigest != 'undefined')
	    {
	    	baseHeaders["X-RequestDigest"] = xRequestDigest;
	    }

	    if (typeof eTag != 'undefined')
	    {
	    	baseHeaders["IF-MATCH"] = eTag;
	    }
		return baseHeaders;
	}
}

BTR.BudgetTransfer.SiteUrl = function (siteUrl) {
    this._siteUrl = siteUrl;
};

BTR.BudgetTransfer.DataItem = {
    dataTypeName: "SP.Data.TC_x005f_BudgetTransferFormListItem",
    Create: function () {
        var jsonData = { '__metadata': {} };
        jsonData.__metadata['type'] = this.dataTypeName;
        return jsonData;
    }
};

BTR.BudgetTransfer.FullApiUri = function (paramater) {
    if ((typeof this._siteUrl) === 'undefined') {
        throw "Site Url is not defined for Budget Transfer class";
    }
    if (typeof paramater != 'undefined') {
        return this._siteUrl + this.ListBaseApiUrl + "/items(" + paramater + ")";
    }
    return this._siteUrl + this.ListBaseApiUrl + "/items";
}

BTR.BudgetTransfer.CreateErrMsg = function (data, message) {
    var dataError = {};

    dataError.InnerError = '';
    dataError.HttpStatus = '000';
    if (data != null) {
        errObj.InnerError = JSON.stringify(data);
        errObj.HttpStatus = data.Status;
    }
    dataError.Message = (message != null) ? message : 'Error processing reqest';
    return dataError;
};

//--------------------------------------------------------- Create ---------------------------------------------------------

BTR.BudgetTransfer.Create = function (jsonData, successCB, failedCB) {

    try {
        var ajaxUrl = this.FullApiUri();
        $.ajax({
            url: ajaxUrl,
            method: "POST",
            headers: this.HttpHeaders.Build(null,$("#__REQUESTDIGEST").val()),
            data: JSON.stringify(jsonData),
            success: function (data) {
                successCB(data);
            },
            error: function (data) {
            	console.log(data);
            	var errObj = BTR.BudgetTransfer.CreateErrMsg(data, 'BudgetTransfer.GetItem - ' );
                failedCB(errObj);
            }
        });

    }
    catch (err) {
        console.log(err);
        var errObj = this.CreateErrMsg(null, 'BudgetTransfer.XYZ - ' + err);
        failedCB(errObj);
    }
};
//--------------------------------------------------------- Read  Item  ---------------------------------------------------------
BTR.BudgetTransfer.Item = function (listItemId, scb, failedCB) {
    try {
        var ajaxUrl = this.FullApiUri();
        $.ajax({
            url: ajaxUrl + "?$select=*&$filter=ID eq " + listItemId,
            method: "GET",
            headers: this.HttpHeaders.Build(),
            success: function (data) {
                scb(data.d.results.slice(0));
            },
            error: function (data) {
	            console.log(data);
	            var errObj = BTR.BudgetTransfer.CreateErrMsg(data, 'BudgetTransfer.GetItem - ' );
	            failedCB(errObj);
        	}
    	});
	}
	catch (err) {
	    console.log(err);
	    var errObj = this.CreateErrMsg(null, 'BudgetTransfer.GetItem - ' + err);
	    failedCB(errObj);
	}	
};

BTR.BudgetTransfer.ItemTableRecord = function (userId, scb, failedCB) {

    try {
        var odataSelect = "$select=ID,Title,PriorityFlag,LifeCycle,BudgetType,TransferType,Total_x0020_Transfer_x0020_Amoun,Modified,Author/ID,Author/Title&$expand=Author/ID";
        var odataFilter = "&$filter=Author/ID eq " + userId;
        var odataOrderBy = "&$orderby=PriorityFlag desc";
        //Read the timestamp for concurrent situations
        var ajaxUrl = this.FullApiUri() + "?" + odataSelect + odataFilter + odataOrderBy
        
        $.ajax({
            url: ajaxUrl,
            method: "GET",
            headers: this.HttpHeaders.Build(),
            success: function (data) {
                scb(data.d.results.slice(0));
            },
            error: function (data) {
                console.log(data);
                var errObj = BTR.BudgetTransfer.CreateErrMsg(data, 'BudgetTransfer.ItemTableRecord - ' );
                failedCB(errObj);
            }
        });
    }
    catch (err) {
        console.log(err);
        var errObj = this.CreateErrMsg(null, 'BudgetTransfer.ItemTableRecord - ' + err);
        failedCB(errObj);
    }
};

//--------------------------------------------------------- Update ---------------------------------------------------------
BTR.BudgetTransfer.Update = function (listItemId, jsonData, eTag, successCB, failedCB) {
    //debugger;

    try {
        eTag = "*"; //quick fix for now
        var ajaxUrl = this.FullApiUri(listItemId);

        console.log('JSon data:' + JSON.stringify(jsonData));
        $.ajax({
            url: ajaxUrl,
            method: "POST",
            headers: this.HttpHeaders.Build("MERGE",$("#__REQUESTDIGEST").val(),eTag),
            data: JSON.stringify(jsonData),
            success: function (data) {
                successCB(data);
            },
            error: function (data) {
                console.log(data);
                var errObj = BTR.BudgetTransfer.CreateErrMsg(data, 'BudgetTransfer.Update - ');
                failedCB(errObj);
            }
        });

    }
    catch (err) {
        console.log(err);
        var errObj = this.CreateErrMsg(null, 'BudgetTransfer.Update - ' + err);
        failedCB(errObj);
    }
}; // end of function


/*
data.responseText
"{"error":{"code":"-1, Microsoft.SharePoint.Client.InvalidClientQueryException","message":{"lang":"en-US","value":"The property 'PriorityFlag ' does not exist on type 'SP.Data.TC_x005f_BudgetTransferFormListItem'. Make sure to only use property names that are defined by the type."}}}"				
*/
