@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-10">
            @if(Auth::user()->user_type=='seeker')
            @if($jobs->count()>0)
            @foreach($jobs as $job)
            <div class="card">
                <div class="card-header">{{$job->title}}</div>
                

                <div class="card-body">  
                    <small class="badge badge-success">{{$job->type}}
                </small>

                   <p> {{substr($job->description,0,200)}}</p>
                </div>
                <div class="card-footer">
                    <span class="float-right"><a href="{{route('jobs.show',[$job->id,$job->slug])}}">Read</a></span>
                  
                </div>

            </div>
            <br>
            @endforeach
          
            @else
             <h1 style="text-align: center">No saved jobs yet</h1>
            @endif
            @else
            
            You're logged in 


            @endif
        </div>
    </div>
</div>
@endsection
