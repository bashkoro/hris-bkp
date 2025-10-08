<?php

namespace App\Controllers;

class HakKeuangan extends BaseController
{
    public function index()
    {
        // Sample user data
        $userData = [
            'name' => 'John Doe',
            'email' => 'john@hris-pco.com',
            'unit_kerja' => 'IT Department',
            'status_pns' => 'PNS',
            'status_kepegawaian' => 'Aktif',
            'sisa_cuti' => 12
        ];

        // Helper function to format currency
        $formatCurrency = function($amount) {
            return 'Rp ' . number_format($amount, 0, ',', '.');
        };

        // Sample financial data
        $hakKeuanganData = [
            [
                'id' => 1,
                'slip_gaji' => 'SG-2024-10-001',
                'periode' => '2024-10',
                'status' => 'paid',
                'hak_keuangan' => 15000000,
                'pph_21' => 750000,
                'iuran_bpjs' => 450000,
                'penghasilan_bersih' => 13800000
            ],
            [
                'id' => 2,
                'slip_gaji' => 'SG-2024-09-001',
                'periode' => '2024-09',
                'status' => 'paid',
                'hak_keuangan' => 15000000,
                'pph_21' => 750000,
                'iuran_bpjs' => 450000,
                'penghasilan_bersih' => 13800000
            ],
            [
                'id' => 3,
                'slip_gaji' => 'SG-2024-08-001',
                'periode' => '2024-08',
                'status' => 'paid',
                'hak_keuangan' => 15000000,
                'pph_21' => 750000,
                'iuran_bpjs' => 450000,
                'penghasilan_bersih' => 13800000
            ],
            [
                'id' => 4,
                'slip_gaji' => 'SG-2024-07-001',
                'periode' => '2024-07',
                'status' => 'paid',
                'hak_keuangan' => 14500000,
                'pph_21' => 725000,
                'iuran_bpjs' => 435000,
                'penghasilan_bersih' => 13340000
            ],
            [
                'id' => 5,
                'slip_gaji' => 'SG-2024-06-001',
                'periode' => '2024-06',
                'status' => 'approved',
                'hak_keuangan' => 14500000,
                'pph_21' => 725000,
                'iuran_bpjs' => 435000,
                'penghasilan_bersih' => 13340000
            ],
            [
                'id' => 6,
                'slip_gaji' => 'SG-2024-05-001',
                'periode' => '2024-05',
                'status' => 'paid',
                'hak_keuangan' => 14500000,
                'pph_21' => 725000,
                'iuran_bpjs' => 435000,
                'penghasilan_bersih' => 13340000
            ],
        ];

        // Format currency for each item
        foreach ($hakKeuanganData as &$item) {
            $item['formatted_hak_keuangan'] = $formatCurrency($item['hak_keuangan']);
            $item['formatted_pph_21'] = $formatCurrency($item['pph_21']);
            $item['formatted_iuran_bpjs'] = $formatCurrency($item['iuran_bpjs']);
            $item['formatted_penghasilan_bersih'] = $formatCurrency($item['penghasilan_bersih']);
        }

        // Get filter parameters
        $periode = $this->request->getGet('periode');
        $search = $this->request->getGet('search');

        // Filter data
        $filteredData = $hakKeuanganData;

        if ($periode) {
            $filteredData = array_filter($filteredData, function($item) use ($periode) {
                return $item['periode'] === $periode;
            });
        }

        if ($search) {
            $filteredData = array_filter($filteredData, function($item) use ($search) {
                return stripos($item['slip_gaji'], $search) !== false ||
                       stripos($item['status'], $search) !== false;
            });
        }

        // Get unique periods for filter dropdown
        $periods = array_unique(array_column($hakKeuanganData, 'periode'));
        rsort($periods); // Most recent first

        // Pass data to view
        $data = [
            'user' => $userData,
            'hakKeuangan' => array_values($filteredData),
            'periods' => $periods,
            'periode' => $periode,
            'search' => $search,
            'activeMenu' => 'hak-keuangan'
        ];

        return view('hak_keuangan/index', $data);
    }
}
