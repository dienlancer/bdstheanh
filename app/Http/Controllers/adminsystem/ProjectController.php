<?php namespace App\Http\Controllers\adminsystem;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\CategoryArticleModel;
use App\CategoryProductModel;
use App\ArticleModel;
use App\ProductModel;
use App\PageModel;
use App\MenuModel;
use App\ProjectModel;
use App\ProvinceModel;
use App\DistrictModel;
use App\PostParamModel;
use App\ProjectArticleModel;
use App\ArticleCategoryModel;
use App\CategoryParamModel;
use DB;
class ProjectController extends Controller {
 var $_controller="project";	
 var $_title="Dự án";
 var $_icon="icon-settings font-dark";    
 public function getList(){		
  $controller=$this->_controller;	
  $task="list";
  $title=$this->_title;
  $icon=$this->_icon;		        
  $arrPrivilege=getArrPrivilege();
  $requestControllerAction=$this->_controller."-list";   
  $arrProvince=ProvinceModel::select("id","fullname")->orderBy("sort_order","asc")->get()->toArray();              
  $arrDistrict=DistrictModel::select("id","fullname")->orderBy("sort_order","asc")->get()->toArray();                  
  if(in_array($requestControllerAction,$arrPrivilege)){
    return view("adminsystem.".$this->_controller.".list",compact("controller","task","title","icon","arrProvince","arrDistrict")); 
  }
  else{
    return view("adminsystem.no-access",compact('controller'));
  }
}	    
public function loadData(Request $request){    		   
  $query=DB::table('project')
  ->join('province','project.province_id','=','province.id')
  ->join('district','project.district_id','=','district.id');        
  if(!empty(@$request->filter_search)){
    $query->where('project.fullname','like','%'.trim(@$request->filter_search).'%');
  }
  if((int)@$request->province_id > 0){
    $query->where('project.province_id',(int)@$request->province_id);
  }
  if((int)@$request->district_id > 0){
    $query->where('project.district_id',(int)@$request->district_id); 
  }
  $data=$query->select('project.id','project.fullname','province.fullname as province_name','district.fullname as district_name','project.image','project.sort_order','project.status','project.created_at','project.updated_at')
  ->groupBy('project.id','project.fullname','province.fullname','district.fullname','project.image','project.sort_order','project.status','project.created_at','project.updated_at')
  ->orderBy('project.sort_order', 'asc')->get()->toArray()     ;    		      
  $data=convertToArray($data);		
  $data=projectConverter($data,$this->_controller);		         
  return $data;
}	
public function getForm($task,$id=""){     
  $controller=$this->_controller;     
  $title="";
  $icon=$this->_icon; 
  $arrRowData=array();     
  $arrPostParam=array();   
  $arrPrivilege=getArrPrivilege();
  $requestControllerAction=$this->_controller."-form";  
  if(in_array($requestControllerAction, $arrPrivilege)){
    switch ($task) {
     case 'edit':
     $title=$this->_title . " : Update";
     $arrRowData=ProjectModel::find((int)@$id)->toArray();  
     $arrPostParam=PostParamModel::whereRaw("post_id = ?",[(int)@$id])->get()->toArray();                          
     break;
     case 'add':
     $title=$this->_title . " : Add new";
     break;     
   }     
   $arrProvince=ProvinceModel::select("id","fullname")->orderBy("sort_order","asc")->get()->toArray();              
   $arrDistrict=DistrictModel::select("id","fullname")->orderBy("sort_order","asc")->get()->toArray();   
   $arrCategoryParam=CategoryParamModel::select("id","fullname","alias","parent_id")->orderBy("sort_order","asc")->get()->toArray();
   $arrCategoryParamRecursive=array();
   categoryRecursiveForm($arrCategoryParam ,0,"",$arrCategoryParamRecursive)   ;                   
   return view("adminsystem.".$this->_controller.".form",compact("arrRowData","arrProvince","arrDistrict","controller","task","title","icon","arrCategoryParamRecursive","arrPostParam"));
 }else{
  return view("adminsystem.no-access",compact('controller'));
}        
}
public function save(Request $request){
  $id 					        =		trim(@$request->id);        
  $fullname 				    =		trim(@$request->fullname);
  $alias                =   trim(@$request->alias);                    
  $meta_keyword         =   trim(@$request->meta_keyword);
  $meta_description     =   trim(@$request->meta_description);
  $image_file           =   null;
  if(isset($_FILES["image"])){
    $image_file         =   $_FILES["image"];
  }
  $image_hidden         =   trim(@$request->image_hidden);            
  $total_cost           =   trim(@$request->total_cost);
  $intro                =   trim(@$request->intro);    
  $overview             =   trim(@$request->overview);          
  $equipment            =   trim(@$request->equipment);          
  $price_list           =   trim(@$request->price_list);
  $googlemap_url        =   trim(@$request->googlemap_url);  
  $province_id             =   trim(@$request->province_id);
  $district_id             =   trim(@$request->district_id);
  $category_param_id    =   ($request->category_param_id);  
  $street               =   trim(@$request->street);                    
  $sort_order           =   trim(@$request->sort_order);
  $status               =   trim(@$request->status);          
  $data 		            =   array();

  $item		              =   null;

  $info                 =   array();
  $checked              =   1;                           
  $msg                =   array();
  $setting= getSettingSystem();
  $width=$setting['article_width']['field_value'];
  $height=$setting['article_height']['field_value'];           
  if(empty($fullname)){
   $checked = 0;                 
   $error["fullname"] = "Thiếu tên bài viết";
 }else{
  $data=array();
  if (empty($id)) {
    $data=ProjectModel::whereRaw("trim(lower(fullname)) = ?",[trim(mb_strtolower($fullname,'UTF-8'))])->get()->toArray();	        	
  }else{
    $data=ProjectModel::whereRaw("trim(lower(fullname)) = ? and id != ?",[trim(mb_strtolower($fullname,'UTF-8')),(int)@$id])->get()->toArray();		
  }  
  if (count($data) > 0) {
    $checked = 0;

    $error["fullname"] = "Bài viết đã tồn tại";
  }      	
}      
if((int)@$province_id == 0){
  $checked = 0;

  $error["province_id"]    = "Vui lòng chọn tỉnh thành phố";
}
if((int)@$district_id == 0){
  $checked = 0;

  $error["district_id"]    = "Vui lòng chọn quận huyện";
}            
if(empty($category_param_id)){
  $checked = 0;

  $error["category_param_id"]      = "Thiếu đơn vị tính";
}                        
if(empty($sort_order)){
 $checked = 0;

 $error["sort_order"] 		= "Thiếu sắp xếp";
}
if((int)$status==-1){
 $checked = 0;

 $error["status"] 			= "Thiếu trạng thái";
}
if ($checked == 1) { 
  $image_name='';
  if($image_file != null){                                          
    $image_name=uploadImage($image_file['name'],$image_file['tmp_name'],$width,$height);        
  }  
  if(empty($id)){
    $item 				= 	new ProjectModel;       
    $item->created_at 	=	date("Y-m-d H:i:s",time());        
    if(!empty($image_name)){
      $item->image    =   trim($image_name) ;  
    }				
  } else{
    $item				=	ProjectModel::find((int)@$id);   
    $item->image=null;                       
    if(!empty($image_hidden)){
      $item->image =$image_hidden;          
    }
    if(!empty($image_name))  {
      $item->image=$image_name;                                                
    }                      
  }  
  $item->fullname 		    =	$fullname;
  $item->alias            = $alias;                       
  $item->meta_keyword     = $meta_keyword;
  $item->meta_description = $meta_description;                             
  $item->total_cost       = $total_cost;
  $item->intro            = $intro;
  $item->overview         = $overview;
  $item->equipment        = $equipment;
  $item->price_list       = $price_list;
  $item->googlemap_url    = $googlemap_url;
  $item->province_id         = (int)@$province_id;
  $item->district_id         = (int)@$district_id;                
  $item->street           = $street;                                                   
  $item->sort_order 		  =	(int)@$sort_order;
  $item->status 			    =	(int)@$status;    
  $item->updated_at 		  =	date("Y-m-d H:i:s",time());    	        	
  $item->save();   

  /* begin category param */
  if(!empty(@$category_param_id)){
    $source_category_param_id=explode(',', @$category_param_id);  
    $arrPostParam=PostParamModel::whereRaw("post_id = ?",[(int)@$item->id])->select("param_id")->get()->toArray();
    $arrCategoryParamID=array();
    foreach ($arrPostParam as $key => $value) {
      $arrCategoryParamID[]=$value["param_id"];
    }                  
    $selected=@$source_category_param_id;
    sort($selected);
    sort($arrCategoryParamID);                           
    $resultCompare=0;
    if($selected == $arrCategoryParamID){
      $resultCompare=1;       
    }
    if($resultCompare==0){
      PostParamModel::whereRaw("post_id = ?",[(int)@$item->id])->delete();  
      foreach ($selected as $key => $value) {
        $param_id=$value;
        $postParam=new PostParamModel;
        $postParam->post_id=(int)@$item->id;
        $postParam->param_id=(int)@$param_id;            
        $postParam->save();
      }
    }       
  }  
  PostParamModel::whereRaw("param_id = ?",[0])->delete();
  /* end category param */                                                          
  $msg['success']='Lưu thành công';  
}
$info = array(
  "checked"       => $checked,          
  'msg'       => $msg,                
  "id"            => (int)@$id
);        		 			       
return $info;       
}

public function changeStatus(Request $request){
  $id             =       (int)$request->id;     
  $info                 =   array();
  $checked              =   1;                           
  $msg                =   array();             
  $status         =       (int)$request->status;
  $item           =       ProjectModel::find((int)@$id);        
  $item->status   =       $status;
  $item->save();
  $msg['success']='Cập nhật thành công';     
  $data                   =   $this->loadData($request);
  $info = array(
    "checked"       => $checked,          
    'msg'       => $msg,           
    'data'              => $data
  );
  return $info;
}

public function deleteItem(Request $request){
  $id                     =   (int)$request->id;              
  $info                 =   array();
  $checked              =   1;                           
  $msg                =   array();
  $data=ProjectArticleModel::whereRaw("project_id = ?",[(int)@$id])->select('id')->get()->toArray();
  if(count($data) > 0){
    $checked                =   0;              
    $msg['cannotdelete']                    =   "Phần tử có dữ liệu con. Vui lòng không xoá";
  }                     
  if($checked == 1){
    $item = ProjectModel::find((int)@$id);
    $item->delete();     
    PostParamModel::whereRaw("post_id = ?",[(int)@$id])->delete();                            
    $msg['success']='Xóa thành công';        
  }        
  $data                   =   $this->loadData($request);
  $info = array(
    "checked"       => $checked,          
    'msg'       => $msg,         
    'data'              => $data
  );
  return $info;
}
public function updateStatus(Request $request){
  $strID                 =   $request->str_id;     
  $status                 =   $request->status;            
  $info                 =   array();
  $checked              =   1;                           
  $msg                =   array();             
  $strID=substr($strID, 0,strlen($strID) - 1);
  $arrID=explode(',',$strID);                 
  if(empty($strID)){
    $checked            =   0;              
    $msg['chooseone']            =   "Vui lòng chọn ít nhất một phần tử";
  }
  if($checked==1){
    foreach ($arrID as $key => $value) {
      if(!empty($value)){
        $item=ProjectModel::find($value);
        $item->status=$status;
        $item->save();      
      }            
    }
    $msg['success']='Cập nhật thành công';
  }                 
  $data                   =   $this->loadData($request);
  $info = array(
    "checked"       => $checked,          
    'msg'       => $msg,    
    'data'              => $data
  );
  return $info;
}
public function trash(Request $request){
  $strID                 =   $request->str_id;               
  $info                 =   array();
  $checked              =   1;                           
  $msg                =   array();         
  $strID=substr($strID, 0,strlen($strID) - 1);
  $arrID=explode(',',$strID);                 
  if(empty($strID)){
    $checked            =   0;              
    $msg['chooseone']            =   "Vui lòng chọn ít nhất một phần tử";
  }
  $data=DB::table('project_article')->whereIn('project_id',@$arrID)->select('id')->get()->toArray();             
  if(count($data) > 0){
    $checked            =   0;
    $msg['cannotdelete']            =   "Phần tử này có dữ liệu con . Vui lòng không xóa";
  }   
  if($checked == 1){                                 
    DB::table('project')->whereIn('id',@$arrID)->delete();   
    DB::table('post_param')->whereIn('post_id',@$arrID)->delete();    
    $msg['success']='Xóa thành công';                                     
  }
  $data                   =   $this->loadData($request);
  $info = array(
    "checked"       => $checked,          
    'msg'       => $msg,         
    'data'              => $data
  );
  return $info;
}
public function sortOrder(Request $request){
  $sort_json              =   $request->sort_json;           
  $data_order             =   json_decode($sort_json);       

  $info                 =   array();
  $checked              =   1;                           
  $msg                =   array();
  if(count($data_order) > 0){              
    foreach($data_order as $key => $value){      
      if(!empty($value)){
        $item=ProjectModel::find((int)@$value->id);                
        $item->sort_order=(int)$value->sort_order;                         
        $item->save();                      
      }                                                  
    }           
  }        
  $msg['success']='Cập nhật thành công'; 
  $data                   =   $this->loadData($request);
  $info = array(
    "checked"       => $checked,          
    'msg'       => $msg,          
    'data'              => $data
  );
  return $info;
}

public function createAlias(Request $request){
  $id            =  trim($request->id)  ; 
  $fullname      =  trim($request->fullname)  ;        
  $data          =  array();
  
  $item          =  null;
  $info                 =   array();
  $checked              =   1;                           
  $msg                =   array();
  $alias='';                     
  if(empty($fullname)){
   $checked = 0;           
   $error["fullname"] = "Thiếu tên bài viết";
 }else{
  $alias=str_slug($fullname,'-');
  $dataCategoryArticle=array();
  $dataCategoryProduct=array();
  $dataArticle=array();
  $dataProduct=array();
  $dataPage=array();
  $dataProject=array();
  $dataProjectArticle=array();
  $checked_trung_alias=0;          
  if (empty($id)) {              
    $dataProject=ProjectModel::whereRaw("trim(lower(alias)) = ?",[trim(mb_strtolower($alias,'UTF-8'))])->get()->toArray();             
  }else{
    $dataProject=ProjectModel::whereRaw("trim(lower(alias)) = ? and id != ?",[trim(mb_strtolower($alias,'UTF-8')),(int)@$id])->get()->toArray();    
  }  
  $dataCategoryArticle=CategoryArticleModel::whereRaw("trim(lower(alias)) = ?",[trim(mb_strtolower($alias,'UTF-8'))])->get()->toArray();
  $dataCategoryProduct=CategoryProductModel::whereRaw("trim(lower(alias)) = ?",[trim(mb_strtolower($alias,'UTF-8'))])->get()->toArray();
  $dataArticle=ArticleModel::whereRaw("trim(lower(alias)) = ?",[trim(mb_strtolower($alias,'UTF-8'))])->get()->toArray();
  $dataProduct=ProductModel::whereRaw("trim(lower(alias)) = ?",[trim(mb_strtolower($alias,'UTF-8'))])->get()->toArray();
  $dataPage=PageModel::whereRaw("trim(lower(alias)) = ?",[trim(mb_strtolower($alias,'UTF-8'))])->get()->toArray();
  $dataProjectArticle=ProjectArticleModel::whereRaw("trim(lower(alias)) = ?",[trim(mb_strtolower($alias,'UTF-8'))])->get()->toArray();
  if (count($dataCategoryArticle) > 0) {
    $checked_trung_alias=1;
  }
  if (count($dataCategoryProduct) > 0) {
    $checked_trung_alias=1;
  }
  if (count($dataArticle) > 0) {
    $checked_trung_alias=1;
  }
  if (count($dataProduct) > 0) {
    $checked_trung_alias=1;
  }    
  if (count($dataPage) > 0) {
    $checked_trung_alias=1;
  }
  if (count($dataProject) > 0) {
    $checked_trung_alias=1;
  }  
  if (count($dataProjectArticle) > 0) {
    $checked_trung_alias=1;
  }      
  if((int)$checked_trung_alias == 1){
    $code_alias=rand(1,999999);
    $alias=$alias.'-'.$code_alias;
  }
}
if ($checked == 1){
  $msg['success']='Lưu thành công';     
}  
$info = array(
  "checked"       => $checked,          
  'msg'       => $msg,      
  "alias"            => $alias
);                       
return $info;
}

}
?>
