<?php namespace App\Http\Controllers\adminsystem;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\CategoryBannerModel;
use App\BannerModel;
use DB;
class BannerController extends Controller {
  	var $_controller="banner";	
  	var $_title="Banner";
  	var $_icon="icon-settings font-dark";    
  	public function getList($category_id=0){   
        $controller=$this->_controller; 
        $task="list";
        $title=$this->_title;
        $icon=$this->_icon;           
        $arrPrivilege=getArrPrivilege();
        $requestControllerAction=$this->_controller."-list";         
        if(in_array($requestControllerAction,$arrPrivilege)){
          return view("adminsystem.".$this->_controller.".list",compact("controller","task","title","icon","category_id")); 
        }
        else{
          return view("adminsystem.no-access",compact('controller'));
        }
    }     
    public function loadData(Request $request){      
      $query=DB::table('banner')
                  ->join('category_banner','banner.category_id','=','category_banner.id');            
      if(!empty(@$request->category_id)){
        $query->where('banner.category_id',(int)@$request->category_id);
      }   
      $data=$query->select('banner.id','banner.caption','banner.alt','category_banner.fullname as category_name','banner.category_id','banner.image','banner.sort_order','banner.status','banner.created_at','banner.updated_at')
      ->groupBy('banner.id','banner.caption','banner.alt','category_banner.fullname','banner.category_id','banner.image','banner.sort_order','banner.status','banner.created_at','banner.updated_at')
      ->orderBy('banner.sort_order', 'asc')
      ->get()->toArray();      
      $data=convertToArray($data);    
      $data=bannerConverter($data,$this->_controller);            
      return $data;
    } 
    public function getForm($task,$category_id="",$id=""){   
        $controller=$this->_controller;     
        $title="";
        $icon=$this->_icon; 
        $arrRowData=array();        
        $arrPrivilege=getArrPrivilege();
        $requestControllerAction=$this->_controller."-form";  
        if(in_array($requestControllerAction, $arrPrivilege)){
          switch ($task) {
           case 'edit':
              $title=$this->_title . " : Update";
              $arrRowData=BannerModel::find((int)@$id)->toArray();                     
           break;
           case 'add':
              $title=$this->_title . " : Add new";
           break;     
        }    
        $arrCategoryBanner=CategoryBannerModel::select("id","fullname")->orderBy("sort_order","asc")->get()->toArray();                
        return view("adminsystem.".$this->_controller.".form",compact("arrRowData","arrCategoryBanner","category_id","controller","task","title","icon"));
        }else{
          return view("adminsystem.no-access",compact('controller'));
        }        
    }
     public function save(Request $request){
          $id 					        =		trim($request->id);        
          $category_id          =   $request->category_id;    
          $caption              =   trim($request->caption);  
          $alt              =   trim($request->alt);         
          $page_url             =   trim($request->page_url);                 
          $image_file           =   null;
                if(isset($_FILES["image"])){
                  $image_file         =   $_FILES["image"];
                }
          $image_hidden         =   trim($request->image_hidden);                            
          $sort_order           =   trim($request->sort_order);
          $status               =   trim($request->status);          
          $data 		            =   array();
          $info 		            =   array();
          $error 		            =   array();
          $item		              =   null;
          $checked 	            =   1;                        
          if(empty($sort_order)){
             $checked = 0;
             $error["sort_order"]["type_msg"] 	= "has-error";
             $error["sort_order"]["msg"] 		= "Thiếu sắp xếp";
          }
          if((int)$status==-1){
             $checked = 0;
             $error["status"]["type_msg"] 		= "has-error";
             $error["status"]["msg"] 			= "Thiếu trạng thái";
          }
          if ($checked == 1) {  
              $image_name='';
              if($image_file != null){     
                $setting= getSettingSystem();
                $width=0;
                $height=0;                            
                $image_name=uploadImage($image_file['name'],$image_file['tmp_name'],$width,$height);              
              }  
                if(empty($id)){
                    $item 				= 	new BannerModel;       
                    $item->created_at 	=	date("Y-m-d H:i:s",time());        
                    if(!empty($image_name)){
                  $item->image    =   trim($image_name) ;  
                }   				
                } else{
                    $item				=	BannerModel::find((int)@$id);   
                    $item->image=null;                       
                    if(!empty($image_hidden)){
                      $item->image =$image_hidden;          
                    }
                    if(!empty($image_name))  {
                  $item->image=$image_name;                                                
                }              		  		 	
                }  
                $item->category_id 		  =	$category_id;
                $item->caption          = $caption;
                $item->alt = $alt;
                $item->page_url 			  =	$page_url;                
                $item->sort_order 		  =	(int)$sort_order;
                $item->status 			    =	(int)$status;    
                $item->updated_at 		  =	date("Y-m-d H:i:s",time());    	        	
                $item->save();                  
                $info = array(
                  'type_msg' 			=> "has-success",
                  'msg' 				=> 'Lưu dữ liệu thành công',
                  "checked" 			=> 1,
                  "error" 			=> $error,
                  "id"    			=> $id
                );
            }else {
                    $info = array(
                      'type_msg' 			=> "has-error",
                      'msg' 				=> 'Lưu dữ liệu thất bại',
                      "checked" 			=> 0,
                      "error" 			=> $error,
                      "id"				=> ""
                    );
            }        		 			       
            return $info;       
    }
          public function changeStatus(Request $request){
                  $id             =       (int)$request->id;     
                  $checked                =   1;
                  $type_msg               =   "alert-success";
                  $msg                    =   "Cập nhật thành công";              
                  $status         =       (int)$request->status;
                  $item           =       BannerModel::find((int)@$id);        
                  $item->status   =       $status;
                  $item->save();
                  $data                   =   $this->loadData($request);
                  $info = array(
                    'checked'           => $checked,
                    'type_msg'          => $type_msg,                
                    'msg'               => $msg,                
                    'data'              => $data
                  );
                  return $info;
          }
        
