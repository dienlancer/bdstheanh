<?php 
use App\ProjectModel;
use App\ProjectArticleModel;
use App\ProjectMemberModel;
use Illuminate\Support\Facades\DB;
$setting=getSettingSystem();
if(count($item) > 0){		
	$id=$item["id"];
	$fullname = $item["fullname"];	
	$small_img=get_article_thumbnail($item['image']);
    $large_img=asset('upload/'.$item['image']) ;
	$alias=$item["alias"];
	$overview=$item["overview"];
	$total_cost=$item["total_cost"];
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
                <div class="margin-top-5 product-price">
                    <b>Giá:</b>&nbsp;Liên hệ
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