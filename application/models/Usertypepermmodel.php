<?php
class Usertypepermmodel extends CI_Model
{
	function get_not_allowed_menue()
	{
		extract($_POST);
		
		$myquery = "SELECT mp.menu_page_id, mp.menu_id, m.menu_name, mp.page_id, p.page_title,
							(SELECT user_menu_page_id 
							   FROM user_menu_page_tb ump
							  WHERE ump.user_type_id = ".$user_type_id.
							  " AND ump.menu_page_id = mp.menu_page_id) allowed
					FROM menu_tb m, page_tb p, menu_page_tb mp
					WHERE m.menu_id = mp.menu_id
					  AND p.page_id = mp.page_id
					ORDER BY m.menu_order, p.page_order";
		
		$res = $this->db->query($myquery);
		return $res->result();
	}
}
?>