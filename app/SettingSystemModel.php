<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class SettingSystemModel extends Model {

	protected $table="setting_system";
	protected $fillable=["fullname",
						"alias",
						"title",
						"meta_keyword",
						"meta_description",
						"author",
						"copyright",						
						"google_site_verification",
						"google_analytics",												
						"logo_frontend",												
						"favicon",
						"setting",
						"sort_order",
						"status",
						"created_at",
						"updated_at"];		
}
