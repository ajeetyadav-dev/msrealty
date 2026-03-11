<?php

namespace Database\Seeders;

use Botble\Base\Facades\Html;
use Botble\Base\Models\MetaBox;
use Botble\Base\Supports\BaseSeeder;
use Botble\Page\Database\Traits\HasPageSeeder;
use Botble\Page\Models\Page;
use Botble\Slug\Models\Slug;

class PageSeeder extends BaseSeeder
{
    use HasPageSeeder;

    public function run(): void
    {
        Page::query()->truncate();
        Slug::query()->where('reference_type', Page::class)->delete();
        MetaBox::query()->where('reference_type', Page::class)->delete();

        $pages = [
            [
                'name' => 'Home',
                'content' =>
                    Html::tag('div', '[search-box title="Find your favorite homes at Ms Real Estate" background_image="general/home-banner.jpg" enable_search_projects_on_homepage_search="yes" default_home_search_type="project"][/search-box]') .
                    Html::tag('div', '[featured-projects title="Featured projects" subtitle="We make the best choices with the hottest and most prestigious projects, please visit the details below to find out more." limit="4" enable_lazy_loading="yes"][/featured-projects]') .
                    Html::tag('div', '[properties-by-locations title="Properties by locations" subtitle="Each place is a good choice, it will help you make the right decision, do not miss the opportunity to discover our wonderful properties." city="1,2,3,4,5" enable_lazy_loading="yes"][/properties-by-locations]') .
                    Html::tag('div', '[properties-for-sale title="Properties For Sale" subtitle="Below is a list of properties that are currently up for sale" limit="8" enable_lazy_loading="yes"][/properties-for-sale]') .
                    Html::tag('div', '[properties-for-pg title="Properties For Pg" subtitle="Below is a list of properties that are currently up for pg" limit="8" enable_lazy_loading="yes"][/properties-for-pg]') .
                    Html::tag('div', '[properties-for-rent title="Properties For Rent" subtitle="Below is a detailed price list of each property for rent" limit="8" enable_lazy_loading="yes"][/properties-for-rent]') .
                    // Html::tag('div', '[featured-agents title="Featured Agents" enable_lazy_loading="yes"][/featured-agents]') .
                    // Html::tag('div', '[mortgage-calculator style="default" layout="horizontal" form_style="modern" form_size="xl" form_alignment="center" form_margin="50px 0" form_title="Mortgage Calculator" form_description="Calculate your monthly mortgage payments" primary_color="#1d5f6f" background_color="#f7f7f7" enable_lazy_loading="yes"][/mortgage-calculator]') .
                    Html::tag(
                        'div',
                        '[recently-viewed-properties title="Recently Viewed Properties" subtitle="Your currently viewed properties." limit="8" enable_lazy_loading="yes"][/recently-viewed-properties]'
                    ) .
                    Html::tag('div', '[latest-news title="News" subtitle="Below is the latest real estate news we get regularly updated from reliable sources." limit="4" enable_lazy_loading="yes"][/latest-news]')
                ,
                'template' => 'homepage',
            ],
            [
                'name' => 'News',
                'content' => '---',
                'template' => 'default',
            ],
            [
                'name' => 'About us',
                'description' => 'Founded on August 28, 1993 (formerly known as Truong Thinh Phat Construction Co., Ltd.), Flex Home operates in the field of real estate business, building villas for rent.
With the slogan "Breaking time, through space" with a sustainable development strategy, taking Real Estate as a focus area, Flex Home is constantly connecting between buyers and sellers in the field.',
                'content' => '<h4><span style="font-size:18px;"><b>1. COMPANY</b><span style="font-family:Arial,Helvetica,sans-serif;"><strong> PROFILE</strong></span></span></h4>

<p><span style="font-size:16px;"><span style="font-family:Arial,Helvetica,sans-serif;">Founded on August 28, 1993 (formerly known as Truong Thinh Phat Construction Co., Ltd.), Flex Home operates in the field of real estate business, building villas for rent.<br />
With the slogan &quot;Breaking time, through space&quot; with a sustainable development strategy, taking Real Estate as a focus area, Flex Home is constantly connecting between buyers and sellers in the field. Real estate, bringing people closer together, over the distance of time and space, is a reliable place for real estate investment - an area that is constantly evolving over time.</span></span></p>

<blockquote>
<h2 style="font-style: italic; text-align: center;"><span style="font-size:24px;"><strong><span style="font-family:Arial,Helvetica,sans-serif;"><span style="color:#16a085;">&quot;Breaking time, through space&quot;</span></span></strong></span></h2>
</blockquote>

<h4 style="text-align: center;"><img alt="" src="' . url('') . '/storage/general/asset-3-at-3x.png" style="width: 90%;" /></h4>

<h4><span style="font-size:18px;"><b><font face="Arial, Helvetica, sans-serif">2. VISION&nbsp;</font></b></span></h4>

<p><span style="font-size:16px;"><span style="font-family:Arial,Helvetica,sans-serif;">- Acquiring domestic areas.<br />
- Reaching far across continents.</span></span></p>

<h4><span style="font-size:18px;"><b>3. MISSION</b></span></h4>

<p><span style="font-size:16px;"><span style="font-family:Arial,Helvetica,sans-serif;">- Creating the community<br />
- Building destinations<br />
- Nurture happiness</span></span></p>

<p><img alt="" src="' . url('') . '/storage/general/vietnam-office-4.jpg" /></p>
',
                'template' => 'default',
            ],
            [
                'name' => 'Contact',
                'content' => '<p>[contact-form][/contact-form]<br />
&nbsp;</p>

<h3>Directions</h3>
<p>[google-map]M S REAL ESTATE Raghunath Chambers, 229/4, 2ND FLOOR, Sion East, Mumbai, Maharashtra 400022[/google-map]</p>

<p>&nbsp;</p>',
                'template' => 'default',
            ],
      [
    'name' => 'Terms & Conditions',
    'description' => 'Detailed terms and conditions of MS Real Estate website and services.',
    'content' => '
<div class="container">
    <div class="page-title">
        <h1>Terms & Conditions</h1>
    </div>
    
    <div class="content-section">
        <p>Welcome to MS Real Estate. These terms and conditions outline the rules and regulations for the use of our website and services.</p>
        <p>By accessing this website we assume you accept these terms and conditions in full. Do not continue to use MS Real Estate\'s website if you do not accept all of the terms and conditions stated on this page.</p>
    </div>
    
    <div class="content-section">
        <h2>1. Website Terms</h2>
        <p>By accessing this website we assume you accept these terms and conditions in full. Do not continue to use MS Real Estate\'s website if you do not accept all of the terms and conditions stated on this page.</p>
        <p>The following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice and all Agreements: "Client", "You" and "Your" refers to you, the person log on this website and compliant to the Company\'s terms and conditions. "The Company", "Ourselves", "We", "Our" and "Us", refers to our Company. "Party", "Parties", or "Us", refers to both the Client and ourselves. All terms refer to the offer, acceptance and consideration of payment necessary to undertake the process of our assistance to the Client in the most appropriate manner for the express purpose of meeting the Client\'s needs in respect of provision of the Company\'s stated services, in accordance with and subject to, prevailing law of India. Any use of the above terminology or other words in the singular, plural, capitalization and/or he/she or they, are taken as interchangeable and therefore as referring to same.</p>
    </div>
    
    <div class="content-section">
        <h2>2. License</h2>
        <p>Unless otherwise stated, MS Real Estate and/or its licensors own the intellectual property rights for all material on MS Real Estate. All intellectual property rights are reserved. You may access this from MS Real Estate for your own personal use subjected to restrictions set in these terms and conditions.</p>
        <p>You must not:</p>
        <ul>
            <li>Republish material from this website (including republication on another website)</li>
            <li>Sell, rent or sub-license material from the website</li>
            <li>Show any material from the website in public</li>
            <li>Reproduce, duplicate, copy or otherwise exploit material on this website for a commercial purpose</li>
            <li>Redistribute content from MS Real Estate (except content specifically and expressly made available for redistribution).</li>
        </ul>
    </div>
    
    <div class="content-section">
        <h2>3. Privacy Policy</h2>
        <p>Your privacy is important to us. Our Privacy Policy explains how we collect, use, and protect your information when you use our website and services. By using our website, you consent to the collection and use of information in accordance with our Privacy Policy.</p>
    </div>
    
    <div class="content-section">
        <h2>4. Real Estate Services</h2>
        <p>MS Real Estate provides real estate brokerage services including property listing, buying, selling, and rental assistance. We strive to provide accurate information but do not guarantee the completeness or accuracy of property details.</p>
        <p>Properties listed on our website are for informational purposes only and do not constitute an offer to sell or rent. Prices and availability are subject to change without notice.</p>
    </div>
    
    <div class="content-section">
        <h2>5. User Responsibilities</h2>
        <p>Users of our website must not:</p>
        <ul>
            <li>Use the website for any fraudulent or unlawful purpose</li>
            <li>Provide false or misleading information</li>
            <li>Attempt to gain unauthorized access to our systems</li>
            <li>Violate any applicable laws or regulations</li>
            <li>Interfere with or disrupt the website or servers connected to the website</li>
        </ul>
    </div>
    
    <div class="content-section">
        <h2>6. Communication Consent</h2>
        <p>By providing your contact information, you consent to receiving communications from MS Real Estate via RCS, WhatsApp, Email, or SMS. You may opt out of these communications at any time by following the unsubscribe instructions in our messages or contacting us directly.</p>
        <p>By checking the consent box, you explicitly agree to receive marketing and promotional communications from MS Real Estate.</p>
    </div>
    
    <div class="content-section">
        <h2>7. Limitation of Liability</h2>
        <p>MS Real Estate shall not be liable for any direct, indirect, incidental, consequential, or punitive damages arising out of your access to or use of our website or services.</p>
        <p>In no event shall MS Real Estate, its directors, employees, partners, agents, suppliers, or affiliates be liable for any indirect, incidental, special, or consequential damages arising out of or in connection with your access to or use of the website.</p>
    </div>
    
    <div class="content-section">
        <h2>8. Indemnification</h2>
        <p>You agree to indemnify and hold MS Real Estate and its directors, employees, and agents harmless from any and all claims, liabilities, damages, losses, and expenses, including reasonable attorneys\' fees and costs, arising out of or in any way connected with your access to or use of the website.</p>
    </div>
    
    <div class="content-section">
        <h2>9. Changes to Terms</h2>
        <p>We reserve the right to modify these terms and conditions at any time. Changes will be effective immediately upon posting on our website.</p>
        <p>Your continued use of the website following the posting of changes constitutes your acceptance of such changes.</p>
    </div>
    
    <div class="content-section">
        <h2>10. Governing Law</h2>
        <p>These terms and conditions are governed by and construed in accordance with the laws of India and you irrevocably submit to the exclusive jurisdiction of the courts in that State or location.</p>
    </div>
    
    <div class="content-section">
        <h2>11. Contact Information</h2>
        <p>If you have any questions about these Terms and Conditions, please contact us at:</p>
        <p>Email: info@msrealestate.in<br>
        Phone: +91 98923 14444<br>
        Address:M S REAL ESTATE Raghunath Chambers, 229/4, 2ND FLOOR, Sion East, Mumbai, Maharashtra 400022</p>
    </div>
    
    <!--<p class="last-updated">Last updated: January 1, 2023</p>-->
    
    <footer>
        &copy; 2023 MS Real Estate. All rights reserved.
        <div class="social-links">
            <a href="#"><i class="fab fa-facebook-f"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-linkedin-in"></i></a>
        </div>
    </footer>
</div>',
    'template' => 'default',
],
            [
    'name' => 'Privacy Policy',
    'description' => 'Detailed privacy policy of MS Real Estate with clear sections and user-friendly layout.',
    'content' => '
<div class="privacy-policy-container" style="max-width:900px; margin:auto; line-height:1.7; font-family:Arial, Helvetica, sans-serif;">

<h1 style="text-align:center; color:#1d5f6f;">Privacy Policy</h1>

<p>At MS Real Estate, we are committed to protecting your privacy. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you visit our website and use our services.</p>

<p>By using our website, you consent to the collection and use of information in accordance with this policy.</p>

<hr style="margin:20px 0;" />

<h2 style="color:#16a085;">1. Information We Collect</h2>
<ul>
<li><strong>Personal Information:</strong> Name, email, phone number, and other contact details you provide.</li>
<li><strong>Property Information:</strong> Details about properties you own, wish to buy, or are interested in.</li>
<li><strong>Usage Data:</strong> How you access and use our website.</li>
<li><strong>Cookies and Tracking Technologies:</strong> To enhance your experience.</li>
<li><strong>Communications:</strong> Records of communications between you and MS Real Estate.</li>
</ul>

<h2 style="color:#16a085;">2. How We Use Your Information</h2>
<ul>
<li>Provide, maintain, and improve our services.</li>
<li>Process transactions and send related information.</li>
<li>Send technical notices, updates, security alerts, and support messages.</li>
<li>Communicate about products, services, and promotional offers.</li>
<li>Respond to your comments, questions, and requests.</li>
<li>Personalize your experience on our website.</li>
<li>Monitor and analyze trends and usage.</li>
</ul>

<h2 style="color:#16a085;">3. Communication Consent</h2>
<p>By providing your contact information, you consent to receiving communications via RCS, WhatsApp, Email, or SMS. You can opt out anytime.</p>

<h2 style="color:#16a085;">4. Information Sharing</h2>
<ul>
<li>Service providers assisting us in website operation.</li>
<li>Real estate partners for property-related transactions.</li>
<li>Legal authorities as required by law.</li>
<li>Third parties during mergers, acquisitions, or asset sales.</li>
</ul>

<h2 style="color:#16a085;">5. Data Security</h2>
<p>We implement measures to protect your personal information. No method is 100% secure, but we strive to protect your data.</p>

<h2 style="color:#16a085;">6. Cookies & Tracking</h2>
<p>We use cookies to improve your experience. You can refuse cookies via your browser, but some parts may not function properly.</p>

<h2 style="color:#16a085;">7. Your Rights</h2>
<p>You can access, update, delete, or restrict processing of your personal information and opt out of marketing. Contact us to exercise your rights.</p>

<h2 style="color:#16a085;">8. Children\'s Privacy</h2>
<p>Not intended for users under 18. We do not knowingly collect information from children.</p>

<h2 style="color:#16a085;">9. Links to Other Websites</h2>
<p>We are not responsible for third-party websites linked from our site.</p>

<h2 style="color:#16a085;">10. Changes to This Privacy Policy</h2>
<p>We may update this policy periodically. Changes are effective when posted on this page.</p>

<h2 style="color:#16a085;">11. Contact Us</h2>
<p>Email: <a href="mailto:info@msrealestate.in">info@msrealestate.in</a><br />
Phone: +91 98923 14444</p>

<hr style="margin:20px 0;" />

<div style="text-align:center; margin-top:30px;">
    [contact-form title="Have Questions? Get in Touch!"][/contact-form]
</div>

</div>',
    'template' => 'default',
],
            [
                'name' => 'Cookie Policy',
                'content' => Html::tag('h3', 'EU Cookie Consent') .
                    Html::tag(
                        'p',
                        'To use this website we are using Cookies and collecting some Data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.'
                    ) .
                    Html::tag('h4', 'Essential Data') .
                    Html::tag(
                        'p',
                        'The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.'
                    ) .
                    Html::tag(
                        'p',
                        '- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.'
                    ) .
                    Html::tag(
                        'p',
                        '- XSRF-Token Cookie: Laravel automatically generates a CSRF "token" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.'
                    ),
                'template' => 'default',
            ],
            [
                'name' => 'Properties',
                'content' =>
                    Html::tag('div', '[properties-list title="Discover our properties" description="Discover our properties" description="Each place is a good choice, it will help you make the right decision, do not miss the opportunity to discover our wonderful properties." number_of_properties_per_page="12"][/properties-list]')
                ,
                'template' => 'homepage',
            ],
            [
                'name' => 'Projects',
                'content' =>
                    Html::tag('div', '[projects-list  title="Discover our projects" description="We make the best choices with the hottest and most prestigious projects, please visit the details below to find out more" number_of_projects_per_page="12"][/projects-list]')
                ,
                'template' => 'homepage',
            ],
            [
                'name' => 'FAQs',
                'content' => $this->generateShortcodeContent([
                    [
                        'name' => 'faqs',
                        'attributes' => [
                            'category_ids' => '1,2,3',
                            'display_type' => 'group',
                            'expand_first_time' => true,
                            'enable_lazy_loading' => 'yes',
                        ],
                    ],
                ]),
                'template' => 'default',
            ],
            [
                'name' => 'Pricing Plans',
                'description' => 'Choose the perfect plan for your property listing needs. We offer flexible pricing options to suit every budget.',
                'content' => Html::tag('div', '[pricing-plan title="Choose Your Perfect Plan" subtitle="Select from our range of pricing packages designed to meet your property listing needs. Whether you\'re just starting or need unlimited listings, we have the right plan for you." package_ids="1,2,3,4,5"][/pricing-plan]'),
                'template' => 'default',
            ],
        ];

        $this->createPages($pages);
    }
}
