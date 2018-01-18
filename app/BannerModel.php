<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class BannerModel extends Model {

	protected $table="banner";
	protected $fillable=["category_id","caption","alt","page_url","image","sort_order","status","created_at","updated_at"];		
}
