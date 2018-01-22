<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class ProvinceModel extends Model {

	protected $table="province";
	protected $fillable=["fullname","alias","sort_order","status","created_at","updated_at"];		
}
