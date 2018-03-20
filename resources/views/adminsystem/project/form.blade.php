@extends("adminsystem.master")
@section("content")
<?php 
$setting= getSettingSystem();
$linkCancel             =   route('adminsystem.'.$controller.'.getList');
$linkSave               =   route('adminsystem.'.$controller.'.save');
$linkUploadFile         =   route('adminsystem.'.$controller.'.uploadFile');
$linkCreateAlias        =   route('adminsystem.'.$controller.'.createAlias');
$linkFilterDistrictByProvince        =   route('adminsystem.district.filterDistrictByProvince');
$inputFullName          =   '<input type="text" class="form-control" name="fullname"      onblur="createAlias();"   value="'.@$arrRowData['fullname'].'">';
$inputAlias             =   '<input type="text" class="form-control" name="alias"      disabled      value="'.@$arrRowData['alias'].'">';
$inputIntro             =   '<textarea      name="intro" rows="5" cols="100" class="form-control" >'.@$arrRowData['intro'].'</textarea>'; 
$inputOverview          =   '<textarea      name="overview" rows="5" cols="100" class="form-control" >'.@$arrRowData['overview'].'</textarea>'; 
$inputEquipment         =   '<textarea      name="equipment" rows="2" cols="100" class="form-control" >'.@$arrRowData['equipment'].'</textarea>'; 
$inputPriceList         =   '<textarea      name="price_list" rows="2" cols="100" class="form-control" >'.@$arrRowData['price_list'].'</textarea>'; 
$inputGoogleMapUrl      =   '<textarea      name="googlemap_url" rows="2" cols="100" class="form-control" >'.@$arrRowData['googlemap_url'].'</textarea>'; 
$inputMetakeyword       =   '<textarea      name="meta_keyword" rows="2" cols="100" class="form-control" >'.@$arrRowData['meta_keyword'].'</textarea>'; 
$inputMetadescription   =   '<textarea      name="meta_description" rows="2" cols="100" class="form-control" >'.@$arrRowData['meta_description'].'</textarea>'; 
$inputTotalCost         =   '<input type="text" class="form-control" name="total_cost"       value="'.@$arrRowData['total_cost'].'">';
$ddlProvince            =   cmsSelectboxCategory("province_id","form-control",$arrProvince,@$arrRowData['province_id'],"");
$ddlDistrict            =   cmsSelectboxCategory("district_id","form-control",$arrDistrict,@$arrRowData['district_id'],"");
$ddlCategoryParam        =cmsSelectboxCategoryParamMultiple("category_param_id[]", 'form-control', @$arrCategoryParamRecursive, @$arrPostParam,"");
$inputStreet            =   '<input type="text" class="form-control" name="street"      value="'.@$arrRowData['street'].'">'; 
$inputSortOrder         =   '<input type="text" class="form-control" name="sort_order"    value="'.@$arrRowData['sort_order'].'">';
$status                 =   (count($arrRowData) > 0) ? @$arrRowData['status'] : 1 ;
$arrStatus              =   array(-1 => '- Select status -', 1 => 'Publish', 0 => 'Unpublish');  
$ddlStatus              =   cmsSelectbox("status","form-control",$arrStatus,$status,"");
$id                     =   (count($arrRowData) > 0) ? @$arrRowData['id'] : "" ;
$inputID                =   '<input type="hidden" name="id"  value="'.@$id.'" />'; 
$inputDistrictID        =   '<input type="hidden" name="district_hidden_id"  value="'.@$arrRowData['district_id'].'" />'; 
$picture                =   "";
$strImage               =   "";
$setting= getSettingSystem();
$article_width = $setting['article_width']['field_value'];
$article_height = $setting['article_height']['field_value'];  
if(count(@$arrRowData)>0){
    if(!empty(@$arrRowData["image"])){
        $picture        =   '<div class="col-sm-6"><center>&nbsp;<img src="'.asset("/upload/" . $article_width . "x" . $article_height . "-".@$arrRowData["image"]).'" style="width:100%" />&nbsp;</center></div><div class="col-sm-6"><a href="javascript:void(0);" onclick="deleteImage();"><img src="'.asset('public/adminsystem/images/delete-icon.png').'"/></a></div>';                        
        $strImage       =   @$arrRowData["image"];
    }        
} 
$inputPictureHidden     =   '<input type="hidden" name="image_hidden"  value="'.@$strImage.'" />';
?>
<div class="portlet light bordered">
    <div class="portlet-title">
        <div class="caption">
            <i class="{{$icon}}"></i>
            <span class="caption-subject font-dark sbold uppercase">{{$title}}</span>
        </div>
        <div class="actions">
           <div class="table-toolbar">
            <div class="row">
                <div class="col-md-12">
                    <button onclick="save();" class="btn purple">Lưu <i class="fa fa-floppy-o"></i></button> 
                    <a href="<?php echo $linkCancel; ?>" class="btn green">Thoát <i class="fa fa-ban"></i></a>                    </div>                                                
                </div>
            </div>    
        </div>
    </div>
    <div class="portlet-body form">
        <form class="form-horizontal" name="frm" role="form" enctype="multipart/form-data">
            {{ csrf_field() }}
            <?php echo $inputPictureHidden; ?>                
            <?php echo  $inputID; ?>       
            <?php echo $inputDistrictID; ?>            
            <div class="form-body">
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>Tên dự án</b></label>
                        <div class="col-md-10">
                            <?php echo $inputFullName; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>                         
                </div> 
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>Alias</b></label>
                        <div class="col-md-10">
                            <?php echo $inputAlias; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>   
                </div>         
                        
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>Meta keyword</b></label>
                        <div class="col-md-10">
                            <?php echo $inputMetakeyword; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>   
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>Meta description</b></label>
                        <div class="col-md-10">                            
                            <?php echo $inputMetadescription; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>     
                </div>   
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>Province</b></label>
                        <div class="col-md-10">                            
                            <?php echo $ddlProvince; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>     
                </div>   
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>District</b></label>
                        <div class="col-md-10">                            
                            <?php echo $ddlDistrict; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>     
                </div>    

                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>Địa điểm</b></label>
                        <div class="col-md-10">                            
                            <?php echo $inputStreet; ?>                            
                           <span class="help-block"></span>
                       </div>
                   </div>                       
                </div>   
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>Hình</b></label>
                        <div class="col-md-10">
                            <input type="file"  name="image"  />   
                            <div class="picture-area"><?php echo $picture; ?>                      </div>
                        </div>
                    </div>     
                </div>                       
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>Kinh phí dự án</b></label>
                        <div class="col-md-10">                            
                            <?php echo $inputTotalCost; ?>                           
                           <span class="help-block"></span>
                       </div>
                   </div>                       
                </div>   
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>Đơn vị</b></label>
                        <div class="col-md-10">
                            <?php echo $ddlCategoryParam; ?>
                            <span class="help-block"></span>
                        </div>
                    </div> 
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>Mô tả ngắn</b></label>
                        <div class="col-md-10">                            
                            <?php echo $inputIntro; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>    
                </div>                
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>Tổng quan</b></label>
                        <div class="col-md-10">                            
                            <?php echo $inputOverview; ?>
                            <span class="help-block"></span>
                            <script type="text/javascript" language="javascript">
                                CKEDITOR.replace('overview',{
                                   height:300
                               });
                           </script>                           
                       </div>
                   </div>                       
                </div>   
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>Tiện ích</b></label>
                        <div class="col-md-10">                            
                            <?php echo $inputEquipment; ?>
                            <span class="help-block"></span>
                            <script type="text/javascript" language="javascript">
                                CKEDITOR.replace('equipment',{
                                   height:300
                               });
                           </script>    
                        </div>
                    </div>    
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>Bảng giá</b></label>
                        <div class="col-md-10">                            
                            <?php echo $inputPriceList; ?>
                            <span class="help-block"></span>
                            <script type="text/javascript" language="javascript">
                                CKEDITOR.replace('price_list',{
                                   height:300
                               });
                           </script>    
                        </div>
                    </div>    
                </div>    
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>Google map</b></label>
                        <div class="col-md-10">                            
                            <?php echo $inputGoogleMapUrl; ?>
                            <span class="help-block"></span>                            
                        </div>
                    </div>    
                </div>                             
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>Sắp xếp</b></label>
                        <div class="col-md-10">
                            <?php echo $inputSortOrder; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>  
                </div>
                <div class="row"> 
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>Trạng thái</b></label>
                        <div class="col-md-10">                            
                            <?php echo $ddlStatus; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>     
                </div>                                                                             
            </div>              
        </form>
    </div>
