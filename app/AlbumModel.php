<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class AlbumModel extends Model {

	protected $table="album";
	protected $fillable=["fullname","alias","meta_keyword","meta_description","image","sort_order","status","created_at","updated_at"];		
}
