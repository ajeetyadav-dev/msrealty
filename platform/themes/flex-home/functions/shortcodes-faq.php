<?php

use Botble\Base\Forms\FieldOptions\CheckboxFieldOption;
use Botble\Base\Forms\FieldOptions\RadioFieldOption;
use Botble\Base\Forms\FieldOptions\SelectFieldOption;
use Botble\Base\Forms\Fields\CheckboxField;
use Botble\Base\Forms\Fields\RadioField;
use Botble\Base\Forms\Fields\SelectField;
use Botble\Faq\Models\Faq;
use Botble\Faq\Models\FaqCategory;
use Botble\Shortcode\Compilers\Shortcode as ShortcodeCompiler;
use Botble\Shortcode\Facades\Shortcode;
use Botble\Shortcode\Forms\ShortcodeForm;
use Botble\Theme\Facades\Theme;
use Illuminate\Routing\Events\RouteMatched;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Event;

if (! is_plugin_active('faq')) {
    return;
}

Event::listen(RouteMatched::class, function (): void {
    Shortcode::register('faqs', __('FAQs'), __('FAQs'), function (ShortcodeCompiler $shortcode): ?string {
        if (! $categoryIds = Shortcode::fields()->parseIds($shortcode->category_ids)) {
            return null;
        }

        $limit = (int) $shortcode->limit ?: 5;
        $faqs = collect();
        $categories = collect();

        if ($shortcode->display_type === 'list') {
            $faqs = Faq::query()
                ->whereIn('category_id', $categoryIds)
                ->wherePublished()
                ->take($limit)
                ->get();
        } else {
            $categories = FaqCategory::query()
                ->whereIn('id', $categoryIds)
                ->with('faqs')
                ->get();
        }

        return Theme::partial('short-codes.faqs.index', compact('shortcode', 'faqs', 'categories'));
    });

    Shortcode::setAdminConfig('faqs', function (array $attributes): ShortcodeForm {
        return ShortcodeForm::createFromArray($attributes)
            ->withLazyLoading()
            ->add('title', 'text', [
                'label' => __('Title'),
                'attr' => [
                    'placeholder' => __('Title'),
                ],
            ])
            ->add('subtitle', 'text', [
                'label' => __('Subtitle'),
                'attr' => [
                    'placeholder' => __('Subtitle'),
                ],
            ])
            ->add(
                'category_ids',
                SelectField::class,
                SelectFieldOption::make()
                    ->label(__('FAQ categories'))
                    ->choices(
                        FaqCategory::query()
                            ->pluck('name', 'id')
                            ->all()
                    )
                    ->selected(explode(',', Arr::get($attributes, 'category_ids', '')))
                    ->searchable()
                    ->multiple()
                    ->toArray()
            )
            ->add(
                'display_type',
                RadioField::class,
                RadioFieldOption::make()
                    ->label(__('Display type'))
                    ->choices([
                        'list' => __('List'),
                        'group' => __('Group by category'),
                    ])
            )
            ->add('limit', 'number', [
                'label' => __('Limit'),
                'attr' => [
                'placeholder' => __('Number of FAQs to display'),
                    'min' => 1,
                ],
                'default_value' => 5,
            ])
            ->add(
                'expand_first_time',
                CheckboxField::class,
                CheckboxFieldOption::make()
                    ->label(__('Expand the content of the first FAQ'))
                    ->defaultValue(true)
            );
    });
});
