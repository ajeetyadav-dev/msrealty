<?php

use Botble\Career\Models\Career;
use Botble\Slug\Models\Slug;
use Illuminate\Database\Migrations\Migration;

return new class () extends Migration {
    public function up(): void
    {
        Slug::query()
            ->where('reference_type', 'ArchiElite\Career\Models\Career')
            ->update(['reference_type' => Career::class]);
    }
};
