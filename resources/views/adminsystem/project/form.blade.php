@extends("adminsystem.master")
@section("content")
<?php 
$setting= getSettingSystem();
$linkCancel             =   route('adminsystem.'.$controller.'.getList');
$linkSave               =   route('adminsystem.'.$controller.'.save');

$linkCreateAlias        =   route('adminsystem.'.$controller.'.createAlias');
$linkFilterDistrictByProvince        =   route('adminsystem.district.filterDistrictByProvince');
$inputFullName          =   '<input type="text" class="form-control" name="fullname"      onblur="createAlias();"   value="'.@$arrRowData['fullname'].'">';
$inputAlias             =   '<input type="text" class="form-control" name="alias"      disabled      value="'.@$arrRowData['alias'].'">';
$inputIntro             =   '<textarea      name="intro" rows="5" cols="100" class="form-control" >'.@$arrRowData['intro'].'</textarea>'; 
$inputOverview          =   '<textarea      name="overview" rows="5" cols="100" class="form-control summer-editor" >'.@$arrRowData['overview'].'</textarea>'; 
$inputEquipment         =   '<textarea      name="equipment" rows="2" cols="100" class="form-control summer-editor" >'.@$arrRowData['equipment'].'</textarea>'; 
$inputPriceList         =   '<textarea      name="price_list" rows="2" cols="100" class="form-control summer-editor" >'.@$arrRowData['price_list'].'</textarea>'; 
$inputGoogleMapUrl      =   '<textarea      name="googlemap_url" rows="2" cols="100" class="form-control" >'.@$arrRowData['googlemap_url'].'</textarea>'; 
$inputMetakeyword       =   '<textarea      name="meta_keyword" rows="2" cols="100" class="form-control" >'.@$arrRowData['meta_keyword'].'</textarea>'; 
$inputMetadescription   =   '<textarea      name="meta_description" rows="2" cols="100" class="form-control" >'.@$arrRowData['meta_description'].'</textarea>'; 
$inputTotalCost         =   '<input type="text" class="form-control" name="total_cost"       value="'.@$arrRowData['total_cost'].'">';
$ddlProvince            =   cmsSelectboxCategory("province_id","form-control",$arrProvince,@$arrRowData['province_id'],"",'Chọn danh mục');
$ddlDistrict            =   cmsSelectboxCategory("district_id","form-control",$arrDistrict,@$arrRowData['district_id'],"",'Chọn danh mục');
$ddlCategoryParam        =cmsSelectboxCategoryParamMultiple("category_param_id[]", 'form-control', @$arrCategoryParamRecursive, @$arrPostParam,"",'Chọn danh mục');
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
$inputCallback='<input type="hidden" name="callback_url"  value="'.route('adminsystem.media.saveSummerFile').'" />';
?>
<div class="portlet light bordered">
    <div class="portlet-title">
        <div class="note"  style="display: none;"></div>
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
            <?php echo $inputCallback; ?>                      
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
                            <div class="box-logo">
                                <div><input type="file" name="image"  />   </div>
                                <div><font color="red"><b>Kích thước ảnh không được vượt quá <?php echo (int)max_size_upload; ?>MB</b></font></div>
                            </div> 
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
                       </div>
                   </div>                       
                </div>   
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>Tiện ích</b></label>
                        <div class="col-md-10">                            
                            <?php echo $inputEquipment; ?>
                            <span class="help-block"></span>
                            
                        </div>
                    </div>    
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>Bảng giá</b></label>
                        <div class="col-md-10">                            
                            <?php echo $inputPriceList; ?>
                            <span class="help-block"></span>
                            
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
        /* begin xử lý image */
        var image_file=null;
        var image_ctrl=$('input[name="image"]');         
        var image_files = $(image_ctrl).get(0).files;        
        if(image_files.length > 0){            
            image_file  = image_files[0];  
        }        
        /* end xử lý image */
        var image_hidden=$('input[name="image_hidden"]').val();         
        var total_cost=$('input[name="total_cost"]').val();     
        var category_param_id=$('select[name="category_param_id[]"]').val();      
        var intro=$('textarea[name="intro"]').val();        
        var overview=$('textarea[name="overview"]').summernote('code');    
        var equipment=$('textarea[name="equipment"]').summernote('code');    
        var price_list=$('textarea[name="price_list"]').summernote('code');    
        var googlemap_url=$('textarea[name="googlemap_url"]').val();   
        var province_id=$('select[name="province_id"]').val();     
        var district_id=$('select[name="district_id"]').val();         
        var street=$('input[name="street"]').val();        
        var sort_order=$('input[name="sort_order"]').val();
        var status=$('select[name="status"]').val();     
        var token = $('input[name="_token"]').val();   
                
        var dataItem = new FormData();
        dataItem.append('id',id);
        dataItem.append('fullname',fullname);
        dataItem.append('alias',alias);        
        dataItem.append('meta_keyword',meta_keyword);
        dataItem.append('meta_description',meta_description);        
        if(image_files.length > 0){
            dataItem.append('image',image_file);
        }        
        dataItem.append('image_hidden',image_hidden);
        dataItem.append('total_cost',total_cost);
        dataItem.append('category_param_id',category_param_id);
        dataItem.append('intro',intro);
        dataItem.append('overview',overview);
        dataItem.append('equipment',equipment);
        dataItem.append('price_list',price_list);
        dataItem.append('googlemap_url',googlemap_url);
        dataItem.append('street',street);
        dataItem.append('province_id',province_id);
        dataItem.append('district_id',district_id);
        dataItem.append('sort_order',sort_order); 
        dataItem.append('status',status); 
        dataItem.append('_token',token);        
        $.ajax({
            url: '<?php echo $linkSave; ?>',
            type: 'POST',
            data: dataItem,
            async: false,
            success: function (data) {
                if(data.checked==1){                    
                    window.location.href = data.link_edit;
                }else{
                    showMsg('note',data);         
                }
                spinner.hide();
            },
            error : function (data){
                spinner.hide();
            },
            beforeSend  : function(jqXHR,setting){
                spinner.show();
            },
            cache: false,
            contentType: false,
            processData: false
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
            
        $.ajax({
            url: '<?php echo $linkCreateAlias; ?>',
            type: 'POST',
            data: dataItem,            
            async: false,
            success: function (data) {                
                if(data.checked==1){
                    $('input[name="alias"]').val(data.alias); 
                }else{                    
                    showMsg('note',data);               
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