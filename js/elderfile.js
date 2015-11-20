// JavaScript Document

$(document).ready(function(){
	$('#btnAdddoc').click(function(event) {							
		event.preventDefault();
				
		//-- Validation
		$('#dvSuccessMsg').attr('class', 'alert alert-success display-hide');
		$('#dvErrorMsg')  .attr('class', 'alert alert-danger  display-hide');
				
		if($('#drpDoctype').val() == '')
		{
			$('#dvErrorMsg').attr('class', 'alert alert-danger');
			$('#drpDoctype').focus();
			return;
		}
		if($('#fileToUpload').val() == '')
		{
			$('#dvErrorMsg').attr('class', 'alert alert-danger');
			$('#flFilename').focus();
			return;
		}
		//--
		
		var fileid = $('#hdnFileid').val();
		var doctype = $('#drpDoctype').val();
		var filename = $('#flFilename').html();
		var fileSelect = document.getElementById('fileToUpload');
		
		// Get the selected files from the input.
		var files = fileSelect.files;
		
		// Create a new FormData object.
		var formData = new FormData();
		var file = files[0];
		
		// Add the file to the request.
  		formData.append('fileToUpload', file, file.name);
		formData.append('fileid', fileid);
		formData.append('doctype', doctype);
		formData.append('filename', filename);
		
	
		
		$.ajax({
			url: baseURL+"Elderfilecont/uploaddoc",
			type: "POST",
			data: formData,
			processData: false,
    		contentType: false,
			error: function(xhr, status, error) {
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				$('#drpDoctype').val('');
				$('#tbdDoc').html(returndb);
			}
		});//END $.ajax
	
	}); // END CLICK
	
}); // END READY

function deleteDoc(elderdocid,filename)
{
	var fileid = $('#hdnFileid').val();
	$.ajax({
			url: baseURL+"Elderfilecont/deletedoc",
			type: "POST",
			data: { fileid : fileid,
					elderdocid : elderdocid,
					filename : filename},
			error: function(xhr, status, error) {
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				$('#drpDoctype').val('');
				$('#tbdDoc').html(returndb);
				
			}
		});//END $.ajax
}