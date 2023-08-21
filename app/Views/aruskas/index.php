<?= $this->extend('layout/backend') ?>

<?= $this->section('content') ?>
<title>Sistem Akuntansi &mdash; Arus Kas</title>
<?= $this->endSection() ?>


<?= $this->section('content') ?>

<section class="section">
    <div class="section-header">
        <h1>Arus Kas</h1>
    </div>

    <div class="section-body">
        <div class="card-body">
            <form action="<?=site_url('aruskas')?>" method="POST">
                <?= csrf_field()?>
                <div class="row g-3">
                    <div class="col">
                        <input type="date" class="form-control" name="tglawal" value="<?=$tglawal?>" >
                    </div>
                    <div class="col">
                        <input type="date" class="form-control" name="tglakhir" value="<?=$tglakhir?>">
                    </div>
                    <div class="col">
                        <button type="submit" class="btn btn-primary"><i class="fas fa-list"></i> Tampilkan</button>
                        <input type="submit" class="btn btn-success" formtarget="_blank" formaction="aruskas/cetakaruskaspdf" value="Cetak PDF" >
                    </div>
                </div>
            </form>
        </div>
        <div class="card-body p-4">
            <div class="table-responsive">
                <table class="table table-striped table-md" id="myTable">
                    <thead class="judul">
                        <tr>
                            <td class="text-center" rowspan="2">Tanggal</td>
                            <td class="text-center" rowspan="2">Kode Akun</td>
                            <td class="text-center" rowspan="2">Deskripsi</td>
                            <td class="text-center" colspan="2">Aktivitas Kas</td>
                            <td class="text-center" rowspan="2">Total</td>
                        </tr>
                        <tr>
                            <td class="text-center">Penerimaan</td>
                            <td class="text-center">Pengeluaran</td>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $totalPenerimaan = 0;
                        $totalPengeluaran = 0;
                        ?>
                        <?php foreach ($dttransaksi as $key => $value): ?>
                            <?php
                            // Menghitung penerimaan dan pengeluaran
                            $penerimaan = $value->jumdebit+$value->jumdebits;
                            $pengeluaran = $value->jumkredit+$value->jumkredits;

                            $totalPenerimaan += $penerimaan;
                            $totalPengeluaran += $pengeluaran;
                            ?>
                            <tr>
                                <td><?=$value->tanggal?></td>
                                <td><?=$value->kode_akun3?></td>
                                <td><?=$value->nama_akun3?></td>
                                <td class="text-right"><?= number_format($penerimaan, 0, ",", ".")?></td>
                                <td class="text-right"><?= number_format($pengeluaran, 0, ",", ".")?></td>
                                <td class="text-right"><?= number_format($penerimaan - $pengeluaran, 0, ",", ".")?></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                    <tfoot class="judul">
                        <tr>
                            <td></td>
                            <td></td>
                            <td class="text-right">Total</td>
                            <td class="text-right"><?=number_format($totalPenerimaan, 0, ",", ".")?></td>
                            <td class="text-right"><?=number_format($totalPengeluaran, 0, ",", ".")?></td>
                            <td class="text-right"><?=number_format($totalPenerimaan - $totalPengeluaran, 0, ",", ".")?></td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</section>

<?= $this->endSection() ?>
