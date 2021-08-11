<div class="row">
    <div class="col">

        <?php $role_id = $this->session->userdata['role_id']; ?>
        <?php if ($role_id == 3) : ?>
            <a class="dropdown-item" href="<?= base_url('exportexcel/cetaktkbykodeunor/') . $this->session->userdata('id'); ?>">Cetak Program Kegiatan (excel)</a>
            <a class="dropdown-item" href="<?= base_url('exportexcelrtp/cetakrtpbykodeunor/') . $this->session->userdata('id'); ?>">Cetak RTP (excel)</a>
            <a class="dropdown-item" href="<?= base_url('exportidev/cetakidevbyunor/') . $this->session->userdata('id'); ?>">Cetak Identifikasi dan Analis Risiko (Excel)</a>
            <a class="dropdown-item" href="<?= base_url('exportrealisasiexcel/cetak_realisasi_bidang/') . $this->session->userdata('id'); ?>">Cetak Realisasi (Excel)</a>


        <?php elseif ($role_id == 2) : ?>
            <a class="dropdown-item" href="<?= base_url('exportexcel/cetaktkbyid/') . $this->session->userdata('id'); ?>">Cetak Program Kegiatan (excel)</a>
            <a class="dropdown-item" href="<?= base_url('exportexcelrtp/cetakrtpbyid/') . $this->session->userdata('id'); ?>">Cetak RTP (excel)</a>
            <a class="dropdown-item" href="<?= base_url('exportexcelhistoris/cetakhistorisbyid/') . $this->session->userdata('id'); ?>">Cetak Data Historis Risiko (Excel)</a>
            <a class="dropdown-item" href="<?= base_url('exportidev/cetakidevbyid/') . $this->session->userdata('id'); ?>">Cetak Identifikasi dan Analis Risiko (Excel)</a>
            <a class="dropdown-item" href="<?= base_url('exportrealisasiexcel/cetak_realisasi_opd/') . $this->session->userdata('id'); ?>">Cetak Realisasi (Excel)</a>

        <?php else : ?>
            <a class="dropdown-item" href="<?= base_url('exportexcel/cetaktkall/') ?>">Cetak Program Kegiatan (excel)</a>
            <a class="dropdown-item" href="<?= base_url('exportexcelrtp/cetakrtpall/') ?>">Cetak RTP (excel)</a>
            <a class="dropdown-item" href="<?= base_url('exportexcelhistoris/cetakhistorisall/') . $this->session->userdata('id'); ?>">Cetak Data Historis Risiko (Excel)</a>
            <a class="dropdown-item" href="<?= base_url('exportrealisasiexcel/cetak_realisasi_all/') ?>">Cetak Realisasi (Excel)</a>

        <?php endif; ?>


    </div>
</div>