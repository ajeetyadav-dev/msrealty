<?php

namespace Database\Seeders;

use Botble\Base\Supports\BaseSeeder;
use Botble\RealEstate\Models\Feature;
use Botble\RealEstate\Models\Property;
use Illuminate\Support\Facades\DB;

class FeatureSeeder extends BaseSeeder
{
    public function run(): void
    {
        Feature::query()->truncate();
        DB::table('re_project_features')->truncate();
        DB::table('re_property_features')->truncate();

       $features = [
    [
        'name' => 'Wifi',
        'icon' => 'fas fa-wifi',
    ],
    [
        'name' => 'Parking',
        'icon' => 'fas fa-parking',
    ],
    [
        'name' => 'Swimming pool',
        'icon' => 'fas fa-swimming-pool',
    ],
    [
        'name' => 'Balcony',
        'icon' => 'fas fa-building',
    ],
    [
        'name' => 'Garden',
        'icon' => 'fas fa-tree',
    ],
    [
        'name' => 'Security',
        'icon' => 'fas fa-lock',
    ],
    [
        'name' => 'Fitness center',
        'icon' => 'fas fa-dumbbell',
    ],
    [
        'name' => 'Air Conditioning',
        'icon' => 'fas fa-fan',
    ],
    [
        'name' => 'Central Heating',
        'icon' => 'fas fa-fire',
    ],
    [
        'name' => 'Laundry Room',
        'icon' => 'fas fa-washing-machine',
    ],
    [
        'name' => 'Pets Allow',
        'icon' => 'fas fa-paw',
    ],
    [
        'name' => 'Spa & Massage',
        'icon' => 'fas fa-spa',
    ],
];


        foreach ($features as $facility) {
            Feature::query()->create($facility);
        }

        foreach (Property::query()->get() as $property) {
            $property->features()->detach();
            $property->features()->attach([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]);
        }
    }
}
