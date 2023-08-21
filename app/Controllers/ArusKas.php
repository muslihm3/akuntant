<?php

namespace App\Controllers;

use App\Models\ModelTransaksi;
use App\Models\ModelStatus;
use App\Models\ModelAkun3;
use App\Models\ModelNilai;
use TCPDF;

use App\Controllers\BaseController;

class ArusKas extends BaseController
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
        
        $rowdata=$this->objTransaksi->get_aruskas($userId,$tglawal,$tglakhir);

        $data['dttransaksi']=$rowdata;
        $data['tglawal']=$tglawal;
        $data['tglakhir']=$tglakhir;
        return view('aruskas/index', $data);
    }

    public function cetakaruskaspdf()
    {
        $userId = $this->auth->id();

            // Menyimpan ID pengguna dalam variabel $data
            $data['userId'] = $userId;
        $tglawal=$this->request->getVar('tglawal')?$this->request->getVar('tglawal'):'';
        $tglakhir=$this->request->getVar('tglakhir')?$this->request->getVar('tglakhir'):'';
        
        $rowdata=$this->objTransaksi->get_aruskas($userId,$tglawal,$tglakhir);

        $data['dttransaksi']=$rowdata;
        $data['tglawal']=$tglawal;
        $data['tglakhir']=$tglakhir;
        $html = view('aruskas/cetakaruskaspdf', $data);

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
        $pdf->Output('aruskas.pdf', 'I');
    }
}
