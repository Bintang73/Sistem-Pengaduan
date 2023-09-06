<?php

namespace Modules\Report\Models;

use DB;
use App\Models\BaseModel;
use Illuminate\Database\Eloquent\SoftDeletes;
use Modules\Reporter\Models\Reporter;
use Modules\Category\Models\Category;


class Report extends BaseModel
{
    use SoftDeletes;

    protected $table = 'reports';

    protected $guarded = [];

    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
        'deleted_at' => 'datetime',
    ];

    public function reporters()
    {
        return $this->belongsTo(Reporter::class, 'reporter_id', 'id');
    }

    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id', 'id');
    }
}
