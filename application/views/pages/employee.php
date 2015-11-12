<!-- END PAGE HEADER-->
<!-- BEGIN PAGE CONTENT-->
<div class="row">
	<div class="col-md-12">
      <!-- Begin: life time stats -->
      <div class="portlet">
          <div class="portlet-title">
              <div class="caption">
                  <i class="fa fa-briefcase"></i>المــــوظفـيـن
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
                      <th width="10%">
                           رقـم الهوية
                      </th>
                      <th width="10%">
                           الرقـم الوظيـفي
                      </th>
                      <th width="15%">
                           اسم المـوظـف
                      </th>
                      <th width="10%">
                           المسـمى الوظيـفي
                      </th>
                      <th width="10%">
                           رقـم الجوال
                      </th>
                      <th width="12%">
                           البريد الاكتروني
                      </th>
                      <th width="8%">
                           حالة الموظف
                      </th>
                      <th width="10%">&nbsp;
                           
                      </th>
                  </tr>
                  <tr role="row" class="filter">
                      <td>
                      </td>
                      <td>
                          <input type="text" class="form-control form-filter input-sm" id="national_id" name="national_id">
                      </td>
                      <td>
                          <input type="text" class="form-control form-filter input-sm" id="employee_id" name="employee_id">
                      </td>
                      <td>
                          <input type="text" class="form-control form-filter input-sm" id="name" name="name">
                      </td>
                      <td>
                          <select id="job_title" name="job_title" class="form-control form-filter input-sm">
                              <option value="">اختر...</option>
                          	  <?php
							  foreach($job_title as $row)
							  {
                      			echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
							  }
							  ?>
                          </select>                      
                      </td>
                      <td>
                         <input type="text" class="form-control form-filter input-sm" id="mobile" name="mobile">
                      </td>
                      <td>
                         <input type="text" class="form-control form-filter input-sm" id="email" name="email">
                      </td>
                      <td>
                          <select id="is_active" name="is_active" class="form-control form-filter input-sm">
                              <option value="">اختر...</option>
                              <?php
							  foreach($is_active as $row)
							  {
                      			echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
							  }
							  ?>
                          </select>
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
                    <td>901020304</td>
                    <td>123</td>
                    <td>محمد أحمد</td>
                    <td>مدخل بيانات</td>
                    <td>0599232456</td>
                    <td>mohammed@gmail.com</td>
                    <td><span class="fa fa-check"></span></td>
                    <td><a class="btn btn-xs default" href="addemployee">
						<i class="fa fa-pencil"></i>
							تعديل
						</a></td>
                  </tr>
                  <tr>
                  	<td>&nbsp;</td>
                    <td>905060708</td>
                    <td>456</td>
                    <td>عمر حسن</td>
                    <td>باحث</td>
                    <td>0599454678</td>
                    <td>omar@gmail.com</td>
                    <td><span class="fa fa-ban"></span></td>
                    <td><a class="btn btn-xs default" href="addemployee">
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