<?php 

/**
 * 
 */
class Profil extends CI_controller
{
	
	public function index()
	{
		$this->load->view('admin/_partials/head');
		$this->load->view('admin/_partials/sidebar');
		$this->load->view('admin/profil');
		$this->load->view('admin/_partials/footer');
	}
}

 ?>