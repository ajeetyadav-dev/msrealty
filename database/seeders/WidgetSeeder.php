<?php

namespace Database\Seeders;

use Botble\Base\Supports\BaseSeeder;
use Botble\Widget\Database\Traits\HasWidgetSeeder;
use FriendsOfBotble\MortgageCalculator\Widgets\MortgageCalculatorWidget;

class WidgetSeeder extends BaseSeeder
{
    use HasWidgetSeeder;

    public function run(): void
    {
        $data = [
            [
                'widget_id' => 'CustomMenuWidget',
                'sidebar_id' => 'footer_sidebar',
                'position' => 1,
                'data' => [
                    'id' => 'CustomMenuWidget',
                    'name' => 'About',
                    'menu_id' => 'about',
                ],
            ],
            [
                'widget_id' => 'CustomMenuWidget',
                'sidebar_id' => 'footer_sidebar',
                'position' => 2,
                'data' => [
                    'id' => 'CustomMenuWidget',
                    'name' => 'More Information',
                    'menu_id' => 'more-information',
                ],
            ],
            [
                'widget_id' => 'CustomMenuWidget',
                'sidebar_id' => 'footer_sidebar',
                'position' => 3,
                'data' => [
                    'id' => 'CustomMenuWidget',
                    'name' => 'News',
                    'menu_id' => 'news',
                ],
            ],
            [
                'widget_id' => 'CategoriesWidget',
                'sidebar_id' => 'primary_sidebar',
                'position' => 1,
                'data' => [
                    'id' => 'CategoriesWidget',
                ],
            ],
            [
                'widget_id' => 'RecentPostsWidget',
                'sidebar_id' => 'primary_sidebar',
                'position' => 2,
                'data' => [
                    'id' => 'RecentPostsWidget',
                    'name' => 'Recent Posts',
                    'number_display' => 5,
                ],
            ],
            [
                'widget_id' => MortgageCalculatorWidget::class,
                'sidebar_id' => 'property_detail_sidebar',
                'position' => 1,
                'data' => [
                    'id' => MortgageCalculatorWidget::class,
                    'name' => 'Mortgage Calculator',
                    'style' => 'default',
                    'layout' => 'vertical',
                    'form_style' => 'default',
                    'form_margin' => '20px 0',
                    'form_padding' => '',
                    'primary_color' => '#1d5f6f',
                    'default_price' => '',
                    'default_term' => '',
                    'default_rate' => '',
                    'default_down_payment_type' => '',
                    'default_down_payment_value' => '',
                    'show_extra_costs' => '0',
                ],
            ],
            [
                'widget_id' => MortgageCalculatorWidget::class,
                'sidebar_id' => 'project_detail_sidebar',
                'position' => 1,
                'data' => [
                    'id' => MortgageCalculatorWidget::class,
                    'name' => 'Mortgage Calculator',
                    'style' => 'default',
                    'layout' => 'vertical',
                    'form_style' => 'default',
                    'form_margin' => '20px 0',
                    'form_padding' => '',
                    'primary_color' => '#1d5f6f',
                    'default_price' => '',
                    'default_term' => '',
                    'default_rate' => '',
                    'default_down_payment_type' => '',
                    'default_down_payment_value' => '',
                    'show_extra_costs' => '0',
                ],
            ],
        ];

        $this->createWidgets($data);
    }
}
