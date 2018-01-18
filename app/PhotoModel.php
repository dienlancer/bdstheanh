<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class PhotoModel extends Model {
	protected $table="photo";
	protected $fillable=["id","album_id","image","sort_order","status","created_at","updated_at"];		
}
