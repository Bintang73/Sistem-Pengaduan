<?php

namespace Modules\Reporter\Console\Commands;

use Illuminate\Console\Command;

class ReporterCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'command:ReporterCommand';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Reporter Command description';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        return Command::SUCCESS;
    }
}
