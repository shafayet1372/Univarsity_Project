<?php

namespace App\Http\Controllers;

use App\Job;
use App\User;
use App\profile;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;


class UserController extends Controller
{

  public function __construct()
  {
     // $this->middleware('auth');
      
      $this->middleware(['verified'],['except'=>array('index')]);
  }


    public function index( $id, $slug){
        $all=User::find($id);
       
        
       
        return view('users.user',compact('slug','all'));

    }


    public function user_another( $id, $slug,$count){
      $all=User::find($id);
     
      return view('users.user_another',compact('slug','all','count'));
  }

    public function profile(){

        return view('profiles.profile');
    }

    public function store(Request $request){
       $request->validate([
     
        'address'=>'required',
        'bio'=>'required|min:20',
        'prof'=>'required',
        'phone'=>'required|min:11'
       ]);
   		$user_id = auth()->user()->id;
   		
      Profile::where('user_id',$user_id)->update([
        'address'=>request('address'),
   		'bio'=>request('bio'),
        'phone_number'=>request('phone'),
        'profession'=>request('prof')
   		]);
   		return redirect()->back()->with('message','Profile Sucessfully Updated!');

   }

   public function avatar(Request $request){
       $request->validate([
        'avatar'=>'required|mimes:png,jpeg,jpg|max:20000'
       ]);
    $user_id = auth()->user()->id;
    if($request->hasfile('avatar')){
        $file = $request->file('avatar');
        $ext =  $file->getClientOriginalExtension();
        $filename = time().'.'.$ext;
        $file->move('uploads/avatar/',$filename);
        Profile::where('user_id',$user_id)->update([
          'avatar'=>$filename
        ]);
    return redirect()->back()->with('message','Profile picture Sucessfully Updated!');
    }            
   }
 
}
