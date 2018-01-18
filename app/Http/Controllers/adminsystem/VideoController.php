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
use App\ProjectArticleModel;
use App\ArticleCategoryModel;
use App\AlbumModel;
use App\PhotoModel;
use App\CategoryVideoModel;
use App\VideoModel;
use DB;
class VideoController extends Controller {
  	var $_controller="video";	
  	var $_title="Video";
  	var $_icon="icon-settings font-dark";    
  	public function getList(){		
    		$controller=$this->_controller;	
    		$task="list";
    		$title=$this->_title;
    		$icon=$this->_icon;		   
        $arrCategoryVideo=CategoryVideoModel::select("id","fullname")->orderBy("sort_order","asc")->get()->toArray();     
        $arrPrivilege=getArrPrivilege();
        $requestControllerAction=$this->_controller."-list";         
        if(in_array($requestControllerAction,$arrPrivilege)){
          return view("adminsystem.".$this->_controller.".list",compact("controller","task","title","icon","arrCategoryVideo")); 
        }
        else{
          return view("adminsystem.no-access");
        }
  	}	    
  	public function loadData(Request $request){                 
      $query=DB::table('video')
                ->join('category_video','video.category_video_id','=','category_video.id');        
      if(!empty(@$request->category_video_id)){
        $query->where('video.category_video_id',(int)@$request->category_video_id);
      }
      $data=$query->select('video.id','video.fullname','category_video.fullname as category_name','video.image','video.video_url','video.sort_order','video.status','video.created_at','video.updated_at')
      ->groupBy('video.id','video.fullname','category_video.fullname','video.image','video.video_url','video.sort_order','video.status','video.created_at','video.updated_at')
      ->orderBy('video.sort_order', 'asc')->get()->toArray()     ;              
      $data=convertToArray($data);    
      $data=videoConverter($data,$this->_controller);            
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
              $arrRowData=VideoModel::find((int)@$id)->toArray();                     
           break;
           case 'add':
              $title=$this->_title . " : Add new";
           break;     
        }          
        $arrCategoryVideo=CategoryVideoModel::select("id","fullname")->orderBy("sort_order","asc")->get()->toArray();  
        return view("adminsystem.".$this->_controller.".form",compact("arrRowData","controller","task","title","icon","arrCategoryVideo"));
        }else{
          return view("adminsystem.no-access");
        }        
    }
    public function save(Request $request){
          $id                   =   trim(@$request->id);   
          $fullname             =   trim($request->fullname);
          $category_video_id    =   trim(@$request->category_video_id);                                
          $image                =   trim(@$request->image);          
          $image_hidden         =   trim(@$request->image_hidden); 
          $video_url            =   trim(@$request->video_url);             
          $sort_order           =   trim(@$request->sort_order);
          $status               =   trim(@$request->status);          
          $data                 =   array();
          $info                 =   array();
          $error                =   array();
          $item                 =   null;
          $checked              =   1;        
          if(empty($fullname)){
                 $checked = 0;
                 $error["fullname"]["type_msg"] = "has-error";
                 $error["fullname"]["msg"] = "Thiếu tên video";
          }else{
              $data=array();
              if (empty($id)) {
                $data=ArticleModel::whereRaw("trim(lower(fullname)) = ?",[trim(mb_strtolower($fullname,'UTF-8'))])->get()->toArray();           
              }else{
                $data=ArticleModel::whereRaw("trim(lower(fullname)) = ? and id != ?",[trim(mb_strtolower($fullname,'UTF-8')),(int)@$id])->get()->toArray();   
              }  
              if (count($data) > 0) {
                  $checked = 0;
                  $error["fullname"]["type_msg"] = "has-error";
                  $error["fullname"]["msg"] = "Tên video đã tồn tại";
              }       
          }              
          if(empty($video_url)){
                 $checked = 0;
                 $error["video_url"]["type_msg"] = "has-error";
                 $error["video_url"]["msg"] = "Thiếu tên bài viết";
          }else{
              $data=array();
              if (empty($id)) {
                $data=VideoModel::whereRaw("trim(lower(video_url)) = ?",[trim(mb_strtolower($video_url,'UTF-8'))])->get()->toArray();            
              }else{
                $data=VideoModel::whereRaw("trim(lower(video_url)) = ? and id != ?",[trim(mb_strtolower($video_url,'UTF-8')),(int)@$id])->get()->toArray();    
              }  
              if (count($data) > 0) {
                  $checked = 0;
                  $error["video_url"]["type_msg"] = "has-error";
                  $error["video_url"]["msg"] = "Bài viết đã tồn tại";
              }       
          }          
          
          if((int)@$category_video_id == 0){
              $checked = 0;
              $error["category_video_id"]["type_msg"]   = "has-error";
              $error["category_video_id"]["msg"]      = "Thiếu danh mục";
          }          
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
                if(empty($id)){
                    $item         =   new VideoModel;       
                    $item->created_at   = date("Y-m-d H:i:s",time());        
                    if(!empty($image)){
                      $item->image    =   trim($image) ;  
                    }       
                } else{
                    $item       = VideoModel::find((int)@$id);   
                    $item->image=null;                       
                    if(!empty($image_hidden)){
                      $item->image =$image_hidden;          
                    }
                    if(!empty($image))  {
                      $item->image=$image;                                                
                    }                    
                }        
                $item->fullname         = $fullname;          
                $item->category_video_id       = (int)@$category_video_id;
                $item->video_url = $video_url;                    
                $item->sort_order       = (int)$sort_order;
                $item->status           = (int)$status;    
                $item->updated_at       = date("Y-m-d H:i:s",time());               
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
                      'msg'         => 'Lưu dữ liệu thất bại',
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
                  $item           =       VideoModel::find((int)@$id);        
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
              $item = VideoModel::find((int)@$id);
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
          $str_id                 =   $request->str_id;   
          $status                 =   $request->status;  
          $arrID                 =   explode(",", $str_id)  ;
          $checked                =   1;
          $type_msg               =   "alert-success";
          $msg                    =   "Cập nhật thành công";     
          if(empty($str_id)){
                    $checked                =   0;
                    $type_msg               =   "alert-warning";            
                    $msg                    =   "Vui lòng chọn ít nhất một phần tử";
          }
          if($checked==1){
              foreach ($arrID as $key => $value) {
                if(!empty($value)){
                    $item=VideoModel::find($value);
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
            $str_id                 =   $request->str_id;   
            $checked                =   1;
            $type_msg               =   "alert-success";
            $msg                    =   "Xóa thành công";      
            $arrID                  =   explode(",", $str_id)  ;        
            if(empty($str_id)){
              $checked     =   0;
              $type_msg           =   "alert-warning";            
              $msg                =   "Vui lòng chọn ít nhất một phần tử để xóa";
            }
            if($checked == 1){                
                  $strID = implode(',',$arrID);   
                  $strID=substr($strID, 0,strlen($strID) - 1);
                  $sqlDeleteVideo = "DELETE FROM `video` WHERE `id` IN  (".$strID.")";                               
                  DB::statement($sqlDeleteVideo);                  
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
                  $item=VideoModel::find((int)@$value->id);                
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

      public function uploadFile(Request $request){                     
        $fileObj=$_FILES["image"];          
        $fileName="";
        if($fileObj['tmp_name'] != null){                
          $fileName   = $fileObj['name'];
          $file_path=base_path("upload".DS.$fileName);
          @copy($fileObj['tmp_name'],$file_path);                   
        }   
      }
}
?>
