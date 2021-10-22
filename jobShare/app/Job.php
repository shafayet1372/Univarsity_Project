<?php

namespace App;

use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;

class Job extends Model
{
   
    public function getRouteKeyName()
    {
        return 'slug';
    }

    public function user(){

        return $this->belongsTo('App\User');
    }
    public function category(){

        return $this->belongsTo('App\Category');
    }
    protected $guarded = [''];

    public function users(){
        return $this->belongsToMany(User::class)->withTimeStamps();
    }
    public function checkApplication(){
    	return DB::table('job_user')->where('user_id',auth()->user()->id)->where('job_id',$this->id)->exists();
    }
    public function favorites(){
        return $this->belongsToMany(Job::class,'favourites','job_id','user_id')->withTimeStamps();
    }
    public function checkSaved(){
        return DB::table('favourites')->where('user_id',auth()->user()->id)->where('job_id',$this->id)->exists();
    }
}
