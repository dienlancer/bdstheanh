<?php namespace App\Http\Controllers\adminsystem;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
class MediaController extends Controller {	
	var $_controller="media";	
  	var $_title="Media";
  	var $_icon="icon-settings font-dark";
	public function getList(){		
    		$controller=$this->_controller;	
    		$task="list";
    		$title=$this->_title;
    		$icon=$this->_icon;		            
        $arrPrivilege=getArrPrivilege();
        $requestControllerAction=$this->_controller."-list";         
        if(in_array($requestControllerAction,$arrPrivilege)){
          return view("adminsystem.".$this->_controller.".list",compact("controller","task","title","icon","arrCategoryArticleRecursive")); 
        }
        else{
          return view("adminsystem.no-access");
        }
  	}	   
  	public function loadData(Request $request){
  		$strDirUpload=base_path("upload");
  		$data = scandir($strDirUpload);		  		
  		$data=mediaConverter($data,$this->_controller);		           		
  		return $data;
  	}	 
	public function getForm($task){		 
		$controller=$this->_controller;	
		$title=$this->_title . " : Add new";
		$icon=$this->_icon; 				
		return view("adminsystem.".$this->_controller.".form",compact("controller","task","title","icon"));
	}
	public function uploadFile(Request $request){                     
        $fileObj=$_FILES["image"];          
        $fileName="";
        if($fileObj['tmp_name'] != null){                
          $fileName   = $fileObj['name'];
          $file_path=base_path("upload".DS.$fileName);
          @copy($fileObj['tmp_name'],$file_path);                   
        }   
      }
	public function trash(Request $request){
		$str_id                 =   $request->str_id;   
		$checked                =   1;
		$type_msg               =   "alert-success";
		$msg                    =   "Xóa thành công";      
		if(empty($str_id)){
			$checked     =   0;
			$type_msg           =   "alert-warning";            
			$msg                =   "Vui lòng chọn ít nhất một phần tử để xóa";
		}
		if($checked == 1){                                  
			$str_id=substr($str_id, 0,strlen($str_id) - 1);      
			$arrID                  =   explode(",", $str_id)  ;
			foreach ($arrID as $key => $value) {
				if(!empty($value)){
					$pathFile=base_path("upload/".$value);
					if(file_exists($pathFile)){
						unlink($pathFile);
					}	
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
	public function deleteItem(Request $request){
		$id                     =   $request->id;              
		$checked                =   1;
		$type_msg               =   "alert-success";
		$msg                    =   "Xóa thành công";                    
		$pathFile 				= 	base_path("upload/".$id);			
		if(!file_exists($pathFile)){
			$checked=0;
		}			         	    
		if($checked == 1){
			unlink($pathFile);
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

