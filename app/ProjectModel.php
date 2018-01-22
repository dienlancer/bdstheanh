<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class ProjectModel extends Model {

	protected $table="project";
	protected $fillable=[
		"fullname"
		,"alias"
		,"meta_keyword"
		,"meta_description"
		,"image"
		,"count_view"
		,"total_cost"
		,"unit"
		,"intro"
		,"overview"
		,"equipment"
		,"price_list"
		,"googlemap_url"
		,'province_id'
		,'district_id'
		,'street'
		,"sort_order"
		,"status"
		,"created_at"
		,"updated_at"
	];		
}
