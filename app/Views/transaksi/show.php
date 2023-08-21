<?= $this->extend('layout/backend') ?>

<?= $this->section('content') ?>


 <section class="section">
          <div class="section-header">
            <!-- <h1>Blank Page</h1> -->
            <a href="<?= site_url('transaksi/')?>" class="btn btn-primary">Back</a>
          </div>

          <div class="section-body">
            <!-- Dinamis -->
            <div class="card">
            <div class="card-header">
              <h4>Detail Data Transaksi</h4>
            </div>
            <div class="card-body p-4">
              <table >
                <tr>
                  <td scope="col">No Kwitansi</td>
                  <td scope="col">:</td>
                  <td scope="col"><?=$dttransaksi->kwitansi?></td> 
                </tr>
                  <tr>
                  <td scope="col">Tanggal</td>
                  <td scope="col">:</td>
                  <td scope="col"><?=$dttransaksi->tanggal?></td> 
                </tr>
                <tr>
                  <td scope="col">Deskripsi</td>
                  <td scope="col">:</td>
                  <td scope="col"><?=$dttransaksi->deskripsi?></td> 
                </tr>
                <tr>
                  <td scope="col">Keterangan Jurnal</td>
                  <td scope="col">:</td>
                  <td scope="col"><?=$dttransaksi->ketjurnal?></td> 
                </tr> 
                </table>
               
               
                <table class="table table-bordered" id="">
                  <thead>
                    <tr>
                      <th>No</th>
                      <th>Kode Akun</th>
                      <th>Nama Akun</th>
                      <th>Debit</th>
                      <th>Kredit</th>
                      <th>Status</th>
                    </tr>
                  </thead>
                   <tbody>
                    <?php foreach ($dtnilai as $key => $item):?>
                      <tr>
                        <td>
                          <?= $key+1?>
                        </td>
                        <td>
                          <?= $item->kode_akun3?>
                        </td>
                        <td>
                          <?= $item->nama_akun3?>
                        </td>
                        <td class="text-right">
                          <?= number_format( $item->debit,0,",",".")?>
                        </td>
                        <td>
                          <?= number_format( $item->kredit,0,",",".")?>
                        </td>
                        <td>
                          <?= $item->status?>
                        </td>

                      </tr>
                    <?php endforeach;?> 
                  </tbody> 
                </table>
            </div>
          </div>

 </section>

<?= $this->endSection() ?>

