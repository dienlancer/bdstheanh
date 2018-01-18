<?php 
use App\SettingSystemModel;
use App\MenuModel;
use App\MenuTypeModel;
use App\ModuleItemModel;
use App\ProductModel;
use App\ArticleModel;
use App\CategoryProductModel;
use App\CategoryArticleModel;
function uploadImage($fileObj,$width,$height){        
  require_once base_path("app".DS."scripts".DS."PhpThumb".DS."ThumbLib.inc.php") ;      
  $fileName="";
  $uploadDir = base_path("upload")  ; 
  if($fileObj['tmp_name'] != null){                
    $fileName   = $fileObj['name'];
    $file_path=base_path("upload".DS.$fileName);
    @copy($fileObj['tmp_name'], $file_path);       
    $thumb = PhpThumbFactory::create($file_path);        
    $thumb->adaptiveResize($width, $height);
    $prefix = $width . 'x' . $height . '-';
    $veston = $uploadDir . DS . $prefix  . $fileName;       
    $thumb->save($veston);
  }   
}

function get_featured_image($value){
  $setting= getSettingSystem();
    $product_width=$setting['product_width']['field_value'];
    $product_height=$setting['product_height']['field_value'];
  $image_link=asset('upload/'.$product_width.'x'.$product_height.'-'.$value);
  return $image_link;
}
function stripUnicode($str){ 
  if(!$str) return false; 
   $unicode = array( 
      'a'=>'á|à|ả|ã|ạ|ă|ắ|ằ|ẳ|ẵ|ặ|â|ấ|ầ|ẩ|ẫ|ậ', 
      'A'=>'Á|À|Ả|Ã|Ạ|Ă|Ắ|Ằ|Ẳ|Ẵ|Ặ|Â|Ấ|Ầ|Ẩ|Ẫ|Ậ', 
      'd'=>'đ', 
      'D'=>'Đ', 
      'e'=>'é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ', 
      'E'=>'É|È|Ẻ|Ẽ|Ẹ|Ê|Ế|Ề|Ể|Ễ|Ệ', 
      'i'=>'í|ì|ỉ|ĩ|ị',       
      'I'=>'Í|Ì|Ỉ|Ĩ|Ị', 
      'o'=>'ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ', 
      'O'=>'Ó|Ò|Ỏ|Õ|Ọ|Ô|Ố|Ồ|Ổ|Ỗ|Ộ|Ơ|Ớ|Ờ|Ở|Ỡ|Ợ', 
      'u'=>'ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự', 
      'U'=>'Ú|Ù|Ủ|Ũ|Ụ|Ư|Ứ|Ừ|Ử|Ữ|Ự', 
      'y'=>'ý|ỳ|ỷ|ỹ|ỵ', 
      'Y'=>'Ý|Ỳ|Ỷ|Ỹ|Ỵ' 
  ); 
  foreach($unicode as $khongdau=>$codau) { 
      $arr=explode("|",$codau); 
      $str = str_replace($arr,$khongdau,$str); 
  } 
  return $str; 
} 
function convertToAlias($fullname){
    $str=stripUnicode($fullname); 
    $str=trim($str); 
    if ($str=="") return ""; 
    $str =str_replace('"','',$str); 
    $str =str_replace("'",'',$str); 
    $str = stripUnicode($str); 
    $str = mb_convert_case($str,MB_CASE_LOWER,'utf-8');     
    $str = str_replace(' ','-',$str); 
    return $str; 
}
function getStringCategoryID($category_id,&$arrCategoryID,$model){
    $arrCategory=array();    
    switch ($model) {
      case 'category_article':        
        $arrCategory=CategoryArticleModel::whereRaw("parent_id = ?",[(int)@$category_id])->select("id")->get()->toArray();    
        break;
      case 'category_product':
        $arrCategory=CategoryProductModel::whereRaw("parent_id = ?",[(int)@$category_id])->select("id")->get()->toArray();    
        break;              
    }    
    if(count($arrCategory) > 0){
      foreach ($arrCategory as $key => $value) {
        $arrCategoryID[]=$value["id"];
        getStringCategoryID((int)$value["id"],$arrCategoryID,$model);
      }
    }          
}
function convertToTextPrice($value){
  $data = getSettingSystem();
  $language = $data["currency_unit"]['field_value'] ;
  $strCurrency="";
  switch ($language) {
    case "vi_VN":
    $strCurrency= number_format($value,0,",",".") ;
    break;
    case "en_US":
    $strCurrency='$'.number_format($value,0,".",",");
    break;
  }
  return $strCurrency;
}
function fnPrice($value){
  $data = getSettingSystem();
  $language = $data["currency_unit"]['field_value'] ;
  $strCurrency="";
  switch ($language) {
    case "vi_VN":
    $strCurrency= number_format($value,0,",",".") . ' đ';
    break;
    case "en_US":
    $strCurrency='$'.number_format($value,0,".",",");
    break;
  }
  return $strCurrency;
}
function randomString($length = 5){
  $arrCharacter = array_merge(range('a','z'), range(0,9));
  $arrCharacter = implode($arrCharacter, '');
  $arrCharacter = str_shuffle($arrCharacter);
  $result   = substr($arrCharacter, 0, $length);
  return $result;
}
function getArrPrivilege(){
  /* begin quyền truy cập */
  $user_id=Sentinel::getUser()->id;      
  $stdPrivilegeID=DB::table("users")
  ->join("group_member","users.group_member_id","=","group_member.id")
  ->join("group_privilege","group_member.id","=","group_privilege.group_member_id")
  ->where("users.id","=",(int)@$user_id)                
  ->select("group_privilege.privilege_id")
  ->get();
  ;     
  $arrID=array();    
  foreach ($stdPrivilegeID as $key => $value) {
    $arrID[]=$value->privilege_id;
  }
  $strID=implode(",",$arrID);
  $sql="select concat(`controller`,'-',`action`) as controller_action
  from `privilege`
  where `id` in(".$strID.")";
  $stdPrivilege=DB::select(@$sql);
  $arrPrivilege=array();
  foreach ($stdPrivilege as $key => $value) {
    $arrPrivilege[]=$value->controller_action;
  }     
  /* end quyền truy cập */  
  return $arrPrivilege;
}

?>