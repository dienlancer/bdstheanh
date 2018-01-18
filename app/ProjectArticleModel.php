<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class ProjectArticleModel extends Model {

	protected $table="project_article";
	protected $fillable=["fullname","alias","image","intro","content","description","meta_keyword","meta_description","count_view","project_id","sort_order","status","created_at","updated_at"];		
}
