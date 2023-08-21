<?php

namespace App\Models;

use CodeIgniter\Model;

class ModelPenyesuaian extends Model
{
    // protected $DBGroup          = 'default';
    protected $table            = 'tbl_penyesuaian';
    protected $primaryKey       = 'id_penyesuaian';
    protected $returnType       = 'object';
    protected $allowedFields    = ['tanggal','deskripsi','nilai','waktu','jumlah','user_id'];
    // protected $useAutoIncrement = true;
    // protected $insertID         = 0;
    // protected $useSoftDeletes   = false;
    // protected $protectFields    = true;

    // Dates
    protected $useTimestamps = true;
    // protected $dateFormat    = 'datetime';
    // protected $createdField  = 'created_at';
    // protected $updatedField  = 'updated_at';
    // protected $deletedField  = 'deleted_at';

    // Validation
    // protected $validationRules      = [];
    // protected $validationMessages   = [];
    // protected $skipValidation       = false;
    // protected $cleanValidationRules = true;

    // Callbacks
    // protected $allowCallbacks = true;
    // protected $beforeInsert   = [];
    // protected $afterInsert    = [];
    // protected $beforeUpdate   = [];
    // protected $afterUpdate    = [];
    // protected $beforeFind     = [];
    // protected $afterFind      = [];
    // protected $beforeDelete   = [];
    // protected $afterDelete    = [];

    public function getPenyesuaianByUserId($userId)
    {
        return $this->where('user_id', $userId)->findAll();
        
    }

}
