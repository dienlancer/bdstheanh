@extends("adminsystem.master")
@section("content")
<?php 

$linkCancel             =   route('adminsystem.'.$controller.'.getList');
$linkSave               =   route('adminsystem.'.$controller.'.save');

$inputCode              =   '<input type="text" class="form-control" name="code"  disabled              value="'.@$arrRowData['code'].'">';
$inputUsername          =   '<input type="text" class="form-control" name="username"  disabled              value="'.@$arrRowData['username'].'">';
$inputEmail             =   '<input type="text" class="form-control" name="email"      disabled                value="'.@$arrRowData['email'].'">';
$inputFullName          =   '<input type="text" class="form-control" name="fullname"                value="'.@$arrRowData['fullname'].'">';  
$inputAddress           =   '<input type="text" class="form-control" name="address"                  value="'.@$arrRowData['address'].'">'; 
$inputPhone             =   '<input type="text" class="form-control" name="phone"                      value="'.@$arrRowData['phone'].'">';  


$lblQuantity            =   number_format((int)@$arrRowData['quantity'],0,".",",");
$lblTotalPrice          =   number_format((int)@$arrRowData['total_price'],0,".",",");

$ddlPaymentMethod       = cmsSelectboxCategory("payment_method_id","payment_method_id", "form-control", $dataPaymentMethod, (int)@$arrRowData['payment_method_id'],'disabled');
$status                 =   (count($arrRowData) > 0) ? @$arrRowData['status'] : 1 ;
$arrStatus              =   array(-1 => '- Select status -', 1 => 'Publish', 0 => 'Unpublish');  
$ddlStatus              =   cmsSelectbox("status","status","form-control",$arrStatus,$status,"");
$inputSortOrder         =   '<input type="text" class="form-control" name="sort_order" id="sort_order"     value="'.@$arrRowData['sort_order'].'">';
$id                     =   (count($arrRowData) > 0) ? @$arrRowData['id'] : "" ;
$inputID                =   '<input type="hidden" name="id" value="'.@$id.'" />'; 
$setting= getSettingSystem();
$product_width = $setting['product_width']['field_value'];
$product_height = $setting['product_height']['field_value'];
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
                    <button onclick="save()" class="btn purple">Save new <i class="fa fa-floppy-o"></i></button> 
                    <a href="<?php echo $linkCancel; ?>" class="btn green">Cancel <i class="fa fa-ban"></i></a>                    </div>                                                
                </div>
            </div>    
        </div>
    </div>
    <div class="portlet-body form">
        <form class="form-horizontal" role="form" enctype="multipart/form-data" name="frm">
            {{ csrf_field() }}                                  
            <?php echo  $inputID; ?>   
            <div class="form-body">
                <div class="row">
                    <div class="form-group col-md-6">
                        <label class="col-md-3 control-label"><b>Username</b></label>
                        <div class="col-md-9">
                            <?php echo $inputUsername; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>   
                    <div class="form-group col-md-6">
                        <label class="col-md-3 control-label"><b>Email</b></label>
                        <div class="col-md-9">
                            <?php echo $inputEmail; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>     
                </div>      
                <div class="row">
                    <div class="form-group col-md-6">
                        <label class="col-md-3 control-label"><b>Tên khách hàng</b></label>
                        <div class="col-md-9">
                            <?php echo $inputFullName; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>   
                    <div class="form-group col-md-6">
                        <label class="col-md-3 control-label"><b>Địa chỉ</b></label>
                        <div class="col-md-9">
                            <?php echo $inputAddress; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>      
                </div>       
                <div class="row">
                    <div class="form-group col-md-6">
                        <label class="col-md-3 control-label"><b>Phone</b></label>
                        <div class="col-md-9">
                            <?php echo $inputPhone; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>   
                    <div class="form-group col-md-6">
                        <label class="col-md-3 control-label"><b>Trạng thái giao hàng</b></label>
                        <div class="col-md-9">                            
                            <?php echo $ddlStatus; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>     
                </div>                     
                <div class="row">
                    <div class="form-group col-md-6">
                        <label class="col-md-3 control-label"><b>Phương thức thanh toán</b></label>
                        <div class="col-md-9">
                            <?php echo $ddlPaymentMethod; ?>
                            <span class="help-block"></span>
                        </div>
                        
                        
                    </div>   
                    <div class="form-group col-md-6">
                        <label class="col-md-3 control-label"><b>Mã đơn hàng</b></label>
                        <div class="col-md-9">
                            <?php echo $inputCode; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>       
                </div>  
                <div class="row">
                    <div class="form-group col-md-6">
                        <label class="col-md-3 control-label"><b>Sắp xếp</b></label>
                        <div class="col-md-9">
                            <?php echo $inputSortOrder; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>   
                    <div class="form-group col-md-6">                        
                    </div>       
                </div>  
                <div class="row">
                    <div class="col-md-12">
                        <table width="100%" class="com_product16">
                            <thead>
                                <tr>
                                    <th align="center"><center>Mã sản phẩm</center></th>
                                    <th align="center"><center>Tên sản phẩm</center></th>
                                    <th align="center"><center>Hình</center></th>
                                    <th align="center"><center>Giá</center></th>
                                    <th align="center"><center>Số lượng</center></th>
                                    <th align="center"><center>Thành tiền</center></th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                foreach ($arrInvoiceDetail as $key => $value) {
                                    $product_code=$value["product_code"];
                                    $product_name=$value["product_name"];
                                    $product_image=asset('/upload/'.$product_width . 'x'.$product_height.'-'.$value["product_image"]) ;                
                                    $product_price=fnPrice($value["product_price"]);
                                    $product_quantity=$value["product_quantity"];
                                    $product_total_price=fnPrice($value["product_total_price"]);
                                    ?>
                                    <tr>
                                        <td align="center"><?php echo $product_code; ?></td>
                                        <td><?php echo $product_name; ?></td>
                                        <td width="10%" align="center"><img style="width:100%" src="<?php echo $product_image; ?>" /></td>
                                        <td align="right"><?php echo $product_price; ?></td>
                                        <td width="10%" align="center"><b><center><?php echo $product_quantity; ?></center></b> </td>
                                        <td width="15%" align="right"><b><?php echo $product_total_price; ?></b></td>
                                    </tr>
                                    <?php
                                } 
                                ?>              
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="4" align="center"><b>Tổng cộng</b></td>
                                    <td align="center"><b><?php echo (@$arrRowData["quantity"]); ?></b></td>
                                    <td align="right"><b><?php echo fnPrice(@$arrRowData["total_price"]); ?></b></td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>                                                                    
            </div>                         
        </form>
        
    </div>
