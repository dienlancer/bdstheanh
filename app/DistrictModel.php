<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class DistrictModel extends Model {

	protected $table="district";
	protected $fillable=["fullname","alias","province_id","sort_order","status","created_at","updated_at"];		
}
