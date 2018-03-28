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
use App\PaginationModel;
use DB;
class CategoryProductController extends Controller {
    	var $_controller="category-product"; 
      var $_title="Loại sản phẩm";
      var $_icon="icon-settings font-dark";
      var $_totalItemsPerPage=9999;    
      var $_pageRange=10;
    	public function getList(Request $request){   
        $controller=$this->_controller; 
        $task="list";
        $title=$this->_title;
        $icon=$this->_icon; 
        $currentPage=1;                 
        $query=DB::table('category_product');        
        if(!empty(@$request->filter_search)){
          $query->where('category_product.fullname','like','%'.trim(@$request->filter_search).'%');
        }
        $data=$query->select('category_product.id')                                
        ->groupBy('category_product.id')                
        ->get()
        ->toArray();
        $totalItems=count($data);
        $totalItemsPerPage=$this->_totalItemsPerPage;       
        $pageRange=$this->_pageRange;
        if(!empty(@$request->filter_page)){
          $currentPage=(int)@$request->filter_page;    
        }            
        $arrPagination=array(
          "totalItems"=>$totalItems,
          "totalItemsPerPage"=>$totalItemsPerPage,
          "pageRange"=>$pageRange,
          "currentPage"=>$currentPage 
        );
        $pagination=new PaginationModel($arrPagination);
        $position = (@$arrPagination['currentPage']-1)*$totalItemsPerPage;
        $data=array();
        $query=DB::table('category_product as n')
        ->leftJoin('category_product as a','n.parent_id','=','a.id');        
        if(!empty(@$request->filter_search)){
          $query->where('n.fullname','like','%'.trim(@$request->filter_search).'%');
        }
        $data=$query->select('n.id','n.fullname','n.alias','n.parent_id','a.fullname as parent_fullname','n.image','n.sort_order','n.status','n.created_at','n.updated_at')                           
        ->groupBy('n.id','n.fullname','n.alias','n.parent_id','a.fullname','n.image','n.sort_order','n.status','n.created_at','n.updated_at')
        ->orderBy('n.sort_order', 'asc')
        ->skip($position)
        ->take($totalItemsPerPage)
        ->get()
        ->toArray();        
        $data=convertToArray($data);
        $data=categoryProductConverter($data,$this->_controller);   
        $data_recursive=array();
        categoryProductRecursive($data,0,null,$data_recursive);          
        $data=$data_recursive;        
        $arrPrivilege=getArrPrivilege();
        $requestControllerAction=$this->_controller."-list";         
        if(in_array($requestControllerAction,$arrPrivilege)){
          return view("adminsystem.".$this->_controller.".list",compact("controller","task","title","icon",'data','pagination','filter_search'));
        }
        else{
          return view("adminsystem.no-access");
        }
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
                $arrRowData=CategoryProductModel::find((int)@$id)->toArray();      
            break;
            case 'add':
                $title=$this->_title . " : Add new";
            break;      
         }             
         $arrCategoryProduct=CategoryProductModel::whereRaw("id != ?",[(int)@$id])->select("id","fullname","parent_id")->orderBy("sort_order","asc")->get()->toArray();
         $arrCategoryProductRecursive=array();      
         categoryRecursiveForm($arrCategoryProduct ,0,"",$arrCategoryProductRecursive)  ;      
         return view("adminsystem.".$this->_controller.".form",compact("arrCategoryProductRecursive","arrRowData","controller","task","title","icon")); 
        } else{
          return view("adminsystem.no-access");
        }               
          
     }
    public function save(Request $request){
        $id 					          =	  trim($request->id)	;        
        $fullname 				      =	  trim($request->fullname)	;
        $alias 					        =   trim($request->alias);
        $alias_menu              =  trim($request->alias_menu);
        
        $meta_keyword         =   trim($request->meta_keyword);
        $meta_description     =   trim($request->meta_description);
        $category_id	  =		trim($request->category_id);
        $image_file           =   null;
                if(isset($_FILES["image"])){
                  $image_file         =   $_FILES["image"];
                }
        $image_hidden           =   trim($request->image_hidden);
        $sort_order 			      =		trim($request->sort_order);
        $status 				        =		trim($request->status);
        $data 		              =   array();
        $info 		              =   array();
        $error 		              =   array();
        $item		= null;
        $checked 	= 1;              
        if(empty($fullname)){
           $checked = 0;
           $error["fullname"]["type_msg"] = "has-error";
           $error["fullname"]["msg"] = "Thiếu tên loại sản phẩm";
        }else{
            $data=array();
             if (empty($id)) {
                $data=CategoryProductModel::whereRaw("trim(lower(fullname)) = ?",[trim(mb_strtolower($fullname,'UTF-8'))])->get()->toArray();	        	
            }else{
              $data=CategoryProductModel::whereRaw("trim(lower(fullname)) = ? and id != ?",[trim(mb_strtolower($fullname,'UTF-8')),(int)@$id])->get()->toArray();		
            }  
            if (count($data) > 0) {
              $checked = 0;
              $error["fullname"]["type_msg"] = "has-error";
              $error["fullname"]["msg"] = "Loại sản phẩm đã tồn tại";
            }      	
        }        
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
            $width=0;
            $height=0;                            
            $image_name=uploadImage($image_file['name'],$image_file['tmp_name'],$width,$height);            
          }   
             if(empty($id)){
              $item 				= 	new CategoryProductModel;       
              $item->created_at 	=	date("Y-m-d H:i:s",time());        
              if(!empty($image_name)){
                  $item->image    =   trim($image_name) ;  
                }		
        } else{
              $item				=	CategoryProductModel::find((int)@$id);   
              $item->image=null;                       
                    if(!empty($image_hidden)){
                      $item->image =$image_hidden;          
                    }
                    if(!empty($image_name))  {
                  $item->image=$image_name;                                                
                }             
        }  
        $item->fullname 		=	$fullname;
        $item->alias 			  =	$alias;
        
        $item->meta_keyword     = $meta_keyword;
        $item->meta_description = $meta_description;           
        $item->parent_id 		=	(int)@$category_id;            
        $item->sort_order 	=	(int)@$sort_order;
        $item->status 			=	(int)@$status;    
        $item->updated_at 	=	date("Y-m-d H:i:s",time());    	        	
        $item->save(); 
        $dataMenu=MenuModel::whereRaw("trim(lower(alias)) = ?",[trim(mb_strtolower($alias_menu,'UTF-8'))])->get()->toArray();
          if(count($dataMenu) > 0){
            foreach ($dataMenu as $key => $value) {                   
              $menu_id=(int)$value['id'];
              $sql = "update  `menu` set `alias` = '".$alias."' WHERE `id` = ".$menu_id;           
                DB::statement($sql);    
            }          
          } 
        $info = array(
          'type_msg' 			=> "has-success",
          'msg' 				=> 'Lưu dữ liệu thành công',
          "checked" 			=> 1,
          "error" 			=> $error,
          "id"    			=> $id
        );
      } else {
            $info = array(
              'type_msg' 			=> "has-error",
              'msg' 				=> 'Lưu dữ liệu gặp sự cố',
              "checked" 			=> 0,
              "error" 			=> $error,
              "id"				=> ""
            );
      }        		 			       
      return $info;       
    }
      public function changeStatus(Request $request){
            $id             =       (int)$request->id;  
            $status         =       (int)$request->status;
            
            $item=CategoryProductModel::find($id);
            $trangThai=0;
            if($status==0){
              $trangThai=1;
            }
            else{
              $trangThai=0;
            }
            $item->status=$status;
            $item->save();
            $result = array(
                        'id'      => $id, 
                        'status'  => $status, 
                        'link'    => 'javascript:changeStatus('.$id.','.$trangThai.');'
                    );
            return $result;   
      }
      
      public function deleteItem($id){           
        $checked                =   1;
        $type_msg               =   "alert-success";
        $msg                    =   "Xóa dữ liệu thành công";         
        $arrPrivilege=getArrPrivilege();
        $requestControllerAction=$this->_controller."-delete";      
        if(in_array($requestControllerAction,$arrPrivilege)){
          $data                   =   CategoryProductModel::whereRaw("parent_id = ?",[(int)@$id])->get()->toArray();  
          if(count($data) > 0){
            $checked     =   0;
            $type_msg           =   "alert-warning";            
            $msg                    =   "Phần tử này có dữ liệu con. Vui lòng không xoá";
          }
          $data                   =   ProductModel::whereRaw("category_id = ?",[(int)@$id])->get()->toArray();              
          if(count($data) > 0){
            $checked     =   0;
            $type_msg           =   "alert-warning";            
            $msg                    =   "Phần tử này có dữ liệu con. Vui lòng không xoá";
          }
          if($checked == 1){
            $item               =   CategoryProductModel::find((int)@$id);
            $item->delete();            
          }        
          return redirect()->route("adminsystem.".$this->_controller.".getList")->with(["message"=>array("type_msg"=>$type_msg,"msg"=>$msg)]); 
        } else{
          return view("adminsystem.no-access");
        }                        
      }
      public function updateStatus(Request $request,$status){        
        $arrID=$request->cid;
        $type_msg               =   "alert-success";
        $msg                    =   "Cập nhật thành công";    
        $checked                =   1; 
        $arrPrivilege=getArrPrivilege();
        $requestControllerAction=$this->_controller."-status";  
        if(in_array($requestControllerAction,$arrPrivilege)){
          if(count($arrID)==0){
            $checked                =   0;
            $type_msg               =   "alert-warning";            
            $msg                    =   "Vui lòng chọn 1 phần tử";
          }
          if($checked==1){
            foreach ($arrID as $key => $value) {
              $item=CategoryProductModel::find($value);
              $item->status=$status;
              $item->save();    
            }
          }        
          return redirect()->route("adminsystem.".$this->_controller.".getList")->with(["message"=>array("type_msg"=>$type_msg,"msg"=>$msg)]); 
        }else{
          return view("adminsystem.no-access");
        }        
      }
      public function trash(Request $request){            
        $arrID                 =   $request->cid;             
        $checked                =   1;
        $type_msg               =   "alert-success";
        $msg                    =   "Xóa dữ liệu thành công";      
        $arrID                 =   $request->cid;   
        $arrPrivilege=getArrPrivilege();
        $requestControllerAction=$this->_controller."-trash";   
        if(in_array($requestControllerAction,$arrPrivilege)){
          if(count($arrID)==0){
            $checked     =   0;
            $type_msg           =   "alert-warning";            
            $msg                =   "Vui lòng chọn 1 phần tử";
          }else{
            foreach ($arrID as $key => $value) {
              if(!empty($value)){
                $data                   =   CategoryProductModel::whereRaw("parent_id = ?",[(int)@$value])->get()->toArray();                    
                if(count($data) > 0){
                  $checked     =   0;
                  $type_msg           =   "alert-warning";            
                  $msg                    =   "Phần tử này có dữ liệu con. Vui lòng không xoá";
                }
                $data                   =   ProductModel::whereRaw("category_id = ?",[(int)@$value])->get()->toArray();                     
                if(count($data) > 0){
                  $checked     =   0;
                  $type_msg           =   "alert-warning";            
                  $msg                    =   "Phần tử này có dữ liệu con. Vui lòng không xoá";
                }
              }                
            }
          }
          if($checked == 1){                            
            DB::table('category_product')->whereIn('id',@$arrID)->delete();   
          }
          return redirect()->route("adminsystem.".$this->_controller.".getList")->with(["message"=>array("type_msg"=>$type_msg,"msg"=>$msg)]); 
        }else{
          return view("adminsystem.no-access");
        }            
      }
      public function sortOrder(Request $request){
        $checked                =   1;
        $type_msg               =   "alert-success";
        $msg                    =   "Cập nhật thành công"; 
        $arrPrivilege=getArrPrivilege();
        $requestControllerAction=$this->_controller."-ordering";    
        if(in_array($requestControllerAction,$arrPrivilege)){
          $arrOrder=array();
          $arrOrder=$request->sort_order;  
          if(count($arrOrder) == 0){
            $checked     =   0;
            $type_msg           =   "alert-warning";            
            $msg                =   "Vui lòng chọn 1 phần tử";
          }
          if($checked==1){        
            foreach($arrOrder as $id => $value){                    
              $item=CategoryProductModel::find($id);
              $item->sort_order=(int)$value;            
              $item->save();            
            }     
          }    
          return redirect()->route("adminsystem.".$this->_controller.".getList")->with(["message"=>array("type_msg"=>$type_msg,"msg"=>$msg)]); 
        }else{
          return view("adminsystem.no-access");
        }      
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
          $dataCategoryArticle=array();
          $dataCategoryProduct=array();
          $dataArticle=array();
          $dataProduct=array();
          $dataPage=array();
          $checked_trung_alias=0;
          if (empty($id)) {
              
              $dataCategoryProduct = CategoryProductModel::whereRaw("trim(lower(alias)) = ?",[trim(mb_strtolower($alias,'UTF-8'))])->get()->toArray();
              
            }else{
              $dataCategoryProduct = CategoryProductModel::whereRaw("trim(lower(alias)) = ? and id != ?",[trim(mb_strtolower($alias,'UTF-8')),(int)@$id])->get()->toArray();    
            }  
            $dataCategoryArticle=CategoryArticleModel::whereRaw("trim(lower(alias)) = ?",[trim(mb_strtolower($alias,'UTF-8'))])->get()->toArray();             
              $dataArticle=ArticleModel::whereRaw("trim(lower(alias)) = ?",[trim(mb_strtolower($alias,'UTF-8'))])->get()->toArray();
              $dataProduct=ProductModel::whereRaw("trim(lower(alias)) = ?",[trim(mb_strtolower($alias,'UTF-8'))])->get()->toArray();
              $dataPage=PageModel::whereRaw("trim(lower(alias)) = ?",[trim(mb_strtolower($alias,'UTF-8'))])->get()->toArray();
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
