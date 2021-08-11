<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Auth extends CI_Controller
{

    public function index()
    {

        $this->form_validation->set_rules('email', 'Email', 'required|trim|valid_email', [
            'valid_email' => 'Must be Valid Email!'
        ]);
        $this->form_validation->set_rules('password', 'password', 'required|trim|min_length[3]', [
            'min_length' => 'Min Pass 3 Characters'
        ]);


        if ($this->form_validation->run() == FALSE) {
            $this->load->view('auth/index');
        } else {
            $this->_login();
        }
    }
    #==================================================================
    private function _login()
    {
        $email = $this->input->post('email', true);
        $password = $this->input->post('password', true);
        $user = $this->db->get_where('user', ['email' => $email])->row_array();

        //jika ada usernya
        if ($user) {
            # cek usernya aktif atau tidak
            if ($user['is_active'] == 1) {
                # cek password
                if (password_verify($password, $user['password'])) {
                    # ambil data untuk disimpan di session
                    $data = [
                        'id' => $user['id'],
                        'id_pemkot' => $user['id_pemkot'],
                        'name' => $user['name'],
                        'alias' => $user['alias'],
                        'email' => $user['email'],
                        'id_atasan' => $user['id_atasan'],
                        'role_id' => $user['role_id'],
                        'tahun_anggaran' => $this->input->post('tahun_anggaran')
                    ];
                    #buat session
                    $this->session->set_userdata($data);
                    redirect('dashboard');
                } else {
                    # jia password salah
                    $this->session->set_flashdata('message', 'Maaf Pasword Salah!');
                    redirect('auth');
                }
            } else {
                # jika email tidak aktif
                $this->session->set_flashdata('message', 'Maaf email ini belum diaktifkan!');
                redirect('auth');
            }
        } else {
            # jika tidak ada user
            $this->session->set_flashdata('message', 'Maaf Email tidak terdaftar!');
            redirect('auth');
        }
    }
    #=====================================================

    public function logout()
    {

        $this->session->unset_userdata('email');
        $this->session->unset_userdata('role_id');
        $this->session->set_flashdata('message', 'Anda Telah Logout!');
        redirect('auth/');
    }
    #=====================================================
    public function blocked()
    {
        $this->load->view('auth/blocked/');
    }
    #=====================================================
}
