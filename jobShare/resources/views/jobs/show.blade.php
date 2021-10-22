@extends('layouts.main')
@section('content')
   <div class="album text-muted">
     <div class="container">
      @if(Session::has('message'))

      <div class="alert alert-success">{{Session::get('message')}}</div>
      @endif
        @if(Session::has('err_message'))

      <div class="alert alert-danger">{{Session::get('err_message')}}</div>
      @endif
      @if(isset($errors)&&count($errors)>0)
      <div class="alert alert-danger">
        <ul>
          @foreach($errors->all() as $error)
            <li>{{$error}}</li>
          @endforeach
        </ul>
      </div>

      @endif

       <div class="row" id="app">
          <div class="title" style="margin-top: 20px;">
                <h2>{{$job->title}}</h2> 

          </div>

      

          <div class="col-lg-8">
            
            
            <div class="p-4 mb-8 bg-white">
              <!-- icon-book mr-3-->
              <h3 class="h5 text-black mb-3"><i class="fa fa-book" style="color: blue;">&nbsp;</i>Description <a href="#"data-toggle="modal" data-target="#exampleModal1"><i class="fa fa-envelope-square" style="font-size: 34px;float:right;color:green;"></i></a></h3>
              <p>{{$job->description}}</p>
              
            </div>
       
          
            <div class="p-4 mb-8 bg-white">
              <h3 class="h5 text-black mb-3"><i class="fa fa-clock-o" style="color: blue;">&nbsp;</i><span style="font-weight: bold;">Job Payment</span></h3>
              <p style="color:green;font-weight:bold;">&nbsp;{{$job->salary}}TK</p>
              
            </div>
            @if($job->type=="offline")
            <div class="p-4 mb-8 bg-white">
              <h3 class="h5 text-black mb-3"><i class="fa fa-venus-mars" style="color: blue;">&nbsp;</i>Address</h3>
              <p>&nbsp;{{$job->address}} </p>
              
            </div>
            @endif
          

          </div>

          
            <div class="col-md-4 p-4 site-section bg-light">
              <h3 class="h5 text-black mb-3 text-center" >Short Info</h3>
                 
              <p><span style="font-weight: bold;">Job Poster:</span> <a href="{{route('user.show',[$job->user->id,$job->user->name_slug])}}">{{$job->user->name}}</a><p>
                <p> <span style="font-weight: bold;">Number-to-call:</span> {{$job->user_phone_number}}</p>   
                <p> <span style="font-weight: bold;">Address:</span> {{$job->address}}</p>
                <p><span style="font-weight: bold;">Job Type:</span>{{$job->type}}</p>
                <p> <span style="font-weight: bold;"> Category:</span>{{$job->category->name}}</p>
                <p><span style="font-weight: bold;">Posted:</span>{{$job->created_at->diffForHumans()}}</p>


            
              <p>
        @if(Auth::check()&&Auth::user()->user_type=='seeker')
           

            @if(!$job->checkApplication())
            
            <apply-component :jobid={{$job->id}} ></apply-component>
            @else
            <center><span style="color: #000;">You applied this job</span></center>
            @endif
<br>
            <favorite-component :jobid={{$job->id}} :favorited={{$job->checkSaved()?'true':'false'}}  ></favorite-component>
            @else
           <span style="color:green;font-weight:bold;"> Please login as seeker to apply this job</span>

            @endif

              </p>
        
   <div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Send job to your friend</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>      
        <form action="{{route('mail')}}" method="POST">@csrf
  
        <div class="modal-body">
          <input type="hidden" name="job_id" value="{{$job->id}}">
          <input type="hidden" name="job_slug" value="{{$job->slug}}">
  
          <div class="form-goup">
            <label>Your name * </label>
            <input type="text" name="your_name" class="form-control" required="">
          </div>
          <div class="form-goup">
            <label>Your email *</label>
            <input type="email" name="your_email" class="form-control" required="">
          </div>
          <div class="form-goup">
            <label>Person name *</label>
            <input type="text" name="friend_name" class="form-control" required="">
          </div>
          <div class="form-goup">
            <label>Person email *</label>
            <input type="email" name="friend_email" class="form-control" required="">
          </div>
          
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary">Mail this job</button>
        </div>
      </form>
      </div>
    </div>
  </div>
</div>

<br>
<br>
<br>
<br>

@foreach($jobRecommendations as $jobRecommendation)
<div class="card" style="width: 18rem;margin:2px;">
  <div class="card-body">
    <p class="badge badge-success">{{$jobRecommendation->type}}</p><span class="float-right badge badge-danger">
      <?php
        $get=  DB::table('categories')
          ->select('name')
             ->where('id',$job->category_id)
             ->first();
        echo $get->name;
          ?>
    </span>
    
    <p class="card-text">{{str_limit($jobRecommendation->description,90)}}
 
 
        <righ> <a href="{{route('jobs.show',[$jobRecommendation->id,$jobRecommendation->slug])}}" class="btn btn-success">Apply</a></righ>
  </div>
</div>
@endforeach


<!-- Modal -->

               </div>
          

<br>
<br>
<br>

     </div>
   
   </div>



@endsection
