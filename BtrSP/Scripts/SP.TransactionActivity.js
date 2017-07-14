var BTR = BTR || {};
BTR.TransactionActivity = {};

BTR.TransactionActivity.ListBaseApiUrl = "/_api/web/lists/getbytitle('TransferActivities')";

BTR.TransactionActivity.DigestValue = function (digestValue) {
    this._disgestValue = digestValue;
};

BTR.TransactionActivity.CreateErrMsg = function (data, message) {
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

BTR.TransactionActivity.FullApiUri = function (paramater) {
    if ((typeof this._siteUrl) === 'undefined') {
        throw "Site Url is not defined for Transaction Activity class";
    }
    if (typeof paramater != 'undefined') {
        return this._siteUrl + this.ListBaseApiUrl + "/items(" + paramater + ")";
    }
    return this._siteUrl + this.ListBaseApiUrl + "/items";
}

BTR.TransactionActivity.SiteUrl = function (siteUrl) {
    this._siteUrl = siteUrl;
};

BTR.TransactionActivity.RequestDigest = function (requestDigest) {
    this._requestDigest = requestDigest;
};

BTR.TransactionActivity.DataItem = {
    dataTypeName: "SP.Data.TransferActivitiesListItem",
    Create: function () {
        var jsonData = { '__metadata': {} };
        jsonData.__metadata['type'] = this.dataTypeName;
        return jsonData;
    }
};

BTR.TransactionActivity.ItemsNotComplete = function (pUni, successCB, failedCB) {
    var select = "$select=*";
    var filter = "$filter=ApprovalStatus ne 'Complete' and Approver eq '" + pUni + "'";

    BTR.TransactionActivity.GetItems(select, filter, successCB, failedCB);
}

BTR.TransactionActivity.GetItems = function (select, filter, successCB, failedCB) {
    try {
        var queryString = "";
        if ((select != null) || (filter != null)) {
            queryString = "?" + select;

            if (filter != null) {
                queryString += "&" + filter
            }
        }
        var ajaxUrl = this.FullApiUri() + queryString;
        $.ajax({
            url: ajaxUrl,
            method: "GET",
            headers: { "Accept": "application/json; odata=verbose" },
            success: function (data) {
                successCB(data.d.results.splice(0));
            },
            error: function (data) {
                console.log(data.error.message);
                var errObj = this.CreateErrMsg(data, 'Error getting tanser actions items');
                failedCB(errObj);
            }
        });
    }
    catch (err) {
        console.log(err);
        var errObj = this.CreateErrMsg(null, 'TransactionActivity.GetItems - ' + err);
        failedCB(errObj);
    }
}


BTR.TransactionActivity.GetBTRAssociatedTransactions = function (btrId, successCB, failedCB) {
    var select = "$select=*";
    var filter = "$filter=BTRID eq '" + btrId + "'";
    return BTR.TransactionActivity.GetItems(select, filter, successCB, failedCB);
}

BTR.TransactionActivity.Create = function (jsonData, successCB, failedCB) {
    try {
        var ajaxUrl = this.FullApiUri();
        $.ajax({
            url: ajaxUrl,
            method: "POST",
            headers: {
                "Accept": "application/json; odata=verbose",
                "content-type": "application/json;odata=verbose",
                "X-RequestDigest": $("#__REQUESTDIGEST").val()
            },
            data: JSON.stringify(jsonData),
            success: function (data) {
                successCB(data.d);
            },
            error: function (data) {
                console.log(data.error.message);
                var errObj = this.CreateErrMsg(data, 'Error getting tanser actions items');
                failedCB(data);
            }
        });
    }
    catch (err) {
        console.log(err);
        var errObj = this.CreateErrMsg(null, 'TransactionActivity.Create - ' + err);
        failedCB(errObj);
    }
}

BTR.TransactionActivity.Update = function (listItemId, jsonData, eTag, successCB, failedCB) {
    try {
        eTag = "*"; //quick fix for now
        var ajaxUrl = this.FullApiUri(listItemId);
        $.ajax({
            url: ajaxUrl,
            method: "POST",
            headers: {
                "Accept": "application/json; odata=verbose",
                "X-HTTP-Method": "MERGE",
                "content-type": "application/json;odata=verbose",
                "X-RequestDigest": $("#__REQUESTDIGEST").val(),
                "IF-MATCH": eTag
            },
            data: JSON.stringify(jsonData),
            success: function () {
                console.log('TransactionActivity.Update.Success - ' + listItemId);
                successCB(jsonData);
            },
            error: function (data) {
                console.log(data.error.message);
                var errObj = this.CreateErrMsg(data, 'Error updating transfer action item - ' + listItemId);
                failedCB(data);
            }
        });
    }
    catch (err) {
        console.log(err);
        var errObj = this.CreateErrMsg(null, 'TransactionActivity.GetItems - ' + err);
        failedCB(errObj);
    }
}

BTR.TransactionActivity.Delete = function (listItemId, eTag, successCB, failedCB) {
    try {
        eTag = "*"; //quick fix for now

        var ajaxUrl = this.FullApiUri(listItemId);
        $.ajax({
            url: ajaxUrl,
            method: "POST",
            headers: {
                "Accept": "application/json; odata=verbose",
                "X-HTTP-Method": "DELETE",
                "content-type": "application/json;odata=verbose",
                "X-RequestDigest": $("#__REQUESTDIGEST").val(),
                "IF-MATCH": eTag
            },
            success: function (data) {
            debugger;
                successCB(null);
            },
            error: function (data) {
                console.log(data.error.message);
                var errObj = this.CreateErrMsg(data, 'Error deleting tanser actions item - ' + listItemId);
                failedCB(data);
            }
        });
    }
    catch (err) {
        console.log(err);
        var errObj = this.CreateErrMsg(null, 'TransactionActivity.GetItems - ' + err);
        failedCB(errObj);
    }
}


BTR.TransactionActivity.UpdateStatus = function (listItemId, eTag, action) {
    try {
        eTag = "*"; //quick fix for now
        var vActionValue = (action == 1) ? "Approved" : "Rejected";
        var ajaxUrl = this.FullApiUri(listItemId);
        var jsonData = this.DataItem.Create();
        $.ajax({
            url: ajaxUrl,
            method: "POST",
            headers: {
                "Accept": "application/json; odata=verbose",
                "X-HTTP-Method": "MERGE",
                "content-type": "application/json;odata=verbose",
                "X-RequestDigest": $("#__REQUESTDIGEST").val(),
                "IF-MATCH": eTag
            },
            success: function (data) {
                return;
            },
            error: function (data) {
                console.log(data.error.message);
                var errObj = this.CreateErrMsg(data, 'Error updating status of tanser actions item - ' + litItemId);
                failedCB(data);
            }
        });
    }
    catch (err) {
        console.log(err);
        var errObj = this.CreateErrMsg(null, 'TransactionActivity.GetItems - ' + err);
        failedCB(errObj);
    }
}