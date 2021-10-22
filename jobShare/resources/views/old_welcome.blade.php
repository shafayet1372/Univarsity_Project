@extends('layouts.app')

@section('content')
<div class="container">

    <div class="row">
        <div class="col-md-12">
            <search-component></search-component>
        </div>

        <h1>Recent Jobs</h1>

        <table class="table">
            
         <thead>
  
        <th></th>
        <th></th>
        <th></th>
        <th></th>
         </thead>

            <tbody>
                @foreach ($jobs as $job)
                    
                
                <tr>
                  
            
            <td>{{$job->category->name}}
                <br>
                <i class="fa fa-clock"aria-hidden="true"></i>&nbsp&nbsp;{{$job->type}}
            </td>
            <td><i class="fa fa-map-marker" aria-hidden="true"></i>&nbsp;Address:{{$job->address}}</td>
            <td><i class="fa fa-globe"aria-hidden="true"></i>&nbsp;{{$job->created_at->diffForHumans()}}</td>
                   
        <td>   <a href="{{route('jobs.show',[$job->id,$job->slug])}}"><button class="btn btn-success btn-sm">Give a Try!</button></a>
            </td>
                   
                </tr>
                @endforeach
            </tbody>
        </table>

    </div>

   
    <div>
        <a href="{{route('alljobs')}}">  <button class="btn btn-primary btn-lg" style="width: 100%;">Browse all jobs</button></a>
      </div>

</div>





@endsection
<style>
.fa{
    color: red;
}
</style>
