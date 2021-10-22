@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
    <form action="{{route('alljobs')}}" method="get">

    <div class="form-inline">
        <div class="form-group">
            <label>Keyword&nbsp;</label>
            <input type="text" name="title" class="form-control">&nbsp;&nbsp;&nbsp;
        </div>
        <div class="form-group">
            <label>Employment type&nbsp;</label>
            <select class="form-control" name="type">
                    <option value="">-select-</option>
                    <option value="online">online</option>
                    <option value="offline">offline</option>
                   
                </select>
                &nbsp;&nbsp;
        </div>
        <div class="form-group">
            <label>category</label>
            <select name="category_id" class="form-control">
                <option value="">-select-</option>

                    @foreach(App\Category::all() as $cat)
                        <option value="{{$cat->id}}">{{$cat->name}}</option>
                    @endforeach
                </select>
                &nbsp;&nbsp;
        </div>

        <div class="form-group">
            <label>address</label>
            <input type="text" name="address" class="form-control">&nbsp;&nbsp;
        </div>
        
        <div class="form-group">
            <button type="submit" class="btn btn-outline-success">Search</button>
        </div>
    </div>
    </form>


        <table class="table">
            
            <tbody>
                @foreach($jobs as $job)
                <tr>
                <td>
                        <i class="fa fa-clock-o"aria-hidden="true"></i>&nbsp;{{$job->type}}
                    </td>
                    <td>@if($job->type=='offline')<i class="fa fa-map-marker" aria-hidden="true"></i>&nbsp;{{$job->address}}@endif</td>
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
