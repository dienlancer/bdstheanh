@extends("adminsystem.master")
@section("content")
<?php 
$linkCancel             =   route('adminsystem.'.$controller.'.getList');
$linkSave               =   route('adminsystem.'.$controller.'.save');
$linkUploadFile         =   route('adminsystem.'.$controller.'.uploadFile');
$linkCreateAlias        =   route('adminsystem.'.$controller.'.createAlias');
$inputCode              =   '<input type="text" class="form-control" name="code"   id="code"       value="'.@$arrRowData['code'].'">'; 
$inputFullName          =   '<input type="text" class="form-control" name="fullname"   id="fullname"  onblur="createAlias()"     value="'.@$arrRowData['fullname'].'">';
$inputAlias             =   '<input type="text" class="form-control" name="alias"      id="alias"    disabled      value="'.@$arrRowData['alias'].'">'; 
 
$inputMetakeyword             =   '<textarea id="meta_keyword" name="meta_keyword" rows="2" cols="100" class="form-control" >'.@$arrRowData['meta_keyword'].'</textarea>'; 
$inputMetadescription             =   '<textarea id="meta_description" name="meta_description" rows="2" cols="100" class="form-control" >'.@$arrRowData['meta_description'].'</textarea>'; 
$inputPrice             =   '<input type="text" class="form-control" name="price" onkeyup="PhanCachSoTien(this);"  id="price"       value="'.convertToTextPrice(@$arrRowData['price']).'">';
$inputSalePrice             =   '<input type="text" class="form-control" name="sale_price" onkeyup="PhanCachSoTien(this);"  id="sale_price"       value="'.convertToTextPrice(@$arrRowData['sale_price']).'">';
$status                 =   (count($arrRowData) > 0) ? @$arrRowData['status'] : 1 ;
$arrStatus              =   array(-1 => '- Select status -', 1 => 'Publish', 0 => 'Unpublish');  
$ddlStatus              =   cmsSelectbox("status","status","form-control",$arrStatus,$status,"");
$inputIntro            =   '<textarea id="intro" name="intro" rows="5" cols="100" class="form-control" >'.@$arrRowData['intro'].'</textarea>'; 
$inputDetail            =   '<textarea id="detail" name="detail" rows="5" cols="100" class="form-control" >'.@$arrRowData['detail'].'</textarea>'; 
$inputSortOrder         =   '<input type="text" class="form-control" name="sort_order" id="sort_order"     value="'.@$arrRowData['sort_order'].'">';
$ddlCategoryProduct     =   cmsSelectboxCategoryProductMultiple("category_product_id","category_product_id[]", 'form-control', @$arrCategoryProductRecursive, @$arrProductCategory,"");
$id                     =   (count($arrRowData) > 0) ? @$arrRowData['id'] : "" ;
$inputID                =   '<input type="hidden" name="id" id="id" value="'.@$id.'" />'; 
$inputAliasMenu       =   '<input type="hidden" name="alias_menu" id="alias_menu" value="'.@$arrRowData['alias'].'" />'; 
$picture                =   "";
$strImage               =   "";
$setting= getSettingSystem();
$product_width = $setting['product_width']['field_value'];
$product_height = $setting['product_height']['field_value'];  
if(count(@$arrRowData)>0){
    if(!empty(@$arrRowData["image"])){
        $picture        =   '<div class="col-sm-6"><center>&nbsp;<img src="'.asset("/upload/" . $product_width . "x" . $product_height . "-".@$arrRowData["image"]).'" style="width:100%" />&nbsp;</center></div><div class="col-sm-6"><a href="javascript:void(0);" onclick="deleteImage();"><img src="'.asset('public/adminsystem/images/delete-icon.png').'"/></a></div>';                        
        $strImage       =   @$arrRowData["image"];
    }        
}   
$inputPictureHidden     =   '<input type="hidden" name="image_hidden" id="image_hidden" value="'.@$strImage.'" />';
$str_child_image="";
if(count($arrRowData) > 0){
    $arrProductChildImage=json_decode(@$arrRowData['child_image']);    
    if(count($arrProductChildImage) > 0){        
        $str_child_image=implode(',',$arrProductChildImage);
    }    
}   
$inputChildPictureHidden     =   '<input type="hidden" name="image_child_hidden" id="image_child_hidden" value="'.@$str_child_image.'" />';
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
                    <button onclick="save()" class="btn purple">Lưu <i class="fa fa-floppy-o"></i></button> 
                    <a href="<?php echo $linkCancel; ?>" class="btn green">Thoát <i class="fa fa-ban"></i></a>                    </div>                                                
                </div>
            </div>    
        </div>
    </div>
    <div class="portlet-body form">
        <form class="form-horizontal" name="frm" role="form" enctype="multipart/form-data">
            {{ csrf_field() }}          
            <?php 
            echo $inputPictureHidden; 
            echo $inputChildPictureHidden;
            echo $inputID;
            ?>                
            <?php echo $inputAliasMenu; ?>         
            <div class="form-body">                
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>Sản phẩm</b></label>
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
                        <label class="col-md-2 control-label"><b>Mã sản phẩm</b></label>
                        <div class="col-md-10">
                            <?php echo $inputCode; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>  
                </div>
                <div class="row"> 
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>Giá</b></label>
                        <div class="col-md-10">
                            <?php echo $inputPrice; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>      
                </div>    
                <div class="row"> 
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>Giá khuyến mãi</b></label>
                        <div class="col-md-10">
                            <?php echo $inputSalePrice; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>      
                </div>    
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>Loại sản phẩm</b></label>
                        <div class="col-md-10">
                            <?php echo $ddlCategoryProduct; ?>
                            <span class="help-block"></span>
                        </div>
                    </div> 
                </div>
                <div class="row">                      
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>Hình</b></label>
                        <div class="col-md-4">
                            <input type="file" id="image" name="image"  />   
                            <div class="picture-area"><?php echo $picture; ?>                      </div>
                            <div class="clr"></div>
                                                
                        </div>
                        <div class="col-md-6">
                            <div>
                                <a href="javascript:void(0);" onclick="addRow();" class="btn btn-sm green"> Thêm mới
                                    <i class="fa fa-plus"></i>
                                </a>
                            </div>
                            <table class="table-image" id="table-image" border="0" cellpadding="0" cellspacing="0" border="1" width="100%">
                                <thead>
                                    <tr>                                    
                                        <th><center>Thumbnails</center></th>                                  
                                        <th width="1%" ></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    if(count($arrRowData) > 0){
                                        $arrProductChildImage=json_decode(@$arrRowData['child_image']);    
                                        if(count($arrProductChildImage) > 0){
                                            foreach ($arrProductChildImage as $key => $value) {
                                                $featuredImg=url("/upload/" . $product_width . "x" . $product_height . "-".@$value);
                                               ?>
                                               <tr>
                                                   <td align="center" valign="middle">
                                                    <img src="<?php echo $featuredImg; ?>" width="<?php echo ((int)$product_width/6); ?>" />
                                                    <input type="hidden" name="product_child_image_hidden" value="<?php echo $value; ?>" />
                                                   </td>
                                                   <td align="center" valign="middle">
                                                       <a href="javascript:void(0);"  onclick="removeRow(this);"><img src="<?php echo url("/public/adminsystem/images/delete-icon.png"); ?>" /></a>
                                                   </td>
                                               </tr>
                                               <?php
                                            }                                            
                                        }    
                                    }   
                                    ?>                                    
                                </tbody>
                            </table>    
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
                        <label class="col-md-2 control-label"><b>Giới thiệu</b></label>
                        <div class="col-md-10">                            
                            <?php echo $inputIntro; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>     
                </div> 
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>Chi tiết</b></label>
                        <div class="col-md-10">                            
                            <?php echo $inputDetail; ?>
                            <span class="help-block"></span>
                            <script type="text/javascript" language="javascript">
                                CKEDITOR.replace('detail',{
                                   height:300
                               });
                           </script>
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
        var code                 =   $('input[name="code"]');
        var fullname             =   $('input[name="fullname"]');
        var alias                =   $('input[name="alias"]');     
        var category_product_id  =   $('select[name="category_product_id[]"]');   
        var sort_order           =   $('input[name="sort_order"]');
        var status               =   $('select[name="status"]');
        
        $(code).closest('.form-group').removeClass("has-error");
        $(fullname).closest('.form-group').removeClass("has-error");        
        $(alias).closest('.form-group').removeClass("has-error");
        $(category_product_id).closest('.form-group').removeClass("has-error");
        $(sort_order).closest('.form-group').removeClass("has-error");
        $(status).closest('.form-group').removeClass("has-error");        

        $(code).closest('.form-group').find('span').empty().hide();
        $(fullname).closest('.form-group').find('span').empty().hide();        
        $(alias).closest('.form-group').find('span').empty().hide();
        $(category_product_id).closest('.form-group').find('span').empty().hide();
        $(sort_order).closest('.form-group').find('span').empty().hide();
        $(status).closest('.form-group').find('span').empty().hide();        
    }

    function uploadFileImport(ctrl_image){    
        var token = $('input[name="_token"]').val();       
        var image=ctrl_image;        
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
        var code = $('input[name="code"]').val();
        var fullname=$('input[name="fullname"]').val();        
        var alias=$('input[name="alias"]').val();
        var alias_menu=$('input[name="alias_menu"]').val();
        
        var meta_keyword=$('textarea[name="meta_keyword"]').val();
        var meta_description=$('textarea[name="meta_description"]').val();
        var category_product_id=$('select[name="category_product_id[]"]').val();
        var image = $('input[name="image"]').val();
        if (image != ''){
            image = image.substr(image.lastIndexOf('\\') + 1);       
        }
        var image_hidden=$('input[name="image_hidden"]').val();             
        var child_image='';
        var tbody=$("table.table-image > tbody")[0];
        var arr_child_image=new Array(tbody.rows.length);
        for(var i=0;i<tbody.rows.length;i++){
            var row=tbody.rows[i];
            var imageChild='';
            var product_child_image_hidden=$(row.cells[0]).find('input[type="hidden"][name="product_child_image_hidden"]');
            var product_child_image_file=$(row.cells[0]).find('input[type="file"][name="product_child_image_file"]');
            if(product_child_image_hidden.length > 0){
                imageChild=$(product_child_image_hidden).val();
            }
            if(product_child_image_file.length > 0){
                imageChild = $(product_child_image_file).val();
                imageChild = imageChild.substr(imageChild.lastIndexOf('\\') + 1);       
            }
            arr_child_image[i]=imageChild;
        }
        if(arr_child_image.length > 0){
                child_image=arr_child_image.toString();          
        }        
        var status=$('select[name="status"]').val();             
        var price=$('input[name="price"]').val();
        var sale_price=$('input[name="sale_price"]').val();
        var intro=$('textarea[name="intro"]').val(); 
        var detail=CKEDITOR.instances['detail'].getData();        
        var sort_order=$('input[name="sort_order"]').val();        
        var token = $('input[name="_token"]').val();   
        resetErrorStatus();
        var dataItem={
            "id":id,
            "code":code,
            "fullname":fullname,            
            "alias":alias,
            "alias_menu":alias_menu,
            
            "meta_keyword":meta_keyword,
            "meta_description":meta_description,
            "image":image,
            "image_hidden":image_hidden,
            "status":status,                     
            "price":price,
            "sale_price":sale_price,
            "intro":intro,
            "detail":detail,
            "category_product_id":category_product_id,                        
            "child_image":child_image,            
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
                if(data.checked==true){
                    uploadFileImport($('input[name="image"]'));    
                    var child_image_ctrl=$("table.table-image > tbody").find("input[type='file']");                
                    if(child_image_ctrl.length > 0){
                        for(var i=0;i<child_image_ctrl.length;i++){
                            uploadFileImport(child_image_ctrl[i]);
                        }
                    }                    
                    window.location.href = "<?php echo $linkCancel; ?>";
                }else{
                    var data_error=data.error;
                    if(typeof data_error.code               != "undefined"){
                        $('input[name="code"]').closest('.form-group').addClass(data_error.code.type_msg);
                        $('input[name="code"]').closest('.form-group').find('span').text(data_error.code.msg);
                        $('input[name="code"]').closest('.form-group').find('span').show();                        
                    }   
                    if(typeof data_error.fullname               != "undefined"){
                        $('input[name="fullname"]').closest('.form-group').addClass(data_error.fullname.type_msg);
                        $('input[name="fullname"]').closest('.form-group').find('span').text(data_error.fullname.msg);
                        $('input[name="fullname"]').closest('.form-group').find('span').show();                        
                    }                    
                    if(typeof data_error.alias                  != "undefined"){
                        $('input[name="alias"]').closest('.form-group').addClass(data_error.alias.type_msg);
                        $('input[name="alias"]').closest('.form-group').find('span').text(data_error.alias.msg);
                        $('input[name="alias"]').closest('.form-group').find('span').show();                       
                    }
                    if(typeof data_error.category_product_id               != "undefined"){
                        $('select[name="category_product_id[]"]').closest('.form-group').addClass(data_error.category_product_id.type_msg);
                        $('select[name="category_product_id[]"]').closest('.form-group').find('span').text(data_error.category_product_id.msg);
                        $('select[name="category_product_id[]"]').closest('.form-group').find('span').show();                        
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
    function addRow() {
    var tbody=$("table.table-image > tbody")[0];
    var row=tbody.insertRow(tbody.length);
    var cell0 = row.insertCell(0);
    var cell1 = row.insertCell(1);
    cell0.innerHTML = '<input type="file" name="product_child_image_file">';
    cell1.innerHTML = '<a href="javascript:void(0);"  onclick="removeRow(this);"><img src="<?php echo url("/public/adminsystem/images/delete-icon.png"); ?>" />';         
    }
    function removeRow(control) {
        var tbody=$(control).closest("tbody")[0];
        var tr=$(control).closest("tr")[0];
        var image=$(tr).find("input[type='hidden']").val();            
        var image_child_hidden=$('input[name="image_child_hidden"]').val()            
        var arrImageChild=image_child_hidden.split(',');
        var index=arrImageChild.indexOf(image);
        if (index > -1) {
            arrImageChild.splice(index, 1);
        }
        var str=arrImageChild.toString();
        $('input[name="image_child_hidden"]').val(str);
        var index = $(tr).index();         
        tbody.deleteRow(index); 
    }
    function createAlias(){
        var id=$('input[name="id"]').val();   
        var fullname    = $('input[name="fullname"]').val();
        var token       = $('form[name="frm"] > input[name="_token"]').val();     
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
                if(data.checked==true){
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
</script>
@endsection()            