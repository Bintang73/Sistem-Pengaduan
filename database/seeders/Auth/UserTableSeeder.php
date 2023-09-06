<?php

namespace Database\Seeders\Auth;

use App\Events\Backend\UserCreated;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Schema;

/**
 * Class UserTableSeeder.
 */
class UserTableSeeder extends Seeder
{
    /**
     * Run the database seed.
     *
     * @return void
     */
    public function run()
    {
        Schema::disableForeignKeyConstraints();

        $faker = \Faker\Factory::create();

        // Add the master administrator, user id of 1
        $users = [
            [
                'name' => 'Super Admin',
                'email' => 'superadmin@pengaduan.com',
                'username' => 'superadmin',
                'phone_number' => $faker->phoneNumber,
                'password' => Hash::make('password'),
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'name' => 'Administrator',
                'email' => 'admin@pengaduan.com',
                'username' => 'admin',
                'phone_number' => $faker->phoneNumber,
                'password' => Hash::make('password'),
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'name' => 'Staff',
                'email' => 'staff@pengaduan.com',
                'username' => 'staff',
                'phone_number' => $faker->phoneNumber,
                'password' => Hash::make('password'),
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
        ];

        foreach ($users as $user_data) {
            $user = User::create($user_data);

            event(new UserCreated($user));
        }

        Schema::enableForeignKeyConstraints();
    }
}
