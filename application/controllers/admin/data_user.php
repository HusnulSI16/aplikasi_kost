<?php 

/**
 * 
 */
class Data_user extends CI_controller
{
	
	public function index()
	{
		$data['user']= $this->indekos_model->get_data('user')->result();
		$data['level']= $this->indekos_model->get_data('level')->result();
		$this->load->view('admin/_partials/head');
		$this->load->view('admin/_partials/sidebar');
		$this->load->view('admin/data_user', $data);
		$this->load->view('admin/_partials/footer');
	}

	public function detail()
	{
		$this->load->view('admin/_partials/head');
		$this->load->view('admin/_partials/sidebar');
		$this->load->view('admin/detail_user');
		$this->load->view('admin/_partials/footer');
	}
}

 ?>