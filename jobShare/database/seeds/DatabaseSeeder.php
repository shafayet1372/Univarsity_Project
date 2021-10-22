<?php

use App\Role;
use App\User;
use App\Category;
use Illuminate\Support\Str;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        Category::truncate();
        factory('App\User',20)->create();
        factory('App\Job',20)->create();
        $categories=[
           'Delivery-Product',
           'Grocery-shopping',
           'Data-entry',
           'Development',
           'Article-Writting'



        ];
        foreach($categories as $cata){

            Category::create(['name'=>$cata]);
        }
        Role::truncate();
        $adminRole = Role::create(['name'=>'admin']);

        $admin = User::create([
            'name'=>'admin',
            'name_slug'=>'admin',
            'email'=>'admin@gmail.com',
            'user_type'=>'admin',
            'password'=>bcrypt('password123'),
            'email_verified_at'=>NOW()
        ]);

        $admin->roles()->attach($adminRole);



    }
}
