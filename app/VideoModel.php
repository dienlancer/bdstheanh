<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class VideoModel extends Model {
	protected $table="video";
	protected $fillable=["id","fullname","category_id","image","video_url","sort_order","status","created_at","updated_at"];		
}