</div>
<script type="text/javascript" language="javascript">
    function resetErrorStatus(){
        var id                   =   $('input[name="id"]');
        var fullname             =   $('input[name="fullname"]');
        var province_id             =   $('select[name="province_id"]');
        var district_id             =   $('select[name="district_id"]');
        var alias                =   $('input[name="alias"]');        
        var sort_order           =   $('input[name="sort_order"]');
        var status               =   $('select[name="status"]');
        
        $(fullname).closest('.form-group').removeClass("has-error");        
        $(province_id).closest('.form-group').removeClass("has-error");   
        $(district_id).closest('.form-group').removeClass("has-error");   
        $(alias).closest('.form-group').removeClass("has-error");        
        $(sort_order).closest('.form-group').removeClass("has-error");
        $(status).closest('.form-group').removeClass("has-error");        

        $(fullname).closest('.form-group').find('span').empty().hide();  
        $(province_id).closest('.form-group').find('span').empty().hide();  
        $(district_id).closest('.form-group').find('span').empty().hide();        
        $(alias).closest('.form-group').find('span').empty().hide();       
        $(sort_order).closest('.form-group').find('span').empty().hide();
        $(status).closest('.form-group').find('span').empty().hide();        
    }

    function uploadFileImport(){    
        var token = $('input[name="_token"]').val();       
        var image=$('input[name="image"]'); 
        var file_upload=$(image).get(0);
        var files = file_upload.files;
        var file  = files[0];    
        var frmdata = new FormData();        
        frmdata.append("image", file);
        frmdata.append("_token", token);
        $.ajax({ url: '<?php echo $linkUploadFile; ?>', method: 'post', data: frmdata, contentType: false, processData: false })
    }
    function deleteImage(){
        var xac_nhan = 0;
        var msg="Bạn có muốn xóa ?";
        if(window.confirm(msg)){ 
            xac_nhan = 1;
        }
        if(xac_nhan  == 0){
            return 0;
        }
        $(".picture-area").empty();
        $("input[name='image_hidden']").val("");        
    }
    function save(){
        var id=$('input[name="id"]').val();        
        var fullname=$('input[name="fullname"]').val();
        var alias=$('input[name="alias"]').val();        
         
        var meta_keyword=$('textarea[name="meta_keyword"]').val();
        var meta_description=$('textarea[name="meta_description"]').val();
        var image = $('input[name="image"]').val();
        if (image != ''){
            image = image.substr(image.lastIndexOf('\\') + 1);       
        }
        var image_hidden=$('input[name="image_hidden"]').val();         
        var total_cost=$('input[name="total_cost"]').val();     
        var category_param_id=$('select[name="category_param_id[]"]').val();      
        var intro=$('textarea[name="intro"]').val();        
        var overview=CKEDITOR.instances['overview'].getData();    
        var equipment=CKEDITOR.instances['equipment'].getData();    
        var price_list=CKEDITOR.instances['price_list'].getData();    
        var googlemap_url=$('textarea[name="googlemap_url"]').val();   
        var province_id=$('select[name="province_id"]').val();     
        var district_id=$('select[name="district_id"]').val();         
        var street=$('input[name="street"]').val();        
        var sort_order=$('input[name="sort_order"]').val();
        var status=$('select[name="status"]').val();     
        var token = $('input[name="_token"]').val();   
        resetErrorStatus();
        var dataItem={
            "id":id,
            "fullname":fullname,
            "alias":alias,                
            "meta_keyword":meta_keyword,
            "meta_description":meta_description,                   
            "image":image,       
            "image_hidden":image_hidden,
            "total_cost":total_cost,     
            "category_param_id":category_param_id,                
            "intro":intro,
            "overview":overview,
            "equipment":equipment,
            "price_list":price_list,
            "googlemap_url":googlemap_url,
            "street":street,     
            "province_id":province_id,
            "district_id":district_id,                            
            "sort_order":sort_order,
            "status":status,
            "_token": token
        };
        $.ajax({
            url: '<?php echo $linkSave; ?>',
            type: 'POST',
            data: dataItem,
            async: false,
            success: function (data) {
                if(data.checked==1){
                    uploadFileImport();
                    window.location.href = "<?php echo $linkCancel; ?>";
                }else{
                    var data_error=data.error;
                    if(typeof data_error.fullname               != "undefined"){
                        $('input[name="fullname"]').closest('.form-group').addClass(data_error.fullname.type_msg);
                        $('input[name="fullname"]').closest('.form-group').find('span').text(data_error.fullname.msg);
                        $('input[name="fullname"]').closest('.form-group').find('span').show();                        
                    }             
                    if(typeof data_error.province_id               != "undefined"){
                        $('select[name="province_id"]').closest('.form-group').addClass(data_error.province_id.type_msg);
                        $('select[name="province_id"]').closest('.form-group').find('span').text(data_error.province_id.msg);
                        $('select[name="province_id"]').closest('.form-group').find('span').show();                        
                    }     
                    if(typeof data_error.district_id               != "undefined"){
                        $('select[name="district_id"]').closest('.form-group').addClass(data_error.district_id.type_msg);
                        $('select[name="district_id"]').closest('.form-group').find('span').text(data_error.district_id.msg);
                        $('select[name="district_id"]').closest('.form-group').find('span').show();                        
                    }          
                    if(typeof data_error.alias                  != "undefined"){
                        $('input[name="alias"]').closest('.form-group').addClass(data_error.alias.type_msg);
                        $('input[name="alias"]').closest('.form-group').find('span').text(data_error.alias.msg);
                        $('input[name="alias"]').closest('.form-group').find('span').show();                       
                    }                    
                    if(typeof data_error.sort_order               != "undefined"){
                        $('input[name="sort_order"]').closest('.form-group').addClass(data_error.sort_order.type_msg);
                        $('input[name="sort_order"]').closest('.form-group').find('span').text(data_error.sort_order.msg);
                        $('input[name="sort_order"]').closest('.form-group').find('span').show();                        
                    }
                    if(typeof data_error.status               != "undefined"){
                        $('select[name="status"]').closest('.form-group').addClass(data_error.status.type_msg);
                        $('select[name="status"]').closest('.form-group').find('span').text(data_error.status.msg);
                        $('select[name="status"]').closest('.form-group').find('span').show();

                    }                    
                }
                spinner.hide();
            },
            error : function (data){
                spinner.hide();
            },
            beforeSend  : function(jqXHR,setting){
                spinner.show();
            },
        });
    }
    function createAlias(){
        var id=$('input[name="id"]').val();   
        var fullname    = $('input[name="fullname"]').val();
        var token       = $('input[name="_token"]').val();     
        var dataItem={      
            "id":id,      
            "fullname":fullname,            
            "_token": token
        };   
        $('input[name="alias"]').val(''); 
        resetErrorStatus();    
        $.ajax({
            url: '<?php echo $linkCreateAlias; ?>',
            type: 'POST',
            data: dataItem,            
            async: false,
            success: function (data) {                
                if(data.checked==1){
                    $('input[name="alias"]').val(data.alias); 
                }else{                    
                    var data_error=data.error;
                    if(typeof data_error.fullname               != "undefined"){
                        $('input[name="fullname"]').closest('.form-group').addClass(data_error.fullname.type_msg);
                        $('input[name="fullname"]').closest('.form-group').find('span').text(data_error.fullname.msg);
                        $('input[name="fullname"]').closest('.form-group').find('span').show();                        
                    }      
                                     
                }
                spinner.hide();
            },
            error : function (data){
                spinner.hide();
            },
            beforeSend  : function(jqXHR,setting){
                spinner.show();
            },
        });
    }
    $('select[name="province_id"]').on('click',function(){
        var province_id = $('select[name="province_id"]').val();
        var token       = $('input[name="_token"]').val();
        var dataItem={      
            "province_id":province_id,                  
            "_token": token,
        }; 
        $.ajax({
            url: '<?php echo $linkFilterDistrictByProvince; ?>',
            type: 'POST',
            data: dataItem,            
            async: false,
            success: function (data) {   
                $('select[name="district_id"]').empty();      
                $('select[name="district_id"]').append('<option >--Select a category--</option>');          
                $.each(data,function(i,value){
                    $('select[name="district_id"]').append('<option value="'+value.id+'">'+value.fullname+'</option>');
                });
            },
            error : function (data){

            },
            beforeSend  : function(jqXHR,setting){

            },
        });
    });
    function filterDistrictByProvince(){
        var province_id = $('select[name="province_id"]').val();
        var district_id = $('input[name="district_hidden_id"]').val();        
        var token       = $('input[name="_token"]').val();
        var dataItem={      
            "province_id":province_id,                  
            "_token": token,
        }; 
        $.ajax({
            url: '<?php echo $linkFilterDistrictByProvince; ?>',
            type: 'POST',
            data: dataItem,            
            async: false,
            success: function (data) {   
                $('select[name="district_id"]').empty();      
                $('select[name="district_id"]').append('<option >--Select a category--</option>');          
                $.each(data,function(i,value){
                    if(parseInt(value.id) == parseInt(district_id)){
                        $('select[name="district_id"]').append('<option value="'+value.id+'" selected>'+value.fullname+'</option>');
                    }else{
                        $('select[name="district_id"]').append('<option value="'+value.id+'">'+value.fullname+'</option>');
                    }
                });
            },
            error : function (data){

            },
            beforeSend  : function(jqXHR,setting){

            },
        });
    }   
    $(document).ready(function(){
        filterDistrictByProvince();
    });
</script>
@endsection()            