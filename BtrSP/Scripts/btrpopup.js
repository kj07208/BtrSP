var BTRPopup = BTRPopup || {};

BTRPopup.popUp = function(elementId,openButtonId,closeButtonId) {
	//$('#'+elementId).toggleVisible('visibility');

	BTRPopup.modal = document.getElementById(elementId);
	
	// Get the button that opens the modal
	var openButton = document.getElementById(openButtonId);
	// When the user clicks the button, open the modal
	openButton.onclick = function() {
	    BTRPopup.modal.style.display = "block";
	}
	
	// Get the <span> element that closes the modal
	var closeButton = document.getElementById(closeButtonId);
	
	// When the user clicks on <span> (x), close the modal
	closeButton.onclick = function() {
	    BTRPopup.modal.style.display = "none";
	}
	
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	    if (event.target == BTRPopup.modal) {
	        BTRPopup.modal.style.display = "none";
	    }
	}
};



///Build plugin

jQuery.fn.visibilityToggle = function() {
    return this.css('visibility', function(i, visibility) {
        return (visibility == 'visible') ? 'hidden' : 'visible';
    });
}

!(function($) {
    var toggle = $.fn.toggleVisible;
    $.fn.toggleVisible = function() {
        var args = $.makeArray(arguments),
            lastArg = args.pop();

        if (lastArg == 'visibility') {
            return this.visibilityToggle();
        }
    };
})(jQuery);