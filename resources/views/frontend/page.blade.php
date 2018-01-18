<?php 
use App\PageModel;
$setting=getSettingSystem();
if(count($item) > 0){	
	$id=$item["id"];
	$fullname = $item["fullname"];
	$intro=$item["intro"];
	$content=$item['content'];
	$featuredImg=asset('upload/'.$item['image']);
	/* begin cập nhật count view */
	$count_view=(int)@$item['count_view'];
	$count_view++;
	$row				=	PageModel::find((int)@$id); 
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
	?>    
	<div class="margin-top-15 box-article">	
        	
		<div>
            <div class="col-lg-4 no-padding-left">
                <div class="margin-top-15">
                    <img id="zoom_img" src="<?php echo $featuredImg; ?>" data-zoom-image="<?php echo $featuredImg; ?>" />
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
		<hr class="duong-ngang" />		
		<div class="margin-top-15">
			<?php echo $content; ?>
		</div>	
	</div>
	<?php
}
?>	
<script language="javascript" type="text/javascript">
    jQuery('#zoom_img').elevateZoom({
        zoomType: "inner",
        cursor: "crosshair",
        zoomWindowFadeIn: 500,
        zoomWindowFadeOut: 750
    });
</script> 
