</div>

<footer>
    <div class="footer clearfix mb-0 text-muted">
        <div class="float-start">
            <p>2021 &copy; Ibrizal</p>
        </div>
        <div class="float-end">
            <p>Crafted with <span class="text-danger"><i class="bi bi-heart"></i></span> by <a href="http://ahmadsaugi.com">Sasajadev</a></p>
        </div>
    </div>
</footer>
</div>
</div>

<script src="<?= base_url() ?>assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="<?= base_url() ?>assets/js/bootstrap.bundle.min.js"></script>

<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<script src="<?= base_url() ?>assets/js/main.js"></script>
<script src="<?= base_url() ?>assets/vendors/chartjs/Chart.js"></script>

<!-- sweet alert2 -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- data table -->
<script src="//cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>


<!-- custom js -->
<?php if ($js) : ?>
    <script src="<?= base_url('assets/') ?>js/pages/<?= $js; ?>"></script>
<?php endif ?>


</body>

</html>