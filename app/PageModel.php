<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class PageModel extends Model {

	protected $table="page";
	protected $fillable=["fullname","alias","theme_location","image","intro","content","description","meta_keyword","meta_description","count_view","sort_order","status","created_at","updated_at"];		
}
