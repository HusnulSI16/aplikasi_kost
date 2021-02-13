<?php 

/**
 * 
 */
class Data_indekos extends CI_controller
{
	
	public function index()
	{
		$data['indekos']= $this->indekos_model->get_data('indekos')->result();
		$data['level']= $this->indekos_model->get_data('level')->result();
		$data['kondisi']= $this->indekos_model->get_data('kondisi')->result();
		$data['fasilitas']= $this->indekos_model->get_data('fasilitas')->result();
		$data['user']= $this->indekos_model->get_data('user')->result();
		$this->load->view('admin/_partials/head');
		$this->load->view('admin/_partials/sidebar');
		$this->load->view('admin/data_indekos',$data);
		$this->load->view('admin/_partials/footer');
	}

	public function detail()
	{
		$this->load->view('admin/_partials/head');
		$this->load->view('admin/_partials/sidebar');
		$this->load->view('admin/detail_indekos');
		$this->load->view('admin/_partials/footer');
	}


}

 ?>