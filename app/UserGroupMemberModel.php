<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class UserGroupMemberModel extends Model {

	protected $table="user_group_member";
	protected $fillable=["group_member_id","user_id","created_at","updated_at"];		
}
