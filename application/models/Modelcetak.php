<?php

defined('BASEPATH') or exit('No direct script access allowed');

class ModelCetak extends CI_Model
{
    function getTkbyid($id)
    {
        $tahun_anggaran = $this->session->tahun_anggaran;
        $id_pemkot = $this->session->id_pemkot;
        $query = "SELECT tb_tujuan_kegiatan.*, user.name FROM tb_tujuan_kegiatan JOIN user ON tb_tujuan_kegiatan.id_user = user.id WHERE user.id = $id AND tb_tujuan_kegiatan.id_pemkot = $id_pemkot AND tb_tujuan_kegiatan.tahun_anggaran = $tahun_anggaran";

        return $this->db->query($query)->result_array();
    }

    function getTkbykodeunor($kodeunor)
    {
        $tahun_anggaran = $this->session->tahun_anggaran;
        $id_pemkot = $this->session->id_pemkot;
        $query = "SELECT tb_tujuan_kegiatan.*, user.name FROM tb_tujuan_kegiatan JOIN user ON tb_tujuan_kegiatan.kode_unor = user.id WHERE user.id = $kodeunor AND tb_tujuan_kegiatan.id_pemkot = $id_pemkot AND tb_tujuan_kegiatan.tahun_anggaran = $tahun_anggaran";

        return $this->db->query($query)->result_array();
    }
    function getTkall()
    {
        $tahun_anggaran = $this->session->tahun_anggaran;
        $id_pemkot = $this->session->id_pemkot;
        $query = "SELECT tb_tujuan_kegiatan.*, tb_daftar_pemkot.nama_pemkot, user.name FROM tb_tujuan_kegiatan JOIN tb_daftar_pemkot ON tb_tujuan_kegiatan.id_pemkot = tb_daftar_pemkot.id JOIN user ON tb_tujuan_kegiatan.id_user = user.id WHERE tb_tujuan_kegiatan.id_pemkot = $id_pemkot AND tb_tujuan_kegiatan.tahun_anggaran = $tahun_anggaran";
        return $this->db->query($query)->result_array();
    }

    function getRtpbyid($id)
    {
        $tahun_anggaran = $this->session->tahun_anggaran;
        $id_pemkot = $this->session->id_pemkot;
        $query = "SELECT tb_rtp.*, v_highrisk.program, v_highrisk.kegiatan, v_highrisk.resiko, user.name FROM tb_rtp JOIN v_highrisk ON tb_rtp.id_idev = v_highrisk.id_idev JOIN user ON v_highrisk.id_user = user.id WHERE v_highrisk.id_atasan = $id AND v_highrisk.id_pemkot = $id_pemkot AND v_highrisk.tahun_anggaran = $tahun_anggaran";

        return $this->db->query($query)->result_array();
    }

    function getRtpbykodeunor($kodeunor)
    {
        $tahun_anggaran = $this->session->tahun_anggaran;
        $id_pemkot = $this->session->id_pemkot;
        $query = "SELECT tb_rtp.*, v_highrisk.program, v_highrisk.kegiatan, v_highrisk.resiko, user.name FROM tb_rtp JOIN v_highrisk ON tb_rtp.id_idev = v_highrisk.id_idev JOIN user ON v_highrisk.id_user = user.id WHERE v_highrisk.id_user = $kodeunor AND v_highrisk.id_pemkot = $id_pemkot AND v_highrisk.tahun_anggaran = $tahun_anggaran";

        return $this->db->query($query)->result_array();
    }

    function getRtpall()
    {
        $tahun_anggaran = $this->session->tahun_anggaran;
        $id_pemkot = $this->session->id_pemkot;
        $query = "SELECT tb_rtp.*, v_highrisk.program, v_highrisk.kegiatan, v_highrisk.resiko, user.name FROM tb_rtp JOIN v_highrisk ON tb_rtp.id_idev = v_highrisk.id_idev JOIN user ON v_highrisk.id_atasan = user.id WHERE v_highrisk.id_pemkot = $id_pemkot AND v_highrisk.tahun_anggaran = $tahun_anggaran ";

        return $this->db->query($query)->result_array();
    }

    //historis
    function gethistorisbyid($id)
    {

        $query = "SELECT tb_riwayat_resiko.*, user.name FROM tb_riwayat_resiko JOIN user ON tb_riwayat_resiko.id_user = user.id WHERE tb_riwayat_resiko.id_user = $id";

        return $this->db->query($query)->result_array();
    }

    function gethistorisall()
    {

        $query = "SELECT tb_riwayat_resiko.*, user.name FROM tb_riwayat_resiko JOIN user ON tb_riwayat_resiko.id_user = user.id";

        return $this->db->query($query)->result_array();
    }
    //--

