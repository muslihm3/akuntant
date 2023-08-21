<?= $this->extend('layout/backend') ?>

<?= $this->section('content') ?>


 <section class="section">
          <div class="section-header">
            <!-- <h1>Blank Page</h1> -->
            <a href="<?= site_url('penyesuaian/')?>" class="btn btn-primary">Back</a>
          </div>

          <div class="section-body">
            <!-- Dinamis -->
            <div class="card">
                  <div class="card-header">
                    <h4>Edit Data penyesuaian</h4>
                  </div>
                  <div class="card-body p-4">
                    <form method="post" action="<?=site_url('penyesuaian/'.$dtpenyesuaian->id_penyesuaian.'/edit')?>">
                    <?=csrf_field()?>
                        
                        <input type="hidden" name="_method" value="PUT">
    
                        <div class="form-group">
                          <label>Tanggal</label>
                          <input type="date" class="form-control" name="tanggal" placeholder="tanggal" value="<?=$dtpenyesuaian->tanggal?>" required>
                        </div>
                        <div class="form-group">
                          <label>Deskripsi</label>
                          <input type="text" class="form-control" name="deskripsi" placeholder="Deskripsi" value="<?=$dtpenyesuaian->deskripsi?>" required>
                        </div>
                        <div class="form-group">
                          <label>Nilai</label>
                          <input type="text" class="form-control" onkeyup="hitung()" name="nilai" placeholder="Nilai" value="<?=$dtpenyesuaian->nilai?>" required>
                        </div>
                        <div class="form-group">
                          <label>Waktu</label>
                          <input type="text" class="form-control" onkeyup="hitung()" name="waktu" placeholder="Waktu" value="<?=$dtpenyesuaian->waktu?>" required>
                        </div>
                        <div class="form-group">
                          <label>Jumlah</label>
                          <input type="text" class="form-control" name="jumlah" placeholder="Jumlah" value="<?=$dtpenyesuaian->jumlah?>" readonly required>
                        </div>
                        <div class="box-body">
                          <table class="table table-bordered" id="">
                            <thead>
                              <tr>
                                <th scope="col">No</th>
                                <th scope="col">Kode Akun</th>
                                <th scope="col">Debit</th>
                                <th scope="col">Kredit</th>
                                <th scope="col">Status</th>
                                
                              </tr>
                            </thead>
                            <tbody>
                              <?php $i=0?>
                              <?php foreach($dtnilaipenyesuaian as $item):?>
                                <?php $i++ ?>
                                <tr>
                                    <td>
                                        <?=$i?>
                                    </td>
                                    <td>
                                        <select class="form-control" name="kode_akun3[]">
                                            <?php foreach ($dtakun3 as $key =>$value):?>
                                                <option value="<?=$value->kode_akun3?>"<?=$item->kode_akun3==$value->kode_akun3?'selected':null?>><?=$value->kode_akun3?> | <?=$value->nama_akun3?>
                                                </option>
                                            <?php endforeach;?>
                                                
                                        </select>
                                    </td>
                                    <td>
                                        <input type="text" class="form-control" name="debit[]"  value="<?=$item->debit?>" required>
                                    </td>
                                    <td>
                                        <input type="text" class="form-control" name="kredit[]"  value="<?=$item->kredit?>" required>
                                    </td>
                                    <td>
                                        <select class="form-control" name="id_status[]">
                                            <?php foreach ($dtstatus as $key =>$value):?>
                                                <option value="<?=$value->id_status?>"<?=$item->id_status==$value->id_status?'selected':null?>><?=$value->id_status?> | <?=$value->status?>
                                                </option>
                                            <?php endforeach;?>
                                                
                                        </select>
                                    </td>
                                </tr>
                                <input type="hidden"  id="id[]" name="id[]"  value="<?=$item->id?>">
                                <?php endforeach;?>
                               
                            </tbody>
                          </table>
                        </div>

                        <div class="form-group">
                          <button type="submit" class="btn btn-success"><i class="fas fa-paper-plane"></i> Update</button>
                          <button type="reset" class="btn btn-secondary">Reset</button>
                        </div>
                     </div>
                  </form>
                  
                </div>
          
          </div>
 </section>

<?= $this->endSection() ?>

