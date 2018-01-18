<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class ProjectModel extends Model {

	protected $table="project";
	protected $fillable=["fullname","alias","meta_keyword","meta_description","image","count_view","total_cost","intro","overview","plan","sponsor","sort_order","status","created_at","updated_at"];		
}
