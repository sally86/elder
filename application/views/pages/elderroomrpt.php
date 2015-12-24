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
                  <table class="table table-striped table-bordered table-hover" id="Elderroomrpt_ajax">
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
                           وصف السكن
                      </th>
                      <th>
                           حالة المسن مع الأسرة
                      </th>
                      <th>
                          حالة الملابس والأغطية
                      </th>
                      <th>
                          التهوية
                      </th>
                      <th>
                          الاضاءة
                      </th>
                      <th>
                           الخزانة
                      </th>
                      <th>
                           سرير وفرشة
                      </th>
                      <th>
                           مكان للأدوية
                      </th>
                      <th>
                           نظافة المسن
                      </th>
                      <th>
                           المحـــافـظــة
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
                      	 <select class="form-control form-filter input-sm" id="drpHometype" name="drpHometype">
                            <option value="">اختر...</option>
                            <?php
							  foreach($elder_hometype as $row)
							  {
                      			echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
							  }
							  ?>
                          </select>
                      </td>
                      <td>
                      	 <select class="form-control form-filter input-sm" id="drpRoomtype" name="drpRoomtype">
                            <option value="">اختر...</option>
                            <?php
							  foreach($elder_roomtype as $row)
							  {
                      			echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
							  }
							  ?>
                          </select>
                      </td>
                      <td>
                          <select class="form-control form-filter input-sm" id="drpClothes" name="drpClothes">
                            <option value="">اختر...</option>
                            <?php
							  foreach($elder_clothes as $row)
							  {
                      			echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
							  }
							  ?>
                        </select>
                      </td>
                      <td>
                          <select class="form-control form-filter input-sm" id="drpVentilation" name="drpVentilation">
                            <option value="">اختر...</option>
                            <?php
							  foreach($elder_ventilation as $row)
							  {
                      			echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
							  }
							  ?>
                        </select>
                      </td>
                      <td>
                          <select class="form-control form-filter input-sm" id="drpLighting" name="drpLighting">
                            <option value="">اختر...</option>
                            <?php
							  foreach($elder_lighting as $row)
							  {
                      			echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
							  }
							  ?>
                        </select>
                      </td>
                      <td>
                          <select class="form-control form-filter input-sm" id="drpCloset" name="drpCloset">
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
                         <select class="form-control form-filter input-sm" id="drpBed" name="drpBed">
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
                         <select class="form-control form-filter input-sm" id="drpCupboard" name="drpCupboard">
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
                         <select class="form-control form-filter input-sm" id="drpHigiene" name="drpHigiene">
                            <option value="">اختر...</option>
                            <?php
							  foreach($elder_higiene as $row)
							  {
                      			echo '<option value="'.$row->sub_constant_id.'">'.$row->sub_constant_name.'</option>';
							  }
							  ?>
                        </select>
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