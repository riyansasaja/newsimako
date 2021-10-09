<div class="row">
    <div class="col">
        <div class="card shadow mb-4">
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <h6 class="m-0 font-weight-bold text-primary">
                    <label for="exampleFormControlSelect1">Silah Pilih Monitoring</label>
                </h6>
                <select class="form-control" id="monitoring">
                    <option value="all">--Tampilkan Semua--</option>
                    <option value="m_inputanprogram">Monitoring Program/Kegiatan</option>
                    <option value="m_inputanrisiko">Monitoring Risiko</option>
                    <option value="m_riwayatrisiko">Monitoring Riwayat Risiko</option>
                    <option value="m_inputanrtp">Monitoring RTP</option>
                    <option value="m_realisasiprogram">Monitoring Realisasi Program/Kegiatan</option>
                    <option value="m_realisasirisiko">Monitoring Realisasi Risiko</option>
                    <option value="m_realisasirtp">Monitoring Realisasi RTP</option>
                </select>
            </div>
        </div>
    </div>
</div>

<div class="show" id="m_inputanprogram">
    <div class="row animate__animated animate__headShake">
        <!-- Monitoring Input Program -->
        <div class="col">
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">Monitoring Program/Kegiatan</h6>
                </div>
                <div class="card-body">
                    <table class="table" id="monitoring_inputan_program">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">OPD</th>
                                <th scope="col">Program</th>
                                <th scope="col">Outcome</th>
                                <th scope="col">Kegiatan</th>
                                <th scope="col">Output</th>
                                <th scope="col">Tujuan</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="show" id="m_inputanrisiko">
    <div class="row animate__animated animate__headShake">
        <!-- Monitoring Input Program -->
        <div class="col">
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">Monitoring Risiko</h6>
                </div>
                <div class="card-body">
                    <table class="table table-striped" id="monitoring_inputan_risiko">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">OPD</th>
                                <th scope="col">Program</th>
                                <th scope="col">Kegiatan</th>
                                <th scope="col">Risiko</th>
                                <th scope="col">Sebab</th>
                                <th scope="col">Dampak</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="show" id="m_riwayatrisiko">
    <div class="row animate__animated animate__headShake">
        <!-- Monitoring Input Program -->
        <div class="col">
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">Monitoring Riwayat Risiko</h6>
                </div>
                <div class="card-body">
                    <table class="table table-striped" id="monitoring_riwayat_risiko">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">OPD</th>
                                <th scope="col">Kondisi</th>
                                <th scope="col">Kriteria</th>
                                <th scope="col">Detail</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="show" id="m_inputanrtp">
    <div class="row animate__animated animate__headShake">
        <!-- Monitoring Input Program -->
        <div class="col">
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">Monitoring RTP</h6>
                </div>
                <div class="card-body">
                    <table class="table" id="monitoring_inputan_rtp">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">OPD</th>
                                <th scope="col">kegiatan</th>
                                <th scope="col">Risiko</th>
                                <th scope="col">Uraian RTP</th>
                                <th scope="col">Target Waktu</th>
                                <th scope="col">PJ</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- monitoring realisasi program/kegiatan -->
<div class="show" id="m_realisasiprogram">
    <div class="row animate__animated animate__headShake">
        <!-- Monitoring Input Program -->
        <div class="col">
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">Monitoring Realisasi Program/Kegiatan</h6>
                </div>
                <div class="card-body">
                    <table class="table table-responsive" id="m_realisasi_program">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">OPD</th>
                                <th scope="col">Rencana Output</th>
                                <th scope="col">Rencana Tujuan Kegiatan</th>
                                <th scope="col">Realisasi Output</th>
                                <th scope="col">Realisasi Tujuan</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end -->

<!-- Monitoring realisasi risiko -->

<div class="show" id="m_realisasirisiko">
    <div class="row animate__animated animate__headShake">
        <!-- Monitoring Input Program -->
        <div class="col">
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">Monitoring Realisasi Risiko</h6>
                </div>
                <div class="card-body">
                    <table class="table table-responsive" id="m_realisasi_risiko">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">OPD</th>
                                <th scope="col">Kegiatan</th>
                                <th scope="col">Identifikasi Risiko</th>
                                <th scope="col">Identifikasi Sebab</th>
                                <th scope="col">Identifikasi Dampak</th>
                                <th scope="col">Realisasi Risiko</th>
                                <th scope="col">Realisasi Sebab</th>
                                <th scope="col">Realisasi dampak</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end -->


<!-- Monitoring realisasi rtp -->
<div class="show" id="m_realisasirtp">
    <div class="row animate__animated animate__headShake">
        <div class="col">
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">Monitoring Realisasi RTP</h6>
                </div>
                <div class="card-body">
                    <table class="table table-responsive" id="m_realisasi_rtp">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">OPD</th>
                                <th scope="col">Risiko</th>
                                <th scope="col">Rencana RTP</th>
                                <th scope="col">Rencana Target Waktu</th>
                                <th scope="col">Rencana PJ</th>
                                <th scope="col">Realisasi RTP</th>
                                <th scope="col">Realisasi Target Waktu</th>
                                <th scope="col">Realisasi PJ</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end -->


<!-- UPDATE 09.10.2021 -->
<!-- List Riwayat Modal -->

<div class="modal fade" id="listRiwayatDetailModal" tabindex="-1">
    <div class="modal-dialog modal-lg modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header bg-primary text-light">
                <h5 class="modal-title" id="exampleModalLabel">Detail List Riwayat <i class="fas fa-clipboard-list"></i></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </button>
            </div>
            <div class="modal-body" id="modal-isi">


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>