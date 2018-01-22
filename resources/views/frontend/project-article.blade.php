<?php 
use App\ProjectModel;
use App\ProjectArticleModel;
use Illuminate\Support\Facades\DB;
if(count($item) > 0){			
	$id=$item["id"];
	$fullname = $item["fullname"];
	$intro=$item["intro"];
	$content=$item['content'];	
	/* begin cập nhật count view */
	$count_view=(int)@$item['count_view'];
	$count_view++;
	$row				=	ProjectArticleModel::find((int)@$id); 
	$row->count_view=$count_view;
	$row->save();
	$count_view_text=number_format($count_view,0,",",".");
	/* end cập nhật count view */
	$dataProject=ProjectModel::whereRaw('id = ?',(int)@$item['project_id'])->select('id','fullname','alias')->get()->toArray();	
	$project_name='';	
	$project_alias='';	
	if(count($dataProject) > 0){
		$project_alias=route('frontend.index.index',[$dataProject[0]['alias']]);		
		$project_name='<a href="'.$project_alias.'">'.$dataProject[0]['fullname'].'</a>';
	}		
	?>
	<h2 class="breadcrumb-title margin-top-15">
		<?php echo $project_name; ?>
	</h2>
	<div class="margin-top-5 box-article">		
		<h2 class="tieu-de-bai-viet"><?php echo $title; ?></h2>
		<hr class="duong-ngang-2" />	
		<div class="margin-top-10 article-excerpt justify">
			<?php echo $intro; ?>
		</div>		
		<div class="margin-top-15">
			<?php echo $content; ?>
		</div>	
		<hr class="duong-ngang" />
		<?php 
		$dataRelatedProject=ProjectArticleModel::whereRaw('project_id = ? and id != ?',[(int)@$item['project_id'],(int)@$id])
							->orderBy('project_article.created_at','desc')
							->select()
							->get()
							->toArray();	
		if(count($dataRelatedProject) > 0){
			$dataRelatedProject=convertToArray($dataRelatedProject);	
			?>
			<div class="margin-top-10">
				<div class="related-news">
					<b>Tin liên quan :</b>
				</div>
				<div class="related-news-right">
					<ul class="related-articles">
						<?php 
						foreach ($dataRelatedProject as $key => $value) {
							$related_article_fullname=$value["fullname"];
							$related_article_alias=$value['alias'];
							$related_article_permalink=route('frontend.index.index',[$related_article_alias]) ;
							?>
							<li><a href="<?php echo $related_article_permalink; ?>"><?php echo $related_article_fullname; ?></a></li>
							<?php
						}
						?>					
					</ul>
				</div>	
				<div class="clr"></div>			
			</div>	
			<?php
		}
		?>
	</div>
	<?php
}
?>	

