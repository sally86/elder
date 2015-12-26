﻿// JavaScript Document

//--------------------------- Elder Info Report -------------------------------//
var ElderInfoRptAjax = function () {

// I removed Datepicker becuse it is not used here

    var handleRecords = function () {
		

        var grid = new Datatable();
		
		$.extend(true, $.fn.DataTable.TableTools.classes, {
            "container": "btn-group tabletools-btn-group pull-right",
            "buttons": {
                "normal": "btn btn-sm default",
                "disabled": "btn btn-sm default disabled"
            }
        });

		
        grid.init({
            src: $("#Elderinforpt_ajax"),
            onSuccess: function (grid) {
                // execute some code after table records loaded
				//alert(grid);
            },
            onError: function(xhr, status, error) {
  				//alert(xhr.responseText);
			},
            loadingMessage: 'جاري تحميل البيانات...',
            dataTable: { 
                
                "bStateSave": true, // save datatable state(pagination, sort, etc) in cookie.

                "lengthMenu": [
                    [10, 20, 50, 100, 150, -1],
                    [10, 20, 50, 100, 150, "All"] // change per page values here
                ],
                "pageLength": 10, // default record count per page
				
                "ajax": {
                    "url": baseURL+"Reports/elderinfogriddata", // ajax source
					"type": "POST"
                },
                "order": [
                    [10, "asc"]
                ], // set first column as a default sort by asc
				
				"dom": "<'row' <'col-md-12'T>><'row'<'col-md-6 col-sm-12'l>r><'table-scrollable't><'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>",
				"tableTools": {
					"sSwfPath": baseURL+"assets/global/plugins/datatables/extensions/TableTools/swf/copy_csv_xls_pdf.swf",
					"aButtons": [{
						"sExtends": "xls",
						"sButtonText": "Excel"
						}, {
						"sExtends": "print",
						"sButtonText": "Print",
						"sInfo": 'Please press "CTRL+P" to print or "ESC" to quit',
						"sMessage": "Generated by DataTables"
					}]
            	}
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
			if (!jQuery().dataTable) {
                return;
            }

            //console.log('me 1');
            //initPickers();
            handleRecords();
			
			//console.log('me 2');
			
        }

    };

}();

//--------------------------- END Elder Info Report -------------------------------//



//--------------------------- Elder Gender Report -------------------------------//
var GenderRptAjax = function () {

// I removed Datepicker becuse it is not used here

    var handleGenderRecords = function () {
		

        var grid = new Datatable();
		
		$.extend(true, $.fn.DataTable.TableTools.classes, {
            "container": "btn-group tabletools-btn-group pull-right",
            "buttons": {
                "normal": "btn btn-sm default",
                "disabled": "btn btn-sm default disabled"
            }
        });

		
        grid.init({
            src: $("#Genderrpt_ajax"),
            onSuccess: function (grid) {
                // execute some code after table records loaded
				//alert(grid);
            },
            onError: function(xhr, status, error) {
  				//alert(xhr.responseText);
			},
            loadingMessage: 'جاري تحميل البيانات...',
            dataTable: { 
                
                "bStateSave": true, // save datatable state(pagination, sort, etc) in cookie.

                "lengthMenu": [
                    [10, 20, 50, 100, 150, -1],
                    [10, 20, 50, 100, 150, "All"] // change per page values here
                ],
                "pageLength": 10, // default record count per page
				
                "ajax": {
                    "url": baseURL+"Reports/gendergriddata", // ajax source
					"type": "POST"
                },
                "order": [
                    [5, "asc"]
                ], // set first column as a default sort by asc
				
				"dom": "<'row' <'col-md-12'T>><'row'<'col-md-6 col-sm-12'l>r><'table-scrollable't><'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>",
				"tableTools": {
					"sSwfPath": baseURL+"assets/global/plugins/datatables/extensions/TableTools/swf/copy_csv_xls_pdf.swf",
					"aButtons": [{
						"sExtends": "xls",
						"sButtonText": "Excel"
						}, {
						"sExtends": "print",
						"sButtonText": "Print",
						"sInfo": 'Please press "CTRL+P" to print or "ESC" to quit',
						"sMessage": "Generated by DataTables"
					}]
            	}
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
			if (!jQuery().dataTable) {
                return;
            }

            //console.log('me 1');
            //initPickers();
			handleGenderRecords();
			
			//console.log('me 2');
			
        }

    };

}();

//------------------------ END Elder Gender Report -------------------------------//



//--------------------------- Elder Edu Report -------------------------------//
var EduRptAjax = function () {

// I removed Datepicker becuse it is not used here

    var handleEduRecords = function () {
		

        var grid = new Datatable();
		
		$.extend(true, $.fn.DataTable.TableTools.classes, {
            "container": "btn-group tabletools-btn-group pull-right",
            "buttons": {
                "normal": "btn btn-sm default",
                "disabled": "btn btn-sm default disabled"
            }
        });

		
        grid.init({
            src: $("#Edurpt_ajax"),
            onSuccess: function (grid) {
                // execute some code after table records loaded
				//alert(grid);
            },
            onError: function(xhr, status, error) {
  				//alert(xhr.responseText);
			},
            loadingMessage: 'جاري تحميل البيانات...',
            dataTable: { 
                
                "bStateSave": true, // save datatable state(pagination, sort, etc) in cookie.

                "lengthMenu": [
                    [10, 20, 50, 100, 150, -1],
                    [10, 20, 50, 100, 150, "All"] // change per page values here
                ],
                "pageLength": 10, // default record count per page
				
                "ajax": {
                    "url": baseURL+"Reports/edugriddata", // ajax source
					"type": "POST"
                },
                "order": [
                    [10, "asc"]
                ], // set first column as a default sort by asc
				
				"dom": "<'row' <'col-md-12'T>><'row'<'col-md-6 col-sm-12'l>r><'table-scrollable't><'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>",
				"tableTools": {
					"sSwfPath": baseURL+"assets/global/plugins/datatables/extensions/TableTools/swf/copy_csv_xls_pdf.swf",
					"aButtons": [{
						"sExtends": "xls",
						"sButtonText": "Excel"
						}, {
						"sExtends": "print",
						"sButtonText": "Print",
						"sInfo": 'Please press "CTRL+P" to print or "ESC" to quit',
						"sMessage": "Generated by DataTables"
					}]
            	}
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
			if (!jQuery().dataTable) {
                return;
            }

            //console.log('me 1');
            //initPickers();
			handleEduRecords();
			
			//console.log('me 2');
			
        }

    };

}();
//------------------------- END Elder Edu Report -------------------------------//


//---------------------------- Income Report ----------------------------------//
var IncomeRptAjax = function () {

// I removed Datepicker becuse it is not used here

    var handleIncomeRecords = function () {
		

        var grid = new Datatable();
		
		$.extend(true, $.fn.DataTable.TableTools.classes, {
            "container": "btn-group tabletools-btn-group pull-right",
            "buttons": {
                "normal": "btn btn-sm default",
                "disabled": "btn btn-sm default disabled"
            }
        });

		
        grid.init({
            src: $("#Incomerpt_ajax"),
            onSuccess: function (grid) {
                // execute some code after table records loaded
				//alert(grid);
            },
            onError: function(xhr, status, error) {
  				//alert(xhr.responseText);
			},
            loadingMessage: 'جاري تحميل البيانات...',
            dataTable: { 
                
                "bStateSave": true, // save datatable state(pagination, sort, etc) in cookie.

                "lengthMenu": [
                    [10, 20, 50, 100, 150, -1],
                    [10, 20, 50, 100, 150, "All"] // change per page values here
                ],
                "pageLength": 10, // default record count per page
				
                "ajax": {
                    "url": baseURL+"Reports/incomegriddata", // ajax source
					"type": "POST"
                },
                "order": [
                    [10, "asc"]
                ], // set first column as a default sort by asc
				
				"dom": "<'row' <'col-md-12'T>><'row'<'col-md-6 col-sm-12'l>r><'table-scrollable't><'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>",
				"tableTools": {
					"sSwfPath": baseURL+"assets/global/plugins/datatables/extensions/TableTools/swf/copy_csv_xls_pdf.swf",
					"aButtons": [{
						"sExtends": "xls",
						"sButtonText": "Excel"
						}, {
						"sExtends": "print",
						"sButtonText": "Print",
						"sInfo": 'Please press "CTRL+P" to print or "ESC" to quit',
						"sMessage": "Generated by DataTables"
					}]
            	}
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
			if (!jQuery().dataTable) {
                return;
            }

            //console.log('me 1');
            //initPickers();
			handleIncomeRecords();
			
			//console.log('me 2');
			
        }

    };

}();

//---------------------------- Home Report ----------------------------------//
var HomeRptAjax = function () {

// I removed Datepicker becuse it is not used here

    var handleHomeRecords = function () {
		

        var grid = new Datatable();
		
		$.extend(true, $.fn.DataTable.TableTools.classes, {
            "container": "btn-group tabletools-btn-group pull-right",
            "buttons": {
                "normal": "btn btn-sm default",
                "disabled": "btn btn-sm default disabled"
            }
        });

		
        grid.init({
            src: $("#Elderhomerpt_ajax"),
            onSuccess: function (grid) {
                // execute some code after table records loaded
				//alert(grid);
            },
            onError: function(xhr, status, error) {
  				//alert(xhr.responseText);
			},
            loadingMessage: 'جاري تحميل البيانات...',
            dataTable: { 
                
                "bStateSave": true, // save datatable state(pagination, sort, etc) in cookie.

                "lengthMenu": [
                    [10, 20, 50, 100, 150, -1],
                    [10, 20, 50, 100, 150, "All"] // change per page values here
                ],
                "pageLength": 10, // default record count per page
				
                "ajax": {
                    "url": baseURL+"Reports/homegriddata", // ajax source
					"type": "POST"
                },
                "order": [
                    [12, "asc"]
                ], // set first column as a default sort by asc
				
				"dom": "<'row' <'col-md-12'T>><'row'<'col-md-6 col-sm-12'l>r><'table-scrollable't><'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>",
				"tableTools": {
					"sSwfPath": baseURL+"assets/global/plugins/datatables/extensions/TableTools/swf/copy_csv_xls_pdf.swf",
					"aButtons": [{
						"sExtends": "xls",
						"sButtonText": "Excel"
						}, {
						"sExtends": "print",
						"sButtonText": "Print",
						"sInfo": 'Please press "CTRL+P" to print or "ESC" to quit',
						"sMessage": "Generated by DataTables"
					}]
            	}
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
			if (!jQuery().dataTable) {
                return;
            }

            //console.log('me 1');
            //initPickers();
			handleHomeRecords();
			
			//console.log('me 2');
			
        }

    };

}();

//---------------------------- Room Report ----------------------------------//
var RoomRptAjax = function () {

// I removed Datepicker becuse it is not used here

    var handleRoomRecords = function () {
		

        var grid = new Datatable();
		
		$.extend(true, $.fn.DataTable.TableTools.classes, {
            "container": "btn-group tabletools-btn-group pull-right",
            "buttons": {
                "normal": "btn btn-sm default",
                "disabled": "btn btn-sm default disabled"
            }
        });

		
        grid.init({
            src: $("#Elderroomrpt_ajax"),
            onSuccess: function (grid) {
                // execute some code after table records loaded
				//alert(grid);
            },
            onError: function(xhr, status, error) {
  				//alert(xhr.responseText);
			},
            loadingMessage: 'جاري تحميل البيانات...',
            dataTable: { 
                
                "bStateSave": true, // save datatable state(pagination, sort, etc) in cookie.

                "lengthMenu": [
                    [10, 20, 50, 100, 150, -1],
                    [10, 20, 50, 100, 150, "All"] // change per page values here
                ],
                "pageLength": 10, // default record count per page
				
                "ajax": {
                    "url": baseURL+"Reports/elderroomgriddata", // ajax source
					"type": "POST"
                },
                "order": [
                    [12, "asc"]
                ], // set first column as a default sort by asc
				
				"dom": "<'row' <'col-md-12'T>><'row'<'col-md-6 col-sm-12'l>r><'table-scrollable't><'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>",
				"tableTools": {
					"sSwfPath": baseURL+"assets/global/plugins/datatables/extensions/TableTools/swf/copy_csv_xls_pdf.swf",
					"aButtons": [{
						"sExtends": "xls",
						"sButtonText": "Excel"
						}, {
						"sExtends": "print",
						"sButtonText": "Print",
						"sInfo": 'Please press "CTRL+P" to print or "ESC" to quit',
						"sMessage": "Generated by DataTables"
					}]
            	}
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
			if (!jQuery().dataTable) {
                return;
            }

            //console.log('me 1');
            //initPickers();
			handleRoomRecords();
			
			//console.log('me 2');
			
        }

    };

}();

//---------------------------- Maintenance Report ----------------------------------//
var MaintenanceRptAjax = function () {

// I removed Datepicker becuse it is not used here

    var handleMaintenanceRecords = function () {
		

        var grid = new Datatable();
		
		$.extend(true, $.fn.DataTable.TableTools.classes, {
            "container": "btn-group tabletools-btn-group pull-right",
            "buttons": {
                "normal": "btn btn-sm default",
                "disabled": "btn btn-sm default disabled"
            }
        });

		
        grid.init({
            src: $("#Elderhomemaintenancerpt_ajax"),
            onSuccess: function (grid) {
                // execute some code after table records loaded
				//alert(grid);
            },
            onError: function(xhr, status, error) {
  				//alert(xhr.responseText);
			},
            loadingMessage: 'جاري تحميل البيانات...',
            dataTable: { 
                
                "bStateSave": true, // save datatable state(pagination, sort, etc) in cookie.

                "lengthMenu": [
                    [10, 20, 50, 100, 150, -1],
                    [10, 20, 50, 100, 150, "All"] // change per page values here
                ],
                "pageLength": 10, // default record count per page
				
                "ajax": {
                    "url": baseURL+"Reports/maintenancegriddata", // ajax source
					"type": "POST"
                },
                "order": [
                    [10, "asc"]
                ], // set first column as a default sort by asc
				
				"dom": "<'row' <'col-md-12'T>><'row'<'col-md-6 col-sm-12'l>r><'table-scrollable't><'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>",
				"tableTools": {
					"sSwfPath": baseURL+"assets/global/plugins/datatables/extensions/TableTools/swf/copy_csv_xls_pdf.swf",
					"aButtons": [{
						"sExtends": "xls",
						"sButtonText": "Excel"
						}, {
						"sExtends": "print",
						"sButtonText": "Print",
						"sInfo": 'Please press "CTRL+P" to print or "ESC" to quit',
						"sMessage": "Generated by DataTables"
					}]
            	}
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
			if (!jQuery().dataTable) {
                return;
            }

            //console.log('me 1');
            //initPickers();
			handleMaintenanceRecords();
			
			//console.log('me 2');
			
        }

    };

}();

//---------------------------- Life Improvement Report ----------------------------------//
var LifeimprovementRptAjax = function () {

// I removed Datepicker becuse it is not used here

    var handleLifeimprovementeRecords = function () {
		

        var grid = new Datatable();
		
		$.extend(true, $.fn.DataTable.TableTools.classes, {
            "container": "btn-group tabletools-btn-group pull-right",
            "buttons": {
                "normal": "btn btn-sm default",
                "disabled": "btn btn-sm default disabled"
            }
        });

		
        grid.init({
            src: $("#Lifeimprovementerpt_ajax"),
            onSuccess: function (grid) {
                // execute some code after table records loaded
				//alert(grid);
            },
            onError: function(xhr, status, error) {
  				//alert(xhr.responseText);
			},
            loadingMessage: 'جاري تحميل البيانات...',
            dataTable: { 
                
                "bStateSave": true, // save datatable state(pagination, sort, etc) in cookie.

                "lengthMenu": [
                    [10, 20, 50, 100, 150, -1],
                    [10, 20, 50, 100, 150, "All"] // change per page values here
                ],
                "pageLength": 10, // default record count per page
				
                "ajax": {
                    "url": baseURL+"Reports/lifeimprovementgriddata", // ajax source
					"type": "POST"
                },
                "order": [
                    [2, "asc"]
                ], // set first column as a default sort by asc
				
				"dom": "<'row' <'col-md-12'T>><'row'<'col-md-6 col-sm-12'l>r><'table-scrollable't><'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>",
				"tableTools": {
					"sSwfPath": baseURL+"assets/global/plugins/datatables/extensions/TableTools/swf/copy_csv_xls_pdf.swf",
					"aButtons": [{
						"sExtends": "xls",
						"sButtonText": "Excel"
						}, {
						"sExtends": "print",
						"sButtonText": "Print",
						"sInfo": 'Please press "CTRL+P" to print or "ESC" to quit',
						"sMessage": "Generated by DataTables"
					}]
            	}
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
			if (!jQuery().dataTable) {
                return;
            }

            //console.log('me 1');
            //initPickers();
			handleLifeimprovementeRecords();
			
			//console.log('me 2');
			
        }

    };

}();

$(document).ready(function(){
						   
	
	$('.DTTT_button_print').live('click', function(e) {
		e.preventDefault();
		$('#trNoprint').css({ display: "none" });
		//var table = $('#Elderinforpt_ajax').dataTable();
		
		//table.fnSetColumnVis( 11, false );
		//table.fnSetColumnVis( 11, true );
		/*alert("Table"+table);
		alert(table.column(0));*/
		
		// Get the column API object
       /* var column = table.column("file_id");
		
		alert(column.visible());*/
 		
        // Toggle the visibility
		/*if (column == "file_id")
		{
			alert('hi2');
        column.visible( false );
		}*/
		
	  });
	
	
	
}); // END READY