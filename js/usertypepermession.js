// JavaScript Document
$(document).ready(function(){
		
	$("#drpUsertype").change(function(){
        
		$.ajax({
			url: baseURL+"Usertypeperm/getmenue",
			type: "POST",
			data:  {user_type_id : $("#drpUsertype").val()},
			error: function(xhr, status, error) {
  				//var err = eval("(" + xhr.responseText + ")");
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				$("#dvMenue").css("display","block");
				$("#my_multi_select2").html(returndb);
				$("#my_multi_select2").multiSelect('refresh');
			}
		});//END $.ajax
    });//END change

}); // END READY

var ComponentsDropdowns = function () {

 var handleMultiSelect = function () {
        $('#my_multi_select2').multiSelect({
            selectableOptgroup: true,
			
			afterSelect: function(values){
			  $.ajax({
				  url: baseURL+"Usertypeperm/addusertypepermession",
				  type: "POST",
				  data:  {user_type_id : $("#drpUsertype").val(),
				  			    values : values},
				  error: function(xhr, status, error) {
					  //var err = eval("(" + xhr.responseText + ")");
					  alert(xhr.responseText);
				  },
				  beforeSend: function(){},
				  complete: function(){},
				  success: function(returndb){
					  if(returndb != '')
							$('#my_multi_select2').multiSelect('deselect', values);
				  }
			  });//END $.ajax
			},
			afterDeselect: function(values){
			   $.ajax({
					url: baseURL+"Usertypeperm/deleteusertypepermession",
					type: "POST",
					data:  {user_type_id : $("#drpUsertype").val(),
								  values : values},
					error: function(xhr, status, error) {
						//var err = eval("(" + xhr.responseText + ")");
						alert(xhr.responseText);
					},
					beforeSend: function(){},
					complete: function(){},
					success: function(returndb){
						if(returndb != '')
							$('#my_multi_select2').multiSelect('select', values);
					}
				});//END $.ajax
			},
			
			selectableHeader: "<div class='btn-danger' align='center'><b> غـيـر مـتـاحـة </b></div>",
  			selectionHeader: "<div class='btn-success' align='center'><b> مـتـاحــة </b></div>"
        });
	
    }
	
	return {
        //main function to initiate the module
        init: function () {            
           handleMultiSelect();
        }
    };

}();
