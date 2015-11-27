			<!-- END PAGE HEADER-->
			<!-- BEGIN PAGE CONTENT-->
			<div class="row">
				<div class="col-md-12">
					 Page content goes here
                     <?php $query = $this->db->get('constant_tb');
					 		echo count($query->result());?>
                <div class="form-group">
										<label class="control-label col-md-3">Without Seconds</label>
										<div class="col-md-3">
											<div class="input-group">
												<input type="text" class="form-control timepicker timepicker-no-seconds">
												<span class="input-group-btn">
												<button class="btn default" type="button"><i class="fa fa-clock-o"></i></button>
												</span>
											</div>
										</div>
									</div>
				</div>
			</div>
			<!-- END PAGE CONTENT-->