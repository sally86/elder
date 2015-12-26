<!-- END PAGE HEADER-->
<!-- BEGIN PAGE CONTENT-->
<div class="row">
	<div class="col-md-12">
      <!-- Begin: life time stats -->
      <div class="portlet">
          <div class="portlet-title">
              <div class="caption">
                  <i class="fa fa-briefcase"></i>تقرير وصف سكن كبير السن
              </div>
          </div>
          <div class="portlet-body">
              <div class="table-container">
                  <div class="table-actions-wrapper">
                      <span>
                      </span>
                      <button class="btn btn-sm yellow table-group-action-submit"><i class="fa fa-check"></i> طباعة</button>
                  </div>
                  <table class="table table-striped table-bordered table-hover" id="Lifeimprovementerpt_ajax">
                  <thead>
                  <tr role="row" class="heading">
                      <th width="2%">
                          <input type="checkbox" class="group-checkable">
                      </th>
                      <th>
                           رقـم الملف
                      </th>
                      <th>
                           اســم العضو
                      </th>
                      <th>
                           الهاتف
                      </th>
                      <th>
                           جوال 1
                      </th>
                      <th>
                           جوال 2
                      </th>
                      <th>
                           قدرة المسن على العمل 
                      </th>
                      <th>
                           طبيعة العمل المطلوب
                      </th>
                      <th>
                          امكانية تشغيل أحد أفراد الأسرة
                      </th>
                      <th>
                          طبيعة العمل 
                      </th>
                      <th>
                          نوع التدريب المطلوب
                      </th>
                      <th>
                           عمل مشروع
                      </th>
                      <th>
                           طبيعة المشروع
                      </th>
                      <th>
                           التكلفة
                      </th>
                      <th>&nbsp;
                           
                      </th>
                  </tr>
                  <tr id="trNoprint" role="row" class="filter">
                      <td>
                      </td>
                      <td>
                          <input type="text" class="form-control form-filter input-sm" id="txtFileid" name="txtFileid">
                      </td>
                      <td>
                          <input type="text" class="form-control form-filter input-sm" id="txtElderName" name="txtElderName">
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
                      	 <select class="form-control form-filter input-sm" id="drpWorkability" name="drpWorkability">
                            <option value="">اختر...</option>
                            <?php
							  foreach($elder_elderWorkAbility as $row)
							  {
                      			echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
							  }
							  ?>
                          </select>
                      </td>
                       <td>
                         <input type="text" class="form-control form-filter input-sm" id="txtWorktype" name="txtWorktype">
                      </td>
                      <td>
                      	 <select class="form-control form-filter input-sm" id="drpFamilymember" name="drpFamilymember">
                            <option value="">اختر...</option>
                            <?php
							  foreach($elder_familyMember as $row)
							  {
                      			echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
							  }
							  ?>
                          </select>
                      </td>
                      <td>
                          <select class="form-control form-filter input-sm" id="drpNeedtraining" name="drpNeedtraining">
                            <option value="">اختر...</option>
                            <?php
							  foreach($elder_choice as $row)
							  {
                      			echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
							  }
							  ?>
                        </select>
                      </td>
                      <td>
                          <input type="text" class="form-control form-filter input-sm" id="txtTrainingtype" name="txtTrainingtype">
                      </td>
                      <td>
                          <select class="form-control form-filter input-sm" id="drpStartproject" name="drpStartproject">
                            <option value="">اختر...</option>
                            <?php
							  foreach($elder_choice as $row)
							  {
                      			echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
							  }
							  ?>
                        </select>
                      </td>
                      <td>
                        <input type="text" class="form-control form-filter input-sm" id="txtProjecttype" name="txtProjecttype">
                      </td>
                      <td>
                        <input type="text" class="form-control form-filter input-sm" id="txtProjebudget" name="txtProjebudget">
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