<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Job Share Platform  </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  @include('partials.head')
    
  </head>
  <body>
  
  @include('partials.nav')
  
   @include('partials.hero')
    
   @include('partials.category')
    <div class="site-section bg-light">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-5 mb-md-0" data-aos="fade-up" data-aos-delay="100">
            <h2 class="mb-5 h3">Recent Jobs</h2>
            <div class="rounded border jobs-wrap">
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

            </div>

            <div class="col-md-12 text-center mt-5">
              <a href="{{route('alljobs')}}" class="btn btn-primary rounded py-3 px-5"><span class="icon-plus-circle"></span> Show More Jobs</a>
            </div>
          </div>
         
        </div>
      </div>
    </div>

    @include('partials.testimonial')

    <div class="site-blocks-cover overlay inner-page" style="background-image: url('images/hero_1.jpg');" data-aos="fade" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row align-items-center justify-content-center">
          <div class="col-md-6 text-center" data-aos="fade">
            <h1 class="h3 mb-0">Share your Jobs</h1>
         
            <p><a href="#" class="btn btn-outline-warning py-3 px-4">Share Jobs</a> <a href="#" class="btn btn-warning py-3 px-4">Apply For A Job</a></p>
            
          </div>
        </div>
      </div>
    </div>

    

    <div class="site-section site-block-feature bg-light">
      <div class="container">
        
        <div class="text-center mb-5 section-heading">
          <h2>Why Choose Us</h2>
        </div>

        <div class="d-block d-md-flex border-bottom">
          <div class="text-center p-4 item border-right" data-aos="fade">
            <span class="flaticon-worker display-3 mb-3 d-block text-primary"></span>
            <h2 class="h4">More Jobs Every Day</h2>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati reprehenderit explicabo quos fugit vitae dolorum.</p>
            <p><a href="#">Read More <span class="icon-arrow-right small"></span></a></p>
          </div>
          <div class="text-center p-4 item" data-aos="fade">
            <span class="flaticon-wrench display-3 mb-3 d-block text-primary"></span>
            <h2 class="h4">Creative Jobs</h2>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati reprehenderit explicabo quos fugit vitae dolorum.</p>
            <p><a href="#">Read More <span class="icon-arrow-right small"></span></a></p>
          </div>
        </div>
        <div class="d-block d-md-flex">
          <div class="text-center p-4 item border-right" data-aos="fade">
            <span class="flaticon-stethoscope display-3 mb-3 d-block text-primary"></span>
            <h2 class="h4">Healthcare</h2>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati reprehenderit explicabo quos fugit vitae dolorum.</p>
            <p><a href="#">Read More <span class="icon-arrow-right small"></span></a></p>
          </div>
          <div class="text-center p-4 item" data-aos="fade">
            <span class="flaticon-calculator display-3 mb-3 d-block text-primary"></span>
            <h2 class="h4">Finance &amp; Accounting</h2>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati reprehenderit explicabo quos fugit vitae dolorum.</p>
            <p><a href="#">Read More <span class="icon-arrow-right small"></span></a></p>
          </div>
        </div>
      </div>
    </div>

    


  @include('partials.blog')

    @include('partials.footer')
  </body>
</html>