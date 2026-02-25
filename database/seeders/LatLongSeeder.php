<?php

namespace Database\Seeders;

use Botble\Base\Facades\MetaBox;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Models\Post;
use Botble\RealEstate\Models\Project;
use Botble\RealEstate\Models\Property;

class LatLongSeeder extends BaseSeeder
{
    public function run(): void
    {
        foreach (Property::query()->whereNull('latitude')->orWhereNull('longitude')->orWhere('project_id', 0)->get() as $property) {
            if (! $property->latitude) {
                $property->latitude = 42.4772 + (rand(0, 15000) / 10000);
            }

            if (! $property->longitude) {
                $property->longitude = -76.7517 + (rand(0, 20000) / 10000);
            }

            if (! $property->project_id) {
                $property->project_id = $property->id <= 17 ? rand(1, 6) : rand(7, 12);
            }

            $property->save();
        }

        foreach (Project::query()->whereNull('latitude')->orWhereNull('longitude')->get() as $project) {
            if (! $project->latitude) {
                $project->latitude = 42.4772 + (rand(0, 15000) / 10000);
            }

            if (! $project->longitude) {
                $project->longitude = -76.7517 + (rand(0, 20000) / 10000);
            }

            $project->save();
        }

        foreach (Property::query()->get() as $property) {
            if ($property->id % 2 == 0) {
                MetaBox::saveMetaBoxData($property, 'video', [
                    'thumbnail' => $property->id % 4 == 0 ? 'properties/property-video-thumb.jpg' : '',
                    'url' => 'https://www.youtube.com/watch?v=UfEiKK-iX70',
                ]);
            }
        }

        foreach (Project::query()->get() as $project) {
            if ($project->id % 2 == 0) {
                MetaBox::saveMetaBoxData($project, 'video', [
                    'thumbnail' => $project->id % 4 == 0 ? 'properties/property-video-thumb.jpg' : '',
                    'url' => 'https://www.youtube.com/watch?v=UfEiKK-iX70',
                ]);
            }
        }

        foreach (Post::query()->get() as $post) {
            $post->views = rand(100, 2500);
            $post->save();
        }
    }
}
