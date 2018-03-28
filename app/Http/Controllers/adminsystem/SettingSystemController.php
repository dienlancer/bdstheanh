<?php namespace App\Http\Controllers\adminsystem;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\SettingSystemModel;
use DB;
class SettingSystemController extends Controller {
  	var $_controller="setting-system";	
  	var $_title="Cấu hình";
  	var $_icon="icon-settings font-dark";
  	public function getList(){		
    		$controller=$this->_controller;	
    		$task="list";
    		$title=$this->_title;
    		$icon=$this->_icon;		
    		
        $arrPrivilege=getArrPrivilege();
        $requestControllerAction=$this->_controller."-list";         
        if(in_array($requestControllerAction,$arrPrivilege)){
          return view("adminsystem.".$this->_controller.".list",compact("controller","task","title","icon")); 
        }
        else{
          return view("adminsystem.no-access");
        }
  	}	    
  	public function loadData(Request $request){           
        $query=DB::table('setting_system');        
        if(!empty(@$request->filter_search)){
          $query->where('setting_system.fullname','like','%'.trim(@$request->filter_search).'%');
        }
        $data=$query->select('setting_system.id','setting_system.fullname','setting_system.alias','setting_system.status','setting_system.sort_order','setting_system.created_at','setting_system.updated_at')
        ->groupBy('setting_system.id','setting_system.fullname','setting_system.alias','setting_system.status','setting_system.sort_order','setting_system.created_at','setting_system.updated_at')
        ->orderBy('setting_system.sort_order', 'asc')->get()->toArray()     ;              
        $data=convertToArray($data);    
        $data=settingSystemConverter($data,$this->_controller);            
        return $data;
      }   
    public function getForm($task,$id=""){     
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
              $arrRowData=SettingSystemModel::find((int)@$id)->toArray();                     
           break;
           case 'add':
              $title=$this->_title . " : Add new";
           break;     
        }    
        return view("adminsystem.".$this->_controller.".form",compact("arrRowData","controller","task","title","icon"));
        } else{
          return view("adminsystem.no-access");
        }     
        
    }
     public function save(Request $request){
          $id                   =   trim($request->id);        
          $fullname             =   trim($request->fullname);
          $alias                =   trim($request->alias);  
          $title                =   trim($request->title);
          $meta_keyword         =   trim($request->meta_keyword);
          $meta_description     =   trim($request->meta_description);
          $author               =   trim($request->author);
          $copyright            =   trim($request->copyright);          
          $google_site_verification =   trim($request->google_site_verification);
          $google_analytics     =   trim($request->google_analytics);                    
          $logo_frontend_file           =   null;
          if(isset($_FILES["logo_frontend"])){
            $logo_frontend_file         =   $_FILES["logo_frontend"];
          }
          $favicon_file           =   null;
          if(isset($_FILES["favicon"])){
            $favicon_file         =   $_FILES["favicon"];
          }          
          $logo_frontend_hidden =   trim($request->logo_frontend_hidden);          
          $favicon_hidden       =   trim($request->favicon_hidden);          
          $setting              =   trim($request->setting);        
          $status               =   trim($request->status);        
          $sort_order           =   trim($request->sort_order);                  
          $data                 =   array();
          $info                 =   array();
          $error                =   array();
          $item                 =   null;
          $checked              =   1;                      
          if(empty($sort_order)){
             $checked = 0;
             $error["sort_order"]["type_msg"]   = "has-error";
             $error["sort_order"]["msg"]    = "Thiếu sắp xếp";
          }
          if((int)$status==-1){
             $checked = 0;
             $error["status"]["type_msg"]     = "has-error";
             $error["status"]["msg"]      = "Thiếu trạng thái";
          }                    
          if ($checked == 1) {    
                $logo_frontend_name='';
                $favicon_name='';
                $width=0;
                  $height=0;
                if($logo_frontend_file != null){                                                                   
                  $logo_frontend_name=uploadImage($logo_frontend_file['name'],$logo_frontend_file['tmp_name'],$width,$height);        
                }                    
                if($favicon_file != null){                                                                
                  $favicon_name=uploadImage($favicon_file['name'],$favicon_file['tmp_name'],$width,$height);        
                }   
                if(empty($id)){
                    $item         =   new SettingSystemModel;     
                    if(!empty($logo_frontend_name)){
                        $item->logo_frontend    =   trim($logo_frontend_name) ;  
                    }  
                    if(!empty($favicon_name)){
                        $item->favicon    =   trim($favicon_name) ;  
                    }
                    $item->created_at   = date("Y-m-d H:i:s",time());                             
                } else{
                  $item         = SettingSystemModel::find((int)@$id);   
                  $item->logo_frontend=null;
                  $item->favicon=null;                       
                  if(!empty($logo_frontend_hidden)){
                    $item->logo_frontend =$logo_frontend_hidden;          
                  }
                  if(!empty($favicon_hidden)){
                    $item->favicon =$favicon_hidden;          
                  }
                  if(!empty($logo_frontend_name))  {
                    $item->logo_frontend=$logo_frontend_name;                                                
                  }                  
                  if(!empty($favicon_name))  {
                    $item->favicon=$favicon_name;                                                
                  }                                                              
                }        
                $item->fullname                 =   @$fullname;                
                $item->alias                    =   @$alias;        
                $item->title                    =   @$title;
                $item->meta_keyword             =   @$meta_keyword;
                $item->meta_description         =   @$meta_description;
                $item->author                   =   @$author;
                $item->copyright                =   @$copyright;                
                $item->google_site_verification =   @$google_site_verification;
                $item->google_analytics         =   @$google_analytics;                                            

                $item->setting                  =   @$setting ;                            
                $item->sort_order               = (int)@$sort_order;
                $item->status                   = (int)@$status;    
                $item->updated_at               = date("Y-m-d H:i:s",time());               
                $item->save();                    
                $info = array(
                  'type_msg'      => "has-success",
                  'msg'         => 'Lưu dữ liệu thành công',
                  "checked"       => 1,
                  "error"       => $error,
                  "id"          => $id
                );
            }else {
                    $info = array(
                      'type_msg'      => "has-error",
                      'msg'         => 'Dữ liệu nhập gặp sự cố',
                      "checked"       => 0,
                      "error"       => $error,
                      "id"        => ""
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
                  $item           =       SettingSystemModel::find((int)@$id);        
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
            $id                     =   (int)@$request->id;              
            $checked                =   1;
            $type_msg               =   "alert-success";
            $msg                    =   "Xóa dữ liệu thành công";                    
            if($checked == 1){
                $item = SettingSystemModel::find((int)@$id);
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
          $msg                    =   "Vui lòng chọn ít nhất 1 phần tử";
        }
        if($checked==1){
          foreach ($arrID as $key => $value) {
            if(!empty($value)){
              $item=SettingSystemModel::find($value);
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
          $msg                =   "Vui lòng chọn ít nhất 1 phần tử";
        }
        if($checked == 1){                          
     
          DB::table('setting_system')->whereIn('id',@$arrID)->delete();         
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
                $item=SettingSystemModel::find((int)$value->id);                
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

      public function createAlias(Request $request){
        $id                =  trim($request->id)  ; 
        $fullname                =  trim($request->fullname)  ;        
        $data                    =  array();
        $info                    =  array();
        $error                   =  array();
        $item                    =  null;
        $checked  = 1;   
        $alias='';                     
        if(empty($fullname)){
         $checked = 0;
         $error["fullname"]["type_msg"] = "has-error";
         $error["fullname"]["msg"] = "Thiếu tên bài viết";
       }else{
        $alias=str_slug($fullname,'-');
        $dataSettingSystem=array();        
        $checked_trung_alias=0;          
        if (empty($id)) {
          $dataSettingSystem=SettingSystemModel::whereRaw("trim(lower(alias)) = ?",[trim(mb_strtolower($alias,'UTF-8'))])->get()->toArray();            
        }else{
          $dataSettingSystem=SettingSystemModel::whereRaw("trim(lower(alias)) = ? and id != ?",[trim(mb_strtolower($alias,'UTF-8')),(int)@$id])->get()->toArray();    
        }          
        if (count($dataSettingSystem) > 0) {
            $checked_trung_alias=1;
          }               
        if((int)$checked_trung_alias == 1){
          $code_alias=rand(1,999);
          $alias=$alias.'-'.$code_alias;
        }
      }
      if ($checked == 1){
        $info = array(
          'type_msg'      => "has-success",
          'msg'         => 'Lưu dữ liệu thành công',
          "checked"       => 1,
          "error"       => $error,

          "alias"       =>$alias
        );
      }else {
        $info = array(
          'type_msg'      => "has-error",
          'msg'         => 'Nhập dữ liệu có sự cố',
          "checked"       => 0,
          "error"       => $error,
          "alias"        => $alias
        );
      }    
      return $info;
    }
}
?>
