<?php

namespace App\Controllers;

class Profile extends BaseController
{
    public function index()
    {
        // Sample user data
        $userData = [
            'id' => 1,
            'name' => 'John Doe',
            'email' => 'john@hris-pco.com',
            'unit_kerja' => 'IT Department',
            'status_pns' => 'PNS',
            'status_kepegawaian' => 'Aktif',
            'sisa_cuti' => 12
        ];

        // Pass data to view
        $data = [
            'user' => $userData,
            'activeMenu' => 'profile'
        ];

        return view('profile/index', $data);
    }

    public function update()
    {
        // In a real application, this would update the profile in the database
        // For the prototype, we'll just redirect back with a success message
        return redirect()->to(site_url('profile'))
                        ->with('success', 'Profil berhasil diperbarui.');
    }
}
