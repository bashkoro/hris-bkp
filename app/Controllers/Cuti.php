<?php

namespace App\Controllers;

class Cuti extends BaseController
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

        // Sample cuti history data
        $cutiHistory = [
            [
                'id' => 1,
                'jenis_cuti' => 'CT',
                'tanggal_mulai' => '2024-08-01',
                'tanggal_selesai' => '2024-08-05',
                'jumlah_hari' => 5,
                'alasan' => 'Liburan keluarga ke Bali',
                'status' => 'approved',
                'pejabat_pemberi_cuti' => 'Kepala Divisi'
            ],
            [
                'id' => 2,
                'jenis_cuti' => 'CS',
                'tanggal_mulai' => '2024-09-15',
                'tanggal_selesai' => '2024-09-17',
                'jumlah_hari' => 3,
                'alasan' => 'Sakit flu dan demam',
                'status' => 'approved',
                'pejabat_pemberi_cuti' => 'Kepala Bagian'
            ],
            [
                'id' => 3,
                'jenis_cuti' => 'CT',
                'tanggal_mulai' => '2024-10-20',
                'tanggal_selesai' => '2024-10-22',
                'jumlah_hari' => 3,
                'alasan' => 'Keperluan keluarga',
                'status' => 'pending',
                'pejabat_pemberi_cuti' => 'Direktur'
            ],
            [
                'id' => 4,
                'jenis_cuti' => 'CT',
                'tanggal_mulai' => '2024-07-10',
                'tanggal_selesai' => '2024-07-12',
                'jumlah_hari' => 3,
                'alasan' => 'Acara keluarga',
                'status' => 'rejected',
                'pejabat_pemberi_cuti' => 'Kepala Divisi'
            ],
            [
                'id' => 5,
                'jenis_cuti' => 'CT',
                'tanggal_mulai' => '2024-11-01',
                'tanggal_selesai' => '2024-11-03',
                'jumlah_hari' => 3,
                'alasan' => 'Renovasi rumah',
                'status' => 'pending',
                'pejabat_pemberi_cuti' => 'Kepala Bagian'
            ],
        ];

        // Count by status
        $pendingCount = 0;
        $approvedCount = 0;
        $rejectedCount = 0;

        foreach ($cutiHistory as $cuti) {
            if ($cuti['status'] === 'pending') $pendingCount++;
            if ($cuti['status'] === 'approved') $approvedCount++;
            if ($cuti['status'] === 'rejected') $rejectedCount++;
        }

        // Pass data to view
        $data = [
            'user' => $userData,
            'cutiHistory' => $cutiHistory,
            'pendingCount' => $pendingCount,
            'approvedCount' => $approvedCount,
            'rejectedCount' => $rejectedCount,
            'activeMenu' => 'cuti'
        ];

        return view('cuti/index', $data);
    }

    public function store()
    {
        // This will handle form submission in the future
        return redirect()->to('cuti')->with('success', 'Pengajuan cuti berhasil disimpan! (Prototype - belum tersimpan ke database)');
    }
}
