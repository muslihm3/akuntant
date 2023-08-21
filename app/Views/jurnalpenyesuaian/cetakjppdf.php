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
         <p class="judul">Jurnal Penyesuaian</p>
            Periode : <?= date('d F Y', strtotime($tglawal))." s/d ".date('d F Y', strtotime($tglakhir))?>
            <br/>
            <br/>
        <table border="0.1px" class="table table-striped" >
          <thead class="judul">
            <tr>
              <td class="aturtengah" rowspan="2">Kode</td>
              <td class="aturtengah" rowspan="2">Keterangan</td>
              <td class="aturtengah" colspan="2">Jurnal Penyesuaian</td>
            </tr>
            <tr>
              <td class="aturtengah">Debit</td>
              <td class="aturtengah">Kredit</td>
            </tr>
          </thead>
          <tbody>
            <?php
            $td=0;
            $tk=0;
            ?>
            <?php foreach ($dttransaksi as $key => $value): ?>
              <?php
              $d=$value->jumdebit;
              $k=$value->jumkredit;
              $neraca=$d-$k;

              if($neraca<0){
                $kreditnew=abs($neraca);
                $tk=$tk+$kreditnew;
              } else {
                $kreditnew=0;
              }
              if($neraca>0){
                $debitnew=$neraca;
                $td=$td+$debitnew;
              } else {
                $debitnew=0;
              }
              ?>

            <tr>
              <td><?=$value->kode_akun3?></td>
              <td><?=$value->nama_akun3?></td>
              <td class="aturangka"><?= number_format( $debitnew,0,",",".")?></td>
              <td class="aturangka"><?= number_format( $kreditnew,0,",",".")?></td>
            </tr>
            <?php endforeach; ?>
          </tbody>
          <tfoot class="judul">

          <tr>
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
