<?php 
use App\ProjectModel;
use App\ProjectArticleModel;
use App\ProjectMemberModel;
use App\ProvinceModel;
use App\DistrictModel;
use Illuminate\Support\Facades\DB;
$setting=getSettingSystem();
if(count($item) > 0){		
	$id=$item["id"];
	$fullname = $item["fullname"];	
	$small_img=get_article_thumbnail($item['image']);
    $large_img=asset('upload/'.$item['image']) ;
	$alias=$item["alias"];
	$overview=$item["overview"];
	$total_cost=number_format($item['total_cost'],0,",",".") ;
                $unit=$item['unit'];
	$intro=$item["intro"];				
	/* begin cập nhật count view */
	$count_view=(int)@$item['count_view'];
	$count_view++;
	$row				=	ProjectModel::find((int)@$id); 
	$row->count_view=$count_view;
	$row->save();
	$count_view_text=number_format($count_view,0,",",".");
	/* end cập nhật count view */	
	/* begin setting */
    $address=$setting['address']['field_value'];
    $email_to=$setting['email_to']['field_value'];
    $contacted_person=$setting['contacted_person']['field_value'];
    $telephone=$setting['telephone']['field_value'];
    $office=$setting['office']['field_value'];
    
    /* end setting */    
    $province=ProvinceModel::find((int)@$item['province_id'])->toArray();    
    $district=DistrictModel::find((int)@$item['district_id'])->toArray();  
    $province_name=$province['fullname'];
    $district_name=$district['fullname'];
    $province_permalink=route('frontend.index.index',[$province['alias']]);
    $district_permalink=route('frontend.index.index',[$district['alias']]);
    $street=$item['street'];
    if(empty($breadcrumb)){
        ?>
        <h2 class="tieu-de margin-top-15">
            <?php echo $title; ?>       
        </h2>
        <?php
    }else{
        ?>
        <h2 class="breadcrumb-title margin-top-15">
            <?php echo $breadcrumb; ?>
        </h2>
        <?php
    }   
    ?>  
	<div class="margin-top-10 box-article">		
		<div>
            <div class="col-lg-4 no-padding-left">
                <div class="margin-top-15">
                    <img class="zoom_img" src="<?php echo $small_img; ?>" data-zoom-image="<?php echo $large_img; ?>" />
                </div>
            </div>
            <div class="col-lg-8 no-padding-left">
                <div class="margin-top-15 product-detail-title">
                    <?php echo $title; ?>
                </div>
                <div class="margin-top-5">
                    <b>Lượt xem:</b>&nbsp;<?php echo $count_view; ?>
                </div>
                <div class="margin-top-10">
                            <div class="col-sm-3 no-padding-left"><a href="<?php echo $province_permalink; ?>"><?php echo $province_name; ?></a></div>
                            <div class="col-sm-3 no-padding-left"><a href="<?php echo $district_permalink; ?>"><?php echo $district_name; ?></a></div>
                            <div class="col-sm-6 no-padding-left"><?php echo $street; ?></div>                                                  
                            <div class="clr"></div>
                        </div>
                <div class="margin-top-5 product-price">
                    <span class="project-lbl-price">Giá:</span><span class="project-lbl-price-number margin-left-5"><?php echo $total_cost; ?></span><span class="margin-left-5 project-lbl-price-number"><?php echo $unit; ?></span>
                </div>                                
                <div class="margin-top-5">
                    <span class="phone-tel"><i class="fa fa-phone" aria-hidden="true"></i></span>&nbsp;Hotline:&nbsp;<?php echo $telephone; ?>
                </div>                
                <div class="margin-top-5">
                    <img src="<?php echo asset('upload/tru-so.png'); ?>">&nbsp;Vp giao dịch:&nbsp;<?php echo $office; ?>
                </div>
                <div class="margin-top-5">
                    <img src="<?php echo asset('upload/sendmail.png'); ?>">&nbsp;Email: <?php echo $email_to; ?>
                </div>
                <div class="margin-top-5">
                    <img src="<?php echo asset('upload/earth-web.png'); ?>">&nbsp;Website: <?php echo url('/'); ?>
                </div>
                <hr class="product-ngang">
            </div>
            <div class="clr"></div>
        </div>		
		<div class="margin-top-10 article-excerpt justify">
			<?php echo $intro; ?>
		</div>		
		<div class="margin-top-15">
			
		</div>	
		
	</div>
	<?php
}
?>	
<script language="javascript" type="text/javascript">
    jQuery('.zoom_img').elevateZoom({
        zoomType: "inner",
        cursor: "crosshair",
        zoomWindowFadeIn: 500,
        zoomWindowFadeOut: 750
    });
</script> 