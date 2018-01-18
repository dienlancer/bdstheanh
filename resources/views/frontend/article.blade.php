<?php 
use App\ArticleCategoryModel;
use App\ArticleModel;
use Illuminate\Support\Facades\DB;
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
	$row				=	ArticleModel::find((int)@$id); 
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
	$dataArticleCategory=DB::table('article_category')
	->join('category_article','article_category.category_article_id','=','category_article.id')		
	->select('category_article.id','category_article.fullname','category_article.alias')
	->where('article_category.article_id','=',(int)@$id)					
	->groupBy('category_article.id','category_article.fullname','category_article.alias')
	->orderBy('category_article.sort_order','asc')
	->get()->toArray();
	$arr_category_id=array();
	$arr_category_name=array();	
	$category_name='';	
	if(count($dataArticleCategory) > 0){		
		$dataArticleCategory=convertToArray($dataArticleCategory);
		foreach ($dataArticleCategory as $key => $value) {
			$arr_category_id[]=$value["id"];
			$permalink=route('frontend.index.index',[$value['alias']]);
			$arr_category_name[]='<a href="'.$permalink.'">'.$value["fullname"].'</a>' ;						
		}		
		$category_name=implode(' / ', $arr_category_name);		
	}		
	?>
	<h2 class="breadcrumb-title margin-top-15">
			<?php echo $category_name; ?>
		</h2>
	<div class="margin-top-10 box-article">		
		<div>
            <div class="col-lg-4 no-padding-left">
                <div class="margin-top-15">
                    <img  src="<?php echo $featuredImg; ?>" />
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
		<div class="margin-top-10 article-excerpt justify">
			<?php echo $intro; ?>
		</div>		
		<div class="margin-top-15">
			<?php echo $content; ?>
		</div>	
		<hr class="duong-ngang" />
		<?php 					
		if(count($arr_category_id) > 0){						
			$data=DB::table('article')
			->join('article_category','article.id','=','article_category.article_id')                			
			->select('article.id','article.alias','article.fullname')
			->whereIn('article_category.category_article_id', $arr_category_id)
			->where('article.id','<>',(int)@$id)
			->where('article.status','=',1)
			->groupBy('article.id','article.alias','article.fullname')
			->orderBy('article.created_at', 'desc')
			->take(6)
			->get()->toArray();
			$data=convertToArray($data);            
			?>
			<div class="margin-top-10">
				<div class="related-news">
					<b>Tin liên quan :</b>
				</div>
				<div class="related-news-right">
					<ul class="related-articles">
					<?php 
					foreach ($data as $key => $value) {
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

