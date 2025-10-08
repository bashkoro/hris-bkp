<!DOCTYPE html>
<html lang="id">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="<?= csrf_hash() ?>">

        <title><?= $this->renderSection('title') ?: 'HRIS - Human Resource Information System' ?></title>

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">

        <!-- Custom CSS -->
        <link href="<?= base_url('css/custom.css') ?>" rel="stylesheet">

        <?= $this->renderSection('styles') ?>
    </head>
    <body>
        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <div class="container-fluid">
                <!-- Logo -->
                <a class="navbar-brand" href="<?= site_url('dashboard') ?>">
                    <?php if (file_exists(FCPATH . 'img/FA-Logo-PCO_Horizontal-Emas-Putih.png')): ?>
                        <img src="<?= base_url('img/FA-Logo-PCO_Horizontal-Emas-Putih.png') ?>" alt="HRIS PCO Logo" class="navbar-logo" style="height: 40px;">
                    <?php else: ?>
                        <strong>HRIS PCO</strong>
                    <?php endif; ?>
                </a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarNav">
                    <!-- Main Navigation -->
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item">
                            <a class="nav-link <?= ($activeMenu ?? '') == 'dashboard' ? 'active' : '' ?>" href="<?= site_url('dashboard') ?>">
                                <i class="bi bi-speedometer2 me-1"></i>Dashboard
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link <?= ($activeMenu ?? '') == 'cuti' ? 'active' : '' ?>" href="<?= site_url('cuti') ?>">
                                <i class="bi bi-calendar-check me-1"></i>Cuti
                            </a>
                        </li>

                        <!-- Kepegawaian Dropdown -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                                <i class="bi bi-person-workspace me-1"></i>Kepegawaian
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item <?= ($activeMenu ?? '') == 'hak-keuangan' ? 'active' : '' ?>" href="<?= site_url('hak-keuangan') ?>"><i class="bi bi-currency-dollar me-2"></i>Hak Keuangan</a></li>
                                <li><a class="dropdown-item <?= ($activeMenu ?? '') == 'bukti-potong-pajak' ? 'active' : '' ?>" href="<?= site_url('bukti-potong-pajak') ?>"><i class="bi bi-receipt me-2"></i>Bukti Potong Pajak</a></li>
                            </ul>
                        </li>
                    </ul>

                    <!-- User Profile Dropdown -->
                    <ul class="navbar-nav">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                                <i class="bi bi-person-circle me-1"></i><?= esc($user['name'] ?? 'User') ?>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li>
                                    <a class="dropdown-item" href="<?= site_url('profile') ?>">
                                        <i class="bi bi-person-fill me-2"></i>Profile
                                    </a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="<?= site_url('account-settings') ?>">
                                        <i class="bi bi-gear-fill me-2"></i>Account Setting
                                    </a>
                                </li>
                                <li><hr class="dropdown-divider"></li>
                                <li>
                                    <a class="dropdown-item text-danger" href="<?= site_url('logout') ?>">
                                        <i class="bi bi-box-arrow-right me-2"></i>Log Out
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <div class="container-fluid mt-4">
            <!-- Flash Messages -->
            <?php if (session()->getFlashdata('success')): ?>
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <i class="bi bi-check-circle me-2"></i><?= esc(session()->getFlashdata('success')) ?>
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            <?php endif; ?>

            <?php if (session()->getFlashdata('error')): ?>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <i class="bi bi-exclamation-triangle me-2"></i><?= esc(session()->getFlashdata('error')) ?>
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            <?php endif; ?>

            <?= $this->renderSection('content') ?>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Custom JS -->
        <script src="<?= base_url('js/dashboard.js') ?>"></script>

        <?= $this->renderSection('scripts') ?>
    </body>
</html>