      public function deleteItem(Request $request){
            $id                     =   (int)$request->id;              
            $checked                =   1;
            $type_msg               =   "alert-success";
            $msg                    =   "Xóa thành công";                    
            if($checked == 1){
              $item = BannerModel::find((int)@$id);
                $item->delete();                
            }        
            $data                   =   $this->loadData($request);
            $info = array(
              'checked'           => $checked,
              'type_msg'          => $type_msg,                
              'msg'               => $msg,                
              'data'              => $data
            );
            return $info;
      }
      public function updateStatus(Request $request){
          $strID                 =   $request->str_id;     
        $status                 =   $request->status;            
        $checked                =   1;
        $type_msg               =   "alert-success";
        $msg                    =   "Cập nhật thành công";                  
        $strID=substr($strID, 0,strlen($strID) - 1);
        $arrID=explode(',',$strID);                 
        if(empty($strID)){
                    $checked                =   0;
                    $type_msg               =   "alert-warning";            
                    $msg                    =   "Vui lòng chọn ít nhất một phần tử";
          }
          if($checked==1){
              foreach ($arrID as $key => $value) {
                if(!empty($value)){
                    $item=BannerModel::find($value);
                    $item->status=$status;
                    $item->save();      
                }            
              }
          }                 
          $data                   =   $this->loadData($request);
          $info = array(
            'checked'           => $checked,
            'type_msg'          => $type_msg,                
            'msg'               => $msg,                
            'data'              => $data
          );
          return $info;
      }
      public function trash(Request $request){
            $strID                 =   $request->str_id;               
            $checked                =   1;
            $type_msg               =   "alert-success";
            $msg                    =   "Xóa thành công";                  
            $strID=substr($strID, 0,strlen($strID) - 1);
            $arrID=explode(',',$strID);                 
            if(empty($strID)){  
              $checked     =   0;
              $type_msg           =   "alert-warning";            
              $msg                =   "Vui lòng chọn ít nhất một phần tử để xóa";
            }
            if($checked == 1){                                  
                  DB::table('banner')->whereIn('id',@$arrID)->delete();   
            }
            $data                   =   $this->loadData($request);
            $info = array(
              'checked'           => $checked,
              'type_msg'          => $type_msg,                
              'msg'               => $msg,                
              'data'              => $data
            );
            return $info;
      }
      public function sortOrder(Request $request){
            $sort_json              =   $request->sort_json;           
            $data_order             =   json_decode($sort_json);       
          
            $checked                =   1;
            $type_msg               =   "alert-success";
            $msg                    =   "Cập nhật thành công";      
            if(count($data_order) > 0){              
              foreach($data_order as $key => $value){      
                if(!empty($value)){
                  $item=BannerModel::find((int)@$value->id);                
                $item->sort_order=(int)$value->sort_order;                         
                $item->save();                      
                }                                                  
              }           
            }        
            $data                   =   $this->loadData($request);
            $info = array(
              'checked'           => $checked,
              'type_msg'          => $type_msg,                
              'msg'               => $msg,                
              'data'              => $data
            );
            return $info;
      }
      
}
?>
