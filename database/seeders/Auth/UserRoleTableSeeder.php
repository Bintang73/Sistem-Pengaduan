<?php

namespace Database\Seeders\Auth;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Schema;

/**
 * Class UserRoleTableSeeder.
 */
class UserRoleTableSeeder extends Seeder
{
    /**
     * Run the database seed.
     *
     * @return void
     */
    public function run()
    {
        Schema::disableForeignKeyConstraints();

        User::where('email', '=', 'superadmin@pengaduan.com')->firstOrFail()->assignRole('super admin');
        User::where('email', '=', 'admin@pengaduan.com')->firstOrFail()->assignRole('administrator');
        User::where('email', '=', 'staff@pengaduan.com')->firstOrFail()->assignRole('staff');

        Schema::enableForeignKeyConstraints();
    }
}
