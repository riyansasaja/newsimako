$(document).ready(function () {

    // const path = window.location.href;
    const path = './'
    console.log(path);

    // ---tampil data table
    let table_dashboard = $('#table_dashboard').DataTable({
        "ajax": `${path}/get_dashboard`,
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
            { "data": "output" },
            { "data": "nilai_reskeg" }
        ],

        rowCallback: function (row, data, index) {
            if (data.nilai_reskeg > 3) {
                $('td', row).addClass('text-warning')
            }
            if (data.nilai_reskeg > 8) {
                $('td', row).addClass('text-danger')
            } else {
                $('td', row).addClass('text-success')
            }
        }
    });
    // ------

    //untuk tampilan chart
    $.ajax({
        type: "GET",
        url: `${path}/get_dashboard`,
        dataType: "json",
        success: function (response) {
            //chart
            var ctx = $('#programChart');
            var myChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: ['Risiko Rendah (1-3)', 'Risiko Sedang (3<R<9)', 'Risiko Tinggi (9-16)'],
                    datasets: [{
                        label: '# Chart Nilai Risiko Kegiatan',
                        data: [response.lowrisk, response.midlerisk, response.highrisk],
                        backgroundColor: [
                            'rgba(50, 168, 82, 0.5)',
                            'rgba(242, 181, 27, 0.5)',
                            'rgba(255, 99, 132, 0.5)'
                        ],
                        borderColor: [
                            'rgba(50, 168, 82, 1)',
                            'rgba(242, 181, 27, 1)',
                            'rgba(255, 99, 132, 1)'
                        ],
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        yAxes: [{
                            ticks: {
                                beginAtZero: true
                            }
                        }]
                    }
                }
            });
        }
    });
});