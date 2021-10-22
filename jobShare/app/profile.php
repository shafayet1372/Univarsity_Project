<?php

namespace App;

use App\User;
use Illuminate\Database\Eloquent\Model;

class profile extends Model
{
    protected $guarded=[];
    public function user(){

        return $this->belongsTo('App\User');
    }
}
