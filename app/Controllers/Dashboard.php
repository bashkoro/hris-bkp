<?php

namespace App\Controllers;

class Dashboard extends BaseController
{
    public function index()
    {
        // Sample user data (hardcoded for prototype)
        $userData = [
            'name' => 'John Doe',
            'email' => 'john@hris-pco.com',
            'unit_kerja' => 'IT Department',
            'status_pns' => 'PNS',
            'status_kepegawaian' => 'Aktif',
            'sisa_cuti' => 12
        ];

        // Sample today's attendance (null for prototype - user hasn't checked in)
        $todaysAttendance = null; // Set to null to show "Belum Presensi"

        // Uncomment below to simulate checked in:
        // $todaysAttendance = [
        //     'waktu_masuk' => '08:15:00',
        //     'waktu_pulang' => null,
        //     'is_outside_office' => false,
        //     'office_building' => 'Gedung Utama'
        // ];

        // Sample attendance history data
        $attendanceHistory = [
            [
                'tanggal' => '2024-10-06',
                'waktu_masuk' => '08:00:00',
                'waktu_pulang' => '17:05:00',
                'is_late' => false,
                'is_early_leave' => false,
                'is_outside_office' => false,
                'office_building' => 'Gedung Utama',
                'total_jam_kerja' => 9.08,
                'keterangan' => ''
            ],
            [
                'tanggal' => '2024-10-05',
                'waktu_masuk' => '08:15:00',
                'waktu_pulang' => '17:00:00',
                'is_late' => true,
                'is_early_leave' => false,
                'is_outside_office' => false,
                'office_building' => 'Gedung Utama',
                'total_jam_kerja' => 8.75,
                'keterangan' => ''
            ],
            [
                'tanggal' => '2024-10-04',
                'waktu_masuk' => '08:05:00',
                'waktu_pulang' => '16:45:00',
                'is_late' => false,
                'is_early_leave' => true,
                'is_outside_office' => false,
                'office_building' => 'Gedung Utama',
                'total_jam_kerja' => 8.67,
                'keterangan' => ''
            ],
            [
                'tanggal' => '2024-10-03',
                'waktu_masuk' => '08:30:00',
                'waktu_pulang' => '17:10:00',
                'is_late' => true,
                'is_early_leave' => false,
                'is_outside_office' => true,
                'office_building' => '',
                'total_jam_kerja' => 8.67,
                'keterangan' => 'Kunjungan Client'
            ],
            [
                'tanggal' => '2024-10-02',
                'waktu_masuk' => '08:00:00',
                'waktu_pulang' => '17:00:00',
                'is_late' => false,
                'is_early_leave' => false,
                'is_outside_office' => false,
                'office_building' => 'Gedung B',
                'total_jam_kerja' => 9.00,
                'keterangan' => ''
            ],
            [
                'tanggal' => '2024-10-01',
                'waktu_masuk' => '08:10:00',
                'waktu_pulang' => '17:05:00',
                'is_late' => false,
                'is_early_leave' => false,
                'is_outside_office' => false,
                'office_building' => 'Gedung Utama',
                'total_jam_kerja' => 8.92,
                'keterangan' => ''
            ],
        ];

        // Get filter parameters from query string
        $month = $this->request->getGet('month');
        $year = $this->request->getGet('year');

        // Pass data to view
        $data = [
            'user' => $userData,
            'todaysAttendance' => $todaysAttendance,
            'attendanceHistory' => $attendanceHistory,
            'month' => $month,
            'year' => $year,
            'activeMenu' => 'dashboard'
        ];

        return view('dashboard/index', $data);
    }
}
