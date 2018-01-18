<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class ProjectMemberModel extends Model {

	protected $table="project_member";
	protected $fillable=["project_id","member_id","created_at","updated_at"];		
}

