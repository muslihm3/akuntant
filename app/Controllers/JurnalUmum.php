<?php

namespace App\Controllers;

use App\Models\ModelTransaksi;
use App\Models\ModelStatus;
use App\Models\ModelAkun3;
use App\Models\ModelNilai;
use TCPDF;

use App\Controllers\BaseController;

class JurnalUmum extends BaseController
{
    protected $auth;

    function __construct()
    {
        $this->db = \Config\Database::connect();
        $this->objTransaksi = new ModelTransaksi();
        $this->objNilai = new ModelNilai();
        $this->objAkun3 = new ModelAkun3();
        $this->objStatus = new ModelStatus();

        $this->auth = service('authentication');

    }

    public function index()
    {
        $userId = $this->auth->id();

        // Menyimpan ID pengguna dalam variabel $data
        $data['userId'] = $userId;

        $tglawal=$this->request->getVar('tglawal')?$this->request->getVar('tglawal'):'';
        $tglakhir=$this->request->getVar('tglakhir')?$this->request->getVar('tglakhir'):'';
        
        $rowdata=$this->objTransaksi->get_jurnalumum($userId,$tglawal,$tglakhir);
        $i=0;
        $temp1='';
        $temp2='';

        foreach($rowdata as $row){
            $tgl=($temp1==$row->tanggal && $temp2 == $row->kwitansi)?'':$row->tanggal;
            $temp1=$row->tanggal;
            $temp2=$row->kwitansi;
            $rowdata[$i]->tanggal=$tgl;
            $i++;
        }

        $data['dttransaksi']=$rowdata;
        $data['tglawal']=$tglawal;
        $data['tglakhir']=$tglakhir;
        return view('jurnalumum/index', $data);
    }
    public function cetakjupdf()
    {
        $userId = $this->auth->id();

        // Menyimpan ID pengguna dalam variabel $data
        $data['userId'] = $userId;
        
        $tglawal=$this->request->getVar('tglawal')?$this->request->getVar('tglawal'):'';
        $tglakhir=$this->request->getVar('tglakhir')?$this->request->getVar('tglakhir'):'';
        
        $rowdata=$this->objTransaksi->get_jurnalumum($userId,$tglawal,$tglakhir);
        $i=0;
        $temp1='';
        $temp2='';

        foreach($rowdata as $row){
            $tgl=($temp1==$row->tanggal && $temp2 == $row->kwitansi)?'':$row->tanggal;
            $temp1=$row->tanggal;
            $temp2=$row->kwitansi;
            $rowdata[$i]->tanggal=$tgl;
            $i++;
        }

        $data['dttransaksi']=$rowdata;
        $data['tglawal']=$tglawal;
        $data['tglakhir']=$tglakhir;
        $html = view('jurnalumum/cetakjupdf', $data);
        
        // create new PDF document
        $pdf = new TCPDF('P', PDF_UNIT, 'A4', true, 'UTF-8', false);
       
        // remove default header/footer
       $pdf->setPrintHeader(false);
       $pdf->setPrintFooter(false); 

       // set margins
       $pdf->SetMargins(30,4,3);
       
       // Set font
        // dejavusans is a UTF-8 Unicode font, if you only need to
        // print standard ASCII chars, you can use core fonts like
        // helvetica or times to reduce file size.
        $pdf->SetFont('helvetica', '', 8);

        // Add a page
        $pdf->AddPage();
        
        // Print text using writeHTMLCell()
        $pdf->writeHTML($html, true, false, true, false, '');

        // Close and output PDF document
        // This method has several options, check the source code documentation for more information.
        $this->response->setContentType('application/pdf');
        $pdf->Output('jurnalumum.pdf', 'I');
    }
}
