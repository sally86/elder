<!-- END PAGE HEADER-->
<!-- BEGIN PAGE CONTENT-->
<div class="row">
	<div class="col-md-12">
      <!-- Begin: life time stats -->
      <div class="portlet">
          <div class="portlet-title">
              <div class="caption">
                  <i class="fa fa-briefcase"></i>تقرير حالة الأسرة مع المسن 
              </div>
          </div>
          <div class="portlet-body">
              <div class="table-container">
                  <div class="table-actions-wrapper">
                      <span>
                      </span>
                      <button class="btn btn-sm yellow table-group-action-submit"><i class="fa fa-check"></i> طباعة</button>
                  </div>
                  <table class="table table-striped table-bordered table-hover" id="Familyelderrelationrpt_ajax">
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
                      <th width="10%">
                           احترام متبادل
                      </th>
                      <th width="20%">
                           اهتــمام
                      </th>
                      <th>
                           الدعم النفسي
                      </th>
                      <th>
                           توفير الاحتياجات
                      </th>
                      <th>
                           مــنبــوذ
                      </th>
                      <th>
                           حالة أسرة المسن الإجتماعية و النفسية 
                      </th>
                      <th>
                          علاقة المسن بالأسرة والمجتمع المحلي
                      </th>
                      <th>
                           سبب النبذ
                      </th>
                      <th>
                          تعاون الأسرة مع الباحث 
                      </th>
                      <th>
                           جهة  الإستعانة
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
                      	 <select class="form-control form-filter input-sm" id="drpRespect" name="drpRespect">
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
                      	 <select class="form-control form-filter input-sm" id="drpCare" name="drpCare">
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
                         <select class="form-control form-filter input-sm" id="drpPsychologicalsupport" name="drpPsychologicalsupport">
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
                        <select class="form-control form-filter input-sm" id="drpProvisionneeds" name="drpProvisionneeds">
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
                          <select class="form-control form-filter input-sm" id="drpPariah" name="drpPariah">
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
                          <select class="form-control form-filter input-sm" id="drpPsychologicalstatus" name="drpPsychologicalstatus">
                            <option value="">اختر...</option>
                            <?php
							  foreach($elder_psychologicalstatus as $row)
							  {
                      			echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
							  }
							  ?>
                        </select>
                      </td>
                      <td>
                          <select class="form-control form-filter input-sm" id="drpElderbehaviour" name="drpElderbehaviour">
                            <option value="">اختر...</option>
                            <?php
							  foreach($elder_elderbehaviour as $row)
							  {
                      			echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
							  }
							  ?>
                        </select>
                      </td>
                      <td>
                          <select class="form-control form-filter input-sm" id="drpElderpariah" name="drpElderpariah">
                            <option value="">اختر...</option>
                            <?php
							  foreach($elder_elderpariah as $row)
							  {
                      			echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
							  }
							  ?>
                        </select>
                      </td>
                      <td>
                          <select class="form-control form-filter input-sm" id="drpIscooperative" name="drpIscooperative">
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
                         <input type="text" class="form-control form-filter input-sm" id="txtCooperativepersonename" name="txtCooperativepersonename">
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