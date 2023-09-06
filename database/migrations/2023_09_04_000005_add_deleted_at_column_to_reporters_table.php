<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('reporters', function (Blueprint $table) {
            $table->timestamp('deleted_at')->nullable();
        });

        Schema::table('reports', function (Blueprint $table) {
            $table->timestamp('deleted_at')->nullable();
        });

        Schema::table('categories', function (Blueprint $table) {
            $table->timestamp('deleted_at')->nullable();
        });

        Schema::table('status', function (Blueprint $table) {
            $table->timestamp('deleted_at')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('reporters', function (Blueprint $table) {
            $table->dropColumn('deleted_at');
        });

        Schema::table('reports', function (Blueprint $table) {
            $table->dropColumn('deleted_at');
        });

        Schema::table('categories', function (Blueprint $table) {
            $table->dropColumn('deleted_at');
        });

        Schema::table('status', function (Blueprint $table) {
            $table->dropColumn('deleted_at');
        });
    }
};
