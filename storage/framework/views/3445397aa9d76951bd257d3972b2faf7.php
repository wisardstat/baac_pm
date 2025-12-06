<?php $__env->startSection('title', 'Roles Management'); ?>

<?php $__env->startSection('css'); ?>
    <link rel="stylesheet" type="text/css" href="<?php echo e(asset('assets/css/vendors/animate.css')); ?>">
    <link rel="stylesheet" type="text/css" href="<?php echo e(asset('assets/css/vendors/select2.css')); ?>">
    <link rel="stylesheet" type="text/css" href="<?php echo e(asset('assets/css/vendors/jquery.dataTables.css')); ?>">
    <link rel="stylesheet" type="text/css" href="<?php echo e(asset('assets/css/vendors/dataTables.bootstrap5.css')); ?>">
<?php $__env->stopSection(); ?>

<?php $__env->startSection('main_content'); ?>
    <div class="container-fluid">
        <div class="page-title">
            <div class="row">
                <div class="col-sm-6">
                    <h3>Roles Management</h3>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="<?php echo e(route('admin.default_dashboard')); ?>"> <svg class="stroke-icon">
                                    <use href="<?php echo e(asset('assets/svg/icon-sprite.svg#stroke-home')); ?>"></use>
                                </svg></a></li>
                        <li class="breadcrumb-item">Laravel Example</li>
                        <li class="breadcrumb-item active">Roles Management</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- Container-fluid starts-->
    <div class="container-fluid basic_table">
        <div class="row">
            <div class="col-xxl-6 box-col-12">
                <div class="card role-management">
                    <div class="card-body ">
                        <div class="blog-card">
                            <div class="blog-card-content">
                                <div class="role-details">
                                    
                                    <?php
                                        $image = auth()->user()->getFirstMedia('image');
                                    ?>

                                    <?php if(isset($image)): ?>
                                        <div class="role-profile">
                                            <img src="<?php echo e($image?->getUrl()); ?>" alt="Image">
                                        </div>
                                    <?php else: ?>
                                        <div class="role-profile">
                                            <img src="<?php echo e(asset('assets/images/dashboard/user/user.png')); ?>" alt="Image">
                                        </div>
                                    <?php endif; ?>
                                    
                                    <div class="role-profile-details">
                                        <h3>Welcome back <?php echo e(\Illuminate\Support\Str::title(auth()->user()->first_name ?? '')); ?> <?php echo e(\Illuminate\Support\Str::title(auth()->user()->last_name ?? '')); ?>!</h3>
                                    </div>
                                </div>
                                <div class="blog-tags">
                                    <div class="tags-icon bg-primary">
                                        <svg class="stroke-icon">
                                            <use href="<?php echo e(asset('assets/svg/icon-sprite.svg#multi-user')); ?>"></use>
                                        </svg>
                                    </div>
                                    <div class="tag-details">
                                        <h2 class="total-num counter"><?php echo e(\App\Models\User::where('system_reserve', false)->count()); ?></h2>
                                        <p>Total Users</p>
                                    </div>
                                </div>
                            </div>
                            <div class="blog-card-image">
                            <img src="<?php echo e(asset('assets/images/role-management.png')); ?>" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xxl-3 col-sm-6 box-col-6">
              <div class="card">
                <div class="card-body">
                    <div class="btn-light1-primary b-r-15">
                        <div class="upcoming-box">
                            <div class="upcoming-icon bg-primary">
                                <svg class="stroke-icon">
                                    <use href="<?php echo e(asset('assets/svg/icon-sprite.svg#stroke-form')); ?>"></use>
                                </svg>
                            </div>
                            <p>Role</p>
                            <a href="<?php echo e(route('admin.role.create')); ?>" class="btn btn-primary"><?php echo e(__('Add Role')); ?></a>
                        </div>
                    </div>
                </div>
              </div>
            </div>
            <div class="col-xxl-3 col-sm-6 box-col-6 tag-card">
                <div class="card"> 
                    <div class="card-body">
                        <div class="btn-light1-secondary b-r-15">
                            <div class="upcoming-box">
                                <div class="upcoming-icon bg-secondary">
                                    <svg class="stroke-icon">
                                        <use href="<?php echo e(asset('assets/svg/icon-sprite.svg#user-plus')); ?>"></use>
                                    </svg>
                                </div> 
                                <p>User</p>
                                <a href="<?php echo e(route('admin.user.create')); ?>" class="btn btn-secondary"><?php echo e(__('Add User')); ?></a>
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
    <script src="<?php echo e(asset('assets/js/select/bootstrap-select.min.js')); ?>"></script>
    <?php echo $dataTable->scripts(); ?>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.simple.master', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH D:\MyProject\baac_pm\resources\views/admin/role/index.blade.php ENDPATH**/ ?>