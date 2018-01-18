<?php 
$li_content_management='';
$li_category_article='';
$li_article='';

$li_album_management='';
$li_album='';
$li_photo='';

$li_video_management='';
$li_category_video='';
$li_video='';

$li_project_management='';
$li_project='';
$li_project_article='';

$li_product_management='';
$li_category_product='';
$li_product='';
$li_customer='';
$li_payment_method='';
$li_invoice='';

$li_menu_type='';
$li_page='';
$li_category_banner='';
$li_module_item='';

$li_setting_system='';

$li_phan_quyen='';
$li_group_member='';
$li_user='';
$li_privilege='';
$li_media='';
$li_supporter='';
$li_organization='';
switch ($controller) {
    case 'category-article':  
    $li_category_article='active open';
    $li_content_management='active open';
    break;   
    case 'article': 
    $li_article='active open';
    $li_content_management='active open';
    break;

    case 'album':  
    $li_album='active open';   
    $li_album_management='active open'; 
    break; 
    case 'photo':  
    $li_photo='active open';   
    $li_album_management='active open'; 
    break;    
   
    case 'category-video':  
    $li_category_video='active open';   
    $li_video_management='active open'; 
    break; 
    case 'video':  
    $li_video='active open';   
    $li_video_management='active open'; 
    break;    

    case 'project': 
    $li_project='active open';    
    $li_project_management='active open';
    break;

    case 'project-article': 
    $li_project_article='active open';    
    $li_project_management='active open';
    break;
    
    case 'category-product':  
    $li_category_product='active open';
    $li_product_management='active open';
    break;   
    case 'product': 
    $li_product='active open';
    $li_product_management='active open';
    break;
    case 'customer': 
    $li_customer='active open';
    $li_product_management='active open';
    break;
    case 'payment-method':     
    $li_payment_method='active open';
    $li_product_management='active open';
    break;
    case 'invoice':        
    $li_invoice='active open';
    $li_product_management='active open';
    break; 
    case 'menu-type':
    case 'menu':
    $li_menu_type='active open';
    break;  
    case 'page':    
    $li_page='active open';
    break;  
    case 'category-banner':
    case 'banner':
    $li_category_banner='active open';
    break;  
    case 'module-item':
    $li_module_item='active open';
    break;
    case 'setting-system':
    $li_setting_system='active open';
    break; 
    case 'media':
    $li_media='active open';
    break;
    case 'supporter':
    $li_supporter='active open';
    break; 
    case 'organization':
    $li_organization='active open';
    break; 
    case 'group-member':
    $li_group_member='active open';
    $li_phan_quyen='active open';
    break;  
    case 'user':
    $li_user='active open';
    $li_phan_quyen='active open';
    break;
    case 'privilege':
    $li_privilege='active open';
    $li_phan_quyen='active open';
    break;       
}
?>
<ul class="page-sidebar-menu  page-header-fixed " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200" style="padding-top: 20px">
    <li class="sidebar-toggler-wrapper hide">
        <div class="sidebar-toggler">
            <span></span>
        </div>
    </li>                                          
    <li class="nav-item <?php echo $li_content_management; ?>">
        <a href="javascript:;" class="nav-link nav-toggle">
            <i class="fa fa-folder-open-o" ></i>
            <span class="title">Quản lý nội dung</span>
            <span class="arrow"></span>
        </a>
        <ul class="sub-menu">                                    
            <li class="nav-item  <?php echo $li_category_article; ?>">
                <a href="{!! route('adminsystem.category-article.getList') !!}" class="nav-link nav-toggle">
                    <i class="icon-notebook"></i>
                    <span class="title">Chủ đề bài viết</span>                                            
                </a>                                                                      
            </li>            
            <li class="nav-item  <?php echo $li_article; ?>">
                <a href="{!! route('adminsystem.article.getList') !!}" class="nav-link nav-toggle">
                    <i class="icon-notebook"></i>
                    <span class="title">Bài viết</span>                                            
                </a>                                                                      
            </li>           
        </ul>
    </li>
    <li class="nav-item  <?php echo $li_category_banner; ?>">
        <a href="{!! route('adminsystem.category-banner.getList') !!}" class="nav-link nav-toggle">
            <i class="icon-notebook"></i>
            <span class="title">Quản lý banner</span>                                            
        </a>                                                                      
    </li> 
    <li class="nav-item  <?php echo $li_page; ?>">
        <a href="{!! route('adminsystem.page.getList') !!}" class="nav-link nav-toggle">
            <i class="icon-notebook"></i>
            <span class="title">Trang tĩnh</span>                                            
        </a>                                                                      
    </li> 
    <li class="nav-item  <?php echo $li_product_management; ?>">
        <a href="javascript:;" class="nav-link nav-toggle">
            <i class="fa fa-folder-open-o" ></i>
            <span class="title">Chuyên mục bán hàng</span>
            <span class="arrow"></span>
        </a>
        <ul class="sub-menu">                                    
            <li class="nav-item  <?php echo $li_category_product; ?>">
                <a href="{!! route('adminsystem.category-product.getList') !!}" class="nav-link nav-toggle">
                    <i class="icon-notebook"></i>
                    <span class="title">Loại sản phẩm</span>                                            
                </a>                                                                      
            </li>
            <li class="nav-item  <?php echo $li_product; ?>">
                <a href="{!! route('adminsystem.product.getList') !!}" class="nav-link nav-toggle">
                    <i class="icon-notebook"></i>
                    <span class="title">Sản phẩm</span>                                            
                </a>                                                                      
            </li>
            <li class="nav-item  <?php echo $li_customer; ?>">
                <a href="{!! route('adminsystem.customer.getList') !!}" class="nav-link nav-toggle">
                    <i class="icon-notebook"></i>
                    <span class="title">Khách hàng</span>                                            
                </a>                                                                      
            </li>
            <li class="nav-item <?php echo $li_payment_method; ?> ">
                <a href="{!! route('adminsystem.payment-method.getList') !!}" class="nav-link nav-toggle">
                    <i class="icon-notebook"></i>
                    <span class="title">Phương thức thanh toán</span>                                            
                </a>                                                                      
            </li>
            <li class="nav-item  <?php echo $li_invoice; ?>">
                <a href="{!! route('adminsystem.invoice.getList') !!}" class="nav-link nav-toggle">
                    <i class="icon-notebook"></i>
                    <span class="title">Đơn hàng</span>                                            
                </a>                                                                      
            </li>
        </ul>
    </li>
    <!--<li class="nav-item <?php echo $li_project_management; ?>">
        <a href="javascript:;" class="nav-link nav-toggle">
            <i class="fa fa-folder-open-o" ></i>
            <span class="title">Quản lý dự án</span>
            <span class="arrow"></span>
        </a>
        <ul class="sub-menu">                                    
            <li class="nav-item  <?php echo $li_project; ?>">
                <a href="{!! route('adminsystem.project.getList') !!}" class="nav-link nav-toggle">
                    <i class="icon-notebook"></i>
                    <span class="title">Dự án</span>                                            
                </a>                                                                      
            </li>  
            <li class="nav-item  <?php echo $li_project_article; ?>">
                <a href="{!! route('adminsystem.project-article.getList') !!}" class="nav-link nav-toggle">
                    <i class="icon-notebook"></i>
                    <span class="title">Tin tức</span>                                            
                </a>                                                                      
            </li>                        
        </ul>
    </li>-->
    <!--<li class="nav-item <?php echo $li_album_management; ?>">
        <a href="javascript:;" class="nav-link nav-toggle">
            <i class="fa fa-folder-open-o" ></i>
            <span class="title">Thư viện hình ảnh</span>
            <span class="arrow"></span>
        </a>
        <ul class="sub-menu">                                    
            <li class="nav-item  <?php echo $li_album; ?>">
                <a href="{!! route('adminsystem.album.getList') !!}" class="nav-link nav-toggle">
                    <i class="icon-notebook"></i>
                    <span class="title">Album</span>                                            
                </a>                                                                      
            </li>  
            <li class="nav-item  <?php echo $li_photo; ?>">
                <a href="{!! route('adminsystem.photo.getList') !!}" class="nav-link nav-toggle">
                    <i class="icon-notebook"></i>
                    <span class="title">Photo</span>                                            
                </a>                                                                      
            </li>                        
        </ul>
    </li>
    <li class="nav-item <?php echo $li_video_management; ?>">
        <a href="javascript:;" class="nav-link nav-toggle">
            <i class="fa fa-folder-open-o" ></i>
            <span class="title">Thư viện video</span>
            <span class="arrow"></span>
        </a>
        <ul class="sub-menu">                                    
            <li class="nav-item  <?php echo $li_category_video; ?>">
                <a href="{!! route('adminsystem.category-video.getList') !!}" class="nav-link nav-toggle">
                    <i class="icon-notebook"></i>
                    <span class="title">Danh mục video</span>                                            
                </a>                                                                      
            </li>  
            <li class="nav-item  <?php echo $li_video; ?>">
                <a href="{!! route('adminsystem.video.getList') !!}" class="nav-link nav-toggle">
                    <i class="icon-notebook"></i>
                    <span class="title">Video</span>                                            
                </a>                                                                      
            </li>                        
        </ul>
    </li>-->
    <!--<li class="nav-item  <?php echo $li_supporter; ?>">
        <a href="{!! route('adminsystem.supporter.getList') !!}" class="nav-link nav-toggle">
            <i class="icon-notebook"></i>
            <span class="title">Tiếp lửa</span>                                            
        </a>                                                                      
    </li>
    <li class="nav-item  <?php echo $li_organization; ?>">
        <a href="{!! route('adminsystem.organization.getList') !!}" class="nav-link nav-toggle">
            <i class="icon-notebook"></i>
            <span class="title">Tổ chức</span>                                            
        </a>                                                                      
    </li>-->
    <li class="nav-item  <?php echo $li_media; ?>">
        <a href="{!! route('adminsystem.media.getList') !!}" class="nav-link nav-toggle">
            <i class="icon-notebook"></i>
            <span class="title">Thư viện</span>                                            
        </a>                                                                      
    </li>
    <li class="nav-item  <?php echo $li_menu_type; ?>">
        <a href="{!! route('adminsystem.menu-type.getList') !!}" class="nav-link nav-toggle">
            <i class="icon-notebook"></i>
            <span class="title">Menu</span>                                            
        </a>                                                                      
    </li> 
    <li class="nav-item  <?php echo $li_module_item; ?>">
        <a href="{!! route('adminsystem.module-item.getList') !!}" class="nav-link nav-toggle">
            <i class="icon-notebook"></i>
            <span class="title">Module</span>                                            
        </a>                                                                      
    </li>     
    
    <li class="nav-item  <?php echo $li_setting_system; ?>">
        <a href="{!! route('adminsystem.setting-system.getList') !!}" class="nav-link nav-toggle">
            <i class="icon-notebook"></i>
            <span class="title">Cấu hình</span>                                            
        </a>                                                                      
    </li>       
    <li class="nav-item  <?php echo $li_phan_quyen ?>">
        <a href="javascript:;" class="nav-link nav-toggle">
            <i class="fa fa-folder-open-o" ></i>
            <span class="title">Quản lý người dùng</span>
            <span class="arrow"></span>
        </a>
        <ul class="sub-menu">                                    
            <li class="nav-item  <?php echo $li_group_member; ?>">
                <a href="{!! route('adminsystem.group-member.getList') !!}" class="nav-link nav-toggle">
                    <i class="icon-notebook"></i>
                    <span class="title">Nhóm người dùng</span>                                            
                </a>                                                                      
            </li>
            <li class="nav-item  <?php echo $li_user; ?>">
                <a href="{!! route('adminsystem.user.getList') !!}" class="nav-link nav-toggle">
                    <i class="icon-notebook"></i>
                    <span class="title">Người dùng</span>                                            
                </a>                                                                      
            </li>
            <li class="nav-item  <?php echo $li_privilege; ?>">
                <a href="{!! route('adminsystem.privilege.getList') !!}" class="nav-link nav-toggle">
                    <i class="icon-notebook"></i>
                    <span class="title">Nhóm quyền</span>                                            
                </a>                                                                      
            </li>
        </ul>
    </li>                                           
</ul>