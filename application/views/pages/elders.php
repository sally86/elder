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
                  <table class="table table-striped table-bordered table-hover" id="datatable_ajax">
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
                         <select class="form-control select2me" id="drpGovernorate" name="drpGovernorate">
                            <option value="">اختر...</option>
                            <option value="pending">الشمال</option>
                            <option value="closed">غزة</option>
                            <option value="closed">الوسطى</option>
                            <option value="closed">خانيونس</option>
                            <option value="closed">رفح</option>
                        </select>
                      </td>
                      <td>
                          <select id="isDead" name="isDead" class="form-control form-filter input-sm">
                              <option value="">اختر...</option>
                              <option value="pending">على قيد الحياة</option>
                              <option value="closed">متوفي</option>
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
                    <td>أحمد محمد أحمد حسين</td>
                    <td>2822345</td>
                    <td>0599112456</td>
                    <td>0599232456</td>
                    <td>غزة</td>
                    <td>&nbsp;</td>
                    <td><a class="btn btn-xs default" href="openfile">
						<i class="fa fa-pencil"></i>
							تعديل
						</a></td>
                  </tr>
                  <tr>
                  	<td>&nbsp;</td>
                    <td>905060708</td>
                    <td>عمر حسن علي موسى</td>
                    <td>2033345</td>
                    <td>0599454678</td>
                    <td>0599224678</td>
                    <td>الوسطى</td>
                    <td>01/02/2015</td>
                    <td><a class="btn btn-xs default" href="openfile">
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