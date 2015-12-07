			<!-- END PAGE HEADER-->
			<!-- BEGIN PAGE CONTENT-->
			<div class="row">
				<div class="col-md-12">
					 Page content goes here
                     <?php $query = $this->db->get('constant_tb');
					 		echo count($query->result());?>
              <!------------------------------------------TABLE------------------------------------------------>
  <!-- <span class="required">
                                        		* </span>
                                                
                                               <table class="table table-bordered table-striped">
                                        <thead>
                                          <tr>
                                            <th>
                                              <div class="col-md-4">
                                                 ??? ?????? 
                                              </div>
                                              <div class="col-md-6">
                                                <select id="drpElderHealth" name="drpElderHealth"
                                                   class="form-control input-sm" >
                                                    <option value="">????...</option>
                                                    <?php
                                                     /*foreach($survey_ElderHealth as $row)
                                                      {
                                                        echo '<option value="'.$row->sub_constant_id.'">'
                                                                .$row->sub_constant_name.'</option>';
                                                      }*/
                                                    ?>
                                                </select>
                                              </div>
                                              <div class="col-md-2">
                                                <button id="btnAddconstant" name="btnAddconstant" type="button" class="btn btn-circle green-turquoise btn-sm">
                                                <i id="iConst" class="fa fa-plus"></i></button> 
                                              </div>
                                            </th>
                                          </tr>
                                         </thead>
                                         <tbody id="tbdConst">
                                         
                                          
                                         </tbody>
                                         </table>-->
   <!----------------------------------------END TABLE---------------------------------------------->
				</div>
			</div>
			<!-- END PAGE CONTENT-->