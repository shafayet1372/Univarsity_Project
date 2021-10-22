@extends('layouts.app')

@section('content')
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
    <h1>Applicants</h1>
    <div class="row justify-content-center">
        <div class="col-md-12">       
          @foreach($applicants as $applicant)

            <div class="card">
                <div class="card-header"><a href="{{route('jobs.show',[$applicant->id,$applicant->slug])}}"> {{$applicant->title}}</a>
  <i onclick="add({{$applicant->id}},'{{$applicant->slug}}')" class="fa fa-envelope-square" style="font-size: 34px;float:right;color:green;"></i>
                </div>

                <div class="card-body">
                    @foreach($applicant->users as $user)
                       
            <table class="table" style="width: 100%;">
            <thead class="thead-dark">
             
            </thead>
            <tbody>
            <tr>
                <td>
                    @if(!empty($user->profile->avatar))
                        <img src="{{asset('uploads/avatar')}}/{{$user->profile->avatar}}" width="80">
                    @else
                    <img src="{{asset('uploads/avatar/man.jpg')}}" width="80">
                    @endif

            
                </td>
              <td><b>Name</b>: <a href="{{route('user.show',[$user->id,$user->name_slug])}}">{{$user->name}}</a></td>
      <td><b>Email: </b>{{$user->email}}</td>
  
      <td><b>Gender</b>:@if(!empty($user->profile->gender)){{$user->profile->gender}}@endif</td>
      
      <td><b>Phone</b>:@if(!empty($user->profile->phone_number)){{$user->profile->phone_number}}@endif</td>

      


    </tr>
    
  </tbody>
</table>

                   </div><br><br>
                    @endforeach
                </div> 
                <br>
                 @endforeach


            </div>

        </div>
    </div>
</div>
<div class="modal fade" id="ss" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Send job to your friend</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>      
        <form action="{{route('offermail')}}" method="POST">@csrf
  
        <div class="modal-body">
          <input type="hidden" id='job_id' name="job_id" value="">
          <input type="hidden" id="job_slug" name="job_slug" value="">
  
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

  <script>
      function add(id,slug){
        $('#ss').modal("show");
         document.getElementById('job_id').value=id;
         document.getElementById('job_slug').value=slug;
  
      }
  </script>
@endsection