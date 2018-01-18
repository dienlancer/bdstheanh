<?php 
$seo_alias="";
if(isset($alias)){
    $seo_alias=$alias;
}
?>
@extends("frontend.master")
@section("content")
<div class="container box-inner-content">    
    <?php             
    switch ($layout){
        case 'two-column':  
        ?>
        <div class="col-lg-3">
            <?php                                      
            $argsTinTucSuKien = array(                         
                'menu_class'            => 'categoryarticle',                            
                'before_wrapper'        => '<div class="box-category margin-top-15">',
                'before_title'          => '<h2 class="menu-right-title">',
                'after_title'           => '</h2>',
                'before_wrapper_ul'     =>  '<div>',
                'after_wrapper_ul'      =>  '</div>',
                'after_wrapper'         => '</div>'     ,
                'link_before'           => '', 
                'link_after'            => '',                                                                    
                'theme_location'        => 'tin-tuc-su-kien-menu' ,
                'menu_li_actived'       => 'current-menu-item',
                'menu_item_has_children'=> 'menu-item-has-children',
                'alias'                 => $seo_alias,
            );    
            $argsDanhMucSanPham = array(                         
                'menu_class'            => 'categoryproduct',                            
                'before_wrapper'        => '<div class="box-category margin-top-15">',
                'before_title'          => '<h2 class="menu-right-title">',
                'after_title'           => '</h2>',
                'before_wrapper_ul'     =>  '<div class="category-product-wrapper">',
                'after_wrapper_ul'      =>  '</div>',
                'after_wrapper'         => '</div>'     ,
                'link_before'           => '', 
                'link_after'            => '',                                                                    
                'theme_location'        => 'danh-muc-san-pham-menu' ,
                'menu_li_actived'       => 'current-menu-item',
                'menu_item_has_children'=> 'menu-item-has-children',
                'alias'                 => $seo_alias,
            );    
            switch ($component) {
                case 'articles':
                case 'category-article':
                case 'article':
                case 'page':                
                wp_nav_menu($argsTinTucSuKien);  
                $module=getBanner("advertising-article-widget");                        
                if(count($module) > 0){                    
                    $banners=$module["items"];    
                    ?>
                    <div class="margin-top-20">
                        <ul class="advertising">
                            <?php 
                            foreach ($banners as $key => $value) {
                                $alt=$value["alt"];
                                $featuredImg=asset('upload/'.$value["image"]);
                                $permalink='';
                                if(!empty($value['page_url'])){
                                    $permalink=$value['page_url'];                                    
                                }else{
                                    $permalink='javascript:void(0);';
                                }                                
                                ?>
                                <li><center><a href="<?php echo $permalink; ?>"><img src="<?php echo $featuredImg; ?>" alt="<?php echo $alt; ?>" /></a></center></li>
                                <?php
                            }
                            ?>
                        </ul>                        
                    </div>
                    <?php
                }
                break;
                case 'products':        
                case 'category-product':
                case 'product':
                case 'search-product':                
                wp_nav_menu($argsDanhMucSanPham);       
                $module=getBanner("advertising-product-widget");                        
                if(count($module) > 0){                    
                    $banners=$module["items"];    
                    ?>
                    <div class="margin-top-20">
                        <ul class="advertising">
                            <?php 
                            foreach ($banners as $key => $value) {
                                $alt=$value["alt"];
                                $featuredImg=asset('upload/'.$value["image"]);
                                $permalink='';
                                if(!empty($value['page_url'])){
                                    $permalink=$value['page_url'];                                    
                                }else{
                                    $permalink='javascript:void(0);';
                                }                                
                                ?>
                                <li><center><a href="<?php echo $permalink; ?>"><img src="<?php echo $featuredImg; ?>" alt="<?php echo $alt; ?>" /></a></center></li>
                                <?php
                            }
                            ?>
                        </ul>                        
                    </div>
                    <?php
                }                                                         
                break;                            
            }                                       
            ?>                            
        </div>
        <div class="col-lg-9">
            <?php
            switch ($component) {                                                                      
                case "category-article":    
                case "articles":                                                                          
                ?>@include("frontend.category-article")<?php
                break;                                         
                case "article":                                                            
                ?>@include("frontend.article")<?php
                break;                
                case "page":                                                            
                ?>@include("frontend.page")<?php
                break;            
                case "search-product":             
                case "category-product":
                case "products":                                                
                ?>@include("frontend.category-product")<?php
                break; 
                case "product":                                                
                ?>@include("frontend.product")<?php
                break;
                case "gio-hang":                                                
                ?>@include("frontend.cart")<?php
                break; 
                case "register":                                                
                ?>@include("frontend.register")<?php
                break;
                case "account":                                                
                ?>@include("frontend.account")<?php
                break;
                case "login":                                                
                ?>@include("frontend.login")<?php
                break;
                case "login-join-project":                                                
                ?>@include("frontend.login-join-project")<?php
                break;
                case "security":                                                
                ?>@include("frontend.security")<?php
                break;
                case "xac-nhan-thanh-toan":                                                
                ?>@include("frontend.confirm-checkout")<?php
                break;
                case "dang-nhap-thanh-toan":                                                
                ?>@include("frontend.login-checkout")<?php
                break;
                case "hoan-tat-thanh-toan":                                                
                ?>@include("frontend.finished-checkout")<?php
                break;
                case "hoa-don":                                                
                ?>@include("frontend.invoice")<?php
                break;                                                                        
            }
            ?>
        </div>
        <div class="clr"></div>
        <?php          
        break;
        case 'full-width':        
        ?>
        <div class="col-lg-12">
            <?php
                switch ($component) {                          
                    case "contact": 
                    ?>@include("frontend.contact")<?php   
                    break;      
                    case "categories-album": 
                    ?>@include("frontend.categories-album")<?php   
                    break;   
                    case "album": 
                    ?>@include("frontend.album")<?php   
                    break; 
                    case "category-video": 
                    ?>@include("frontend.category-video")<?php   
                    break;                                                                                     
                }  
                ?>
             
        </div> 
        <div class="clr"></div>           
        <?php
        break;
    }
    ?>    
</div>
@endsection()               