var Banner = Banner || {};
	Banner.JV = {};

	Banner.JV.ListBaseApiUrl = "/api/jv/";
	
	
	Banner.JV.Authorization = function(key) {
		this._headerAuthorization = key;
	}

	Banner.JV.SiteUrl = function(hostDomain) {
		this._siteUrl = hostDomain + Banner.JV.ListBaseApiUrl;
	}
	
	Banner.JV.HttpHeaders = {
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
			
			if ((typeof this._headerAuthorization) != 'undefined') {
				baseHeaders["authorization"] = this._headerAuthorization;
			}

			return baseHeaders;
		}
	}

//--------------------------------------------------------- Read  Item  ---------------------------------------------------------

//@Function Create 
//@Description: Create a new JV 
//@Parameters: btr_key = Required, successful callback, failed callback
	Banner.JV.Create = function(btr_key,scb,fcb) {
		var dataError = {};
	  	dataError.StatusText = '';
	  	dataError.HttpStatus = '000';
	  	dataError.Url = '';
		
		if ((btr_key== null) || (btr_key.length == 0)) {
			var dataError = {};
		  	dataError.StatusText = "btr_key can not be blank";
		  	dataError.Message = dataError.StatusText;
			fcb(dataError);
		}
		
		var filter = 'btr_key='+btr_key;
		Banner.JV.Items('create','post',filter,scb,fcb);
	}



//@Function Items 
//@Description: Function used to call the web api to retieve the data
	Banner.JV.Items = function(indexUrl,method,filter,scb,fcb) {
	
		if ((typeof this._siteUrl) == 'undefined') {
			var dataError = {};
		  	dataError.StatusText = "Web API site URL is has not been initialized";
		  	dataError.HttpStatus = "000";
		  	dataError.Url = '';
		  	dataError.Message = dataError.StatusText;
			fcb(dataError);
			return;
		}
		
		var queryString = "";
		if ((filter !=null) && (filter.length > 0))
		{
			queryString = "?" + filter;
		}
		
		var executeUrl = this._siteUrl + indexUrl + queryString;
		$.ajax({
				url: executeUrl,
				method: method,
				headers: this.HttpHeaders.Build(),
				success: function (data) {
					if (data == null) return data;
					if(data.constructor === Array)
					{
						scb(data.slice(0));
					}
					else
					{
						scb(data);
					}
				  },
				  error: function (data) {
				  	var dataError = {};
				  	dataError.StatusText = data.statusText;
				  	dataError.HttpStatus = data.status;
				  	dataError.Url = executeUrl;
				  	dataError.Message = "("+data.status+") - URL(" + executeUrl + ") - "+data.statusText;
					fcb(dataError);
				 }
		});
	};