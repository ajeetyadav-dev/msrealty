<?php

namespace Database\Seeders;

use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Models\Category;
use Botble\Blog\Models\Post;
use Botble\Slug\Facades\SlugHelper;
use Botble\Slug\Models\Slug;

class SettingSeeder extends BaseSeeder
{
    public function run(): void
    {
        $settings = [
            'admin_favicon' => $this->filePath('logo/favicon.png'),
            'admin_logo' => $this->filePath('logo/logo-white.png'),
            SlugHelper::getPermalinkSettingKey(Post::class) => 'news',
            SlugHelper::getPermalinkSettingKey(Category::class) => 'news',
            'payment_cod_status' => 1,
            'payment_cod_description' => 'Please pay money directly to the postman, if you choose cash on delivery method (COD).',
            'payment_bank_transfer_status' => 1,
            'payment_bank_transfer_description' => 'Please send money to our bank account: ACB - 69270 213 19.',
            'payment_stripe_payment_type' => 'stripe_checkout',
        ];

        $this->saveSettings($settings);

        Slug::query()->where('reference_type', Post::class)->update(['prefix' => 'news']);
        Slug::query()->where('reference_type', Category::class)->update(['prefix' => 'news']);
    }
}