    //idev
    function getidevbyid($id)
    {
        $tahun_anggaran = $this->session->tahun_anggaran;
        $id_pemkot = $this->session->id_pemkot;
        $query = "SELECT tb_idev.*, tb_tujuan_kegiatan.program,tb_tujuan_kegiatan.kegiatan, user.name FROM tb_idev JOIN tb_tujuan_kegiatan ON tb_idev.id_tk = tb_tujuan_kegiatan.id_tk JOIN user ON tb_idev.id_user = user.id WHERE tb_idev.id_atasan = $id AND tb_idev.id_pemkot = $id_pemkot AND tb_idev.tahun_anggaran = $tahun_anggaran";
        return $this->db->query($query)->result_array();
    }
    function getidevbyunor($id)
    {
        $tahun_anggaran = $this->session->tahun_anggaran;
        $id_pemkot = $this->session->id_pemkot;
        $query = "SELECT tb_idev.*, tb_tujuan_kegiatan.program,tb_tujuan_kegiatan.kegiatan, user.name FROM tb_idev JOIN tb_tujuan_kegiatan ON tb_idev.id_tk = tb_tujuan_kegiatan.id_tk JOIN user ON tb_idev.id_user = user.id WHERE tb_idev.id_user = $id AND tb_idev.id_pemkot = $id_pemkot AND tb_idev.tahun_anggaran = $tahun_anggaran";
        return $this->db->query($query)->result_array();
    }

    //---

    //realisasi
    public function get_realisasi_risiko($id)
    {
        $this->db->select('*');
        $this->db->from('tb_idev');
        $this->db->where('tb_idev.id_user', $id);
        $this->db->join('tb_tujuan_kegiatan', 'tb_idev.id_tk = tb_tujuan_kegiatan.id_tk');
        return $this->db->get()->result_array();
    }

    public function get_realisasi_rtp($id)
    {
        $this->db->select('*');
        $this->db->from('tb_idev');
        $this->db->where('tb_idev.id_user', $id);
        $this->db->join('tb_rtp', 'tb_idev.id_idev = tb_rtp.id_idev');
        $this->db->join('tb_tujuan_kegiatan', 'tb_idev.id_tk = tb_tujuan_kegiatan.id_tk');
        return $this->db->get()->result_array();
    }

    public function get_realisasi_kegiatan_opd($id)
    {
        $this->db->select('*');
        $this->db->from('tb_tujuan_kegiatan');
        $this->db->where('tb_tujuan_kegiatan.id_user', $id);
        $this->db->join('user', 'tb_tujuan_kegiatan.kode_unor = user.id');
        return $this->db->get()->result_array();
    }

    public function get_realisasi_risiko_opd($id)
    {
        $this->db->select('*');
        $this->db->from('tb_idev');
        $this->db->where('tb_idev.id_atasan', $id);
        $this->db->join('tb_tujuan_kegiatan', 'tb_idev.id_tk = tb_tujuan_kegiatan.id_tk');
        $this->db->join('user', 'tb_idev.id_user = user.id');
        return $this->db->get()->result_array();
    }

    public function get_realisasi_rtp_opd($id)
    {
        $this->db->select('*');
        $this->db->from('tb_idev');
        $this->db->where('tb_idev.id_atasan', $id);
        $this->db->join('tb_rtp', 'tb_idev.id_idev = tb_rtp.id_idev');
        $this->db->join('user', 'tb_idev.id_user = user.id');
        return $this->db->get()->result_array();
    }

    public function get_realisasi_kegiatan_all()
    {
        $this->db->select('*');
        $this->db->from('tb_tujuan_kegiatan');
        $this->db->join('user', 'tb_tujuan_kegiatan.id_user = user.id');
        return $this->db->get()->result_array();
    }
    public function get_realisasi_risiko_all()
    {
        $this->db->select('*');
        $this->db->from('tb_idev');
        $this->db->join('tb_tujuan_kegiatan', 'tb_idev.id_tk = tb_tujuan_kegiatan.id_tk');
        $this->db->join('user', 'tb_idev.id_atasan = user.id');
        return $this->db->get()->result_array();
    }

    public function get_realisasi_rtp_all()
    {
        $this->db->select('*');
        $this->db->from('tb_idev');
        $this->db->join('tb_rtp', 'tb_idev.id_idev = tb_rtp.id_idev');
        $this->db->join('user', 'tb_idev.id_atasan = user.id');
        $this->db->join('tb_tujuan_kegiatan', 'tb_idev.id_tk = tb_tujuan_kegiatan.id_tk');
        return $this->db->get()->result_array();
    }
    //---

}
