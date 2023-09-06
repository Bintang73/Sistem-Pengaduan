<?php

namespace Database\Seeders;

use App\Models\Category;
use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Schema;

/**
 * Class CategoriesTableSeeder.
 */
class CategoriesTableSeeder extends Seeder
{
    /**
     * Run the database seed.
     *
     * @return void
     */
    public function run()
    {
        Schema::disableForeignKeyConstraints();

        // Add the categories dummy data
        $categories = [
            [
                'name' => 'Infrastruktur',
                'slug' => 'infrastruktur',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'name' => 'Lingkungan',
                'slug' => 'lingkungan',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'name' => 'Layanan Publik',
                'slug' => 'layanan-publik',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'name' => 'Keamanan',
                'slug' => 'keamanan',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'name' => 'Kesehatan',
                'slug' => 'kesehatan',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'name' => 'Lain-lain',
                'slug' => 'lain-lain',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
        ];

        foreach ($categories as $category) {
            Category::create($category);
        }

        Schema::enableForeignKeyConstraints();
    }
}
