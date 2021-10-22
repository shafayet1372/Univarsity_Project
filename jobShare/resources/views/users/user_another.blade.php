
@extends('layouts.main')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-6">

            <div class="company-profile">
    
    
    
    
    
     
    
    
    <div class="company-desc">
    
    
        @if(empty($all->profile->avatar))
        <img src="{{asset('avatar/man.jpg')}}" style="width: 150px;height:150px;border-radius:50%
        ;" >
        @else
        <img src="{{asset('uploads/avatar')}}/{{Auth::user()->profile->avatar}}"  style="width: 150px;height:150px;border-radius:50%
        ;">

        @endif
    
      <br>
    <p><b>Name:</b>{{$all->name}}</p>
    <h1></h1>
    
    @if($all->type=="sharer")
    <p><b>Job Posted Total:</b>{{$all->jobs->count()}}</p>
    @endif
    @if(!empty($all->profile->phone_number))
    <p>  <b>Number:</b>{{$all->profile->phone_number}}</p>
    @else
    @endif
    @if(!empty($count))
    <p>  <b>Job Applied Total:</b>{{$count}}</p>
    @else
    @endif
                </div>
  
            </div>
    
     
    
    
        </div>
        @if($all->type=="sharer")
            
       
        <div class="col-md-6">
            <div class="card">
            <div class="card-body">
                <table class="table">
                    <thead>
                        <th>Category</th>
          
                        <th>Job posted</th>
                        
                    </thead>
                    <tbody>
                        @foreach($all->jobs as $job)
                        <tr>
                           
                            <td>Category:{{$job->category->name}}
                                <br>
                                <i class="fa fa-clock-o"aria-hidden="true"></i>&nbsp;{{$job->type}}
                            </td>
                         
                            <td><i class="fa fa-globe"aria-hidden="true"></i>&nbsp;Date:{{$job->created_at->diffForHumans()}}</td>
                           
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            </div>
            
        </div>
        @endif
    </div>

</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
@endsection

<style>
    .fa{
        color: #4183D7;
    }
    </style>
    