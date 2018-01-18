<form method="post" class="frm margin-top-15" name="frm">
	<input type="hidden" name="filter_page" value="1">         
	{{ csrf_field() }}	
	<?php 		
	if(empty($breadcrumb)){
		?>
		<h2 class="tieu-de">
			<?php echo $title; ?>		
		</h2>
		<?php
	}else{
		?>
		<h2 class="breadcrumb-title">
			<?php echo $breadcrumb; ?>
		</h2>
		<?php
	}	
	?>
	<div class="row">
		<?php 	
		if(count($items) > 0){
			$k=1;			
			foreach ($items as $key => $value) {
				$id=$value['id'];
				$alias=$value['alias'];
				$fullname=$value['fullname'];
				$permalink=route('frontend.index.index',[$alias]) ;
				$featuredImg =get_featured_image($value['image']) ;						
				?>
				<div class="col-sm-3 no-padding-left">
					<div class="margin-top-15">
						<div>
							<center><figure><a href="<?php echo $permalink; ?>"><img src="<?php echo $featuredImg; ?>" /></a></figure></center>
						</div>
						<div class="box-product-title margin-top-5"><a href="<?php echo $permalink; ?>"><b><?php echo $fullname; ?></b></a></div>						
					</div>
				</div>
				<?php			
				if($k%4==0 || $k==count($items)){
					echo '<div class="clr"></div>';
				}
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
	</div>
</form>