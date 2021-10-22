@extends('layouts.main')
@section('content')
<div class="container" style="width: 100%">
    <div class="row">
    <form action="{{route('alljobs')}}" method="get">

    <div class="form-inline col-md-12">
        <div class="form-group  ">
            <label style="font-weight: bold;">Keyword&nbsp;</label>
            <input type="text" name="title" class="form-control input-sm" style="height: 2%;width:60%;" >&nbsp;&nbsp;
        </div>
        <div class="form-group ">
            <label style="font-weight: bold;">Type&nbsp;</label>
            <select class="form-control" name="type" style="height: 2%;width:60%;" >
                    <option value="">-select-</option>
                    <option value="online">online</option>
                    <option value="offline">offline</option>
                   
                </select>
                &nbsp;
        </div>
        <div class="form-group">
            <label style="font-weight: bold;">category</label>
            <select name="category_id" class="form-control" style="height: 2%;width:60%;" >
                <option value="">-select-</option>

                    @foreach(App\Category::all() as $cat)
                        <option value="{{$cat->id}}">{{$cat->name}}</option>
                    @endforeach
                </select>
                &nbsp;&nbsp;
        </div>

        <div class="form-group">
            <label style="font-weight: bold;">address</label>
            <input type="text" name="address" class="form-control" style="height: 2%;width:60%;" >&nbsp;
        </div>
        
        <div class="form-group">
            <button type="submit" class="btn btn-outline-success">Search</button>
        </div>
    </div>
    </form>

  <div class="col-md-12">
    <div class="rounded border jobs-wrap">
        @if(count($jobs)>0)
        @foreach($jobs as $job)

        <a href="{{route('jobs.show',[$job->id,$job->slug])}}" class="job-item d-block d-md-flex align-items-center  border-bottom @if($job->type=='parttime') partime @elseif($job->type=='fulltime')fulltime @else freelance   @endif;">
          <div class="company-logo blank-logo text-center text-md-left pl-3">
           
          </div>
          <div class="job-details h-100">
            <div class="p-3 align-self-center">
              <h3>{{$job->title}}</h3>
              <div class="d-block d-lg-flex">
                <div class="mr-3"><span class="icon-suitcase mr-1" style="color:green;font-weight:bold;"><?php
                  $get=  DB::table('categories')
                    ->select('name')
                       ->where('id',$job->category_id)
                       ->first();
                  echo $get->name;
                    ?></span> </div>
                <div class="mr-3" style="color:blue;font-weight:bold;">@if($job->type=='offline')<span style="font-weight: bold;" class="icon-room mr-1">{{$job->address}}</span> @endif</div>
                <div style="color:red;font-weight:bold"><span class="icon-money mr-1" ></span>{{$job->salary}}TK</div>
              </div>
            </div>
          </div>
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
       
        </a>

      @endforeach
      @else
      no jobs found
      @endif

      </div>
    </div>
        {{$jobs->appends(Illuminate\Support\Facades\Request::except('page'))->links()}}

    </div>

</div>




@endsection
<style>
.fa{
    color: red;
}
</style>
