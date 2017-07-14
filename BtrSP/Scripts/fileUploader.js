	jQuery(document).ready(function () {
	   if (!window.FileReader) {
	        alert('This browser does not support the FileReader API.');
	    }
	});


	function uploadFile() {

	    // Define the folder path for this example.
	    var serverRelativeUrlToFolder = '/shared documents';

	    // Get test values from the file input and text input page controls.
	    // The display name must be unique every time you run the example.
	    var fileInput = jQuery('#getFile');
	    var newName = jQuery('#displayName').val();

	    // Initiate method calls using jQuery promises.
	    // Get the local file as an array buffer.
	    var getFile = getFileBuffer();
	    getFile.done(function (arrayBuffer) {
	
	        // Add the file to the SharePoint folder.
	        var addFile = addFileToFolder(arrayBuffer);
	        addFile.done(function (file, status, xhr) {
	
	            // Get the list item that corresponds to the uploaded file.
	            /*var getItem = getListItem(file.d.ListItemAllFields.__deferred.uri);
	            getItem.done(function (listItem, status, xhr) {
	                    alert('file uploaded and updated');
	            });
	            getItem.fail(onError);
	            */
	        });
	        addFile.fail(onError);
	    });
	    getFile.fail(onError);

    // Get the local file as an array buffer.
    function getFileBuffer() {
        var deferred = jQuery.Deferred();
        var reader = new FileReader();
        reader.onloadend = function (e) {
            deferred.resolve(e.target.result);
        }
        reader.onerror = function (e) {
            deferred.reject(e.target.error);
        }
        reader.readAsArrayBuffer(fileInput[0].files[0]);
        return deferred.promise();
    }

    // Add the file to the file collection in the Shared Documents folder.
    function addFileToFolder(arrayBuffer) {

        // Get the file name from the file input control on the page.
        var parts = fileInput[0].value.split('\\');
        var fileName = parts[parts.length - 1];

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
	function getListItem(fileListItemUri) { }
