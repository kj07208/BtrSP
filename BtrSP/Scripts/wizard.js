var _gWizardPages = null;
var _gWizardCurrentPage = null;
var _gWizardPagesMaximum = null;
$(document).ready(function() {
	if ($('#wizardPages').val() != null)
	{
		_gWizardPages = $('#wizardPages').val().split(';');
		$('#wizardPagesCurrentPage').val(_gWizardPages[0]);
		_gWizardPagesMaximum = _gWizardPages[_gWizardPages.length-1]; //pages need to be in order
		$("[wizardpage]").css('display','none');
		$($("[wizardpage]")[$('#wizardPagesCurrentPage').val()-1]).css('display','block');
		$('#previous-button').hide();
		
	}
});

function nextStep()
{
	var currentStep = Number($('#wizardPagesCurrentPage').val()); 
	var nextStep = currentStep + ((currentStep < _gWizardPagesMaximum) ? 1 : 0); //convert to a number
	var indexCurrent = currentStep - 1; //for the array index
	var indexNext = nextStep -1; 
	

	$($('.stepPreviewPanal li')[indexCurrent]).removeClass('active');
	$($('.stepPreviewPanal li')[indexCurrent]).addClass('disabled');
	$($('.stepPreviewPanal li')[indexNext]).removeClass('disabled');
	$($('.stepPreviewPanal li')[indexNext]).addClass('active');

	$($("[wizardpage]")[indexCurrent]).css('display','none');
	$($("[wizardpage]")[indexNext]).css('display','block');
	if (currentStep == 1)	
	{
		$('#previous-button').show();
	}
	if (nextStep == _gWizardPagesMaximum)
	{
		$('#next-button').hide();
	}
	$('#wizardPagesCurrentPage').val(nextStep);
}

function previousStep()
{
	var currentStep = Number($('#wizardPagesCurrentPage').val());
	var prevStep = currentStep - ((currentStep > 1) ? 1 : 0); //convert to a number
	var indexCurrent = currentStep - 1; //for the array index
	var indexPrevious = prevStep -1; 

	$($('.stepPreviewPanal li')[indexCurrent]).removeClass('active');
	$($('.stepPreviewPanal li')[indexCurrent]).addClass('disabled');
	$($('.stepPreviewPanal li')[indexPrevious]).removeClass('disabled');
	$($('.stepPreviewPanal li')[indexPrevious]).addClass('active');
	
	$($("[wizardpage]")[indexCurrent]).css('display','none');
	$($("[wizardpage]")[indexPrevious]).css('display','block');
	if (prevStep == 1)	
	{
		$('#previous-button').hide();
	}
	if (currentStep == _gWizardPagesMaximum)
	{
		$('#next-button').show();
	}

	$('#wizardPagesCurrentPage').val(prevStep );	
}

function GoToWizardPage(pageNumber)
{
	var currentStep = Number($('#wizardPagesCurrentPage').val());
	var gotoStep = pageNumber; //convert to a number
	var indexCurrent = currentStep - 1; //for the array index
	var indexGoto = gotoStep -1; 

	$($('.stepPreviewPanal li')[indexCurrent]).removeClass('active');
	$($('.stepPreviewPanal li')[indexCurrent]).addClass('disabled');
	$($('.stepPreviewPanal li')[indexPrevious]).removeClass('disabled');
	$($('.stepPreviewPanal li')[indexPrevious]).addClass('active');
	
	$($("[wizardpage]")[indexCurrent]).css('display','none');
	$($("[wizardpage]")[indexPrevious]).css('display','block');
	if (gotoStep == 1)	
	{
		$('#previous-button').hide();
	}
	if (gotoStep == _gWizardPagesMaximum)
	{
		$('#next-button').show();
	}

	$('#wizardPagesCurrentPage').val(gotoStep);	
	
}
