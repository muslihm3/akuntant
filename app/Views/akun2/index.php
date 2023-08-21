<?= $this->extend('layout/backend') ?>

<?= $this->section('content') ?>
<title>Sistem Akuntansi &mdash; Akun 2</title>
<?= $this->endSection() ?>


<?= $this->section('content') ?>

 <section class="section">
          <div class="section-header">
            <!-- <h1>Blank Page</h1> -->
            <a href="<?= site_url('akun2/new')?>" class="btn btn-primary">Add New</a>
          </div>

          <!-- Menangkap session input data -->
<?php if (session()->getFlashdata('success')) : ?>
<div class="alert alert-success alert-dismissible fade show">
  <div class="alser-body">
    <button class="close" data-dissmiss="alert"> <span aria-hidden="true">&times;</span></button>
    <?=session()->getFlashdata('success');?>
  </div>
</div>
<?php endif; ?>
<?php if (session()->getFlashdata('error')) :?>
<div class="alert alert-danger alert-dismissible show">
  <div class="alser-body">
    <button class="close" data-dissmiss="alert"> <span aria-hidden="true">&times;</span></button>
    <?=session()->getFlashdata('error')?>
  </div>
</div>
<?php endif; ?>
          <div class="section-body">
            <!-- Dinamis -->
            <div class="card">
                  <div class="card-header">
                    <h4>Data Akun 2</h4>
                  </div>
                  <div class="card-body p-4">
                    <div class="table-responsive">
                      <table class="table table-striped table-md" id="myTable">
                        <thead>
                          <tr>
                            <th>No</th>
                            <th>Kode Akun 2</th>
                            <th>Nama Akun 2</th>
                            <th>Nama Akun 1</th>
                            <th>Action</th>
                          </tr>
                        </thead>
                        <tbody>
                          <?php foreach ($dtakun2 as $key => $value): ?>
                          <tr>
                            <td><?=$key+1?></td>
                            <td><?=$value->kode_akun2?></td>
                            <td><?=$value->nama_akun2?></td>
                            <td><?=$value->nama_akun1?></td>
                            <td class="text-center" style="width:15%">
                              <a href="<?= site_url('akun2/'. $value->id_akun2).'/edit' ?>" class="btn btn-warning btn-sm"><i class="fas fa-pencil-alt btn-small"></i>Edit</a>
                              <form action="<?=site_url('akun2/'.$value->id_akun2)?>" method="post" id="del<?=$value->id_akun2?>" class="d-inline">
                              <?=csrf_field();?>
                              <input type="hidden" name="_method" value="DELETE">
                              <button class="btn btn-danger btn-sm" data-confirm="Hapus Data...? | Apakah anda Yakin..?" data-confirm-yes="hapus(<?=$value->id_akun2?>)"><i class="fas fa-trash"></i>Del</button>
                            </form>
                            </td>
                          </tr>
                          <?php endforeach; ?>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
          </div>
 </section>

<?= $this->endSection() ?>

