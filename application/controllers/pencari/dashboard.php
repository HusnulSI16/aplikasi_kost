<?php 

/**
 * 
 */
class Dashboard extends CI_controller
{
	
	public function index()
	{
		$this->load->view('pencari/_partials/head');
		$this->load->view('pencari/dashboard');
		$this->load->view('pencari/_partials/footer');
	}
}

 ?>