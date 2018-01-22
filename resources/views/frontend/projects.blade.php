<?php 
use App\ProjectModel;
use App\ProjectArticleModel;
use App\ProjectMemberModel;
use App\ProvinceModel;
use App\DistrictModel;
?>
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
	<div>
		<?php 	
		if(count($items) > 0){
			$k=1;			
			foreach ($items as $key => $value) {
				$id=$value['id'];
				$alias=$value['alias'];
				$fullname=$value['fullname'];
				$permalink=route('frontend.index.index',[$alias]) ;
				$image=get_article_thumbnail($value['image']) ;
				$intro=substr($value['intro'],0,200).'...' ;
				$count_view=(int)@$value['count_view'];
				$count_view_text=number_format($count_view,0,",",".");		
				$province=ProvinceModel::find((int)@$value['province_id'])->toArray();	
				$district=DistrictModel::find((int)@$value['district_id'])->toArray();	
				$province_name=$province['fullname'];
				$district_name=$district['fullname'];
				$province_permalink=route('frontend.index.index',[$province['alias']]);
				$district_permalink=route('frontend.index.index',[$district['alias']]);
				$street=$value['street'];
				$total_cost=number_format($value['total_cost'],0,",",".") ;
				$unit=$value['unit'];
				?>
				<div class="box-row margin-top-10">
					<div class="col-sm-4 no-padding-left"><div class="box-img"><center><figure><a href="<?php echo $permalink; ?>"><img src="<?php echo $image; ?>" /></a></figure></center></div></div>
					<div class="col-sm-8 no-padding-left">
						<h3 class="box-title"><a href="<?php echo $permalink; ?>"><?php echo $fullname; ?></a></h3>
						<div class="margin-top-10">
							<div class="col-sm-3 no-padding-left"><a href="<?php echo $province_permalink; ?>"><?php echo $province_name; ?></a></div>
							<div class="col-sm-3 no-padding-left"><a href="<?php echo $district_permalink; ?>"><?php echo $district_name; ?></a></div>
							<div class="col-sm-6 no-padding-left"><?php echo $street; ?></div>													
							<div class="clr"></div>
						</div>
						<div class="margin-top-10"><span class="project-lbl-price">Giá:</span><span class="project-lbl-price-number margin-left-5"><?php echo $total_cost; ?></span><span class="margin-left-5 project-lbl-price-number"><?php echo $unit; ?></span></div>	
						<div class="margin-top-10">
							<div class="view-post-count">
								<i class="fa fa-eye" aria-hidden="true"></i><span class="margin-left-5"><?php echo $count_view_text; ?>&nbsp;lượt xem	</span>
							</div>	
						</div>
						<div class="box-readmore margin-top-10"><a href="<?php echo $permalink; ?>">Xem chi tiết</a></div>
					</div>
					<div class="clr"></div>
				</div>
				<?php			
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