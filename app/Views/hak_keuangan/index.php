<?php $this->extend('layout/main') ?>

<?php $this->section('title') ?>Hak Keuangan - HRIS<?php $this->endSection() ?>

<?php $this->section('content') ?>
<div class="container-fluid">
    <!-- Page Header -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h1 class="h3 mb-0 text-primary fw-bold">Hak Keuangan</h1>
            <p class="text-muted-custom mb-0">Kelola informasi hak keuangan dan slip gaji Anda</p>
        </div>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="<?= site_url('dashboard') ?>">Dashboard</a></li>
                <li class="breadcrumb-item active">Hak Keuangan</li>
            </ol>
        </nav>
    </div>

    <!-- Informasi Hak Keuangan Card -->
    <div class="card card-custom">
        <div class="card-header bg-primary text-white">
            <h5 class="card-title mb-0 text-white">
                <i class="bi bi-currency-dollar me-2"></i>Informasi Hak Keuangan
            </h5>
        </div>
        <div class="card-body">
            <!-- Filter and Search Section -->
            <div class="row mb-4">
                <div class="col-md-4">
                    <form method="GET" action="<?= site_url('hak-keuangan') ?>" id="filterForm">
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="bi bi-calendar3"></i>
                            </span>
                            <select class="form-select" name="periode" onchange="document.getElementById('filterForm').submit();">
                                <option value="">Semua Periode</option>
                                <?php foreach ($periods as $period): ?>
                                    <option value="<?= $period ?>" <?= ($periode ?? '') == $period ? 'selected' : '' ?>>
                                        <?= date('F Y', strtotime($period . '-01')) ?>
                                    </option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <input type="hidden" name="search" value="<?= esc($search ?? '') ?>">
                    </form>
                </div>
                <div class="col-md-4 offset-md-4">
                    <form method="GET" action="<?= site_url('hak-keuangan') ?>">
                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="bi bi-search"></i>
                            </span>
                            <input type="text"
                                   class="form-control"
                                   name="search"
                                   placeholder="Cari slip gaji atau status..."
                                   value="<?= esc($search ?? '') ?>">
                            <button class="btn btn-outline-primary" type="submit">
                                <i class="bi bi-search"></i>
                            </button>
                        </div>
                        <input type="hidden" name="periode" value="<?= esc($periode ?? '') ?>">
                    </form>
                </div>
            </div>

            <!-- Data Table -->
            <?php if (!empty($hakKeuangan)): ?>
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead class="table-light">
                            <tr>
                                <th>Slip Gaji</th>
                                <th>Periode</th>
                                <th>Status</th>
                                <th>Hak Keuangan</th>
                                <th>PPH 21</th>
                                <th>Iuran BPJS</th>
                                <th>Penghasilan Bersih</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($hakKeuangan as $item): ?>
                                <tr>
                                    <td>
                                        <span class="fw-medium"><?= esc($item['slip_gaji']) ?></span>
                                    </td>
                                    <td>
                                        <span class="text-muted">
                                            <?= date('F Y', strtotime($item['periode'] . '-01')) ?>
                                        </span>
                                    </td>
                                    <td>
                                        <?php if ($item['status'] == 'pending'): ?>
                                            <span class="badge bg-warning">
                                                <i class="bi bi-clock me-1"></i>Pending
                                            </span>
                                        <?php elseif ($item['status'] == 'approved'): ?>
                                            <span class="badge bg-info">
                                                <i class="bi bi-check-circle me-1"></i>Approved
                                            </span>
                                        <?php else: ?>
                                            <span class="badge bg-success">
                                                <i class="bi bi-check-circle-fill me-1"></i>Paid
                                            </span>
                                        <?php endif; ?>
                                    </td>
                                    <td>
                                        <span class="fw-bold text-primary"><?= $item['formatted_hak_keuangan'] ?></span>
                                    </td>
                                    <td>
                                        <span class="text-danger"><?= $item['formatted_pph_21'] ?></span>
                                    </td>
                                    <td>
                                        <span class="text-info"><?= $item['formatted_iuran_bpjs'] ?></span>
                                    </td>
                                    <td>
                                        <span class="fw-bold text-success"><?= $item['formatted_penghasilan_bersih'] ?></span>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>

                <!-- Pagination would go here -->
            <?php else: ?>
                <!-- Empty State -->
                <div class="text-center py-5">
                    <div class="mb-3">
                        <i class="bi bi-folder2-open display-1 text-muted"></i>
                    </div>
                    <h5 class="text-muted mb-2">Belum Ada Data Hak Keuangan</h5>
                    <p class="text-muted mb-0">
                        <?php if (!empty($search) || !empty($periode)): ?>
                            Tidak ada data yang sesuai dengan filter yang dipilih.
                            <br>
                            <a href="<?= site_url('hak-keuangan') ?>" class="btn btn-link p-0">
                                <i class="bi bi-arrow-clockwise me-1"></i>Reset Filter
                            </a>
                        <?php else: ?>
                            Data hak keuangan belum tersedia.
                        <?php endif; ?>
                    </p>
                </div>
            <?php endif; ?>
        </div>
    </div>
</div>
<?php $this->endSection() ?>

<?php $this->section('scripts') ?>
<script>
document.addEventListener('DOMContentLoaded', function() {
    // Auto-submit search form on Enter key
    const searchInput = document.querySelector('input[name="search"]');
    if (searchInput) {
        searchInput.addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                this.closest('form').submit();
            }
        });
    }

    // Highlight search terms
    const searchTerm = '<?= esc($search ?? '') ?>';
    if (searchTerm) {
        const regex = new RegExp(`(${searchTerm})`, 'gi');
        document.querySelectorAll('tbody td').forEach(function(cell) {
            if (cell.textContent.toLowerCase().includes(searchTerm.toLowerCase())) {
                cell.innerHTML = cell.innerHTML.replace(regex, '<mark>$1</mark>');
            }
        });
    }
});
</script>
<?php $this->endSection() ?>
