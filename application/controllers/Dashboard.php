<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Dashboard extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        is_logged_in();
        $this->load->model('Modeldashboard', 'dashboard');
        $this->load->model('Modelcetak', 'cetak');
    }

    public function index()
    {

        $data['title'] = 'Dashboard';
        $data['js'] = 'dashboard.js';
        $data['unitbawah'] = $this->dashboard->get_unitbawah();
        $this->load->view('templates/header', $data);
        $this->load->view('dashboard/index');
        $this->load->view('templates/footer', $data);
    }
    #====================================================
    public function get_dashboard()
    {

        $role_id = $this->session->role_id;
        $id = $this->session->id;
        $tahun_anggaran = $this->session->tahun_anggaran;
        $id_pemkot = $this->session->id_pemkot;


        if ($role_id == 3) {
            # jika Usernya Bidang
            $data = $this->dashboard->getDataById($id);
            $lowrisk = $this->dashboard->countRiskById_low($id);
            $midlerisk = $this->dashboard->countRiskById_midle($id);
            $highrisk = $this->dashboard->countRiskById_high($id);
        } else if ($role_id == 2) {
            # Jika User OPD
            $data = $this->dashboard->getDataByAtasan($id);
            $lowrisk = $this->dashboard->countRiskByAtasan_low($id);
            $midlerisk = $this->dashboard->countRiskByAtasan_midle($id);
            $highrisk = $this->dashboard->countRiskByAtasan_high($id);
        } else {
            #jika user asda atau Inspektorat
            $data = $this->db->get_where('v_total', ['id_pemkot' => $id_pemkot, 'tahun_anggaran' => $tahun_anggaran])->result();
            $lowrisk = $this->dashboard->countRiskAll_low();
            $midlerisk = $this->dashboard->countRiskAll_midle();
            $highrisk = $this->dashboard->countRiskAll_high();
        }

        $json = [
            'data' => $data,
            'lowrisk' => $lowrisk,
            'midlerisk' => $midlerisk,
            'highrisk' => $highrisk,
            'totalrisk' => count($data)
        ];

        echo json_encode($json);
    }
    #=====================

    //monitoring
    public function monitoring()
    {
        $data['title'] = 'Monitoring';
        $data['js'] = 'monitoring.js';

        $this->load->view('templates/header', $data);
        $this->load->view('dashboard/monitoring');
        $this->load->view('templates/footer', $data);
    }

    //Monitoring
    public function get_monitoring_inputan_program()
    {
        $this->db->select('*');
        $this->db->from('tb_tujuan_kegiatan');
        $this->db->join('v_list_user', 'tb_tujuan_kegiatan.id_user = v_list_user.id');
        $this->db->where('tb_tujuan_kegiatan.id_pemkot', $this->session->id_pemkot);
        $this->db->where('tb_tujuan_kegiatan.tahun_anggaran', $this->session->tahun_anggaran);
        $data['data'] =  $this->db->get()->result();
        echo json_encode($data);
    }

    public function get_monitoring_riwayat_risiko()
    {
        $this->db->select('*');
        $this->db->from('tb_riwayat_resiko');
        $this->db->join('v_list_user', 'tb_riwayat_resiko.id_user = v_list_user.id');
        $this->db->where('tb_riwayat_resiko.id_pemkot', $this->session->id_pemkot);
        $data['data'] =  $this->db->get()->result();
        echo json_encode($data);
    }


    public function get_monitoring_inputan_risiko()
    {
        $this->db->select('*');
        $this->db->from('tb_idev');
        $this->db->join('tb_tujuan_kegiatan', 'tb_idev.id_tk = tb_tujuan_kegiatan.id_tk');
        $this->db->join('v_list_user', 'tb_idev.id_atasan = v_list_user.id');
        $this->db->where('tb_tujuan_kegiatan.id_pemkot', $this->session->id_pemkot);
        $this->db->where('tb_tujuan_kegiatan.tahun_anggaran', $this->session->tahun_anggaran);
        $data['data'] =  $this->db->get()->result();
        echo json_encode($data);
    }
    public function get_monitoring_inputan_rtp()
    {
        $this->db->select('*');
        $this->db->from('tb_idev');
        $this->db->join('tb_tujuan_kegiatan', 'tb_idev.id_tk = tb_tujuan_kegiatan.id_tk');
        $this->db->join('tb_rtp', 'tb_idev.id_idev = tb_rtp.id_idev');
        $this->db->join('v_list_user', 'tb_idev.id_atasan = v_list_user.id');
        $this->db->where('tb_tujuan_kegiatan.id_pemkot', $this->session->id_pemkot);
        $this->db->where('tb_tujuan_kegiatan.tahun_anggaran', $this->session->tahun_anggaran);
        $data['data'] =  $this->db->get()->result();
        echo json_encode($data);
    }
    //----

    // m_realisasiprogram
    public function get_monitoring_realisasi_program()
    {
        $id = $this->session->id;
        $data['data'] =  $this->cetak->get_realisasi_kegiatan_all();
        echo json_encode($data);
    }
    //end

    // m_realisasirisiko
    public function get_monitoring_realisasi_risiko()
    {
        $id = $this->session->id;
        $data['data'] =  $this->cetak->get_realisasi_risiko_all();
        echo json_encode($data);
    }
    //end


    // m_realisasirisiko
    public function get_monitoring_realisasi_rtp()
    {
        $id = $this->session->id;
        $data['data'] =  $this->cetak->get_realisasi_rtp_all();
        echo json_encode($data);
    }
    //end
}
