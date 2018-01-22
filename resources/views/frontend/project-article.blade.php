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
	<div class="margin-top-15 box-article">
		<h2 class="tieu-de-bai-viet">
			<?php echo $title; ?>		
		</h2>
		<div class="margin-top-15">
			<span class="box-article-category">
				<i class="fa fa-folder" aria-hidden="true"></i>
				<span class="margin-left-5"><b>Dự án:</b></span><span class="margin-left-5"><?php echo $project_name; ?></span>
			</span>
			<span class="post-view margin-left-15">
				<i class="fa fa-eye" aria-hidden="true"></i>&nbsp;&nbsp;<?php echo $count_view_text ?>&nbsp;Lượt xem
			</span>
		</div>	
		<hr class="duong-ngang" />	
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

