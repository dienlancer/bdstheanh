<?php 
$setting=getSettingSystem();
$map_url=$setting['map_url']['field_value'];       
?>
<form action="" method="POST">
	<input type="hidden" name="filter_page" value="1">         
	{{ csrf_field() }}	
	<h2 class="tieu-de-bai-viet">
		<?php echo $title; ?>
	</h2>
	<div class="margin-top-15">
		<?php 
		if(count($items) > 0){
			$k=1;			
			foreach ($items as $key => $value) {
				$id=$value['id'];				
				$large_image=asset('upload/'.$value['image']);
				$small_image=asset('upload/400x250-'.$value['image']);
				?>
				<div class="box-photo">
					<center><figure><a data-fancybox="gallery" href="<?php echo $large_image ; ?>"><img src="<?php echo $small_image; ?>" /></a></figure></center>
				</div>
				<?php
				if($k%7==0 || $k==count($items)){
					echo '<div class="clr"></div>';
				}
				$k++;
			}
		}
		?>
	</div>
	<div class="margin-top-15">

		<?php 
		if(count($items) > 0){
			echo $pagination->showPagination();
		}  
		?>
		<div class="clr"></div>
	</div>
</form>

