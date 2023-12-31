<?php

namespace App\Listeners\Backend\UserUpdated;

use App\Events\Backend\UserUpdated;
use App\Models\Userprofile;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Support\Facades\Log;

class UserUpdatedProfileUpdate implements ShouldQueue
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
    public function handle(UserUpdated $event)
    {
        $user = $event->user;

        Log::info('UserUpdated: ' . $user->name . '(Id:' . $user->id . ')');

        // Clear Cache
        \Artisan::call('cache:clear');
    }
}
