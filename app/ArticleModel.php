<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class ArticleModel extends Model {

	protected $table="article";
	protected $fillable=["fullname","alias","image","intro","content","description","meta_keyword","meta_description","count_view","sort_order","status","created_at","updated_at"];		
}
