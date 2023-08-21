<html>
    <head>
        <style type="text/css">
            .aturangka{
                text-align: right;
            }
            .aturtengah{
                text-align: center;
            }
            .aturkiri{
                text-align: left;
            }
            .judul{
                font-style: italic;
                font-size: 20px;
            }
        </style>
    </head>
    <body>
         <p class="judul">Arus Kas</p>
            Periode : <?= date('d F Y', strtotime($tglawal))." s/d ".date('d F Y', strtotime($tglakhir))?>
            <br/>
            <br/>
        <table border="0.1px" class="table table-striped" >
          <thead class="judul">
              <tr>
                  <td class="aturtengah" rowspan="2">Tanggal</td>
                  <td class="aturtengah" rowspan="2">Kode Akun</td>
                  <td class="aturtengah" rowspan="2">Deskripsi</td>
                  <td class="aturtengah" colspan="2">Aktivitas Kas</td>
                  <td class="aturtengah" rowspan="2">Total</td>
              </tr>
              <tr>
                  <td class="aturtengah">Penerimaan</td>
                  <td class="aturtengah">Pengeluaran</td>
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
                      <td class="aturangka"><?= number_format($penerimaan, 0, ",", ".")?></td>
                      <td class="aturangka"><?= number_format($pengeluaran, 0, ",", ".")?></td>
                      <td class="aturangka"><?= number_format($penerimaan - $pengeluaran, 0, ",", ".")?></td>
                  </tr>
              <?php endforeach; ?>
          </tbody>
          <tfoot class="judul">
              <tr>
                  <td></td>
                  <td></td>
                  <td class="aturangka">Total</td>
                  <td class="aturangka"><?=number_format($totalPenerimaan, 0, ",", ".")?></td>
                  <td class="aturangka"><?=number_format($totalPengeluaran, 0, ",", ".")?></td>
                  <td class="aturangka"><?=number_format($totalPenerimaan - $totalPengeluaran, 0, ",", ".")?></td>
              </tr>
          </tfoot>
          
            <br/>
            <br/>
            <?php
            $tgl=date('l,d-m-y');
            echo $tgl;
            ?>
            <br/>
            <br/>

            Pimpinan Akuntansi
<br/>
            <br/><br/>
            <br/>
            __________________
        </table>
    </body>
</html>
