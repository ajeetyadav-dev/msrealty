<?php

namespace Database\Seeders;

use Botble\ACL\Models\User;
use Botble\Base\Facades\Html;
use Botble\Base\Models\MetaBox;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;
use Botble\Blog\Models\Category;
use Botble\Blog\Models\Post;
use Botble\Blog\Models\Tag;
use Botble\Media\Facades\RvMedia;
use Botble\Slug\Facades\SlugHelper;
use Botble\Slug\Models\Slug;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class BlogSeeder extends BaseSeeder
{
    use HasBlogSeeder;

    public function run(): void
    {
        $this->uploadFiles('news');
        $this->uploadFiles('posts');

        Post::query()->where('id', '>', 4)->delete();
        Category::query()->truncate();
        Tag::query()->where('id', '>', 3)->delete();
        DB::table('post_categories')->truncate();
        DB::table('post_tags')->truncate();

        Slug::query()->where('reference_type', Post::class)->where('reference_id', '>', 4)->delete();
        Slug::query()->where('reference_type', Tag::class)->where('reference_id', '>', 3)->delete();
        Slug::query()->where('reference_type', Category::class)->truncate();
        MetaBox::query()->where('reference_type', Post::class)->where('reference_id', '>', 4)->delete();
        MetaBox::query()->where('reference_type', Tag::class)->where('reference_id', '>', 3)->delete();
        MetaBox::query()->where('reference_type', Category::class)->where('reference_id', '>', 8)->delete();

        $posts = [
            [
                'name' => 'The Top 2020 Handbag Trends to Know',
            ],
            [
                'name' => 'Top Search Engine Optimization Strategies!',
            ],
            [
                'name' => 'Which Company Would You Choose?',
            ],
            [
                'name' => 'Used Car Dealer Sales Tricks Exposed',
            ],
            [
                'name' => '20 Ways To Sell Your Product Faster',
            ],
            [
                'name' => 'The Secrets Of Rich And Famous Writers',
            ],
            [
                'name' => 'Imagine Losing 20 Pounds In 14 Days!',
            ],
            [
                'name' => 'Are You Still Using That Slow, Old Typewriter?',
            ],
            [
                'name' => 'A Skin Cream That’s Proven To Work',
            ],
            [
                'name' => '10 Reasons To Start Your Own, Profitable Website!',
            ],
            [
                'name' => 'Simple Ways To Reduce Your Unwanted Wrinkles!',
            ],
            [
                'name' => 'Apple iMac with Retina 5K display review',
            ],
            [
                'name' => '10,000 Web Site Visitors In One Month:Guaranteed',
            ],
            [
                'name' => 'Unlock The Secrets Of Selling High Ticket Items',
            ],
            [
                'name' => '4 Expert Tips On How To Choose The Right Men’s Wallet',
            ],
            [
                'name' => 'Sexy Clutches: How to Buy & Wear a Designer Clutch Bag',
            ],
        ];

        $categoryDescriptions = [
            'Stay updated with the latest real estate news, market trends, and industry developments.',
            'Explore innovative architectural designs and modern building concepts for your dream home.',
            'Discover creative interior and exterior design ideas to transform your living spaces.',
            'Learn about sustainable and quality building materials for construction projects.',
        ];

        $this->createBlogCategories([
            [
                'name' => 'News',
                'description' => $categoryDescriptions[0],
                'is_featured' => 1,
            ],
            [
                'name' => 'House architecture',
                'description' => $categoryDescriptions[1],
                'is_featured' => 1,
            ],
            [
                'name' => 'House design',
                'description' => $categoryDescriptions[2],
                'is_featured' => 1,
            ],
            [
                'name' => 'Building materials',
                'description' => $categoryDescriptions[3],
                'is_featured' => 1,
            ],
        ]);

        $categories = Category::query()->get();

        $contentParagraphs = [
            'The real estate market continues to evolve with changing buyer preferences and economic conditions. Experts suggest that understanding local market dynamics is crucial for making informed decisions. Whether you are buying your first home or investing in property, staying informed about market trends can help you navigate the complexities of real estate transactions.',
            'Modern home design emphasizes open floor plans, natural lighting, and sustainable materials. Architects are increasingly incorporating smart home technology and energy-efficient features into their designs. The focus has shifted toward creating spaces that are both functional and aesthetically pleasing.',
            'When choosing building materials, consider factors such as durability, maintenance requirements, and environmental impact. Quality materials may have higher upfront costs but often provide better long-term value. Sustainable options are becoming increasingly popular among environmentally conscious homeowners.',
            'Interior design trends are moving toward minimalist aesthetics with warm, natural tones. Functionality is paramount, with storage solutions integrated seamlessly into living spaces. The goal is to create homes that feel both spacious and inviting.',
        ];

        $postDescriptions = [
            'Discover essential tips and strategies for navigating the real estate market successfully.',
            'Learn about the latest trends in home design and architecture from industry experts.',
            'Explore practical advice for homeowners looking to improve their property value.',
            'Get insights into making smart real estate investments in today competitive market.',
        ];

        foreach ($posts as $index => $item) {
            $item['content'] =
                ($index % 3 == 0 ? Html::tag(
                    'p',
                    '[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]'
                ) : '') .
                Html::tag('p', $contentParagraphs[$index % count($contentParagraphs)]) .
                Html::tag(
                    'p',
                    Html::image(RvMedia::getImageUrl('news/' . (($index % 5) + 1) . '.jpg'))
                        ->toHtml(),
                    ['class' => 'text-center']
                ) .
                Html::tag('p', $contentParagraphs[($index + 1) % count($contentParagraphs)]) .
                Html::tag(
                    'p',
                    Html::image(RvMedia::getImageUrl('news/' . (($index % 5) + 6) . '.jpg'))
                        ->toHtml(),
                    ['class' => 'text-center']
                ) .
                Html::tag('p', $contentParagraphs[($index + 2) % count($contentParagraphs)]) .
                Html::tag(
                    'p',
                    Html::image(RvMedia::getImageUrl('news/' . (($index % 4) + 11) . '.jpg'))
                        ->toHtml(),
                    ['class' => 'text-center']
                ) .
                Html::tag('p', $contentParagraphs[($index + 3) % count($contentParagraphs)]);
            $item['author_id'] = User::query()->value('id');
            $item['author_type'] = User::class;
            $item['views'] = rand(100, 2500);
            $item['is_featured'] = $index < 9;
            $item['image'] = 'news/' . ($index + 1) . '.jpg';
            $item['description'] = $postDescriptions[$index % count($postDescriptions)];
            $item['content'] = str_replace(url(''), '', $item['content']);

            $post = Post::query()->create($item);

            $post->categories()->sync($categories->random(2)->pluck('id')->toArray());

            $post->tags()->sync([1, 2, 3]);

            SlugHelper::createSlug($post);
        }

        Post::query()->update(['created_at' => Carbon::now(), 'updated_at' => Carbon::now()]);
    }
}
