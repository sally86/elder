			<!-- END PAGE HEADER-->
			<!-- BEGIN PAGE CONTENT-->
			<div class="row">
				<div class="col-md-12">
					 Page content goes here
                     <?php $query = $this->db->get('constant_tb');
					 		echo count($query->result());?>
				</div>
			</div>
			<!-- END PAGE CONTENT-->