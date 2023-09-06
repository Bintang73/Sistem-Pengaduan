<?php

namespace App\Listeners\Backend\UserCreated;

use App\Events\Backend\UserCreated;
use App\Models\Userprofile;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Log;

class UserCreatedProfileCreate implements ShouldQueue
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @return void
     */
    public function handle(UserCreated $event)
    {
        $user = $event->user;

        Log::info('UserCreated: ' . $user->name . '(Id:' . $user->id . ')');

        // Clear Cache
        Artisan::call('cache:clear');
    }
}
