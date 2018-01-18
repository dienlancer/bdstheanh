var timeout;
var second_timeout=3000;
function checkAllAgent(cid){
	var tbl=$(cid).closest("table");	
	var checkStatus = cid.checked;
	var tbody=$(tbl).find("tbody");
	var tr=(tbody).children("tr");	
	$(tr).find(':checkbox').each(function(){
		checkWithList(this);
	});
}  
function checkAllAgentArticle(cid){
	var tbl=$(cid).closest("table");	
	var checkStatus = cid.checked;
	var tbody=$(tbl).find("tbody");
	var tr=(tbody).children("tr");	
	$(tr).find(':checkbox').each(function(){
		checkWithListArticle(this);
	});
}   
function checkAllAgentProduct(cid){
	var tbl=$(cid).closest("table");	
	var checkStatus = cid.checked;
	var tbody=$(tbl).find("tbody");
	var tr=(tbody).children("tr");	
	$(tr).find(':checkbox').each(function(){
		checkWithListProduct(this);
	});
}  
function showMsg(ctrlID,msg,type_msg){		
	$('#'+ctrlID).removeClass();	
	$('#'+ctrlID).addClass("alert");			
	$('#'+ctrlID).addClass(type_msg);
	$('#'+ctrlID).find("strong").text(msg);		
	$('#'+ctrlID).fadeIn();		
	if (timeout != null){
        clearTimeout(timeout);
	}
	timeout = setTimeout(hideMsg, second_timeout,ctrlID);			 
}
function hideMsg(ctrlID) {
	$('#'+ctrlID).fadeOut();
}    
function submitForm(url){
    $('form[name="frm"]').attr('action', url);
    $('form[name="frm"]').submit();
}
function trashForm(url){
    var xac_nhan=false;
    var msg='Bạn xác nhận có chắc chắn xóa?';
	if(window.confirm(msg)){
		xac_nhan=true;
	}
	if(xac_nhan == true){
		$('form[name="frm"]').attr('action', url);
        $('form[name="frm"]').submit();
	}
    return xac_nhan;    
}
function xacnhanxoa(){
	var msg="Bạn chắc chắn có muốn xóa ?";
    var xac_nhan=false;
	if(window.confirm(msg)){
		xac_nhan=true;
	}
	return xac_nhan;
}

function changePage(page,ctrl){
	$('input[name=filter_page]').val(page);
	var frm=$(ctrl).closest('form');
	$(frm)[0].submit();
}
function isNumberKey(evt){var hopLe=true;var charCode=(evt.which)?evt.which:event.keyCode;if(charCode>31&&(charCode<48||charCode>57))hopLe=false;return hopLe;}
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
$(document).ready(function(){
	basicTable.init();
	$('table.table-recursive > thead > tr > th > input[name="checkall-toggle"]').change(function(){		
		var checkStatus = this.checked;
		$('table.table-recursive').find(':checkbox').each(function(){
			this.checked = checkStatus;
		});
	});
	timeout = setTimeout(hideMsg, second_timeout,'alert');		
});