@extends("frontend.master")
@section("content")
<?php 
use App\ProjectModel;
$setting=getSettingSystem();
$telephone=$setting['telephone']['field_value'];
$email_to=$setting['email_to']['field_value'];
$facebook_url=$setting['facebook_url']['field_value'];
$twitter_url=$setting['twitter_url']['field_value'];
$google_plus=$setting['google_plus']['field_value'];
$youtube_url=$setting['youtube_url']['field_value'];
$instagram_url=$setting['instagram_url']['field_value'];
$pinterest_url=$setting['pinterest_url']['field_value'];   
$company=$setting['contacted_person']['field_value'];
$data_slideshow=getBanner("slideshow");
if(count($data_slideshow) > 0){
	$items=$data_slideshow["items"];
	if(count($items) > 0){
		?>
		<div class="slideshow">
			<script type="text/javascript" language="javascript">
				$(document).ready(function(){
					$(".building-construction").owlCarousel({
						items: 1,
	autoplay:true,
	loop:true,
	nav:true,
	navText: ["<i class='fa fa-chevron-left'></i>","<i class='fa fa-chevron-right'></i>"]
					});			

					dotcount = 1;

					$('.owl-dot').each(function() {
						$( this ).addClass( 'dotnumber' + dotcount);
						$( this ).attr('data-info', dotcount);
						dotcount=dotcount+1;
					});

			 // 2) ASSIGN EACH 'SLIDE' A NUMBER
			 slidecount = 1;

			 $('.owl-item').not('.cloned').each(function() {
			 	$( this ).addClass( 'slidenumber' + slidecount);
			 	slidecount=slidecount+1;
			 });

			// SYNC THE SLIDE NUMBER IMG TO ITS DOT COUNTERPART (E.G SLIDE 1 IMG TO DOT 1 BACKGROUND-IMAGE)
			$('.owl-dot').each(function() {

				grab = $(this).data('info');

				slidegrab = $('.slidenumber'+ grab +' img').attr('src');
				console.log(slidegrab);

				$(this).css("background-image", "url("+slidegrab+")");  

			});
			
			
			amount = $('.owl-dot').length;
			gotowidth = 100/amount;
			

			newwidth = $('.owl-dot').width();
			$('.owl-dot').css("height", 160+"px");
			$('.owl-dot').css("background-size", 100+"%" + 100+"%");
			$('.owl-dot').css("background-repeat", "no-repeat");

		}); 

	</script>
	<div class="owl-carousel building-construction owl-theme">
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
<hr class="gach-ngang">
<div class="container">
	<div class="col-lg-12">
		<hr class="gach-ngang-2">
		<div class="du-an-noi-bat margin-top-15">
			<div class="du-an">Dự án</div>
			<div class="noi-bat margin-left-5">Nổi bật</div>
		</div>
		<div class="margin-top-10 include-project">Gồm những dự án mới và nổi bật của chúng tôi</div>
		<div class="margin-top-15">
			<?php  
			$data=ProjectModel::select()->get()->toArray();
			$data=convertToArray($data);
			$k=1;
			foreach($data as $key => $value){
				$fullname=$value['fullname'];
				$thumbnail=get_article_thumbnail($value['image']);
				$total_cost=number_format($value['total_cost'],0,",",".") ;
				$unit=$value['unit'];
				$permalink=route('frontend.index.index',[$value['alias']]);
				?>
				<div class="col-sm-3">
					<div class="box-project margin-top-15 relative">						
						<div>
							<center><figure><a href="<?php echo $permalink; ?>"><img src="<?php echo $thumbnail; ?>"></a></figure></center>
						</div>
						<div class="box-project-info">
							<div class="margin-top-10 box-project-title"><center><a href="<?php echo $permalink; ?>"><?php echo $fullname; ?></a></center></div>	
							<div class="margin-top-10"><center><span class="project-lbl-price">Giá:</span><span class="project-lbl-price-number margin-left-5"><?php echo $total_cost; ?></span><span class="margin-left-5 project-lbl-price-number"><?php echo $unit; ?></span></center></div>						
						</div>
					</div>
				</div>
				<?php
				if($k%4 == 0 || $k==count($data)){
					echo '<div class="clr"></div>';
				}
			}
			?>
			<div class="clr"></div>
		</div>
	</div>	
	<div class="clr"></div>
</div>
<div class="hand-bg">
	<div class="container">
		<div class="col-lg-12">
			<div class="join-with-us-reason">
				<hr class="gach-ngang-3">
				<div class="du-an-noi-bat-2 margin-top-20">
					<div class="du-an">Hãy chọn</div>
					<div class="noi-bat margin-left-5">Chúng tôi</div>
				</div>
				<div class="margin-top-10 include-project">Sau đây là những lý do để khách hàng lựa chọn và tin tưởng vào chúng tôi</div>
			</div>			
		</div>
		<div class="clr"></div>
		<div class="phuong-cham">
			<div class="col-lg-6 bottom-right">
				<?php 
				$data=getPage("tam-nhin-home-content");							
				$fullname=$data['fullname'];
				$intro=$data['intro'];
				?>
				<div class="margin-top-15">
					<div><center><img src="<?php echo asset('upload/icon-1.png'); ?>"></center></div>
					<div class="phuong-cham-title margin-top-15"><center><?php echo $fullname; ?></center></div>
					<div class="justify phuong-cham-content margin-top-5">
						<?php echo $intro; ?>
					</div>
				</div>				
			</div>
			<div class="col-lg-6">
				<?php 
				$data=getPage("su-menh-hand-content");							
				$fullname=$data['fullname'];
				$intro=$data['intro'];
				?>
				<div class="margin-top-15">
					<div><center><img src="<?php echo asset('upload/icon-2.png'); ?>"></center></div>
					<div class="phuong-cham-title margin-top-15"><center><?php echo $fullname; ?></center></div>
					<div class="justify phuong-cham-content margin-top-5">
						<?php echo $intro; ?>
					</div>
				</div>
			</div>
			<div class="clr"></div>
			<div class="col-lg-6">
				<?php 
				$data=getPage("gia-tri-cot-loi-hand-content");							
				$fullname=$data['fullname'];
				$intro=$data['intro'];
				?>
				<div class="margin-top-15">
					<div><center><img src="<?php echo asset('upload/icon-3.png'); ?>"></center></div>
					<div class="phuong-cham-title margin-top-15"><center><?php echo $fullname; ?></center></div>
					<div class="justify phuong-cham-content margin-top-5">
						<?php echo $intro; ?>
					</div>
				</div>				
			</div>
			<div class="col-lg-6 top-left">
				<?php 
				$data=getPage("triet-ly-kinh-doanh-hand-content");							
				$fullname=$data['fullname'];
				$intro=$data['intro'];
				?>
				<div class="margin-top-15">
					<div><center><img src="<?php echo asset('upload/icon-4.png'); ?>"></center></div>
					<div class="phuong-cham-title margin-top-15"><center><?php echo $fullname; ?></center></div>
					<div class="justify phuong-cham-content margin-top-5">
						<?php echo $intro; ?>
					</div>
				</div>
			</div>
			<div class="clr"></div>
		</div>
		<div class="clr"></div>
	</div>
</div>
<div class="bg-3 relative">
	<div class="container">
		<div class="col-lg-12">
			<div class="featured-service margin-top-45"><center>Dịch vụ nổi bật</center></div>
			<div class="featured-service-intro margin-top-15"><center>Mô hình dịch vụ hoàn hảo với những tiện ích vượt trội của chúng tôi có thể đáp ứng mọi nhu cầu của khách hàng</center></div>
		</div>
		<div class="clr"></div>
		<div>
			<div class="col-lg-4">
				<?php 
				$data=getPage('service-left');
				$fullname=$data['fullname'];
				$thumbnail=get_article_thumbnail($data['image']);				
				$intro=substr($data['intro'], 0,100) ;
				$permalink=route('frontend.index.index',[$data['alias']]);
				?>
				<div class="margin-top-15 service-box margin-bottom-45 padding-bottom-15">
					<div class="service-img"><center><figure><a href="<?php echo $permalink; ?>"><img src="<?php echo $thumbnail; ?>"></a></figure></center></div>
					<div class="service-info padding-left-15 padding-right-15">
						<div class="margin-top-15 service-title"><center><a href="<?php echo $permalink; ?>"><?php echo $fullname; ?></a></center></div>
						<div class="margin-top-15 justify"><?php echo $intro; ?></div>
						<div class="service-readmore margin-top-15">
							<a href="<?php echo $permalink; ?>">Xem thêm</a>
							<div class="clr"></div>
						</div>
					</div>					
				</div>
			</div>
			<div class="col-lg-4">
				<?php 
				$data=getPage('service-center');
				$fullname=$data['fullname'];
				$thumbnail=get_article_thumbnail($data['image']);				
				$intro=substr($data['intro'], 0,150) ;
				$permalink=route('frontend.index.index',[$data['alias']]);
				?>
				<div class="margin-top-15 service-box margin-bottom-45 padding-bottom-15">
					<div class="service-img"><center><figure><a href="<?php echo $permalink; ?>"><img src="<?php echo $thumbnail; ?>"></a></figure></center></div>
					<div class="service-info padding-left-15 padding-right-15">
						<div class="margin-top-15 service-title"><center><a href="<?php echo $permalink; ?>"><?php echo $fullname; ?></a></center></div>
						<div class="margin-top-15 justify"><?php echo $intro; ?></div>
						<div class="service-readmore margin-top-15">
							<a href="<?php echo $permalink; ?>">Xem thêm</a>
							<div class="clr"></div>
						</div>
					</div>					
				</div>
			</div>
			<div class="col-lg-4">
				<?php 
				$data=getPage('service-right');
				$fullname=$data['fullname'];
				$thumbnail=get_article_thumbnail($data['image']);				
				$intro=substr($data['intro'], 0,150) ;
				$permalink=route('frontend.index.index',[$data['alias']]);
				?>
				<div class="margin-top-15 service-box margin-bottom-45 padding-bottom-15">
					<div class="service-img"><center><figure><a href="<?php echo $permalink; ?>"><img src="<?php echo $thumbnail; ?>"></a></figure></center></div>
					<div class="service-info padding-left-15 padding-right-15">
						<div class="margin-top-15 service-title"><center><a href="<?php echo $permalink; ?>"><?php echo $fullname; ?></a></center></div>
						<div class="margin-top-15 justify"><?php echo $intro; ?></div>
						<div class="service-readmore margin-top-15">
							<a href="<?php echo $permalink; ?>">Xem thêm</a>
							<div class="clr"></div>
						</div>
					</div>					
				</div>
			</div>
			<div class="clr"></div>
		</div>
	</div>
</div>
<div class="container">
	<div class="col-lg-12">
			<hr class="gach-ngang-3">
			<div class="du-an-noi-bat-2 margin-top-20">
				<div class="du-an">Tin tức</div>
				<div class="noi-bat margin-left-5">Mới nhất</div>
			</div>
			<div class="margin-top-10 include-project">Sau đây là những lý do để khách hàng lựa chọn và tin tưởng vào chúng tôi</div>
			<?php 
				$data=getModuleItem("news-between");
				if(count($data) > 0){
					$fullname=$data["fullname"];
					$items=$data["items"];
					if(count($items) > 0){
						?>						
						<div class="margin-top-15">
							<div class="col-lg-12">
								<script type="text/javascript" language="javascript">
									$(document).ready(function(){
										$(".bottom-news").owlCarousel({
											autoplay:true,                    
											loop:true,
											margin:25,                        
											nav:false,            
											mouseDrag: false,
											touchDrag: false,                                
											responsiveClass:true,
											responsive:{
												0:{
													items:1
												},
												600:{
													items:3
												},
												1000:{
													items:3
												}
											}
										});
										var chevron_left='<i class="fa fa-chevron-left"></i>';
										var chevron_right='<i class="fa fa-chevron-right"></i>';
										$("div.bottom-news div.owl-prev").html(chevron_left);
										$("div.bottom-news div.owl-next").html(chevron_right);
									});                
								</script>
								<div class="owl-carousel bottom-news owl-theme">
									<?php 
									foreach($items as $key => $value){
										$thumbnail=get_product_thumbnail($value['image']) ;
										$permalink=route('frontend.index.index',[$value['alias']]);
										$fullname=$value['fullname'];
										$intro=substr($value['intro'], 0,100) ;
										?>
										<div class="margin-top-15 service-box-2 margin-bottom-45 padding-bottom-15">
											<div class="service-img-2"><center><figure><a href="<?php echo $permalink; ?>"><img src="<?php echo $thumbnail; ?>"></a></figure></center></div>
											<div class="service-info padding-left-15 padding-right-15">
												<div class="margin-top-15 service-title-2"><center><a href="<?php echo $permalink; ?>"><?php echo $fullname; ?></a></center></div>
												<div class="margin-top-15 justify"><?php echo $intro; ?></div>
												<div class="service-readmore margin-top-15">
													<a href="<?php echo $permalink; ?>">Xem thêm</a>
													<div class="clr"></div>
												</div>
											</div>					
										</div>
										<?php
									}
									?>
								</div>
							</div>	
							<div class="clr"></div>
						</div>						
						<?php
					}  
				}
				?>
		</div>
		<div class="clr"></div>
</div>
<?php 
$data=getBanner("doi-tac");
if(count($data) > 0){
	$items=$data["items"];
	if(count($items) > 0){
		?>
		<div class="partner-wrapper">
			<div class="container padding-top-45 padding-bottom-15">
				<div class="col-lg-12">
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
										items:1
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
			</div>  
		</div>		
		<?php
	}  
}
?>
<div class="contact-wrapper padding-bottom-45">
	<div class="container">
		<div class="col-lg-6"><div class="margin-top-45"><img src="<?php echo asset('upload/house.jpg'); ?>"></div></div>
		<div class="col-lg-6">
			<hr class="gach-ngang-4">
			<div class="du-an-noi-bat-2 margin-top-20">
				<div class="du-an">Thông tin</div>
				<div class="noi-bat margin-left-5">Liên hệ</div>
			</div>
			<div class="margin-top-10"><center>Tư vấn pháp luật đất đai là một trong những công cụ hữu hiệu để bạn giải quyết các thắc mắc trong lĩnh vực đất đai một cách nhanh chóng, thuận lợi nhất.</center></div>
			<?php            				
				if(count($error) > 0 || count($success) > 0){
					?>
					<div class="alert-system margin-top-15">
						<?php                                           
						if(count($error) > 0){
							?>
							<ul class="alert-error">
								<?php 
								foreach ($error as $key => $value) {
									?>
									<li><?php echo $value; ?></li>
									<?php
								}
								?>                              
							</ul>
							<?php
						}
						if(count($success) > 0){
							?>
							<ul class="alert-success">
								<?php 
								foreach ($success as $key => $value) {
									?>
									<li><?php echo $value; ?></li>
									<?php
								}
								?>                              
							</ul>
							<?php
						}
						?>                                              
					</div>              
					<?php
				}
				?>
			<form  method="post" name="frm-home-contact" class="home-contact-hd margin-top-15 padding-top-15 padding-bottom-15">
				{{ csrf_field() }}      				
				<div>
					<div class="col-lg-6">
						<input type="text" name="title" class="form-control" placeholder="Tiêu đề">
					</div>
					<div class="col-lg-6">
						<input type="text" name="fullname" class="form-control" placeholder="Họ và tên">
					</div>
					<div class="clr"></div>
				</div>
				<div class="margin-top-15">
					<div class="col-lg-6">
						<input type="text" name="email" class="form-control" placeholder="Email">
					</div>
					<div class="col-lg-6">
						<input type="text" name="telephone" class="form-control" placeholder="Số điện thoại">
					</div>
					<div class="clr"></div>
				</div>
				<div class="margin-top-15">
					<div class="col-lg-10">
						<input type="text" name="content" class="form-control" placeholder="Nội dung">
					</div>
					<div class="col-lg-2">
						<div class="service-readmore-2">
							<center><a href="javascript:void(0);" onclick="document.forms['frm-home-contact'].submit();">Gửi</a></center>									
						</div>
					</div>
					<div class="clr"></div>
				</div>
				<div class="hotline-info">
					<div class="col-lg-6">
						<div class="margin-top-15"><i class="fa fa-envelope" aria-hidden="true"></i><span class="margin-left-10"><?php echo $email_to; ?></span></div>
					</div>
					<div class="col-lg-6">
						<div class="margin-top-15 telephone-info">
							<i class="fa fa-volume-control-phone" aria-hidden="true"></i><span class="margin-left-10"><?php echo $telephone; ?></span>
						</div>
					</div>
					<div class="clr"></div>
				</div>
				<div class="social-2 margin-top-15">
					<center>
						<span><a href="<?php echo $facebook_url; ?>" target="_blank" title="facebook"><i class="fa fa-facebook" aria-hidden="true"></i></a></span>
						<span class="margin-left-10"><a href="<?php echo $google_plus; ?>" target="_blank" title="google+"><i class="fa fa-google-plus" aria-hidden="true"></i></a></span>
						<span class="margin-left-10"><a href="<?php echo $twitter_url; ?>" target="_blank" title="twitter"><i class="fa fa-twitter" aria-hidden="true"></i></a></span>
						<span class="margin-left-10"><a href="<?php echo $youtube_url; ?>" target="_blank" title="youtube_"><i class="fa fa-youtube" aria-hidden="true"></i></a></span>
					</center>					
				</div>
			</form>			
		</div>
		<div class="clr"></div>
	</div>
</div>
@endsection()               