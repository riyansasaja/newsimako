$(document).ready(function () {



    var pathArray = window.location.pathname.split( '/' );
    const base_url = window.location.origin;
    const prepath = `${base_url}/${pathArray[1]}`;
    const path = `${prepath}/dashboard/`;

    let monitoring_inputan_program = $('#monitoring_inputan_program').DataTable({
        "ajax": `${path}get_monitoring_inputan_program`,
        "columns": [
            {
                "data": null, "sortable": false,
                render: function (data, type, row, meta) {
                    return meta.row + meta.settings._iDisplayStart + 1;
                }
            },
            { "data": "name" },
            { "data": "program" },
            { "data": "outcome" },
            { "data": "kegiatan" },
            { "data": "output" },
            { "data": "tujuan" }
        ]
    });


    let monitoring_inputan_risiko = $('#monitoring_inputan_risiko').DataTable({
        "ajax": `${path}get_monitoring_inputan_risiko`,
        "columns": [
            {
                "data": null, "sortable": false,
                render: function (data, type, row, meta) {
                    return meta.row + meta.settings._iDisplayStart + 1;
                }
            },
            { "data": "name" },
            { "data": "program" },
            { "data": "kegiatan" },
            { "data": "resiko" },
            { "data": "sebab" },
            { "data": "dampak" }
        ]
    });


    //========UPDATE 09.10.2021=======
    let monitoring_riwayat_risiko = $('#monitoring_riwayat_risiko').DataTable({
        "ajax": `${path}get_monitoring_riwayat_risiko`,
        "columns": [
            {
                "data": null, "sortable": false,
                render: function (data, type, row, meta) {
                    return meta.row + meta.settings._iDisplayStart + 1;
                }
            },
            { "data": "name" },
            { "data": "kondisi" },
            { "data": "kriteria" },
            { "data": null,
            "defaultContent": `<a href="javascript:;" id='view' class="badge rounded-pill bg-primary item_view"'>Detail</a>` }
        ]
    });

    let monitoring_inputan_rtp = $('#monitoring_inputan_rtp').DataTable({
        "ajax": `${path}get_monitoring_inputan_rtp`,
        "columns": [
            {
                "data": null, "sortable": false,
                render: function (data, type, row, meta) {
                    return meta.row + meta.settings._iDisplayStart + 1;
                }
            },
            { "data": "name" },
            { "data": "kegiatan" },
            { "data": "resiko" },
            { "data": "uraian_rtp" },
            { "data": "target_waktu" },
            { "data": "pj" }
        ]
    });

    //monitoring realisasi program
    let monitoring_realisasi_program = $('#m_realisasi_program').DataTable({
        "ajax": `${path}get_monitoring_realisasi_program`,
        "columns": [
            {
                "data": null, "sortable": false,
                render: function (data, type, row, meta) {
                    return meta.row + meta.settings._iDisplayStart + 1;
                }
            },
            { "data": "name" },
            { "data": "output" },
            { "data": "tujuan" },
            { "data": "realisasi_output_kegiatan" },
            { "data": "realisasi_tujuan_kegiatan" }
        ]
    });
    //end

    //monitoring realisasi risiko
    let monitoring_realisasi_risiko = $('#m_realisasi_risiko').DataTable({
        "ajax": `${path}get_monitoring_realisasi_risiko`,
        "columns": [
            {
                "data": null, "sortable": false,
                render: function (data, type, row, meta) {
                    return meta.row + meta.settings._iDisplayStart + 1;
                }
            },
            { "data": "name" },
            { "data": "kegiatan" },
            { "data": "resiko" },
            { "data": "sebab" },
            { "data": "dampak" },
            { "data": "realisasi_resiko" },
            { "data": "realisasi_sebab" },
            { "data": "realisasi_dampak" }
        ]
    });
    //end

    //monitoring realisasi rtp
    let monitoring_realisasi_rtp = $('#m_realisasi_rtp').DataTable({
        "ajax": `${path}get_monitoring_realisasi_rtp`,
        "columns": [
            {
                "data": null, "sortable": false,
                render: function (data, type, row, meta) {
                    return meta.row + meta.settings._iDisplayStart + 1;
                }
            },
            { "data": "name" },
            { "data": "resiko" },
            { "data": "uraian_rtp" },
            { "data": "target_waktu" },
            { "data": "pj" },
            { "data": "realisasi_uraian" },
            { "data": "realisasi_target_waktu" },
            { "data": "realisasi_pj" }
        ]
    });
    //end



    //panggil ajax per 6detik
    setInterval(function () { monitoring_inputan_program.ajax.reload() }, 6000);
    setInterval(function () { monitoring_inputan_risiko.ajax.reload() }, 6000);


    //menampilkan row berdasarkan pilihan

    $('select').on('change', function () {
        $('.show').attr('class', 'show d-none');
        $(`#${this.value}`).attr('class', 'show');
        if (this.value == 'all') {
            $('.show').attr('class', 'show');
        }
    });
    //--end

    //=========UPDATE 09.10.2021 ==========
    //item view - Monitoring_riwayat_risiko
    $('#monitoring_riwayat_risiko').on('click', '.item_view', function () {
        let data = monitoring_riwayat_risiko.row($(this).parents('tr')).data();
        $('#listRiwayatDetailModal').modal('show');
        let text = `<ul class="list-group">
        <li class="list-group-item">
            <h5 class="text-primary">Kondisi</h5>
            ${data.kondisi}
        </li>
        <li class="list-group-item">
            <h5 class="text-primary">Kriteria</h5>
            ${data.kriteria}
        </li>
        <li class="list-group-item">
            <h5 class="text-primary">Sebab Uraian</h5>
            ${data.sebab_uraian}
        </li>
        <li class="list-group-item">
            <h5 class="text-primary">Akibat</h5>
            ${data.akibat}
        </li>
        <li class="list-group-item">
            <h5 class="text-primary">Saran</h5>
            ${data.saran}
        </li>
        <li class="list-group-item">
            <h5 class="text-primary">Sumber Data</h5>
            ${data.sumber_data}
        </li>
        <li class="list-group-item">
            <h5 class="text-primary">Pernyataan Risiko</h5>
            ${data.pernyataan_resiko}
        </li>
        <li class="list-group-item">
            <h5 class="text-primary">Sebab</h5>
            ${data.sebab}
        </li>
        <li class="list-group-item">
            <h5 class="text-primary">Dampak</h5>
            ${data.dampak}
    </ul>`

        $('#modal-isi').html(text);


    });

    //---end

});