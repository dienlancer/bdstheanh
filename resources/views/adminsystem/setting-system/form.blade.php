@extends("adminsystem.master")
@section("content")
<?php 

$linkCancel             =   route('adminsystem.'.$controller.'.getList');
$linkSave               =   route('adminsystem.'.$controller.'.save');
$linkUploadFile         =   route('adminsystem.'.$controller.'.uploadFile');
$linkCreateAlias        =   route('adminsystem.'.$controller.'.createAlias');
$inputFullName          =   '<input type="text" class="form-control" name="fullname"    onblur="createAlias()"        value="'.@$arrRowData['fullname'].'">';  
$inputAlias             =   '<input type="text" class="form-control" name="alias"       disabled      value="'.@$arrRowData['alias'].'">';
$inputTitle             =   '<textarea   name="title" rows="2" cols="100" class="form-control" >'.@$arrRowData['title'].'</textarea>'; 
$inputMetakeyword             =   '<textarea   name="meta_keyword" rows="2" cols="100" class="form-control" >'.@$arrRowData['meta_keyword'].'</textarea>'; 
$inputMetadescription             =   '<textarea  name="meta_description" rows="2" cols="100" class="form-control" >'.@$arrRowData['meta_description'].'</textarea>'; 
$inputAuthor             =   '<input type="text" class="form-control" name="author"                  value="'.@$arrRowData['author'].'">'; 
$inputCopyright             =   '<input type="text" class="form-control" name="copyright"             value="'.@$arrRowData['copyright'].'">';   
$inputGoogleSiteVerification             =   '<input type="text" class="form-control" name="google_site_verification"                 value="'.@$arrRowData['google_site_verification'].'">';  
$inputGoogleAnalytics             =   '<input type="text" class="form-control" name="google_analytics"                 value="'.@$arrRowData['google_analytics'].'">';  

