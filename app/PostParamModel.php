<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class PostParamModel extends Model {

	protected $table="post_param";
	protected $fillable=["post_id","param_id","created_at","updated_at"];		
}
