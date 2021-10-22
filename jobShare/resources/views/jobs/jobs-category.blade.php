@extends('layouts.main')
@section('content')
<div class="container" style="width: 100%">
    <div class="row">
    

        <table class="table">
            
            <tbody>
                @foreach($jobs as $job)
                <tr>
                <td>
                    <div class="job-category align-self-center">
                        @if($job->type=='online')
                        <div class="p-3">
                          <span class="text-info p-2 rounded border border-info" style="font-weight: bold">{{$job->type}}</span>
                        </div>
                        @elseif($job->type=='offline')
                        <div class="p-3">
                          <span class="text-danger p-2 rounded border border-danger"style="font-weight: bold">{{$job->type}}</span>
                        </div>
                        @else
                         <div class="p-3">
                          <span class="text-warning p-2 rounded border border-warning">{{$job->type}}</span>
                        </div>
                        @endif
      
                      </div>  
                    </td>
                    <td>@if($job->type=='offline')<span style="font-weight: bold;color:blue;" class="icon-room mr-1">{{$job->address}}@endif</td>
                    <td>
                        <span class="badge badge-danger"><?php
                          $get=  DB::table('categories')
                            ->select('name')
                               ->where('id',$job->category_id)
                               ->first();
                          echo $get->name;
                            ?></span>
                    </td>
                    <td>
                       
                        <a href="{{route('jobs.show',[$job->id,$job->slug])}}">
                            <button class="btn btn-success btn-sm">     Apply
                            </button>
                        </a>
                        
                </td>
               
                </tr>
                @endforeach
            </tbody>
        </table>

        {{$jobs->appends(Illuminate\Support\Facades\Request::except('page'))->links()}}

    </div>

</div>




@endsection
<style>
.fa{
    color: red;
}
</style>
