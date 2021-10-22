<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use App\profile;
use App\Role;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable  implements MustVerifyEmail  
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password','name_slug','user_type','phone_number'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function jobs(){
        return $this->hasMany('App\Job');
    }
    public function profile(){
        return $this->hasOne(Profile::class);
    }
    public function favorites(){
        return $this->belongsToMany(Job::class,'favourites','user_id','job_id')->withTimeStamps();
    }
    public function roles(){
        return $this->belongsToMany(Role::class);
    }
}
