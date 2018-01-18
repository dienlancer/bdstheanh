<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class SupporterModel extends Model {

	protected $table="supporter";
	protected $fillable=["fullname","number_money","payment_method_id","sort_order","status","created_at","updated_at"];		
}
