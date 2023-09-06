<?php

namespace Modules\Reporter\Models;

use DB;
use App\Models\BaseModel;
use Illuminate\Database\Eloquent\SoftDeletes;

class Reporter extends BaseModel
{
    use SoftDeletes;

    protected $table = 'reporters';

    protected $guarded = [];

    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
        'deleted_at' => 'datetime',
    ];
}
