<?php

defined('BASEPATH') or exit('No direct script access allowed');

class ModelDashboard extends CI_Model
{

    public function getDataById($id)
    {
        return $this->db->get_where('v_total', ['id_user' => $id, 'tahun_anggaran' => $this->session->tahun_anggaran, 'id_pemkot' => $this->session->id_pemkot])->result();
    }

    public function getDataByAtasan($id)
    {
        return $this->db->get_where('v_total', ['id_atasan' => $id, 'tahun_anggaran' => $this->session->tahun_anggaran, 'id_pemkot' => $this->session->id_pemkot])->result();
    }

    public function countRiskById_low($id)
    {
        $tahun_anggaran = $this->session->tahun_anggaran;
        $id_pemkot = $this->session->id_pemkot;
        $query = "SELECT * FROM v_total WHERE id_user = $id AND nilai_reskeg <=3 AND tahun_anggaran = $tahun_anggaran AND id_pemkot = $id_pemkot";
        return $this->db->query($query)->num_rows();
    }
    public function countRiskById_midle($id)
    {
        $tahun_anggaran = $this->session->tahun_anggaran;
        $id_pemkot = $this->session->id_pemkot;
        $query = "SELECT * FROM v_total WHERE id_user = $id AND nilai_reskeg > 3 AND nilai_reskeg < 8 AND tahun_anggaran = $tahun_anggaran AND id_pemkot = $id_pemkot";
        return $this->db->query($query)->num_rows();
    }
    public function countRiskById_high($id)
    {
        $tahun_anggaran = $this->session->tahun_anggaran;
        $id_pemkot = $this->session->id_pemkot;
        $query = "SELECT * FROM v_total WHERE id_user = $id AND nilai_reskeg >=9 AND tahun_anggaran = $tahun_anggaran AND id_pemkot = $id_pemkot";
        return $this->db->query($query)->num_rows();
    }

    public function countRiskByAtasan_low($id)
    {
        $tahun_anggaran = $this->session->tahun_anggaran;
        $id_pemkot = $this->session->id_pemkot;
        $query = "SELECT * FROM v_total WHERE id_atasan = $id AND nilai_reskeg <=3 AND tahun_anggaran = $tahun_anggaran AND id_pemkot = $id_pemkot";
        return $this->db->query($query)->num_rows();
    }
    public function countRiskByAtasan_midle($id)
    {
        $tahun_anggaran = $this->session->tahun_anggaran;
        $id_pemkot = $this->session->id_pemkot;
        $query = "SELECT * FROM v_total WHERE id_atasan = $id AND nilai_reskeg > 3 AND nilai_reskeg < 9 AND tahun_anggaran = $tahun_anggaran AND id_pemkot = $id_pemkot";
        return $this->db->query($query)->num_rows();
    }
    public function countRiskByAtasan_high($id)
    {
        $tahun_anggaran = $this->session->tahun_anggaran;
        $id_pemkot = $this->session->id_pemkot;
        $query = "SELECT * FROM v_total WHERE id_atasan = $id AND nilai_reskeg >=9 AND tahun_anggaran = $tahun_anggaran AND id_pemkot = $id_pemkot";
        return $this->db->query($query)->num_rows();
    }
    public function countRiskAll_low()
    {
        $tahun_anggaran = $this->session->tahun_anggaran;
        $id_pemkot = $this->session->id_pemkot;
        $query = "SELECT * FROM v_total WHERE nilai_reskeg <= 3 AND tahun_anggaran = $tahun_anggaran AND id_pemkot = $id_pemkot";
        return $this->db->query($query)->num_rows();
    }
    public function countRiskAll_midle()
    {
        $tahun_anggaran = $this->session->tahun_anggaran;
        $id_pemkot = $this->session->id_pemkot;
        $query = "SELECT * FROM v_total WHERE nilai_reskeg > 3 AND nilai_reskeg <9 AND tahun_anggaran = $tahun_anggaran AND id_pemkot = $id_pemkot";
        return $this->db->query($query)->num_rows();
    }
    public function countRiskAll_high()
    {
        $tahun_anggaran = $this->session->tahun_anggaran;
        $id_pemkot = $this->session->id_pemkot;
        $query = "SELECT * FROM v_total WHERE nilai_reskeg >=9 AND tahun_anggaran = $tahun_anggaran AND id_pemkot = $id_pemkot";
        return $this->db->query($query)->num_rows();
    }
    public function get_unitbawah()
    {
        $id_atasan = $this->session->userdata('id');
        return $this->db->get_where('user', ['id_atasan' => $id_atasan])->result_object();
    }
}
