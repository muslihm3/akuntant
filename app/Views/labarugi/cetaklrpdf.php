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
         <p class="judul">Laba Rugi</p>
            Periode : <?= date('d F Y', strtotime($tglawal))." s/d ".date('d F Y', strtotime($tglakhir))?>
            <br/>
            <br/>
        <table border="0.1px" class="table table-striped" >
          <thead class="judul">
            <tr>
              <td class="aturtengah" rowspan="2">Kode Akun</td>
              <td class="aturtengah" rowspan="2">Deskripsi</td>
              
              <td class="aturtengah" colspan="2">Laba Rugi</td>

            </tr>
            <tr>
              
              <td class="aturtengah" rowspan="2">Pendapatan</td>
              <td class="aturtengah" rowspan="2">Beban</td>

            </tr>
          </thead>
          <tbody>
            <?php
            $td=0;
            $tk=0;

            $tdjp=0;
            $tkjp=0;

            $totd=0;
            $totk=0;

            $lb_td=0;
            $lb_tk=0;

            $totns=0;
            $totkd=0;
            ?>
            <?php foreach ($dttransaksi as $key => $value): ?>
              <?php
              // Neraca Saldo
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

              // Jurnal Penyesuaian
              $djp=$value->jumdebits;
              $kjp=$value->jumkredits;
              $neracajp = $djp-$kjp;

              if($neraca<0){
                $kreditnewjp=abs($neracajp);
                $tkjp=$tkjp+$kreditnewjp;
              } else {
                $kreditnewjp=0;
              }
              
              if($neraca>0){
                $debitnewjp=$neracajp;
                $tdjp=$tdjp+$debitnewjp;
              } else {
                $debitnewjp=0;
              }

              // NS Penyesuaian
              $ns = $debitnew-$kreditnew+$value->jumdebits-$value->jumkredits;

              if($ns>0){
                $debs=$ns;
                $totd=$totd+$debs;
              } else {
                $debs=0;
              }

              if($ns<0){
                $kres=abs($ns);
                $totk=$totk+$kres;
              } else {
                $kres=0;
              }

              // Laba Rugi
              $kode_akun=$value->kode_akun3;
              $kode=substr($kode_akun,0,1);

              if($kode==4){
                $lb_db=$debs;
                $lb_td=$lb_td+$lb_db;
              } else {
                $lb_db=0;
              }

              if($kode==5){
                $lb_kr=$kres;
                $lb_tk=$lb_tk+$lb_kr;
              } else {
                $lb_kr=0;
              }

              // Neraca
              if($kode<=3 and $ns>0){
                $nrbs=$debs;
                $totns=$totns+$nrbs;
              } else {
                $nrbs=0;
              }

              if($kode<=3 and $ns<0){
                $nrkd=abs($ns);
                $totkd=$totkd+$nrkd;
              } else {
                $nrkd=0;
              }

              

              ?>
            <tr>
              <td><?=$value->kode_akun3?></td>
              <td><?=$value->nama_akun3?></td>
              <td class="aturangka"><?= number_format( $lb_db,0,",",".")?></td>
              <td class="aturangka"><?= number_format( $lb_kr,0,",",".")?></td>
            </tr>
            <?php endforeach; ?>
          </tbody>
          <tfoot class="judul">

           <tr>
              <td></td>
              <td></td>
              <td class="aturangka"><?=number_format($lb_td,0,",",".")?></td>
              <td class="aturangka"><?=number_format($lb_tk,0,",",".")?></td>
            </tr>
            <tr class="khusus">
              <td></td>
              <td></td>
              <td class="aturtengah">Laba Rugi</td>
              <td class="aturangka"><?=number_format(($lb_td-$lb_tk),0,",",".")?></td>
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