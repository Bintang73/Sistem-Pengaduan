<?php

namespace Database\Seeders;

use App\Models\Status;
use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Schema;

/**
 * Class StatusTableSeeder.
 */
class StatusTableSeeder extends Seeder
{
    /**
     * Run the database seed.
     *
     * @return void
     */
    public function run()
    {
        Schema::disableForeignKeyConstraints();

        // Add the status data
        $status = [
            [
                'name'          => 'Pending',
                'default'       => true,
                'created_at'    => Carbon::now(),
                'updated_at'    => Carbon::now(),
            ],
            [
                'name'          => 'Proses Administratif',
                'default'       => false,
                'created_at'    => Carbon::now(),
                'updated_at'    => Carbon::now(),
            ],
            [
                'name'          => 'Proses Penanganan',
                'default'       => false,
                'created_at'    => Carbon::now(),
                'updated_at'    => Carbon::now(),
            ],
            [
                'name'          => 'Selesai Ditangani',
                'default'       => false,
                'created_at'    => Carbon::now(),
                'updated_at'    => Carbon::now(),
            ],
            [
                'name'          => 'Laporan Ditolak',
                'default'       => false,
                'created_at'    => Carbon::now(),
                'updated_at'    => Carbon::now(),
            ],
        ];

        foreach ($status as $status) {
            Status::create($status);
        }

        Schema::enableForeignKeyConstraints();
    }
}
