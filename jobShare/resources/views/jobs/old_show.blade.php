@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row ">
        
        <div class="col-md-8">
            @if(Session::has('message'))
                 <div class="alert alert-success">
                    {{Session::get('message')}}
                </div>
            @endif
            <div class="card">
                <div class="card-header">{{$job->title}}</div>

                <div class="card-body">
                   <p>
                    <h3>Description</h3>
                    {{$job->description}}
                    <p>
                  
                   
</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-header">Short Info</div>

                <div class="card-body">
                    <p>Job Poster: <a href="{{route('user.show',[$job->user->id,$job->user->name_slug])}}">{{$job->user->name}}</a><p>
                    
                    <p>Address:{{$job->address}}</p>
                    <p>Job Type:{{$job->type}}</p>
                    <p>Category:{{$job->category->name}}</p>
                    <p>Posted:{{$job->created_at->diffForHumans()}}</p>
                   

                </div>
            </div>
            <br>
            @if(Auth::check()&&Auth::user()->user_type=='seeker')
           @if(!$job->checkApplication())
           <apply-component :jobid={{$job->id}}></apply-component>
            
        @endif

        <br>
            <favorite-component :jobid={{$job->id}} :favorited={{$job->checkSaved()?'true':'false'}}  ></favorite-component>
            @endif
           

 
        </div>
</div>



    </div>

@endsection
