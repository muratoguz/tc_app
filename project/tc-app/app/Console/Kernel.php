<?php

namespace App\Console;

use App\Models\Purchase;
use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    /**
     * Define the application's command schedule.
     *
     * @param  \Illuminate\Console\Scheduling\Schedule  $schedule
     * @return void
     */
    protected function schedule(Schedule $schedule)
    {
        // $schedule->command('inspire')->hourly();
        $schedule->command('tcapp:expiredsubs', [Purchase::Started])->daily()->runInBackground()->withoutOverlapping();
        $schedule->command('tcapp:expiredsubs', [Purchase::Renewed])->daily()->runInBackground()->withoutOverlapping();
        $schedule->command('tcapp:expiredsubs', [Purchase::Pending])->everyFiveMinutes()->runInBackground()->withoutOverlapping();
        //callback
        $schedule->command('call:back', [Purchase::Waiting])->daily()->runInBackground()->withoutOverlapping();
        $schedule->command('call:back', [Purchase::SendAgain])->daily()->everyTwoHours()->withoutOverlapping();
        //$schedule->command('cache:write')->daily();
    }

    /**
     * Register the commands for the application.
     *
     * @return void
     */
    protected function commands()
    {
        $this->load(__DIR__.'/Commands');

        require base_path('routes/console.php');
    }
}
