<?php
/**
 * Custom Pagination Template for HRIS
 * Compatible with CodeIgniter 4 Pager
 *
 * Variables available:
 * $pager - Pager object
 */
$pager = $pager ?? null;
if (!$pager) return;
?>

<?php if ($pager->getPageCount() > 1): ?>
<div class="d-flex justify-content-center align-items-center mt-4">
    <div class="d-flex align-items-center">
        <!-- Previous Page Link -->
        <?php if ($pager->hasPrevious()): ?>
            <a href="<?= $pager->getPreviousPage() ?>" class="btn btn-outline-primary btn-sm me-2">
                <i class="bi bi-chevron-left"></i>
            </a>
        <?php else: ?>
            <span class="btn btn-outline-secondary btn-sm me-2 disabled">
                <i class="bi bi-chevron-left"></i>
            </span>
        <?php endif; ?>

        <!-- Pagination Elements -->
        <div class="d-flex align-items-center">
            <?php
            $currentPage = $pager->getCurrentPage();
            $lastPage = $pager->getPageCount();

            // Simple pagination logic: show current, adjacent pages, first and last
            for ($i = 1; $i <= $lastPage; $i++):
                // Show first page, last page, current page and adjacent pages
                if ($i == 1 || $i == $lastPage || ($i >= $currentPage - 1 && $i <= $currentPage + 1)):
                    if ($i == $currentPage): ?>
                        <span class="btn btn-primary btn-sm mx-1 fw-bold"><?= $i ?></span>
                    <?php else: ?>
                        <a href="<?= $pager->getPageURI($i) ?>" class="btn btn-outline-light btn-sm mx-1 text-dark border-secondary"><?= $i ?></a>
                    <?php endif;
                // Show dots for gaps
                elseif ($i == $currentPage - 2 || $i == $currentPage + 2): ?>
                    <span class="px-2 text-muted">...</span>
                <?php endif;
            endfor; ?>
        </div>

        <!-- Next Page Link -->
        <?php if ($pager->hasNext()): ?>
            <a href="<?= $pager->getNextPage() ?>" class="btn btn-outline-primary btn-sm ms-2">
                <i class="bi bi-chevron-right"></i>
            </a>
        <?php else: ?>
            <span class="btn btn-outline-secondary btn-sm ms-2 disabled">
                <i class="bi bi-chevron-right"></i>
            </span>
        <?php endif; ?>
    </div>
</div>

<!-- Page Info -->
<div class="text-center mt-3">
    <small class="text-muted">
        Menampilkan <?= ($currentPage - 1) * $pager->getPerPage() + 1 ?> -
        <?= min($currentPage * $pager->getPerPage(), $pager->getTotal()) ?> dari
        <?= $pager->getTotal() ?> data
        (Halaman <?= $currentPage ?> dari <?= $lastPage ?>)
    </small>
</div>
<?php endif; ?>
