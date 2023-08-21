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
         <p class="judul">Jurnal Umum</p>
            Periode : <?= date('d F Y', strtotime($tglawal))." s/d ".date('d F Y', strtotime($tglakhir))?>
            <br/>
            <br/>
        <table border="0.1px" class="table table-striped" >
          <thead>
            <tr>
              <th class="aturtengah">Tanggal</th>
              <th class="aturtengah">Keterangan</th>
              <th class="aturtengah">Ref</th>
              <th class="aturtengah">Debit</th>
              <th class="aturtengah">Kredit</th>
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
              <td class="aturangka"><?= number_format( $value->debit,0,",",".")?></td>
              <td class="aturangka"><?= number_format( $value->kredit,0,",",".")?></td>
            </tr>
            <?php endforeach; ?>
          </tbody>
          <tfoot class="judul">

          <tr>
            <td></td>
            <td></td>
            <td></td>
            <td class="aturangka"><?=number_format($td,0,",",".")?></td>
            <td class="aturangka"><?=number_format($tk,0,",",".")?></td>
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
