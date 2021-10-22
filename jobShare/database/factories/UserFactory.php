<?php

use App\User;
use Illuminate\Support\Str;
use Faker\Generator as Faker;

/*
|--------------------------------------------------------------------------
| Model Factories
|--------------------------------------------------------------------------
|
| This directory should contain each of the model factory definitions for
| your application. Factories provide a convenient way to generate new
| model instances for testing / seeding your application's database.
|
*/

$factory->define(User::class, function (Faker $faker) {
    return [
        'name' => $slug=$faker->name,
        'email' => $faker->unique()->safeEmail,
        'user_type'=>'seeker',
        'name_slug'=>Str::slug($slug),
      
        'email_verified_at' => now(),
        'password' => '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', // password
        'remember_token' => Str::random(10),
    ];
});

$factory->define(App\Job::class, function (Faker $faker) {
    return [
        'user_id' => App\User::all()->random()->id,
        'title'=>$title=$faker->text,
        'slug'=>Str::slug($title),
        'address'=>$faker->address,
        'category_id'=>rand(1,5),
        'type'=>'online',
        'user_avatar'=>'avatar/man.jpg',
        'status'=>rand(0,1),
        'description'=>$faker->paragraph(rand(2,10)),
        'last_date'=>$faker->DateTime,
        'user_phone_number'=>$faker->phoneNumber,
        'salary'=>rand(50,2000),
       
    ];
});
