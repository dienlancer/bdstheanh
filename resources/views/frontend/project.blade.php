<?php 
use App\ProjectModel;
use App\ProjectArticleModel;
use App\ProjectMemberModel;
use App\ProvinceModel;
use App\DistrictModel;
use Illuminate\Support\Facades\DB;
$setting=getSettingSystem();
if(count($item) > 0){		
	$id=$item["id"];
	$fullname = $item["fullname"];	
	$small_img=get_article_thumbnail($item['image']);
    $large_img=asset('upload/'.$item['image']) ;
    $alias=$item["alias"];
    $overview=$item["overview"];
    $equipment=$item["equipment"];
    $price_list=$item["price_list"];
    $googlemap_url=$item['googlemap_url'];
    $total_cost=number_format($item['total_cost'],0,",",".") ;
    $unit=$item['unit'];
    $intro=$item["intro"];				
    /* begin cập nhật count view */
    $count_view=(int)@$item['count_view'];
    $count_view++;
    $row				=	ProjectModel::find((int)@$id); 
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
    $province=ProvinceModel::find((int)@$item['province_id'])->toArray();    
    $district=DistrictModel::find((int)@$item['district_id'])->toArray();  
    $province_name=$province['fullname'];
    $district_name=$district['fullname'];
    $province_permalink=route('frontend.index.index',[$province['alias']]);
    $district_permalink=route('frontend.index.index',[$district['alias']]);
    $street=$item['street'];
    
    ?>  
    <h2 class="tieu-de margin-top-15">
            Dự án
        </h2>
<div class="margin-top-10 box-article">		
    <div>
        <div class="col-lg-4 no-padding-left">
            <div class="margin-top-15">
                <img class="zoom_img" src="<?php echo $small_img; ?>" data-zoom-image="<?php echo $large_img; ?>" />
            </div>
        </div>
        <div class="col-lg-8 no-padding-left">
            <div class="margin-top-15 product-detail-title">
                <?php echo $title; ?>
            </div>
            <div class="margin-top-5">
                <b>Lượt xem:</b>&nbsp;<?php echo $count_view; ?>
            </div>
            <div class="margin-top-10">
                <div class="col-sm-3 no-padding-left"><a href="<?php echo $province_permalink; ?>"><?php echo $province_name; ?></a></div>
                <div class="col-sm-3 no-padding-left"><a href="<?php echo $district_permalink; ?>"><?php echo $district_name; ?></a></div>
                <div class="col-sm-6 no-padding-left"><?php echo $street; ?></div>                                                  
                <div class="clr"></div>
            </div>
            <div class="margin-top-5 product-price">
                <span class="project-lbl-price">Giá:</span><span class="project-lbl-price-number margin-left-5"><?php echo $total_cost; ?></span><span class="margin-left-5 project-lbl-price-number"><?php echo $unit; ?></span>
            </div>                                
            <div class="margin-top-5">
                <span class="phone-tel"><i class="fa fa-phone" aria-hidden="true"></i></span>&nbsp;Hotline:&nbsp;<?php echo $telephone; ?>
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
        <script type="text/javascript" language="javascript">
            function openCity(evt, cityName) {    
                var i, tabcontent, tablinks;
                tabcontent = document.getElementsByClassName("tabcontent");
                for (i = 0; i < tabcontent.length; i++) {
                    tabcontent[i].style.display = "none";
                }   
                tablinks = document.getElementsByClassName("tablinks");
                for (i = 0; i < tablinks.length; i++) {
                    tablinks[i].className = tablinks[i].className.replace(" active", "");
                }   
                document.getElementById(cityName).style.display = "block";
                evt.currentTarget.className += " active";
            }
            jQuery(document).ready(function(){
                jQuery("#overview").show();
                jQuery("div.tab > button.tablinks:first-child").addClass('active');
            });
        </script>       
        <div class="tab">
            <button class="tablinks h-title" onclick="openCity(event, 'overview')">Tổng quan</button>
            <button class="tablinks h-title" onclick="openCity(event, 'equipment')">Tiện ích</button>               
            <button class="tablinks h-title" onclick="openCity(event, 'price-list')">Bảng giá</button>
            <button class="tablinks h-title" onclick="openCity(event, 'tien-do')">Tiến độ thi công</button>                 
            <button class="tablinks h-title" onclick="openCity(event, 'position')">Vị trí</button>                                 
            <div class="clr"></div>           
        </div>
        <div id="overview" class="tabcontent">
            <div class="justify"><?php echo $overview; ?></div>
        </div>
        <div id="equipment" class="tabcontent">
            <div class="justify"><?php echo $equipment; ?></div>
        </div>          
        <div id="price-list" class="tabcontent">
            <div class="justify"><?php echo $price_list; ?></div>
        </div>    
        <div id="tien-do" class="tabcontent">
            <?php  
            $dataNews=ProjectArticleModel::whereRaw("project_id = ? and status = ?",[@$id,1])
            ->select('project_article.id','project_article.alias','project_article.fullname','project_article.image','project_article.intro','project_article.count_view')
            ->orderBy('project_article.created_at', 'desc')                
            ->take(10)
            ->get()->toArray();
            if(count($dataNews) > 0){
                foreach ($dataNews as $key => $value) {
                    $id=$value['id'];
                    $alias=$value['alias'];
                    $fullname=$value['fullname'];
                    $permalink=route('frontend.index.index',[$alias]) ;
                    $image=asset('upload/'.$value['image']);
                    $intro=substr($value['intro'],0,200).'...' ;
                    $count_view=(int)@$value['count_view'];
                    $count_view_text=number_format($count_view,0,",",".");
                    ?>
                    <div class="box-row margin-top-10">
                        <div class="col-lg-4 no-padding-left"><div class="box-img"><figure><a href="<?php echo $permalink; ?>"><img src="<?php echo $image; ?>" /></a></figure></div></div>
                        <div class="col-lg-8 no-padding-left">
                            <h3 class="box-title"><a href="<?php echo $permalink; ?>"><?php echo $fullname; ?></a></h3>
                            <div class="margin-top-5"><i class="fa fa-eye" aria-hidden="true"></i>&nbsp;&nbsp;<?php echo $count_view_text; ?>&nbsp;lượt xem</div>
                            <div class="margin-top-5 box-intro"><?php echo $intro; ?></div>
                            <div class="box-readmore margin-top-10"><a href="<?php echo $permalink; ?>">Xem chi tiết</a></div>
                        </div>
                        <div class="clr"></div>
                    </div>
                    <?php   
                }
            }
            ?>
        </div>    
        <div id="position" class="tabcontent">
            <iframe src="<?php echo $googlemap_url; ?>" width="100%" height="400" frameborder="0" style="border:0" allowfullscreen></iframe> 
        </div>            
    </div>			
</div>
<?php
}
?>	
<script language="javascript" type="text/javascript">
    jQuery('.zoom_img').elevateZoom({
        zoomType: "inner",
        cursor: "crosshair",
        zoomWindowFadeIn: 500,
        zoomWindowFadeOut: 750
    });
</script> 