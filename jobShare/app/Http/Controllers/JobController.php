<?php

namespace App\Http\Controllers;
use App\Apply;
use App\Job;
use App\Post;
use App\User;
use App\Category;
use App\Testimonial;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class JobController extends Controller
{

    public function __construct(){
        $this->middleware(['sharer','verified'],['except'=>array('index','show','apply','allJobs','searchJobs')]);
        
    }
    
    public function index(){
        $jobs = Job::latest()->limit(4)->where('status',1)->get();
        $categories = Category::with('jobs')->get();
        $posts = Post::where('status',1)->get();
        $testimonial = Testimonial::orderBy('id','DESC')->first();
        return view ('welcome',compact('jobs','categories','posts','testimonial'));
    }
    public function show($id,Job $job){
        $data = [];
        
        $jobsBasedOnCategories = Job::latest()->where('category_id',$job->category_id)
                           
                             ->where('id','!=',$job->id)
                             ->where('status',1)
                             ->where('type',$job->type)
                             ->limit(6)
                             ->get();
        array_push($data,$jobsBasedOnCategories);
                           
      

        

       $collection  = collect($data);
       $unique = $collection->unique("id");
       $jobRecommendations =  $unique->values()->first();
    
        return view ('jobs.show',compact('job','jobRecommendations'));
    }

    


    public function  create(){
        return view('jobs.create');
    }

    public function  store(Request $request){
        
        $user_id = auth()->user()->id;
       
        $user_avatar=auth()->user()->profile->avatar;
        $user_number=auth()->user()->profile->phone_number;
        $request->validate([
            'title'=>'required|min:10',
            'description'=>'required',
            'address'=>'required',
            'payment'=>'required|numeric',
            'last_date'=>'required'

        ]);
        $date=Carbon::createFromFormat('m/d/Y', $request->last_date)->format('Y-m-d');
        Job::create([
            'user_id' => $user_id,
            'title'=>request('title'),
            'slug' =>Str::slug(request('title')),
            'description'=>request('description'),
            'category_id' =>request('category'),
            'address'=>request('address'),
            'type'=>request('type'),
            'status'=>request('status'),
            'last_date'=>$date,
             'user_avatar'=>$user_avatar,
             'user_phone_number'=>$user_number,
             'salary'=>request('payment')

        ]);
        return redirect()->back()->with('message','Job posted successfully!');
     }

     public function myjob(){
        $jobs = Job::where('user_id',auth()->user()->id)->get();
        return view('jobs.myjob',compact('jobs'));
    }

    public function edit($slug,$id){
        $job = Job::findOrFail($id);
        return view('jobs.edit',compact('job'));
    }

    public function update(Request $request,$id){
        $job = Job::findOrFail($id);
       
        $date = strtotime($request->last_date);
        $new_date = date('Y-m-d', $date);
        
        $job->title=$request->title;
        $job->slug=Str::slug($request->title);
        $job->description=$request->description;
  
        $job->category_id=$request->category_id;
        $job->address=$request->address;
        $job->type=$request->type;

        $job->status=$request->status;
         
        $job->last_date=$new_date;
           $job->salary=$request->payment;
         $job->save();
       
        
        return redirect()->back()->with('message','Job  Sucessfully Updated!');

    }


    public function apply(Request $request,$id){
        $jobId = Job::find($id);
        $jobId->users()->attach(Auth::user()->id);
        $user_id=User::find(Auth::user()->id);
        $user_id->total_jobs=$user_id->total_jobs+1;
        $user_id->save();
        
       


        return redirect()->back()->with('message','Request for the job has been sent to jobsharer!');

    }

     public function applicant(){
        $applicants = Job::has('users')->where('user_id',auth()->user()->id)->get();
        $count=$applicants->count();
      
        return view('jobs.applicants',compact('applicants'));
    }

    public function allJobs(Request $request){
        $search = $request->get('search');
        $address = $request->get('address');
        if($search && $address){
           $jobs = DB::table('jobs')
        
           ->Where('type','LIKE','%'.$search.'%')
           
           ->Where('address','LIKE','%'.$address.'%')
            ->paginate(10);

            return view('jobs.alljobs',compact('jobs'));

        }
        $keyword = $request->get('title');
        $type = $request->get('type');
        $category = $request->get('category_id');
        $address = $request->get('address');
       
        if( $type||$category||$address){
        
            $jobs = DB::table('jobs')
        
           ->orWhere('type',$type)
           ->orWhere('category_id',$category)
           ->orWhere('address',$address)
            ->paginate(10);
              
           


                 
                 return view('jobs.alljobs',compact('jobs'));
        }else if($keyword){

            
            $jobs = DB::table('jobs')
        
            ->where('title','LIKE','%'.$keyword.'%')
            ->paginate(10);
              
           


                 
                 return view('jobs.alljobs',compact('jobs'));
        }else{

            $jobs = Job::latest()->paginate(10);
            return view('jobs.alljobs',compact('jobs'));
    }
 
 
 }


 public function searchJobs(Request $request){
       
    $keyword = $request->get('keyword');
    $users = Job::where('title','like','%'.$keyword.'%')
    ->orWhere('type','like','%'.$keyword.'%')
            ->limit(5)->get();
    return response()->json($users);

}
}
