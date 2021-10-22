@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">Your jobs</div>

                <div class="card-body">
                    
                    <table class="table">
            <thead>

            </thead>
            
            <tbody>
                
                @foreach($jobs as $job)
                <tr>
              
                    <td><b>Category:</b>{{$job->category->name}}
                        <br>
                       <b>Type:</b> <i class="fa fa-clock-o"aria-hidden="true"></i>&nbsp;{{$job->type}}
                    </td>
                    <td><i class="fa fa-map-marker" aria-hidden="true"></i>&nbsp;Address:{{$job->address}}</td>
                    <td><i class="fa fa-globe"aria-hidden="true"></i>&nbsp;Date:{{$job->created_at->diffForHumans()}}</td>
                    <td>
                        <a href="">
                            <button class="btn btn-success btn-sm">  Read
                            </button>
                        </a>
                        <br><br>
                       <a href="{{route('job.edit',[$job->slug,$job->id])}}"> <button class="btn btn-dark">Edit</button></a>
                        
                </td>
                </tr>
                @endforeach
            </tbody>
        </table>


                </div>
            </div>
        </div>
    </div>
</div>
@endsection

<style>
    .fa{
        color: red;
    }
    </style>