$pictureLogoFrontend                =   "";
$strLogoFrontend               =   "";
if(count(@$arrRowData)>0){
    if(!empty(@$arrRowData["logo_frontend"])){
        $pictureLogoFrontend        =   '<div class="col-sm-6"><center>&nbsp;<img src="'.asset("/upload/".@$arrRowData["logo_frontend"]).'" style="width:100%" />&nbsp;</center></div><div class="col-sm-6"><a href="javascript:void(0);" onclick="deleteLogoFrontend(this);"><img src="'.asset('public/adminsystem/images/delete-icon.png').'"/></a></div>';                        
        $strLogoFrontend       =   @$arrRowData["logo_frontend"];
    }        
}   
$inputPictureLogoFrontendHidden     =   '<input type="hidden" name="logo_frontend_hidden"  value="'.@$strLogoFrontend.'" />';
$pictureFavicon                =   "";
$strFavicon               =   "";
if(count(@$arrRowData)>0){
    if(!empty(@$arrRowData["favicon"])){
        $pictureFavicon        =   '<div class="col-sm-6"><center>&nbsp;<img src="'.asset("/upload/".@$arrRowData["favicon"]).'" style="width:100%" />&nbsp;</center></div><div class="col-sm-6"><a href="javascript:void(0);" onclick="deleteFavicon(this);"><img src="'.asset('public/adminsystem/images/delete-icon.png').'"/></a></div>';                        
        $strFavicon       =   @$arrRowData["favicon"];
    }        
}   
$inputPictureFaviconHidden    =   '<input type="hidden" name="favicon_hidden"  value="'.@$strFavicon.'" />';
$data                   =   array();
if(count(@$arrRowData) > 0){
    if(!empty(@$arrRowData)){
        $data                   =   json_decode(@$arrRowData['setting']);
        $data = convertToArray($data);
    }
}
$status                 =   (count($arrRowData) > 0) ? @$arrRowData['status'] : 1 ;
$arrStatus              =   array(-1 => '- Select status -', 1 => 'Publish', 0 => 'Unpublish');  
$ddlStatus              =   cmsSelectbox("status","status","form-control",$arrStatus,$status,"");
$inputSortOrder         =   '<input type="text" class="form-control" name="sort_order"     value="'.@$arrRowData['sort_order'].'">';
$id                     =   (count($arrRowData) > 0) ? @$arrRowData['id'] : "" ;
$inputID                =   '<input type="hidden" name="id"   value="'.@$id.'" />'; 
?>
<div class="portlet light bordered">
    <div class="portlet-title">
        <div class="caption">
            <i class="{{$icon}}"></i>
            <span class="caption-subject font-dark sbold uppercase">Cấu hình chung</span>
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
        <form class="form-horizontal" role="form" name="frm" enctype="multipart/form-data">
            {{ csrf_field() }}                                  
            <?php 
                echo $inputID;                 
                echo $inputPictureLogoFrontendHidden;
                echo $inputPictureFaviconHidden;
            ?>        
            <div class="form-body">
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>Cấu hình</b></label>
                        <div class="col-md-9">
                            <?php echo $inputFullName; ?>
                            <span class="help-block"></span>
                        </div>
                    </div> 
                </div>
                <div class="row">  
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>Alias</b></label>
                        <div class="col-md-9">
                            <?php echo $inputAlias; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>     
                </div>  
                <div class="row">                    
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>Sắp xếp</b></label>
                        <div class="col-md-9">
                            <?php echo $inputSortOrder; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>   
                </div>
                <div class="row">  
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>Trạng thái</b></label>
                        <div class="col-md-9">                            
                            <?php echo $ddlStatus; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>     
                </div>
                <h3 class="rio"><i class="icon-settings font-dark"></i>Cấu hình SEO</h3>
                <hr>         
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>Tiêu đề</b></label>
                        <div class="col-md-9">
                            <?php echo $inputTitle; ?>
                            <span class="help-block"></span>
                        </div>
                    </div> 
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>Meta keyword</b></label>
                        <div class="col-md-9">
                            <?php echo $inputMetakeyword; ?>
                            <span class="help-block"></span>
                        </div>
                    </div> 
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>Meta description</b></label>
                        <div class="col-md-9">
                            <?php echo $inputMetadescription; ?>
                            <span class="help-block"></span>
                        </div>
                    </div> 
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>Tác giả</b></label>
                        <div class="col-md-9">
                            <?php echo $inputAuthor; ?>
                            <span class="help-block"></span>
                        </div>
                    </div> 
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>Copyright</b></label>
                        <div class="col-md-9">
                            <?php echo $inputCopyright; ?>
                            <span class="help-block"></span>
                        </div>
                    </div> 
                </div>                
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>Google Site Verification</b></label>
                        <div class="col-md-9">
                            <?php echo $inputGoogleSiteVerification; ?>
                            <span class="help-block"></span>
                        </div>
                    </div> 
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>Google Analytics</b></label>
                        <div class="col-md-9">
                            <?php echo $inputGoogleAnalytics; ?>
                            <span class="help-block"></span>
                        </div>
                    </div> 
                </div>                                            
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>Logo trang chủ</b></label>
                        <div class="col-md-9">
                            <input type="file" name="logo_frontend"  />   
                            <div class="picture-area"><?php echo $pictureLogoFrontend; ?>                      </div>
                        </div>
                    </div>     
                </div>   
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>Favicon</b></label>
                        <div class="col-md-9">
                            <input type="file" name="favicon"  />   
                            <div class="picture-area"><?php echo $pictureFavicon; ?>                      </div>
                        </div>
                    </div>     
                </div>    
                <h3 class="rio"><i class="icon-settings font-dark"></i>Cấu hình phụ</h3>
                <hr>                                             
                <div class="row">
                    <div class="form-group col-md-12">
                        <a href="javascript:void(0);" onclick="addRow();" class="btn btn-sm green"> Thêm mới
                            <i class="fa fa-plus"></i>
                        </a>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <table class="table table-bordered table-recursive setting-system">
                            <thead>
                                <tr>
                                    <th width="20%">Tên field</th>
                                    <th width="20%">Mã field</th>                                    
                                    <th>Giá trị</th>
                                    <th width="1%"></th>                                
                                </tr>
                            </thead>                            
                            <tbody>
                                <?php 
                                if(count($data) > 0){
                                    for($i=0;$i<count($data);$i++){
                                        $field_name=$data[$i]['field_name'];
                                        $field_code=$data[$i]['field_code'];
                                        $field_value=$data[$i]['field_value'];
                                        ?>
                                        <tr>
                                            <td><input type="text" name="field_name" value="<?php echo $field_name; ?>" class="form-control"></td>
                                            <td><input type="text" name="field_code" value="<?php echo $field_code; ?>" class="form-control"></td>                                    
                                            <td><input type="text" name="field_value" value="<?php echo $field_value; ?>" class="form-control"></td>
                                            <td ><center><a href="javascript:void(0);" onclick="removeRow(this);"><img src="<?php echo asset('public/adminsystem/images/delete-icon.png'); ?>"  /></a></center></td>                         
                                        </tr>
                                        <?php                                        
                                    }
                                }
                                ?>                                
                            </tbody>                            
                        </table>
                    </div> 
                </div>                                                                                                                
            </div>                     
        </form>
    </div>
