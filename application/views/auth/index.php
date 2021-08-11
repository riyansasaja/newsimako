<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Mazer Admin Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<?= base_url() ?>/assets/css/bootstrap.css">
    <link rel="stylesheet" href="<?= base_url() ?>/assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="<?= base_url() ?>/assets/css/app.css">
    <link rel="stylesheet" href="<?= base_url() ?>/assets/css/pages/auth.css">
</head>

<body>
    <div id="auth">

        <div class="container">

            <!-- Outer Row -->
            <div class="row justify-content-center">

                <div class="flash-data" data-flashdata='<?= $this->session->flashdata('message'); ?>'></div>

                <div class="col-xl-10 col-lg-12 col-md-9">

                    <div class="card o-hidden border-0 shadow-lg my-5">
                        <div class="card-body p-0">
                            <!-- Nested Row within Card Body -->
                            <div class="row animate__animated animate__fadeIn animate__slow">
                                <div class="col-lg-6 d-none d-lg-block text-right">
                                    <!-- gambar -->
                                    <img style="width: 110%;" src="<?= base_url('assets/images/') ?>bg-login.svg" alt="login pict">
                                </div>
                                <div class="col-lg-6">
                                    <div class="p-5">
                                        <div class="text-center mt-5">
                                            <h1>Selamat Datang</h1>
                                            <p class="mb-4 small">Silahkan Login untuk mengakses SIMAKO </p>
                                        </div>
                                        <form method="POST" action="" class="user">
                                            <div class="form-group mb-3">
                                                <input type="email" class="form-control form-control-user" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Enter Email Address..." name="email" required autofocus>
                                                <?= form_error('email', '<p class="text-danger text-center small">', '</p'); ?>

                                            </div>
                                            <div class="form-group mb-3">
                                                <input type="password" class="form-control form-control-user" id="exampleInputPassword" placeholder="Password" name="password" required>
                                                <?= form_error('password', '<p class="text-danger text-center small">', '</p'); ?>
                                            </div>

                                            <div class="form-group mb-3">
                                                <label for="tahunanggaran">Tahun Anggaran</label>
                                                <select class="form-control" id="tahunanggaran" name="tahun_anggaran">
                                                    <option value="<?= date('Y') - 1 ?>"><?= date('Y') - 1 ?></option>
                                                    <option value="<?= date('Y') ?>" selected><?= date('Y') ?></option>
                                                    <option value="<?= date('Y') + 1 ?>"><?= date('Y') + 1 ?></option>
                                                </select>
                                            </div>
                                            <div class="form-group mb-3">
                                                <div class="custom-control custom-checkbox small">
                                                    <input type="checkbox" class="custom-control-input" id="customCheck">
                                                    <label class="custom-control-label" for="customCheck">Ingat Saya</label>
                                                </div>
                                            </div>
                                            <div class="d-grid gap-2">
                                                <button type="submit" class="btn btn-primary">Login</button>
                                            </div>
                                        </form>
                                        <hr>
                                        <div class="text-center">
                                            <a class="small" href="#!" id="forgotPassword">Lupa Password?</a>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </div>


    </div>


    <!-- sweet alert2 -->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>


    <script>
        //script untuk tombol forgot password
        $('#forgotPassword').on('click', function(e) {
            e.preventDefault();
            Swal.fire('Hendak Reset Password ?',
                'Silahkan Hubungi Admin Asda!!'
            );
        });

        //script untuk tampilan flash data
        const flashdata = $('.flash-data').data('flashdata');
        //jika ada flash data
        if (flashdata) {
            //tampilkan swal
            Swal.fire({
                icon: 'warning',
                title: flashdata,
                showConfirmButton: false,
                timer: 2000
            })
        }
    </script>



</body>

</html>