<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class profilepic
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if(!empty(Auth::user()->profile->avatar)){
            return $next($request);
    
        
        }else{
             return redirect('/user/profile')->with('messagedanger','you must upload your image to post a job');
        }
        
    }
}
