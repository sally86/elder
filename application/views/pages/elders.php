<!-- END PAGE HEADER-->
<!-- BEGIN PAGE CONTENT-->
<div class="row">
	<div class="col-md-12">
      <!-- Begin: life time stats -->
      <div class="portlet">
          <div class="portlet-title">
              <div class="caption">
                  <i class="fa fa-briefcase"></i>الأعـضـــــاء
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
                  <table class="table table-striped table-bordered table-hover" id="Elderdatatable_ajax">
                  <thead>
                  <tr role="row" class="heading">
                      <th width="2%">
                          <input type="checkbox" class="group-checkable">
                      </th>
                      <th width="12%">
                           رقـم الهوية
                      </th>
                      <th width="20%">
                           اســم العضو
                      </th>
                      <th width="10%">
                           رقم الهاتف
                      </th>
                      <th width="12%">
                           رقم الجوال 1
                      </th>
                      <th width="12%">
                           رقم الجوال 2
                      </th>
                      <th width="10%">
                           المحافظة
                      </th>
                      <th width="12%">
                           حالة العضو
                      </th>
                      <th width="10%">&nbsp;
                           
                      </th>
                  </tr>
                  <tr role="row" class="filter">
                      <td>
                      </td>
                      <td>
                          <input type="text" class="form-control form-filter input-sm" id="txtElderid" name="txtElderid">
                      </td>
                      <td>
                          <input type="text" class="form-control form-filter input-sm" id="txtName" name="txtName">
                      </td>
                      <td>
                          <input type="text" class="form-control form-filter input-sm" id="txtPhone" name="txtPhone">
                      </td>
                      <td>
                          <input type="text" class="form-control form-filter input-sm" id="txtMobile1" name="txtMobile1">
                      </td>
                      <td>
                         <input type="text" class="form-control form-filter input-sm" id="txtMobile2" name="txtMobile2">
                      </td>
                      <td>
                         <select class="form-control form-filter input-sm" id="drpGovernorate" name="drpGovernorate">
                            <option value="">اختر...</option>
                            <?php
							  foreach($elder_governorate as $row)
							  {
                      			echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
							  }
							  ?>
                        </select>
                      </td>
                      <td>
                          <select id="drpisDead" name="drpisDead" class="form-control form-filter input-sm">
                              <option value="">اختر...</option>
                              <option value="1">على قيد الحياة</option>
                              <option value="0">متوفي</option>
                          </select>
                      </td>
                      <td>
                         <button class="btn btn-sm yellow filter-submit margin-bottom"><i class="fa fa-search"></i> </button>
                         <button class="btn btn-sm red filter-cancel"><i class="fa fa-times"></i> </button>
                      </td>
                  </tr>
                  </thead>
                  <tbody>
                  
                  </tbody>
                  </table>
              </div>
          </div>
      </div>
      <!-- End: life time stats -->
  </div>
</div>
<!-- END PAGE CONTENT-->