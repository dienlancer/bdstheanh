function checkAllAgent(cid){
	var tbl=$(cid).closest("table");	
	var checkStatus = cid.checked;
	var tbody=$(tbl).find("tbody");
	var tr=(tbody).children("tr");	
	$(tr).find(':checkbox').each(function(){
		checkWithList(this);
	});
} 
function showLstInvoiceDetail(ajaxurl,lnk_image,value,quantity,total_price){
		var id = value;						
		var dataObj = {					
					"id"		: id					
				};		
		$.ajax({
			url			: ajaxurl,
			type		: "GET",
			data		: dataObj,
			dataType	: "json",
			success		: function(data, status, jsXHR){							
							var thead='<thead><tr><th colspan="2">PRODUCT</th><th>PRICE</th><th>QTY</th><th>SUBTOTAL</th></tr></thead>';
							var tbody="<tbody>";		
							var tr="";	
							for(var i=0;i<data.length;i++){
								var product_image=lnk_image + data[i]["product_image"];
								var tdImage='<td align="center" class="com_product17"><img src='+product_image+' width="42" height="56" /></td>';
								var tdName='<td class="com_product20">'+data[i]["product_name"]+'</td>';
								var tdPrice='<td class="com_product21" align="right">'+accounting.formatMoney(data[i]["product_price"], "", 0, ".",",")+'</td>';
								var tdQty='<td align="center" class="com_product22" align="center">'+data[i]["product_quantity"]+'</td>';
								var tdTotalPrice='<td class="com_product23" align="right">'+accounting.formatMoney(data[i]["product_total_price"], "", 0, ".",",")+'</td>';	
								tr+='<tr>'+tdImage+tdName+tdPrice+tdQty+tdTotalPrice+'</tr>';							
							}
							tbody=tbody+tr+'</tbody>';
							var tfoot='<tfoot><tr><td colspan="3" align="center"><b>TOTAL</b></td><td align="center">'+quantity+'</td><td align="right">'+accounting.formatMoney(total_price, "", 0, ".",",")+'</td></tr></tfoot>';
							var str='<table border="0" class="com_product16" cellspacing="0" cellpadding="0" width="100%">'+thead+tbody+tfoot+'</table>';							
							$("div.modal-invoice-report div.modal-body").empty();
							$("div.modal-invoice-report div.modal-body").append(str);
						}
		});

	}

function changePage(page,ctrl){
	$('input[name=filter_page]').val(page);
	var frm=$(ctrl).closest('form');
	$(frm)[0].submit();
}
function isNumberKey(evt){var hopLe=true;var charCode=(evt.which)?evt.which:event.keyCode;if(charCode>31&&(charCode<48||charCode>57))hopLe=false;return hopLe;}
function checkRegister() {
    var hopLe=true;
    var strMsg="";
    var fullname=document.getElementById("fullname").value;
    var phone=document.getElementById("phone").value;
    if(fullname=="") {
        hopLe=false;
        strMsg="Vui lòng điền tên";
    }
    if(phone=="") {
        hopLe=false;
        strMsg="Vui lòng điền điện thoại";
    }
    if(!hopLe)alert(strMsg);
    return hopLe;
}
function addToCart(product_id,ajaxurl){
	var id = product_id;		
	var dataObj = {		
		"id"		: id		
	};		
	$.ajax({
		url			: ajaxurl,
		type		: "GET",
		data		: dataObj,
		dataType	: "json",
		success		: function(data, status, jsXHR){
			var thong_bao='Sản phẩm đã được thêm vào trong <a href="'+data.permalink+'" class="comproduct49" >giỏ hàng</a> ';				
			$(".cart-total").empty();			
			$("div.modal-add-cart div.modal-body").empty();		
			$(".cart-total").text(data.quantity);			
			$("div.modal-add-cart div.modal-body").append(thong_bao);			
		}
	});
}

function PhanCachSoTien(Ctrl) {
    var vMoney = Ctrl.value;
    vMoney = vMoney.replace(/[^\d]+/g, '');
    var vNewMoney = "";
    if (vMoney.length > 3) {
        var x = 1;
        for (var i = vMoney.length - 1; i >= 0; i--) {            
            vNewMoney = vNewMoney + "" + vMoney[i];
            if (x % 3 == 0) {
                vNewMoney = vNewMoney + ".";
            }
            x++;

        }

        var tmp = "";
        for (var i = vNewMoney.length - 1; i >= 0; i--) {
            tmp = tmp + "" + vNewMoney[i];
        }

        vNewMoney = tmp.replace(/^[\.]/g, '');
    } else {
        vNewMoney = vMoney;
    }
    Ctrl.value = vNewMoney;
}
function xacnhanxoa(){
	var msg="Bạn chắc chắn có muốn xóa ?";
    var xac_nhan=false;
	if(window.confirm(msg)){
		xac_nhan=true;
	}
	return xac_nhan;
}
function showMsg(ctrl,data){		
	var ul='<ul>';	
	$.each(data.msg,function(index,value){
		ul+='<li>'+value+'</li>';
	});                    
	ul+='</ul>';
	var type_msg = '';
	if(data.checked == 1){
		type_msg='note-success';
	}else{
		type_msg='note-danger';
	}
	$('.'+ctrl).empty();
	$('.'+ctrl).removeClass('note-success');
	$('.'+ctrl).removeClass('note-danger');
	$('.'+ctrl).append(ul);	
	$('.'+ctrl).addClass(type_msg);                    
	$('.'+ctrl).show();     
	setTimeout(hideMsg,10000,ctrl);		 
}
function hideMsg(ctrl){
    $('.'+ctrl).fadeOut();
}       
$(document).ready(function(){	
	basicTable.init();		
	setTimeout(hideMsg,60000,'note');	
});