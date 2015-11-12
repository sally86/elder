// JavaScript Document

// Add Or Update User
function editUser()
{
	var action = $("#hdnAction").val();
	
	$.ajax({
			url: baseURL+"User/"+action,
			type: "POST",
			data:  $("#user_form").serialize(),
			error: function(xhr, status, error) {
  				//var err = eval("(" + xhr.responseText + ")");
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				if(returndb == '')
				{
					var form = $('#user_form');
					$('.alert-success', form).show();
				}
			}
		});//END $.ajax
}
function goto(arg)
{
	$.ajax({
			url: baseURL+"User/senddata",
			type: "POST",
			data:  {username : arg},
			error: function(xhr, status, error) {
  				//var err = eval("(" + xhr.responseText + ")");
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				window.location.href = baseURL+"user/userform";
				//alert(returndb);
			}
		});//END $.ajax
}
//--------------------------------------
var UserFormValidation = function () {
 var handleValidation = function() {
        
            var form = $('#user_form');
            var errormsg = $('.alert-danger', form);
            var successmsg = $('.alert-success', form);

            form.validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-block help-block-error', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                ignore: "", // validate all fields including form hidden input
                rules: {
					txtEmployeeId: {
                        required: true
                    },
                    txtName: {
                        required: true
                    },
					txtUsername: {
						minlength: 2,
                        required: true
                    },
					txtPassword: {
						minlength: 6,
                        required: true
                    },
					txtPasswordconf: {
                        required: true,
						equalTo: "#txtPassword"
                    },
					drpUsertype: {
						required: true
                    }
                },

               messages: { // custom messages for radio buttons and checkboxes
                    txtEmployeeId: {
						required: "الرجاء ادخل رقم الموظف"
                    },
                    txtName: {
                        required: "الرجاء ادخل الاسم"
                    },
					txtUsername: {
                        minlength: "لايمكن ادخال اسـم المستـخدم اقل من حرفين",
						required: "الرجـاء ادخـل اسـم المستـخدم"
                    },
					txtPassword: {
						minlength: "كلمة المرور يجب ان لا تقل عن 6 خانات",
                        required: "الـجاء ادخـل كلمــة المـرور"
                    },
					txtPasswordconf: {
                        required: "الـجاء ادخـل تأكيـد كلمـة المـرور",
						equalTo: "الكلمة غير مطابقة لكلمة المرور"
                    },
					drpUsertype: {
                        required: "الـجاء ادخـل نوع المستخدم"
                    }
					
                },

                errorPlacement: function (error, element) { // render error placement for each input type
                    if (element.parent(".input-group").size() > 0) {
                        error.insertAfter(element.parent(".input-group"));
                    } else if (element.attr("data-error-container")) { 
                        error.appendTo(element.attr("data-error-container"));
                    } else if (element.parents('.radio-list').size() > 0) { 
                        error.appendTo(element.parents('.radio-list').attr("data-error-container"));
                    } else if (element.parents('.radio-inline').size() > 0) { 
                        error.appendTo(element.parents('.radio-inline').attr("data-error-container"));
                    } else if (element.parents('.checkbox-list').size() > 0) {
                        error.appendTo(element.parents('.checkbox-list').attr("data-error-container"));
                    } else if (element.parents('.checkbox-inline').size() > 0) { 
                        error.appendTo(element.parents('.checkbox-inline').attr("data-error-container"));
                    } else {
                        error.insertAfter(element); // for other inputs, just perform default behavior
                    }
                },

                invalidHandler: function (event, validator) { //display error alert on form submit   
                    successmsg.hide();
                    errormsg.show();
                    Metronic.scrollTo(errormsg, -200);
                },

                highlight: function (element) { // hightlight error inputs
                   $(element)
                        .closest('.form-group').addClass('has-error'); // set error class to the control group
                },

                unhighlight: function (element) { // revert the change done by hightlight
                    $(element)
                        .closest('.form-group').removeClass('has-error'); // set error class to the control group
                },

                success: function (label) {
                    label
                        .closest('.form-group').removeClass('has-error'); // set success class to the control group
                },

                submitHandler: function (form) {
                    errormsg.hide();
					editUser();
                    //form[0].submit(); // submit the form
                }

            });
    }
return {
        //main function to initiate the module
        init: function () {
            handleValidation();

        }

    };

}();

/*-----------------------------------------------------*/
/*	Data Grid Section								   */
/*	Ajax Data Table Jquery							   */
/*													   */
/*-----------------------------------------------------*/

