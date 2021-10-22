@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-3">
         
            @if(empty(Auth::user()->profile->avatar))
            <img src="{{asset('avatar/man.jpg')}}" width="100" style="width: 100%;">
            @else
            <img src="{{asset('uploads/avatar')}}/{{Auth::user()->profile->avatar}}" width="100" style="width: 100%;">

            @endif

          
            <br><br>

           
            <form action="{{route('avatar')}}" method="POST" enctype="multipart/form-data">@csrf
            <div class="card">
                <div class="card-header">Update profile picture</div>
                <div class="card-body">
                    <input type="file" class="form-control" name="avatar">
                    <br>
                    <button class="btn btn-success float-right" type="submit">Update</button>
                  
                    @if($errors->has('avatar'))
                    <div class="error" style="color: red;">{{$errors->first('avatar')}}</div>
                @endif
                </div>
            </div>
        </form>


        </div>

        <div class="col-md-5">
            @if(Session::has('message'))
            <div class="alert alert-success alert-dismissible">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <strong>{{Session::get('message')}}</strong> 
              </div>
               
           
          @endif
          @if(Session::has('messagedanger'))
          <div class="alert alert-danger alert-dismissible">
              <button type="button" class="close" data-dismiss="alert">&times;</button>
              <strong>{{Session::get('messagedanger')}}</strong> 
            </div>
             
         
        @endif
   
             <div class="card">
                <div class="card-header">Update Your Profile</div>


                
 
                {!! Form::open(['route' => 'profile.create']) !!}
                @csrf
                <div class="card-body">
                    <div class="form-group">
                        <label for="">Address</label>
                        <input type="text" class="form-control" name="address" value="{{Auth::user()->profile->address}}">
                        @if($errors->has('address'))
                        <div class="error" style="color: red;">{{$errors->first('address')}}</div>
                    @endif

                    </div>
                   
                    <div class="form-group">
                            <label for="">Number</label>
                            <input type="text"  class="form-control" name="phone" value="{{Auth::user()->profile->phone_number}}">
                           
                            @if($errors->has('phone'))
                            <div class="error" style="color: red;">{{$errors->first('phone')}}</div>
                        @endif
                    </div>
    
                    <div class="form-group">
                        <label for="">Profession</label>
                        <input type="text"   class="form-control" name="prof" value="{{Auth::user()->profile->profession}}">
                        @if($errors->has('prof'))
                            <div class="error" style="color: red;">{{$errors->first('prof')}}</div>
                        @endif
                           
                    </div>


                <div class="form-group">
                        <label for="">Bio</label>
                        <textarea name="bio" class="form-control">{{Auth::user()->profile->bio}} </textarea>
                        @if($errors->has('bio'))
                        <div class="error" style="color: red;">{{$errors->first('bio')}}</div>
                    @endif
                    </div>

                    <div class="form-group">
                        <button class="btn btn-success" type="submit">Update</button>
                    </div>

                </div>
               
            </div>
        
            

        </div>

        {!! Form::close() !!}

        <div class="col-md-4">
            <div class="card">
                <div class="card-header">About you</div>
                <div class="card-body">
                
                    <p>Name:{{Auth::user()->name}}</p>
                    <p>User-Type:{{Auth::user()->user_type}}</p>
                    <p>Email:{{Auth::user()->email}}</p>
                    <p>Address:{{Auth::user()->profile->address}}</p>
    
                    <p>Phone:{{Auth::user()->profile->phone_number}}</p>
                    <p>Gender:{{Auth::user()->profile->gender}}</p>
                    <p>Profession:{{Auth::user()->profile->profession}}</p>
                    <p>Bio:{{Auth::user()->profile->bio}}</p>
                    <p>Member On:{{date('F d Y',strtotime(Auth::user()->created_at))}}</p>

                </div>
            </div>
        <br>
      

            <br>
        

        </div>

    </div>
</div>
@endsection

