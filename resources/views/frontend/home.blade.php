@extends("frontend.master")
@section("content")
<?php 
$setting=getSettingSystem();
$name_nvkd_1=$setting['name_nvkd_1']['field_value'];
$name_nvkd_2=$setting['name_nvkd_2']['field_value'];
$name_nvkd_3=$setting['name_nvkd_3']['field_value'];
$name_nvkd_4=$setting['name_nvkd_4']['field_value'];

$skype_nvkd_1=$setting['skype_nvkd_1']['field_value'];
$skype_nvkd_2=$setting['skype_nvkd_2']['field_value'];
$skype_nvkd_3=$setting['skype_nvkd_3']['field_value'];
$skype_nvkd_4=$setting['skype_nvkd_4']['field_value'];

$email_nvkd_1=$setting['email_nvkd_1']['field_value'];
$email_nvkd_2=$setting['email_nvkd_2']['field_value'];
$email_nvkd_3=$setting['email_nvkd_3']['field_value'];
$email_nvkd_4=$setting['email_nvkd_4']['field_value'];

$tel_nvkd_1=$setting['tel_nvkd_1']['field_value'];
$tel_nvkd_2=$setting['tel_nvkd_2']['field_value'];
$tel_nvkd_3=$setting['tel_nvkd_3']['field_value'];
$tel_nvkd_4=$setting['tel_nvkd_4']['field_value'];
?>
<div class="container box-wrapper">
	<?php 

	$data=getModuleItem("san-pham-moi");
	if(count($data) > 0){
		$items=$data["items"];
		if(count($items) > 0){
			?>
			<div class="col-lg-12">
				<script type="text/javascript" language="javascript">
					$(document).ready(function(){
						$(".san-pham-moi").owlCarousel({
							autoplay:false,                    
							loop:true,
							margin:25,                        
							nav:true,            
							mouseDrag: false,
							touchDrag: false,                                
							responsiveClass:true,
							responsive:{
								0:{
									items:1
								},
								600:{
									items:5
								},
								1000:{
									items:5
								}
							}
						});
						var chevron_left='<i class="fa fa-chevron-left"></i>';
						var chevron_right='<i class="fa fa-chevron-right"></i>';
						$("div.san-pham-moi div.owl-prev").html(chevron_left);
						$("div.san-pham-moi div.owl-next").html(chevron_right);
					});                
				</script>
				<div class="owl-carousel san-pham-moi owl-theme">
					<?php 
					foreach($items as $key => $value){
						$featuredImg=get_featured_image($value['image']) ;
						$permalink=route('frontend.index.index',[$value['alias']]);
						$title=$value['fullname'];
						?>
						<div>
							<div><center><figure><a href="<?php echo $permalink; ?>"><img src="<?php echo $featuredImg; ?>"></a></figure></center></div>
							<div class="margin-top-5 box-product-intro-title"><a href="<?php echo $permalink; ?>"><b><?php echo $title; ?></b></a></div>
						</div>
						<?php
					}
					?>
				</div>
			</div>	
			<div class="clr"></div>				
			<?php
		}  
	}
	?>
	<div>
		<div class="col-lg-8">
			<?php 
			$data_slideshow=getBanner("slideshow");
			if(count($data_slideshow) > 0){
				$items=$data_slideshow["items"];
				if(count($items) > 0){
					?>
					<div class="slideshow margin-top-20">
						<script type="text/javascript" language="javascript">        
							$(document).ready(function(){
								$(".slick-slideshow").slick({
									dots: true,
									autoplay:true,
									arrows:false,
									adaptiveHeight:true,
									slidesToShow: 1,
									slidesToScroll: 1,        
								});  
							});     
						</script>
						<div class="slick-slideshow">    
							<?php 
							foreach ($items as $key => $value) {
								$alt=$value["alt"];
								$featuredImg=asset('upload/'.$value["image"]);
								?>
								<div><img src="<?php echo $featuredImg; ?>" alt="<?php echo $alt; ?>" /></div>
								<?php 
							}
							?>              
						</div>
					</div>
					<?php
				}  
			}
			?>
		</div>
		<div class="col-lg-4">
			<div class="ducati margin-top-20">
				<div>
					<h2>Hỗ trợ trực tuyến</h2>
					<div class="box-article-list">	
						<div class="box-support margin-top-5 padding-top-5 padding-left-5 padding-bottom-5">
							<div><img src="<?php echo asset('upload/user-icon.png'); ?>" /><span class="employee-name margin-left-5"><?php echo $name_nvkd_1; ?></span></div>
							<div class="margin-top-5">
								<span><a href="skype:<?php echo $skype_nvkd_1; ?>?add"><img src="<?php echo asset('upload/skype-icon.png'); ?>"></a></span>								
								<span class="margin-left-5"><a href="mailto:<?php echo $email_nvkd_1; ?>"><img src="<?php echo asset('upload/mail-icon.png'); ?>"></a></span>
								<span class="margin-left-5 phone-tel"><i class="fa fa-phone" aria-hidden="true"></i></span>
								<span class="margin-left-5"><img src="<?php echo asset('upload/zalo-icon.png'); ?>" /></span>
								<span class="margin-left-5"><b><?php echo $tel_nvkd_1; ?></b></span>								
							</div>
						</div>
						<div class="box-support margin-top-5 padding-top-5 padding-left-5 padding-bottom-5">
							<div><img src="<?php echo asset('upload/user-icon.png'); ?>" /><span class="employee-name margin-left-5"><?php echo $name_nvkd_2; ?></span></div>
							<div class="margin-top-5">
								<span><a href="skype:<?php echo $skype_nvkd_2; ?>?add"><img src="<?php echo asset('upload/skype-icon.png'); ?>"></a></span>								
								<span class="margin-left-5"><a href="mailto:<?php echo $email_nvkd_2; ?>"><img src="<?php echo asset('upload/mail-icon.png'); ?>"></a></span>
								<span class="margin-left-5 phone-tel"><i class="fa fa-phone" aria-hidden="true"></i></span>
								<span class="margin-left-5"><img src="<?php echo asset('upload/zalo-icon.png'); ?>" /></span>
								<span class="margin-left-5"><b><?php echo $tel_nvkd_2; ?></b></span>								
							</div>
						</div>
						<div class="box-support margin-top-5 padding-top-5 padding-left-5 padding-bottom-5">
							<div><img src="<?php echo asset('upload/user-icon.png'); ?>" /><span class="employee-name margin-left-5"><?php echo $name_nvkd_3; ?></span></div>
							<div class="margin-top-5">
								<span><a href="skype:<?php echo $skype_nvkd_3; ?>?add"><img src="<?php echo asset('upload/skype-icon.png'); ?>"></a></span>								
								<span class="margin-left-5"><a href="mailto:<?php echo $email_nvkd_3; ?>"><img src="<?php echo asset('upload/mail-icon.png'); ?>"></a></span>
								<span class="margin-left-5 phone-tel"><i class="fa fa-phone" aria-hidden="true"></i></span>
								<span class="margin-left-5"><img src="<?php echo asset('upload/zalo-icon.png'); ?>" /></span>
								<span class="margin-left-5"><b><?php echo $tel_nvkd_3; ?></b></span>								
							</div>
						</div>
						<div class="box-support margin-top-5 padding-top-5 padding-left-5 padding-bottom-5">
							<div><img src="<?php echo asset('upload/user-icon.png'); ?>" /><span class="employee-name margin-left-5"><?php echo $name_nvkd_4; ?></span></div>
							<div class="margin-top-5">
								<span><a href="skype:<?php echo $skype_nvkd_4; ?>?add"><img src="<?php echo asset('upload/skype-icon.png'); ?>"></a></span>								
								<span class="margin-left-5"><a href="mailto:<?php echo $email_nvkd_4; ?>"><img src="<?php echo asset('upload/mail-icon.png'); ?>"></a></span>
								<span class="margin-left-5 phone-tel"><i class="fa fa-phone" aria-hidden="true"></i></span>
								<span class="margin-left-5"><img src="<?php echo asset('upload/zalo-icon.png'); ?>" /></span>
								<span class="margin-left-5"><b><?php echo $tel_nvkd_4; ?></b></span>								
							</div>
						</div>								
					</div>
				</div>					
			</div>	
		</div>
		<div class="clr"></div>				
	</div>
	<div>
		<div class="col-sm-4">
			<?php 
			$module=getPage("introduce");
			if(count($module) > 0){
				$fullname=substr($module["fullname"],0,50);
				$featuredImg=asset('upload/'.$module['image']);
				$permalink=route('frontend.index.index',[$module['alias']]);				
				?>
				<div class="margin-top-15">					
					<h2 class="f-title-info"><span>Giới thiệu</span></h2>
					<div class="margin-top-10">
						<div><figure><center><a href="<?php echo $permalink; ?>"><img src="<?php echo $featuredImg; ?>" /></a></center></figure></div>
						<div class="margin-top-5 box-intro-title"><a href="<?php echo $permalink; ?>"><?php echo $fullname; ?></a></div>
					</div>								
				</div>
				<?php	
			}
			?>			
		</div>
		<div class="col-sm-4">			
			<?php 
			$module=getModuleItem("news-between");
			if(count($module) > 0){
				$fullname=$module["fullname"];
				$items=$module["items"];	
				?>
				<div class="margin-top-15">					
					<h2 class="f-title-info"><span><?php echo $fullname ?></span></h2>
					<script type="text/javascript" language="javascript">
						$(document).ready(function(){
							$(".featured-news").owlCarousel({
								autoplay:true,                    
								loop:true,
								margin:25,                        
								nav:true,            
								mouseDrag: false,
								touchDrag: false,                                
								responsiveClass:true,
								responsive:{
									0:{
										items:1
									},
									600:{
										items:1
									},
									1000:{
										items:1
									}
								}
							});
							var chevron_left='<i class="fa fa-chevron-left"></i>';
							var chevron_right='<i class="fa fa-chevron-right"></i>';
							$("div.featured-news div.owl-prev").html(chevron_left);
							$("div.featured-news div.owl-next").html(chevron_right);
						});                
					</script>
					<div class="owl-carousel featured-news owl-theme margin-top-10">
						
						<?php 
						foreach ($items as $key => $value){
							$featuredImg=asset('upload/'.$value['image']);
							$permalink=route('frontend.index.index',[$value['alias']]);
							$title=substr( $value['fullname'],0,50);
							?>
							<div>
								<div><figure><center><a href="<?php echo $permalink; ?>"><img src="<?php echo $featuredImg; ?>" /></a></center></figure></div>
								<div class="margin-top-5 box-intro-title"><a href="<?php echo $permalink; ?>"><?php echo $title; ?></a></div>
							</div>		
							<?php
						}
						?>

					</div>								
				</div>
				<?php	
			}
			?>						
		</div>
		<div class="col-sm-4">
			<?php 
			$module=getModuleItem("other-news");
			if(count($module) > 0){
				$fullname=$module["fullname"];
				$items=$module["items"];	
				?>
				<div class="margin-top-15">					
					<h2 class="f-title-info"><span><?php echo $fullname ?></span></h2>					
					<div class="margin-top-10">	
						<ul class="other-news-list">
							<?php 
							foreach ($items as $key => $value){
								$featuredImg=asset('upload/'.$value['image']);
								$permalink=route('frontend.index.index',[$value['alias']]);
								$title=$value['fullname'];
								?>
								<li><a href="<?php echo $permalink; ?>"><?php echo $title; ?></a></li>
								<?php
							}
							?>		
						</ul>																			
					</div>								
				</div>
				<?php	
			}
			?>				
		</div>
		<div class="clr"></div>
	</div>	
	<?php 
	$data=getBanner("doi-tac");
	if(count($data) > 0){
		$items=$data["items"];
		$fullname=$data['fullname'];
		if(count($items) > 0){
			?>
			<div class="col-lg-12 margin-top-30">
				<h2 class="f-title-info"><span><?php echo $fullname; ?></span></h2>
				<script type="text/javascript" language="javascript">
					$(document).ready(function(){
						$(".partner").owlCarousel({
							autoplay:false,                    
							loop:true,
							margin:25,                        
							nav:true,            
							mouseDrag: false,
							touchDrag: false,                                
							responsiveClass:true,
							responsive:{
								0:{
									items:1
								},
								600:{
									items:5
								},
								1000:{
									items:5
								}
							}
						});
						var chevron_left='<i class="fa fa-chevron-left"></i>';
						var chevron_right='<i class="fa fa-chevron-right"></i>';
						$("div.partner div.owl-prev").html(chevron_left);
						$("div.partner div.owl-next").html(chevron_right);
					});                
				</script>
				<div class="owl-carousel partner owl-theme">
					<?php 
					foreach($items as $key => $value){
						$featuredImg=asset('upload/'.$value['image']) ;
						$page_url=$value['page_url'];
						?>
						<div>
							<a href="<?php echo $page_url; ?>" target="_blank"><img src="<?php echo $featuredImg; ?>" /></a>
						</div>
						<?php
					}
					?>
				</div>
			</div> 
			<div class="clr"></div> 
			<?php
		}  
	}
	?>	
</div>  
@endsection()               