var UserTableAjax = function () {

// I removed Datepicker becuse it is not used here

    var handleRecords = function () {

        var grid = new Datatable();
		
        grid.init({
            src: $("#datatable_ajax"),
            onSuccess: function (grid) {
                // execute some code after table records loaded
				//alert(grid);
            },
            onError: function(xhr, status, error) {
  				//alert(xhr.responseText);
			},
            loadingMessage: 'جاري تحميل البيانات...',
            dataTable: { // here you can define a typical datatable settings from http://datatables.net/usage/options 

                // Uncomment below line("dom" parameter) to fix the dropdown overflow issue in the datatable cells. The default datatable layout
                // setup uses scrollable div(table-scrollable) with overflow:auto to enable vertical scroll(see: assets/global/scripts/datatable.js). 
                // So when dropdowns used the scrollable div should be removed. 
                //"dom": "<'row'<'col-md-8 col-sm-12'pli><'col-md-4 col-sm-12'<'table-group-actions pull-right'>>r>t<'row'<'col-md-8 col-sm-12'pli><'col-md-4 col-sm-12'>>",
                
                "bStateSave": true, // save datatable state(pagination, sort, etc) in cookie.

                "lengthMenu": [
                    [10, 20, 50, 100, 150, -1],
                    [10, 20, 50, 100, 150, "All"] // change per page values here
                ],
                "pageLength": 10, // default record count per page
                "ajax": {
                    "url": baseURL+"User/usergriddata", // ajax source
					"type": "POST"
                },
                "order": [
                    [1, "asc"]
                ] // set first column as a default sort by asc
            }
        });

        // handle group actionsubmit button click
        grid.getTableWrapper().on('click', '.table-group-action-submit', function (e) {
            e.preventDefault();
            var action = $(".table-group-action-input", grid.getTableWrapper());
            if (action.val() != "" && grid.getSelectedRowsCount() > 0) {
                grid.setAjaxParam("customActionType", "group_action");
                grid.setAjaxParam("customActionName", action.val());
                grid.setAjaxParam("id", grid.getSelectedRows());
                grid.getDataTable().ajax.reload();
                grid.clearAjaxParams();
            } else if (action.val() == "") {
                Metronic.alert({
                    type: 'danger',
                    icon: 'warning',
                    message: 'Please select an action',
                    container: grid.getTableWrapper(),
                    place: 'prepend'
                });
            } else if (grid.getSelectedRowsCount() === 0) {
                Metronic.alert({
                    type: 'danger',
                    icon: 'warning',
                    message: 'No record selected',
                    container: grid.getTableWrapper(),
                    place: 'prepend'
                });
            }
        });
    }
	
    return {

        //main function to initiate the module
        init: function () {

            //initPickers();
            handleRecords();
			
        }

    };

}();
//----------------------------------------------------------
var ComponentsFormTools = function () {

    var handleTwitterTypeahead = function() {

        // Example #2
        /*var countries = new Bloodhound({
          datumTokenizer: function(d) { return Bloodhound.tokenizers.whitespace(d.name); },
          queryTokenizer: Bloodhound.tokenizers.whitespace,
          limit: 10,
          prefetch: {
            url: baseURL+'demo/typeahead_countries.json',//'demo/typeahead_countries.json',//'User/getemp',
            filter: function(list) {
              return $.map(list, function(country) { return { name: country }; });
            }
          }
        });
 
        countries.initialize();
         
        if (Metronic.isRTL()) {
          $('#txtName').attr("dir", "rtl");  
        } 
        $('#txtName').typeahead(null, {
          name: 'txtName',
          displayKey: 'name',
          hint: (Metronic.isRTL() ? false : true),
          source: countries.ttAdapter()
        });*/
		
		// Example #3
        var custom = new Bloodhound({
          datumTokenizer: function(d) { return d.tokens; },
          queryTokenizer: Bloodhound.tokenizers.whitespace,
          remote: {
						url: baseURL+'User/getemp',
						filter: function (custom) {
							return $.map(custom, function (emp) {
								return {
									value: emp.name
									
								};
							});
						}
					}
        });
         
        custom.initialize();
         
        if (Metronic.isRTL()) {
          $('#txtName').attr("dir", "rtl");  
        }  
        $('#txtName').typeahead(null, {
          name: 'txtName',
          displayKey: 'value',
          source: custom.ttAdapter(),
          
        });

    }
	return {
        //main function to initiate the module
        init: function () {
            handleTwitterTypeahead();
		}
    };

}();
function count()
{
	$.ajax({
			url: baseURL+"User/getemp",
			type: "POST",
			data:  $("#user_form").serialize(),
			error: function(xhr, status, error) {
  				//var err = eval("(" + xhr.responseText + ")");
  				alert(xhr.responseText);
			},
			beforeSend: function(){},
			complete: function(){},
			success: function(returndb){
				alert(returndb)
			}
		});//END $.ajax
}