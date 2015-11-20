// JavaScript Document

$(document).ready(function(){
	$('#btnAdddoc').click(function(event) {							
		event.preventDefault();
		
		var doctype = $('#drpDoctype').val();
		var filename = $('#flFilename').html();
		
		$.ajax({
			url: baseURL+"Elderfilecont/uploaddoc",
			type: "POST",
			data:  {drpDoctype : doctype,
					flFilename : flFilename},
			error: function(xhr, status, error) {
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				alert(returndb)
			}
		});//END $.ajax
	
	}); // END CLICK
	
}); // END READY

function deleteDoc(elderdocid)
{
	$.ajax({
			url: baseURL+"Elderfilecont/deletedoc",
			type: "POST",
			data:  {elderdocid : elderdocid},
			error: function(xhr, status, error) {
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				alert(returndb)
			}
		});//END $.ajax
}