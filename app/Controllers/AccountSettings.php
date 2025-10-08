<?php

namespace App\Controllers;

class AccountSettings extends BaseController
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
            'activeMenu' => 'account-settings'
        ];

        return view('account_settings/index', $data);
    }

    public function updatePassword()
    {
        // Get form data
        $password = $this->request->getPost('password');
        $passwordConfirmation = $this->request->getPost('password_confirmation');

        // Validate passwords match
        if ($password !== $passwordConfirmation) {
            return redirect()->back()
                            ->with('error', 'Password dan konfirmasi password tidak cocok.');
        }

        // Validate password length
        if (strlen($password) < 8) {
            return redirect()->back()
                            ->with('error', 'Password minimal 8 karakter.');
        }

        // In a real application, this would update the password in the database
        // For the prototype, we'll just redirect back with a success message
        return redirect()->to(site_url('account-settings'))
                        ->with('success', 'Password berhasil diperbarui!');
    }
}
