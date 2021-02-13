<?php 

/**
 * 
 */
class Dashboard extends CI_controller
{
	
	public function index()
	{
		$this->load->view('admin/_partials/head');
		$this->load->view('admin/_partials/sidebar');
		$this->load->view('admin/dashboard');
		$this->load->view('admin/_partials/footer');
	}
}

 ?>