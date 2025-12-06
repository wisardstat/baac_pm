<?php $__env->startSection('title', 'Blogs Management'); ?>

<?php $__env->startSection('css'); ?>
    <link rel="stylesheet" type="text/css" href="<?php echo e(asset('assets/css/vendors/animate.css')); ?>">
    <link rel="stylesheet" type="text/css" href="<?php echo e(asset('assets/css/vendors/jquery.dataTables.css')); ?>">
<?php $__env->stopSection(); ?>

<?php $__env->startSection('main_content'); ?>
    <div class="container-fluid">
        <div class="page-title">
            <div class="row">
                <div class="col-sm-6">
                    <h3>Blogs Management</h3>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="<?php echo e(route('admin.default_dashboard')); ?>"> <svg class="stroke-icon">
                                    <use href="<?php echo e(asset('assets/svg/icon-sprite.svg#stroke-home')); ?>"></use>
                                </svg></a></li>
                        <li class="breadcrumb-item">Laravel Example</li>
                        <li class="breadcrumb-item active">Blogs Management</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- Container-fluid starts-->
    <div class="container-fluid">
        <div class="row">
            <div class="col-xxl-6 box-col-12">
                <div class="card role-management">
                    <div class="card-body "> 
                        <div class="blog-card"> 
                            <div class="blog-card-content">
                                <h5>Good day, <?php echo e(\Illuminate\Support\Str::title(auth()->user()->first_name ?? '')); ?> <?php echo e(\Illuminate\Support\Str::title(auth()->user()->last_name ?? '')); ?></h5>
                                <p>Welcome to the Cuba ! We are glad that you have visited our dashboard.</p>
                                <div class="d-flex">
                                    <div class="blog-tags">
                                        <div class="tags-icon bg-primary">
                                        <svg class="stroke-icon">
                                            <use href="<?php echo e(asset('assets/svg/icon-sprite.svg#multi-user')); ?>"></use>
                                        </svg>
                                        </div>
                                        <div class="tag-details">
                                            <h2 class="total-num counter"><?php echo e(\App\Models\Category::all()->count()); ?></h2>
                                            <p>Total Categories</p>
                                        </div>
                                    </div>
                                    <div class="blog-tags">
                                        <div class="tags-icon bg-secondary">
                                            <svg class="stroke-icon">
                                                <use href="<?php echo e(asset('assets/svg/icon-sprite.svg#tags')); ?>"></use>
                                            </svg>
                                        </div> 
                                        <div class="tag-details">
                                            <h2 class="total-num counter"><?php echo e(\App\Models\Tag::all()->count()); ?></h2>
                                            <p>Total Tags</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="blog-card-image">
                            <img src="<?php echo e(asset('assets/images/blog-management.png')); ?>" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xxl-2 col-md-4 box-col-4">
                <div class="card user-role">
                    <div class="card-body">
                        <div class="btn-light1-primary b-r-15">
                            <div class="upcoming-box">
                                <div class="upcoming-icon bg-primary">
                                    <svg class="stroke-icon">
                                        <use href="<?php echo e(asset('assets/svg/icon-sprite.svg#stroke-blog')); ?>"></use>
                                    </svg>
                                </div>
                                <p>Blog</p>
                                <a href="<?php echo e(route('admin.blog.create')); ?>" class="btn btn-primary"><?php echo e(__('Add Blog')); ?></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xxl-2 col-md-4 box-col-4">
                <div class="card user-role">
                    <div class="card-body">
                        <div class="btn-light1-secondary b-r-15">
                            <div class="upcoming-box">
                                <div class="upcoming-icon bg-secondary">
                                    <svg class="stroke-icon">
                                        <use href="<?php echo e(asset('assets/svg/icon-sprite.svg#tags')); ?>"></use>
                                    </svg>
                                </div>
                                <p>Tag</p>
                                <a href="<?php echo e(route('admin.tag.create')); ?>" class="btn btn-secondary"><?php echo e(__('Add Tag')); ?></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xxl-2 col-md-4 box-col-4">
                <div class="card user-role">
                    <div class="card-body">
                        <div class="btn-light1-warning b-r-15">
                            <div class="upcoming-box">
                                <div class="upcoming-icon bg-warning">
                                <svg class="stroke-icon">
                                    <use href="<?php echo e(asset('assets/svg/icon-sprite.svg#stroke-widget')); ?>"></use>
                                </svg>
                                </div> 
                                <p>Category</p>
                                <a href="<?php echo e(route('admin.category.index')); ?>" class="btn btn-warning"><?php echo e(__('Add Category')); ?></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-body">
                        <div class="table-responsive custom-scrollbar">
                            <?php echo $dataTable->table(); ?>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Container-fluid Ends-->
<?php $__env->stopSection(); ?>

<?php $__env->startSection('scripts'); ?>
    <!-- calendar js-->
    <script src="<?php echo e(asset('assets/js/datatable/datatables/jquery.dataTables.min.js')); ?>"></script>
    <?php echo $dataTable->scripts(); ?>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.simple.master', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH D:\MyProject\baac_pm\resources\views/admin/blog/index.blade.php ENDPATH**/ ?>