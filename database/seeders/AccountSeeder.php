<?php

namespace Database\Seeders;

use Botble\Base\Supports\BaseSeeder;
use Botble\RealEstate\Models\Account;
use Botble\RealEstate\Models\Property;
use Carbon\Carbon;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class AccountSeeder extends BaseSeeder
{
    public function run(): void
    {
        Account::query()->truncate();

        $files = $this->uploadFiles('accounts');

        $now = $this->now();

        $descriptions = [
            'Dedicated real estate professional with expertise in residential properties.',
            'Experienced agent specializing in luxury homes and investment properties.',
            'Passionate about helping clients find their perfect home.',
            'Top-performing agent with strong negotiation skills.',
            'Local market expert committed to exceptional client service.',
            'Full-service real estate professional for buyers and sellers.',
            'Trusted advisor with deep knowledge of the local market.',
            'Results-driven agent focused on client satisfaction.',
            'Seasoned professional with extensive market knowledge.',
            'Customer-focused agent delivering outstanding results.',
            'Skilled negotiator with a proven track record of success.',
            'Committed to making your real estate dreams a reality.',
        ];

        $firstNames = ['John', 'Sarah', 'Michael', 'Emily', 'David', 'Jennifer', 'Robert', 'Lisa', 'James', 'Amanda', 'William', 'Jessica'];
        $lastNames = ['Smith', 'Johnson', 'Williams', 'Brown', 'Jones', 'Garcia', 'Miller', 'Davis', 'Rodriguez', 'Martinez', 'Wilson', 'Anderson'];
        $phones = ['+14155551234', '+12125559876', '+13105557890', '+17185554321', '+16505558765', '+16465553456', '+14085552468', '+15105551357', '+16195559630', '+19495558520', '+13235557410', '+16265556320'];

        $verificationNotes = ['Verified agent', 'Trusted partner', 'Premium member'];

        Account::query()->create([
            'first_name' => 'John',
            'last_name' => 'Smith',
            'email' => 'john.smith@botble.com',
            'username' => 'john-smith-' . rand(100, 999),
            'password' => Hash::make('12345678'),
            'dob' => Carbon::now()->subYears(rand(25, 55))->subDays(rand(0, 365)),
            'phone' => $phone = $phones[0],
            'whatsapp' => $phone,
            'description' => $descriptions[array_rand($descriptions)],
            'credits' => 10,
            'confirmed_at' => $now,
            'approved_at' => $now,
            'avatar_id' => $files[array_rand($files)]['data']->id,
            'is_public_profile' => true,
            'is_verified' => true,
            'verified_at' => $now,
            'verification_note' => 'Verified premium agent',
        ]);

        Account::query()->create([
            'first_name' => 'Sarah',
            'last_name' => 'Johnson',
            'email' => 'agent@botble.com',
            'username' => 'sarah-johnson-' . rand(100, 999),
            'password' => Hash::make('12345678'),
            'dob' => Carbon::now()->subYears(rand(25, 55))->subDays(rand(0, 365)),
            'phone' => $phone = $phones[1],
            'whatsapp' => $phone,
            'description' => $descriptions[array_rand($descriptions)],
            'credits' => 10,
            'confirmed_at' => $now,
            'approved_at' => $now,
            'avatar_id' => $files[array_rand($files)]['data']->id,
            'is_public_profile' => true,
            'is_verified' => true,
            'verified_at' => $now,
            'verification_note' => 'Verified agent',
        ]);

        for ($i = 0; $i < 10; $i++) {
            $isVerified = rand(0, 100) < 40;
            $nameIndex = ($i + 2) % count($firstNames);

            Account::query()->create([
                'first_name' => $firstNames[$nameIndex],
                'last_name' => $lastNames[($nameIndex + 3) % count($lastNames)],
                'email' => strtolower($firstNames[$nameIndex]) . '.' . strtolower($lastNames[($nameIndex + 3) % count($lastNames)]) . $i . '@example.com',
                'username' => Str::slug($firstNames[$nameIndex] . '-' . $lastNames[($nameIndex + 3) % count($lastNames)] . '-' . rand(100, 999)),
                'password' => Hash::make('password123'),
                'dob' => Carbon::now()->subYears(rand(25, 55))->subDays(rand(0, 365)),
                'phone' => $phone = $phones[$i % count($phones)],
                'whatsapp' => $phone,
                'description' => $descriptions[array_rand($descriptions)],
                'credits' => rand(1, 10),
                'confirmed_at' => $now,
                'approved_at' => $now,
                'avatar_id' => $files[array_rand($files)]['data']->id,
                'is_public_profile' => true,
                'is_verified' => $isVerified,
                'verified_at' => $isVerified ? Carbon::now()->subDays(rand(1, 365)) : null,
                'verification_note' => $isVerified ? $verificationNotes[array_rand($verificationNotes)] : null,
            ]);
        }

        foreach (Account::query()->get() as $account) {
            if (is_int($account->id) && $account->id % 2 == 0) {
                $account->is_featured = true;
                $account->save();
            }
        }

        $properties = Property::query()->get();

        foreach ($properties as $property) {
            $property->author_id = Account::query()->inRandomOrder()->value('id');
            $property->author_type = Account::class;
            $property->save();
        }
    }
}
