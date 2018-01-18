<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class CategoryVideoModel extends Model {

	protected $table="category_video";
	protected $fillable=["fullname","alias","meta_keyword","meta_description","image","sort_order","status","created_at","updated_at"];		
}
