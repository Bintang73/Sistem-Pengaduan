<?php

namespace App\Models;

use DB;
use Illuminate\Database\Eloquent\Model;

class ReportTracker extends Model
{
    protected $table = 'report_trackers';

    protected $guarded = [];

    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    /**
     * Get the list of all the Columns of the table.
     *
     * @return array Column names array
     */
    public function getTableColumns()
    {
        $table_info_columns = DB::select(DB::raw('SHOW COLUMNS FROM ' . $this->getTable()));

        return $table_info_columns;
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
