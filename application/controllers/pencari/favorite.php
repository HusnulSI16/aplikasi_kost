<?php 

/**
 * 
 */
class Favorite extends CI_controller
{
	
	public function index()
	{
		$this->load->view('pencari/_partials/head');
		$this->load->view('pencari/favorite');
		$this->load->view('pencari/_partials/footer');
	}
}

 ?>