<?php 
$setting=getSettingSystem();
$map_url=$setting['map_url']['field_value'];       
?>
<h2 class="tieu-de margin-top-15">
	Liên hệ
</h2>		
<div class="box-article margin-top-10">
	<div class="col-md-4 contact no-padding-left">
		<form method="post" name="frm-contact" class="margin-top-15" enctype="multipart/form-data">							
			{{ csrf_field() }}      
			<?php                           
			if(count($error) > 0 || count($success) > 0){
				?>
				<div class="alert-system margin-top-15">
					<?php                                           
					if(count($error) > 0){
						?>
						<ul class="alert-error">
							<?php 
							foreach ($error as $key => $value) {
								?>
								<li><?php echo $value; ?></li>
								<?php
							}
							?>                              
						</ul>
						<?php
					}
					if(count($success) > 0){
						?>
						<ul class="alert-success">
							<?php 
							foreach ($success as $key => $value) {
								?>
								<li><?php echo $value; ?></li>
								<?php
							}
							?>                              
						</ul>
						<?php
					}
					?>                                              
				</div>              
				<?php
			}
			?>
			<div class="margin-top-5"><input type="input" class="contact-input" name="fullname" value="<?php echo @$data['fullname']; ?>" placeholder="Họ và tên"></div>
			<div class="margin-top-5"><input type="input" class="contact-input" name="email" value="<?php echo @$data['email']; ?>" placeholder="Email"></div>
			<div class="margin-top-5"><input type="input" class="contact-input" name="telephone" value="<?php echo @$data['telephone']; ?>" placeholder="Điện thoại"></div>
			<div class="margin-top-5"><input type="input" class="contact-input" name="title" value="<?php echo @$data['title']; ?>" placeholder="Chủ đề"></div>
			<div class="margin-top-5"><input type="input" class="contact-input" name="address" value="<?php echo @$data['address']; ?>" placeholder="Địa chỉ"></div>
			<div class="margin-top-5"><textarea name="content" class="contact-input" placeholder="Nội dung" ><?php echo @$data['content']; ?></textarea></div>
			<div class="margin-top-5 box-readmore">
				<a href="javascript:void(0);" onclick="document.forms['frm-contact'].submit();">Gửi</a>		  
			</div>				
		</form>
	</div>
	<div class="col-md-8 contact-info no-padding-left">
		<div class="margin-top-15">
			<?php 
			$module=getPage("thong-tin-lien-he-widget");
			if(count($module) > 0){
				$fullname=substr($module["fullname"],0,50);
				$featuredImg=asset('upload/'.$module['image']);
				$permalink=route('frontend.index.index',[$module['alias']]);	
				$intro=substr($module["intro"], 0,250) ;
				$content=$module['content'];
				echo $content;	
			}
			?>
		</div>				
	</div>
	<div class="clr"></div>
</div>
<div class="margin-top-15">
	<iframe src="<?php echo $map_url; ?>" width="100%" height="400" frameborder="0" style="border:0" allowfullscreen></iframe>
</div>