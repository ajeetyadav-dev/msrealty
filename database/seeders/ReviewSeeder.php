<?php

namespace Database\Seeders;

use Botble\Base\Supports\BaseSeeder;
use Botble\RealEstate\Models\Account;
use Botble\RealEstate\Models\Project;
use Botble\RealEstate\Models\Property;
use Botble\RealEstate\Models\Review;
use Carbon\Carbon;

class ReviewSeeder extends BaseSeeder
{
    protected array $reviews = [
        'Absolutely loved this property! The location is perfect and the neighborhood is very safe.',
        'Great property with modern amenities. The kitchen is spacious and well-equipped.',
        'Excellent value for money. The property exceeded my expectations in terms of quality.',
        'Beautiful home with amazing natural light. The garden is well-maintained.',
        'The property is well-maintained and in a prime location. Close to schools and shopping.',
        'Stunning views from the balcony. The interior design is modern and tasteful.',
        'Spacious rooms and excellent storage space. Recently renovated and looks brand new.',
        'Perfect starter home for young couples. Affordable yet comfortable.',
        'The property photos were accurate and the space is even better in person.',
        'Outstanding property management. Any issues were addressed promptly.',
        'Loved the open floor plan and high ceilings. Natural ventilation is excellent.',
        'Prime location near downtown but surprisingly quiet. Best of both worlds.',
        'The attention to detail in this property is impressive. Quality finishes throughout.',
        'Wonderful experience from viewing to move-in. The agent was professional.',
        'Great investment property. Already seeing good returns on investment.',
        'The neighborhood is vibrant with lots of cafes and restaurants nearby.',
        'Family-friendly community with excellent schools nearby.',
        'Modern smart home features throughout. Energy-efficient appliances.',
        'Generous closet space and built-in storage solutions.',
        'The property has character and charm while still offering modern conveniences.',
        'Exceptional customer service from the real estate team.',
        'Great natural lighting throughout the day.',
        'Well-insulated property keeps energy costs low.',
        'The community amenities are fantastic - pool, gym, and clubhouse.',
        'Quiet neighbors and a peaceful atmosphere. Perfect for working from home.',
        'The layout is practical and space-efficient.',
        'High-quality construction materials visible throughout.',
        'Love the outdoor space - perfect for gardening and entertaining.',
        'Central location means everything is just minutes away.',
        'The property has great resale potential. Smart investment.',
    ];

    public function run(): void
    {
        Review::query()->truncate();

        $accountsCount = Account::query()->count();
        $projectsCount = Project::query()->count();
        $propertiesCount = Property::query()->count();

        $now = Carbon::now();

        $reviewableTypes = [
            ['id' => $projectsCount, 'type' => Project::class],
            ['id' => $propertiesCount, 'type' => Property::class],
        ];

        for ($i = 1; $i <= 200; $i++) {
            $reviewableType = $reviewableTypes[rand(0, 1)];
            $reviewable = [
                'id' => rand(1, $reviewableType['id']),
                'type' => $reviewableType['type'],
            ];

            Review::query()->insertOrIgnore([
                'id' => (new Review())->newUniqueId(),
                'account_id' => rand(1, $accountsCount),
                'reviewable_type' => $reviewable['type'],
                'reviewable_id' => $reviewable['id'],
                'content' => $this->reviews[array_rand($this->reviews)],
                'star' => rand(1, 5),
                'created_at' => $now,
                'updated_at' => $now,
            ]);
        }
    }
}
