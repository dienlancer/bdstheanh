@extends("frontend.master")
@section("content")
<?php 
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
	</div>	
	<div class="clr"></div>
</div>
@endsection()               