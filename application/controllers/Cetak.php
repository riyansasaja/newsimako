<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Cetak extends CI_Controller
{


    public function index()
    {
        $data['title'] = 'Cetak';
        $data['js'] = 'cetak.js';
        $this->load->view('templates/header', $data);
        $this->load->view('cetak/index');
        $this->load->view('templates/footer', $data);
    }
}
