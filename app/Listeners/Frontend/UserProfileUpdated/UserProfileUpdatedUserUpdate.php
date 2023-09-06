<?php

namespace App\Listeners\Frontend\UserProfileUpdated;

use App\Events\Frontend\UserProfileUpdated;
use App\Models\User;
use Illuminate\Contracts\Queue\ShouldQueue;

class UserProfileUpdatedUserUpdate implements ShouldQueue
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
    public function handle(UserProfileUpdated $event)
    {
    }
}
