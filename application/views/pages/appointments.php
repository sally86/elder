<!-- END PAGE HEADER-->
<!-- BEGIN PAGE CONTENT-->
<div class="row">
	<div class="col-md-12">
      <!-- Begin: life time stats -->
      <div class="portlet">
          <div class="portlet-title">
              <div class="caption">
                  <i class="fa fa-clock-o"></i>عـرض المـواعيد
              </div>
          </div>
          <div class="portlet-body">
              <div class="table-container">
                  <div class="table-actions-wrapper">
                      <span>
                      </span>
                      <select class="table-group-action-input form-control input-inline input-small input-sm">
                          <option value="">Select...</option>
                          <option value="Cancel">Cancel</option>
                          <option value="Cancel">Hold</option>
                          <option value="Cancel">On Hold</option>
                          <option value="Close">Close</option>
                      </select>
                      <button class="btn btn-sm yellow table-group-action-submit"><i class="fa fa-check"></i> Submit</button>
                  </div>
                  <table class="table table-striped table-bordered table-hover" id="datatable_ajax">
                  <thead>
                  <tr role="row" class="heading">
                      <th width="2%">
                          <input type="checkbox" class="group-checkable">
                      </th>
                      <th width="30%">
                           اسم الباحـث
                      </th>
                      <th width="30%">
                           اسم العـضو
                      </th>
                      <th width="20%">
                           تاريخ الموعـد
                      </th>
                      <th width="18%">&nbsp;
                           
                      </th>
                  </tr>
                  <tr role="row" class="filter">
                      <td>
                      </td>
                      <td>
                          <input type="text" class="form-control form-filter input-sm" id="txtResearchername" name="txtResearchername">
                      </td>
                      <td>
                          <input type="text" class="form-control form-filter input-sm" id="txtEmpName" name="txtEmpName">
                      </td>
                      <td>
                          <div class="input-group date date-picker margin-bottom-5" data-date-format="yyyy/mm/dd">
                            <input type="text" class="form-control form-filter input-sm dp" readonly name="dpAppfrom" placeholder="من">
                            <span class="input-group-btn">
                            <button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button>
                            </span>
                        </div>
                        <div class="input-group date date-picker" data-date-format="yyyy/mm/dd">
                            <input type="text" class="form-control form-filter input-sm dp" readonly name="dpAppto" placeholder="إلى">
                            <span class="input-group-btn">
                            <button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button>
                            </span>
                        </div>
                      </td>
                      <td>
                         <button class="btn btn-sm yellow filter-submit margin-bottom"><i class="fa fa-search"></i> </button>
                         <button class="btn btn-sm red filter-cancel"><i class="fa fa-times"></i> </button>
                      </td>
                  </tr>
                  </thead>
                  <tbody>
                  <tr>
                  	<td>&nbsp;</td>
                    <td>محمد أحمد</td>
                    <td>أحمد محمد أحمد حسين</td>
                    <td>1/11/2015</td>
                    <td><a class="btn btn-xs default" href="addAppointment">
						<i class="fa fa-pencil"></i>
							تعديل
						</a></td>
                  </tr>
                  <tr>
                  	<td>&nbsp;</td>
                    <td>عمر حسن</td>
                    <td>حسين محمد علي عيسى</td>
                    <td>5/11/2015</td>
                    <td><a class="btn btn-xs default" href="addAppointment">
						<i class="fa fa-pencil"></i>
							تعديل
						</a></td>
                  </tr>
                  </tbody>
                  </table>
              </div>
          </div>
      </div>
      <!-- End: life time stats -->
  </div>
</div>
<!-- END PAGE CONTENT-->