</div>
<script type="text/javascript" language="javascript">
    function resetErrorStatus(){
        var id              =   $('input[name="id"]');        
        var fullname        =   $('input[name="fullname"]');
        var address         =   $('input[name="address"]');
        var phone           =   $('input[name="phone"]');
        var mobilephone     =   $('input[name="mobilephone"]');
        var fax             =   $('input[name="fax"]');
        var sort_order      =   $('input[name="sort_order"]');
        var status          =   $('select[name="status"]');
        
        $(fullname).closest('.form-group').removeClass("has-error");
        $(address).closest('.form-group').removeClass("has-error");        
        $(phone).closest('.form-group').removeClass("has-error");
        $(mobilephone).closest('.form-group').removeClass("has-error");        
        $(fax).closest('.form-group').removeClass("has-error");        
        $(sort_order).closest('.form-group').removeClass("has-error");        
        $(status).closest('.form-group').removeClass("has-error");        
        
        $(fullname).closest('.form-group').find('span').empty().hide();
        $(address).closest('.form-group').find('span').empty().hide();        
        $(phone).closest('.form-group').find('span').empty().hide();
        $(mobilephone).closest('.form-group').find('span').empty().hide();        
        $(fax).closest('.form-group').find('span').empty().hide();
        $(sort_order).closest('.form-group').find('span').empty().hide();        
        $(status).closest('.form-group').find('span').empty().hide();        
    }

    function save(){
        var id=$('input[name="id"]').val();                
        var fullname=$('input[name="fullname"]').val();
        var address=$('input[name="address"]').val();
        var phone=$('input[name="phone"]').val();
        var mobilephone=$('input[name="mobilephone"]').val();
        var fax=$('input[name="fax"]').val();
        var sort_order=$('input[name="sort_order"]').val();
        var status=$('select[name="status"]').val();     
        var token = $('input[name="_token"]').val();   
        resetErrorStatus();
        var dataItem={
            "id":id,        
            "fullname":fullname,
            "address":address,
            "phone":phone,
            "mobilephone":mobilephone,
            "fax":fax,                
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
                    window.location.href = "<?php echo $linkCancel; ?>";
                }else{
                    var data_error=data.error;   
                    if(typeof data_error.fullname               != "undefined"){
                        $('input[name="fullname"]').closest('.form-group').addClass(data_error.fullname.type_msg);
                        $('input[name="fullname"]').closest('.form-group').find('span').text(data_error.fullname.msg);
                        $('input[name="fullname"]').closest('.form-group').find('span').show();                        
                    }        
                    if(typeof data_error.address               != "undefined"){
                        $('input[name="address"]').closest('.form-group').addClass(data_error.address.type_msg);
                        $('input[name="address"]').closest('.form-group').find('span').text(data_error.address.msg);
                        $('input[name="address"]').closest('.form-group').find('span').show();                        
                    }         
                    if(typeof data_error.phone               != "undefined"){
                        $('input[name="phone"]').closest('.form-group').addClass(data_error.phone.type_msg);
                        $('input[name="phone"]').closest('.form-group').find('span').text(data_error.phone.msg);
                        $('input[name="phone"]').closest('.form-group').find('span').show();                        
                    }     
                    if(typeof data_error.mobilephone               != "undefined"){
                        $('input[name="mobilephone"]').closest('.form-group').addClass(data_error.mobilephone.type_msg);
                        $('input[name="mobilephone"]').closest('.form-group').find('span').text(data_error.mobilephone.msg);
                        $('input[name="mobilephone"]').closest('.form-group').find('span').show();                        
                    } 
                    if(typeof data_error.fax               != "undefined"){
                        $('input[name="fax"]').closest('.form-group').addClass(data_error.fax.type_msg);
                        $('input[name="fax"]').closest('.form-group').find('span').text(data_error.fax.msg);
                        $('input[name="fax"]').closest('.form-group').find('span').show();                        
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
</script>
@endsection()            