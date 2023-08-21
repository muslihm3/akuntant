<?= $this->extend('layout/backend') ?>

<?= $this->section('content') ?>
<title>Sistem Akuntansi &mdash; Jurnal Umum</title>
<?= $this->endSection() ?>


<?= $this->section('content') ?>

 <section class="section">
          <div class="section-header">
            <h1>Laporan Jurnal Umum</h1>
          </div>

          <div class="section-body">
            <div class="card-body">
              <form action="<?=site_url('jurnalumum')?>" method="POST">
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
                    <input type="submit" class="btn btn-success" formtarget="_blank" formaction="jurnalumum/cetakjupdf" value="Cetak PDF" >
                  </div>
                </div>
              </form>
            </div>
            <div class="card-body p-4">
              <div class="table-responsive">
                <table class="table table-striped table-md" id="myTable">
                  <thead class="judul">
                    <tr>
                      <td class="text-left" rowspan="2">Tanggal</td>
                      <td class="text-left" rowspan="2">Keterangan</td>
                      <td class="text-left" rowspan="2">Ref</td>
                    
                    </tr>
                    <tr>
                      
                      <td class="text-right" rowspan="2">Debit</td>
                      <td class="text-right" rowspan="2">Kredit</td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php
                    $td=0;
                    $tk=0;
                    ?>
                    <?php foreach ($dttransaksi as $key => $value): ?>
                       <?php
                      $td += $value->debit;
                      $tk += $value->kredit;
                    ?>
                    <tr>
                      <td><?=$value->tanggal?></td>
                      <td><?=$value->nama_akun3?></td>
                      <td><?=$value->kode_akun3?></td>
                      <td class="text-right"><?= number_format( $value->debit,0,",",".")?></td>
                      <td class="text-right"><?= number_format( $value->kredit,0,",",".")?></td>
                    </tr>
                    <?php endforeach; ?>
                  </tbody>
                  <tfoot class="judul">

                  <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td class="text-right"><?=number_format($td,0,",",".")?></td>
                    <td class="text-right"><?=number_format($tk,0,",",".")?></td>
                  </tr>
                  </tfoot>
                </table>
              </div>
            </div>
          </div>
 </section>

<?= $this->endSection() ?>

