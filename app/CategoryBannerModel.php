<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class CategoryBannerModel extends Model {

	protected $table="category_banner";
	protected $fillable=["fullname","theme_location","status","sort_order","created_at","updated_at"];		
}
