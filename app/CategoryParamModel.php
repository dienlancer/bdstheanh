<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class CategoryParamModel extends Model {

	protected $table="category_param";
	protected $fillable=["fullname","alias","parent_id","param_value","sort_order","status","created_at","updated_at"];		
}
