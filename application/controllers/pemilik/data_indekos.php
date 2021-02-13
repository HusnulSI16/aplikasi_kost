<?php 

/**
 * 
 */
class Data_indekos extends CI_controller
{
	
	public function index()
	{
		$data['indekos']= $this->indekos_model->get_data('indekos')->result();
		$data['kondisi']= $this->indekos_model->get_data('kondisi')->result();
		$data['fasilitas']= $this->indekos_model->get_data('fasilitas')->result();
		$data['luas']= $this->indekos_model->get_data('luas')->result();
		$this->load->view('pemilik/_partials/head');
		$this->load->view('pemilik/_partials/sidebar');
		$this->load->view('pemilik/data_indekos',$data);
		$this->load->view('pemilik/_partials/footer');
	}

	public function tambah_kos()
	{
		$data['luas']= $this->indekos_model->get_data('luas')->result();
		$data['kondisi']= $this->indekos_model->get_data('kondisi')->result();
		$data['fasilitas']= $this->indekos_model->get_data('fasilitas')->result();
		$this->load->view('pemilik/_partials/head');
		$this->load->view('pemilik/_partials/sidebar');
		$this->load->view('pemilik/tambah_indekos',$data);
		$this->load->view('pemilik/_partials/footer');
	}

	public function tambah_kos_aksi()
	{
		$this->_rules();
		if ($this->form_validation->run() == FALSE) {
			$this->tambah_kos();
		}else{
			$nama_kos				= $this->input->post('nama_kos');
			$alamat_kos				= $this->input->post('alamat_kos');
			$jenis_kos				= $this->input->post('jenis_kos');
			$harga_sewa				= $this->input->post('harga_sewa');
			$jarak_kos				= $this->input->post('jarak_kos');
			$id_luas				= $this->input->post('id_luas');
			$id_fasilitas			= $this->input->post('id_fasilitas');
			$id_kondisi				= $this->input->post('id_kondisi');
			$deskripsi				= $this->input->post('deskripsi');
			$image					= $_FILES['image']['name'];
			if ($image='') {}else{
				$config ['upload_path']  = './assets/upload';
				$config ['allowed_type'] ='jpg|jpeg|png|tiff';
				$this->load->library('upload',$config);
				if(!$this->upload->do_upload('image')){
					echo "Gambar Indekos Gagal Diupload!";
				}else{
					$image=$this->upload->data('file_name');
				}
			}
		} 

		$data = array(
			'nama_kos'				=> $nama_kos,
			'alamat_kos'			=> $alamat_kos,
			'jenis_kos'				=> $jenis_kos,
			'harga_sewa'			=> $harga_sewa,
			'jarak_kos'				=> $jarak_kos,
			'id_luas'				=> $id_luas,
			'id_fasilitas'			=> $id_fasilitas,
			'id_kondisi'			=> $id_kondisi,
			'deskripsi'				=> $deskripsi,
			'image'					=> $image
		);

		$this->indekos_model->insert_data($data,'indekos');
		$this->session->set_flashdata('pesan','Data Berhasil Ditambahkan');
		redirect('pemilik/data_indekos');

	}

	public function _rules()
	{
		$this->form_validation->set_rules('nama_kos', 'Nama Indekos', 'required');
		$this->form_validation->set_rules('alamat_kos', 'Alamat Indekos', 'required');
		$this->form_validation->set_rules('jenis_kos', 'Jenis Indekos', 'required');
		$this->form_validation->set_rules('harga_sewa', 'Harga', 'required');
		$this->form_validation->set_rules('jarak_kos', 'Jarak', 'required');
		$this->form_validation->set_rules('id_luas', 'Luas Kamar', 'required');
		$this->form_validation->set_rules('id_fasilitas', 'Fasilitas', 'required');
		$this->form_validation->set_rules('id_kondisi', 'Kondisi', 'required');
		$this->form_validation->set_rules('deskripsi', 'Deskripsi', 'required');
	}


}

?>

