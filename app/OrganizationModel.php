<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class OrganizationModel extends Model {

	protected $table="organization";
	protected $fillable=["fullname","alias","meta_keyword","meta_description","image","address","phone","email","website","intro","content","count_view","sort_order","status","created_at","updated_at"];		
}
