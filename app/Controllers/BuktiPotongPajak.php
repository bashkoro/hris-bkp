<?php

namespace App\Controllers;

class BuktiPotongPajak extends BaseController
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

        // Sample tax document data
        $buktiPotongPajakData = [
            [
                'id' => 1,
                'periode' => '2024-10',
                'formatted_periode' => 'Oktober 2024',
                'is_available' => true,
                'file_path' => 'uploads/bukti_potong/2024-10-john-doe.pdf',
                'keterangan' => 'Bukti potong PPh 21 masa Oktober 2024'
            ],
            [
                'id' => 2,
                'periode' => '2024-09',
                'formatted_periode' => 'September 2024',
                'is_available' => true,
                'file_path' => 'uploads/bukti_potong/2024-09-john-doe.pdf',
                'keterangan' => 'Bukti potong PPh 21 masa September 2024'
            ],
            [
                'id' => 3,
                'periode' => '2024-08',
                'formatted_periode' => 'Agustus 2024',
                'is_available' => true,
                'file_path' => 'uploads/bukti_potong/2024-08-john-doe.pdf',
                'keterangan' => 'Bukti potong PPh 21 masa Agustus 2024'
            ],
            [
                'id' => 4,
                'periode' => '2024-07',
                'formatted_periode' => 'Juli 2024',
                'is_available' => true,
                'file_path' => 'uploads/bukti_potong/2024-07-john-doe.pdf',
                'keterangan' => 'Bukti potong PPh 21 masa Juli 2024'
            ],
            [
                'id' => 5,
                'periode' => '2024-06',
                'formatted_periode' => 'Juni 2024',
                'is_available' => false,
                'file_path' => null,
                'keterangan' => 'Bukti potong PPh 21 masa Juni 2024 (Belum tersedia)'
            ],
            [
                'id' => 6,
                'periode' => '2024-05',
                'formatted_periode' => 'Mei 2024',
                'is_available' => true,
                'file_path' => 'uploads/bukti_potong/2024-05-john-doe.pdf',
                'keterangan' => 'Bukti potong PPh 21 masa Mei 2024'
            ],
        ];

        // Get filter parameters
        $periode = $this->request->getGet('periode');
        $search = $this->request->getGet('search');

        // Filter data
        $filteredData = $buktiPotongPajakData;

        if ($periode) {
            $filteredData = array_filter($filteredData, function($item) use ($periode) {
                return $item['periode'] === $periode;
            });
        }

        if ($search) {
            $filteredData = array_filter($filteredData, function($item) use ($search) {
                return stripos($item['keterangan'], $search) !== false ||
                       stripos($item['formatted_periode'], $search) !== false;
            });
        }

        // Get unique periods for filter dropdown
        $periods = array_unique(array_column($buktiPotongPajakData, 'periode'));
        rsort($periods); // Most recent first

        // Pass data to view
        $data = [
            'user' => $userData,
            'buktiPotongPajak' => array_values($filteredData),
            'periods' => $periods,
            'periode' => $periode,
            'search' => $search,
            'activeMenu' => 'bukti-potong-pajak'
        ];

        return view('bukti_potong_pajak/index', $data);
    }

    public function download($id)
    {
        // In a real application, this would retrieve the file and serve it as a download
        // For the prototype, we'll just show a message
        return redirect()->to(site_url('bukti-potong-pajak'))
                        ->with('message', 'Download fitur akan tersedia setelah integrasi dengan sistem penyimpanan file.');
    }
}
