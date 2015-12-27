<!-- END PAGE HEADER-->
<!-- BEGIN PAGE CONTENT-->
<div class="row">
	<div class="col-md-12">
      <!-- Begin: life time stats -->
      <div class="portlet">
          <div class="portlet-title">
              <div class="caption">
                  <i class="fa fa-briefcase"></i>تقرير احصائي بأعداد الأعضاء و الملفات 
              </div>
          </div>
          <div class="portlet-body">
              <div class="table-container">
                  <div class="table-actions-wrapper">
                      <span>
                      </span>
                      <button class="btn btn-sm yellow table-group-action-submit"><i class="fa fa-check"></i> طباعة</button>
                  </div>
                  <table class="table table-striped table-bordered table-hover" id="Aidrecomendationrpt_ajax">
                  	<tr>
                      <th width="20%">
                          عــدد الوفيـــات
                      </th>
                      <td>
                       <?php 
						   foreach($dead as $row)
							echo $row->dead;
						?>
                      </td>
                    </tr>
                    <?php 
					   foreach($file as $row)
					   {
						   echo '<tr>';
						   echo '<th width="20%"> عدد الملفات بحالة ('.$row->file_status.")</th>";
						   echo '<td>'.$row->file_count."</td>";
						   echo '</tr>';
					   }
					?>
                    
                  </table>
              </div>
          </div>
      </div>
      <!-- End: life time stats -->
  </div>
</div>
<!-- END PAGE CONTENT-->