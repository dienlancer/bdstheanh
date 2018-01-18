<?php 
?>
<footer class="footer">
	<div class="container azweb">
		<div class="col-lg-3">			
			<?php 
			$module=getPage("intro-footer");
			if(count($module) > 0){
				$fullname=substr($module["fullname"],0,50);
				$featuredImg=asset('upload/'.$module['image']);
				$permalink=route('frontend.index.index',[$module['alias']]);	
				$content=$module["content"];					
				?>		
				<div class="margin-top-40">
					<h1 class="brabel"><?php echo $fullname; ?></h1>
					<div class="tialia margin-top-15">
						<?php echo $content; ?>
					</div>
					<div class="margin-top-15 thiet-ke-boi">Thiết kế bởi: <a href="https://vidoweb.com.vn" target="_blank">Vidoweb</a> </div>		
				</div>										
				<?php				
			}
			?>			
		</div>
		<div class="col-lg-3">
			<?php 
			$module=getPage("about-us-footer");
			if(count($module) > 0){
				$fullname=substr($module["fullname"],0,50);
				$featuredImg=asset('upload/'.$module['image']);
				$permalink=route('frontend.index.index',[$module['alias']]);	
				$content=$module["content"];					
				?>		
				<div class="margin-top-40">
					<h1 class="brabel"><?php echo $fullname; ?></h1>
					<div class="tialia margin-top-15">
						<?php echo $content; ?>
					</div>		
				</div>										
				<?php				
			}
			?>			
		</div>
		<div class="col-lg-3">
			<div class="margin-top-40">
				<h1 class="brabel">Fanpage</h1>
				<div class="tialia margin-top-15">
					<div class="fb-page" data-href="https://www.facebook.com/gonguyenlieumy/" data-tabs="timeline" data-width="250" data-height="200" data-small-header="true" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><blockquote cite="https://www.facebook.com/gonguyenlieumy/" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/gonguyenlieumy/">Công ty tnhh Greenecolife</a></blockquote></div>
				</div>		
			</div>							
		</div>
		<div class="col-lg-3">
			<div class="margin-top-40">
				<h1 class="brabel">Kết nối mạng xã hội</h1>
				<div class="tialia margin-top-15">
					<?php 
					$setting=getSettingSystem();
					$telephone=$setting['telephone']['field_value'];
					$facebook_url=$setting['facebook_url']['field_value'];
					$twitter_url=$setting['twitter_url']['field_value'];
					$google_plus=$setting['google_plus']['field_value'];
					$youtube_url=$setting['youtube_url']['field_value'];
					$instagram_url=$setting['instagram_url']['field_value'];
					$pinterest_url=$setting['pinterest_url']['field_value'];   
					?>
					<ul class="inline-block connected-social">
						<li><a href="<?php echo $facebook_url; ?>"><img src="<?php echo asset('upload/facebook-icon.png'); ?>"></a></li>
						<li><a href="<?php echo $twitter_url; ?>"><img src="<?php echo asset('upload/twitter-icon.png'); ?>"></a></li>
						<li><a href="<?php echo $google_plus; ?>"><img src="<?php echo asset('upload/google-plus.png'); ?>"></a></li>
						<li><a href="<?php echo $youtube_url; ?>"><img src="<?php echo asset('upload/youtube-icon.png'); ?>"></a></li>												
					</ul>
					<div class="clr"></div>  
				</div>
			</div>								
		</div>
	</div>
</footer>
<div class="modal fade modal-add-cart" id="modal-alert-add-cart" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>        
			</div>
			<div class="modal-body">

			</div>      
		</div>
	</div>
</div>