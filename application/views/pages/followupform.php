<!-- END PAGE HEADER-->
<!-- BEGIN PAGE CONTENT-->
<?php
$page_title = "تعـــديل زيارة ";

if (isset($elder_info))
{
	foreach($elder_info as $elder_row);
}

	
	

?>

<div class="row">
    <div class="col-md-12">
      <!-- BEGIN VALIDATION STATES-->
      <div class="portlet box blue-madison">
          <div class="portlet-title">
              <div class="caption">
                  <i class="fa fa-briefcase"></i><?php echo $page_title;?>
              </div>
              <div class="tools">
                  <a href="javascript:;" class="collapse">
                  </a>
                  <a href="#portlet-config" data-toggle="modal" class="config">
                  </a>
                  <a href="javascript:;" class="reload">
                  </a>
                  <a href="javascript:;" class="remove">
                  </a>
              </div>
          </div>
          <div class="portlet-body form">
              <!-- BEGIN FORM-->
              <form action="#" id="familymemberform" class="form-horizontal">
                  <div class="form-body">
                  	<br/>
                      <div class="alert alert-danger display-hide">
                          <button class="close" data-close="alert"></button>
                          يـوجد بـعـض الادخـالات الخـاطئة، الرجـاء التأكد من القيم المدخلة
                      </div>
                      <div class="alert alert-success display-hide">
                          <button class="close" data-close="alert"></button>
							تـم عملية حـفـظ البيـانات بنجـاح !
                      </div>
                      <div>
                      
                       <input id="hdnAction" name="hdnAction" type="hidden" value="addfollowup" />
					   <input id="hdnFollowupId" name="hdnFollowupId" type="hidden" value="" />
                               
                      </div>
                       <div class="form-group">
										<label class="control-label col-md-3">رقم الهوية <span class="required">
										* </span>
										</label>
										<div class="col-md-4">
											<input type="text" id="txtElderId" name="txtElderId"  data-required="1" readonly class="form-control"  value="<?php if(isset($elder_row->elder_id)) echo $elder_row->elder_id;?>"/>
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-md-3">الاسم<span class="required">
										* </span>
										</label>
										<div class="col-md-4">
											<input type="text" id="txtName" name="txtName"  readonly class="form-control" value="<?php if(isset($elder_row->name)) echo $elder_row->name;?>"/>
										</div>
									</div>
                      <div class="table-scrollable" style="white-space: nowrap;">
                                        <table class="table table-striped table-bordered table-hover">
                                        <thead>
                                        <tr class="bg-grey-steel">
                                            <th scope="col">
                                                 #
                                            </th>
                                            <th scope="col">
                                                 تاريخ الزيارة
                                                 <span class="font-red">
                                        		* </span>
                                            </th>
                                            <th scope="col">
                                                 وقت الزيارة
                                                 <span class="font-red">
                                        		* </span>
                                            </th>
                                            <th scope="col">
                                                 وقت انتهاء الزيارة
                                            </th>
                                            <th scope="col">
                                                 الباحث
                                                 <span class="font-red">
                                        		* </span>
                                            </th>
                                            <th scope="col">
                                                 سبب الزيارة
                                                 <span class="font-red">
                                        		* </span>
                                            </th>
                                            <th scope="col">
                                                 المشاهدات
                                                 <span class="font-red">
                                        		* </span>
                                            </th>
                                            <th scope="col">
                                                 التوصيات
                                                 <span class="font-red">
                                        		* </span>
                                            </th>
                                            
                                            <th scope="col">&nbsp;
                                                 
                                            </th>
                                        </tr>
                                        <tr>
                                            <th>&nbsp;
                                                 
                                            </th>
                                            <th>
                                                 <div id="dvdpVisitdate" class="input-group date date-picker input-small margin-top-10" 
                                                      data-date-format="yyyy-mm-dd">
                                                        <input type="text" class="form-control" readonly id="dpVisitdate" name="dpVisitdate">
                                                        <span class="input-group-btn">
                                                        <button class="btn default" type="button">
                                                        <i class="fa fa-calendar"></i></button>
                                                        </span>
                                                 </div>
                                            </th>
                                            <th>
                                               	<div class="input-group">
                                                    <input type="text" id="txtVisittime" name="txtVisittime" readonly 
                                                    class="form-control timepicker timepicker-24" >
                                                    <span class="input-group-btn">
                                                    <button class="btn default" type="button"><i class="fa fa-clock-o"></i></button>
                                                 </span>
											</div> 
                                            </th>
                                            <th>
                                                 <div class="input-group">
                                                    <input type="text" id="txtVisitendtime" name="txtVisitendtime" readonly 
                                                    class="form-control timepicker timepicker-24" >
                                                    <span class="input-group-btn">
                                                    <button class="btn default" type="button"><i class="fa fa-clock-o"></i></button>
                                                 </span>
											</div>
                                            </th>
                                            <th>
                                                 <select id="drpResearcher" name="drpResearcher"
                                                 class="form-control input-sm input-xsmall" >
                                                        <option value="">اختر...</option>
                                                        <?php
                                                         foreach($followup_research_info as $row)
                                                         {
                                                            echo '<option value="'.$row->sub_constant_id.'">'
                                                                    .$row->sub_constant_name.'</option>';
                                                         }
                                                         ?>
                                                  </select>
                                            </th>
                                            
                                            <th>
                                             <textarea name="txtVisitreason" id="txtVisitreason" cols="70" rows="1" class="form-control"></textarea>
                                            </th>
                                            
                                            <th>
                                              <textarea name="txtnotes" id="txtnotes" cols="70" rows="1" class="form-control"></textarea>
                                            </th>
                                            <th>
                          <textarea name="txtRecommendation" id="txtRecommendation" cols="70" rows="1" class="form-control"></textarea>                  </th>
                                            <th>
                                                 <button id="btnAddMem" name="btnAddMem" type="button" 
                                                 class="btn btn-circle green-turquoise btn-sm" onclick="editefollowup()">
                                                <i id="iConst" class="fa fa-plus"></i></button>
                                                
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody id="tbdFollowup">
										<?php  	
                                          $i=1;
					foreach($followup_info as $row)
						{
				 
					echo "<tr>";
					echo "<td>" . $i++ . "</td>";
					echo '<td style="display:none;" id="follow_up_id_tb'.$i.'">'. $row->follow_up_id . "</td>";
					echo '<td id="visit_date_tb'.$i.'">'. $row->visit_date . "</td>";
					echo '<td id="visit_time_tb'.$i.'">'. $row->visit_time . "</td>";
					echo '<td id="visit_end_time_tb'.$i.'">'. $row->visit_end_time. "</td>";
					echo '<td style="display:none;" id="researcher_id_tb'.$i.'">'. $row->researcher_id . "</td>";
					echo '<td>'. $row->Researcher_name . "</td>";
					echo '<td id="visit_reason_tb'.$i.'">'. $row->visit_reason ."</td>";
					echo '<td id="notes_tb'.$i.'">'. $row->notes ."</td>";
					echo '<td id="recommendation_tb'.$i.'">'. $row->recommendation ."</td>";
					echo '<td><button id="btnDeletedoc" name="btnDeletedoc" type="button" 
									  class="btn btn-circle red-sunglo btn-sm" 
									  onclick="deleteFollowupbyId('. $row->follow_up_id.')">
									   <i id="iConst" class="fa fa-close"></i>
									   <button id="btnUpdatedoc" name="btnUpdatedoc" type="button" 
									  class="btn btn-circle red-sunglo btn-sm" 
									  onclick="updateFollowup('.$i.')">
									   <i id="iConst" class="fa fa-edit"></i>
							  </button></td>';
					echo "</tr>";
					
					
					
				}
?>
									    </tbody>
                                      	</table>
                        </div>
              </form>
              <!-- END FORM-->
          </div>
          <!-- END VALIDATION STATES-->
      </div>
  </div>
</div>
<!-- END PAGE CONTENT-->