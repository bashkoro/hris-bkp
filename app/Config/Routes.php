<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */
$routes->get('/', 'Home::index');

// HRIS Routes
$routes->get('dashboard', 'Dashboard::index');

// Cuti routes
$routes->get('cuti', 'Cuti::index');
$routes->post('cuti/store', 'Cuti::store');

// Hak Keuangan routes
$routes->get('hak-keuangan', 'HakKeuangan::index');

// Bukti Potong Pajak routes
$routes->get('bukti-potong-pajak', 'BuktiPotongPajak::index');
$routes->get('bukti-potong-pajak/download/(:num)', 'BuktiPotongPajak::download/$1');

// Profile routes
$routes->get('profile', 'Profile::index');
$routes->post('profile/update', 'Profile::update');

// Account Settings routes
$routes->get('account-settings', 'AccountSettings::index');
$routes->post('account-settings/update-password', 'AccountSettings::updatePassword');

$routes->get('logout', function() {
    return redirect()->to('/');
});
