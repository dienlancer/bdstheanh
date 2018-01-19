@extends("frontend.master")
@section("content")
<?php 
use App\ProjectModel;
$setting=getSettingSystem();
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
				$total_cost=$value['total_cost'];
				$place=$value['place'];
				$permalink=route('frontend.index.index',[$value['alias']]);
				?>
				<div class="col-sm-3">
					<div class="box-project margin-top-15 relative padding-bottom-15">
						<div class="project-price"><span><?php echo $total_cost; ?></span><span class="margin-left-5">triệu</span><span class="margin-left-5">VNĐ</span></div>
						<div>
							<center><figure><a href="<?php echo $permalink; ?>"><img src="<?php echo $thumbnail; ?>"></a></figure></center>
						</div>
						<div class="box-project-info">
							<div class="margin-top-10 box-project-title"><center><a href="<?php echo $permalink; ?>"><?php echo $fullname; ?></a></center></div>
							<hr class="project-gach-info margin-top-10">
							<div class="margin-top-10"><center><?php echo $place; ?></center></div>
						</div>
					</div>
				</div>
				<?php
				if($k%4 == 0 || $k==count($data)){
					echo '<div class="clr"></div>';
				}
			}
			?>
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
					<div><center><img src="<?php echo asset('upload/icon-1.png'); ?>"></center></div>
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
					<div><center><img src="<?php echo asset('upload/icon-1.png'); ?>"></center></div>
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
					<div><center><img src="<?php echo asset('upload/icon-1.png'); ?>"></center></div>
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
@endsection()               