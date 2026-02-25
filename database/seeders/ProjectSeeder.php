<?php

namespace Database\Seeders;

use Botble\Base\Supports\BaseSeeder;
use Botble\RealEstate\Models\Project;
use Illuminate\Support\Facades\DB;

class ProjectSeeder extends BaseSeeder
{
    public function run(): void
    {
        $this->uploadFiles('projects');

        DB::statement('UPDATE re_projects SET views = FLOOR(rand() * 10000) + 1;');

        Project::query()
            ->whereRaw('content NOT LIKE ?', ['%[faqs%'])
            ->update(['content' => DB::raw("CONCAT(content, '<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]')")]);
    }
}