</div>
<script type="text/javascript" language="javascript">
    function resetErrorStatus(){
        var id                   =   $("#id");
        var fullname             =   $("#fullname");
        var alias                =   $("#alias");                
        var sort_order           =   $("#sort_order");
        var status               =   $("#status");
        
        $(fullname).closest('.form-group').removeClass("has-error"); 
        $(alias).closest('.form-group').removeClass("has-error");        
        $(sort_order).closest('.form-group').removeClass("has-error");
        $(status).closest('.form-group').removeClass("has-error");        

        $(fullname).closest('.form-group').find('span').empty().hide();        
        $(alias).closest('.form-group').find('span').empty().hide();        
        $(sort_order).closest('.form-group').find('span').empty().hide();
        $(status).closest('.form-group').find('span').empty().hide();        
    }   
    function save(){
        var id=$('input[name="id"]').val();        
        var fullname=$('input[name="fullname"]').val();
        var alias=$('input[name="alias"]').val();
        var title=$('textarea[name="title"]').val();
        var meta_keyword=$('textarea[name="meta_keyword"]').val();
        var meta_description=$('textarea[name="meta_description"]').val();
        var author=$('input[name="author"]').val();
        var copyright=$('input[name="copyright"]').val();
        
        var google_site_verification=$('input[name="google_site_verification"]').val();
        var google_analytics=$('input[name="google_analytics"]').val();
        
     

        var logo_frontend = $("input[type='file'][name='logo_frontend']").val();
        if (logo_frontend != ''){
            logo_frontend = logo_frontend.substr(logo_frontend.lastIndexOf('\\') + 1);       
        }
        var logo_frontend_hidden=$("input[type='hidden'][name='logo_frontend_hidden']").val();    

        var favicon = $("input[type='file'][name='favicon']").val();
        if (favicon != ''){
            favicon = favicon.substr(favicon.lastIndexOf('\\') + 1);       
        }
        var favicon_hidden=$("input[type='hidden'][name='favicon_hidden']").val();    

        var status=$('select[name="status"]').val();        
        var sort_order=$('input[name="sort_order"]').val();        
        var token = $('input[name="_token"]').val();   
        var tbody=$(".setting-system > tbody")[0];
        var rows=tbody.rows;
        var setting=new Array(rows.length);
        for(var i=0 ; i < rows.length ; i++){
            var field_name=$(rows[i].cells[0]).find('input[name="field_name"]').val();
            var field_code=$(rows[i].cells[1]).find('input[name="field_code"]').val();
            var field_value=$(rows[i].cells[2]).find('input[name="field_value"]').val();
            var row={
                'field_name':field_name,
                'field_code':field_code,
                'field_value':field_value
            };
            setting[i]=row;
        }        
        resetErrorStatus();
        var dataItem={
            "id":id,
            "fullname":fullname,            
            "alias":alias,      
            
            "title":title,
            "meta_keyword":meta_keyword,
            "meta_description":meta_description,
            "author":author,
            "copyright":copyright,
            
            "google_site_verification":google_site_verification,
            "google_analytics":google_analytics,
            
            
            "logo_frontend":logo_frontend,
            "favicon":favicon,            
            "logo_frontend_hidden":logo_frontend_hidden,
            "favicon_hidden":favicon_hidden,

            "setting":JSON.stringify(setting),        
            "status":status,        
            "sort_order":sort_order,                      
            "_token": token
        };
        $.ajax({
            url: '<?php echo $linkSave; ?>',
            type: 'POST',
            data: dataItem,
            async: false,
            success: function (data) {
                if(data.checked==1){                    
                    var ctrl_logo_frontend = $("input[type='file'][name='logo_frontend']");
                    var ctrl_favicon = $("input[type='file'][name='favicon']");                    
                    uploadFileImport($(ctrl_logo_frontend));    
                    uploadFileImport($(ctrl_favicon));    
                    window.location.href = "<?php echo $linkCancel; ?>";
                }else{
                    var data_error=data.error;
                    if(typeof data_error.fullname               != "undefined"){
                        $('input[name="fullname"]').closest('.form-group').addClass(data_error.fullname.type_msg);
                        $('input[name="fullname"]').closest('.form-group').find('span').text(data_error.fullname.msg);
                        $('input[name="fullname"]').closest('.form-group').find('span').show();                        
                    }        
                    if(typeof data_error.alias               != "undefined"){
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
                        $('input[name="status"]').closest('.form-group').addClass(data_error.status.type_msg);
                        $('input[name="status"]').closest('.form-group').find('span').text(data_error.status.msg);
                        $('input[name="status"]').closest('.form-group').find('span').show();

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
    function uploadFileImport(ctrl_image){    
        var token = $('input[name="_token"]').val();               
        var file_upload=$(ctrl_image).get(0);
        var files = file_upload.files;
        var file  = files[0];    
        var frmdata = new FormData();        
        frmdata.append("image", file);
        frmdata.append("_token", token);
        $.ajax({ url: '<?php echo $linkUploadFile; ?>', method: 'post', data: frmdata, contentType: false, processData: false })
    }
   
    function deleteLogoFrontend(ctrl){
        var xac_nhan = 0;
        var msg="Bạn có muốn xóa ?";
        if(window.confirm(msg)){ 
            xac_nhan = 1;
        }
        if(xac_nhan  == 0){
            return 0;
        }
        var picture_area=$(ctrl).closest('div.picture-area');
        $(picture_area).empty();
        $("input[type='hidden'][name='logo_frontend_hidden']").val("");        
    }
    function deleteFavicon(ctrl){
        var xac_nhan = 0;
        var msg="Bạn có muốn xóa ?";
        if(window.confirm(msg)){ 
            xac_nhan = 1;
        }
        if(xac_nhan  == 0){
            return 0;
        }
        var picture_area=$(ctrl).closest('div.picture-area');
        $(picture_area).empty();
        $("input[type='hidden'][name='favicon_hidden']").val("");        
    }
    function addRow() {
        var tbody=$("table.setting-system > tbody")[0];
        var row=tbody.insertRow(tbody.length);
        var cell0 = row.insertCell(0);
        var cell1 = row.insertCell(1);
        var cell2 = row.insertCell(2);
        var cell3 = row.insertCell(3);

        cell0.innerHTML = '<input type="text" name="field_name" value="" class="form-control">';
        cell1.innerHTML = '<input type="text" name="field_code" value="" class="form-control">';
        cell2.innerHTML = '<input type="text" name="field_value" value="" class="form-control">';
        cell3.innerHTML = '<a href="javascript:void(0);"  onclick="removeRow(this);"><img src="<?php echo url("/public/adminsystem/images/delete-icon.png"); ?>" />'
    }
    function removeRow(control) {
        var xac_nhan = 0;
        var msg="Bạn có muốn xóa ?";
        if(window.confirm(msg)){ 
            xac_nhan = 1;
        }
        if(xac_nhan  == 0){
            return false;   
        }
        var tbody=$(control).closest("tbody")[0];
        var tr=$(control).closest("tr")[0];
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
</script>
@endsection()            