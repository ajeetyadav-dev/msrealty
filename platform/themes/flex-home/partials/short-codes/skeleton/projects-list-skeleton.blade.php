<style>
    @keyframes skeleton-loading {
        0% {
            background-position: -200% 0;
        }
        100% {
            background-position: 200% 0;
        }
    }

    .skeleton-loading-bg {
        background: linear-gradient(90deg, #f0f0f0 25%, #e0e0e0 50%, #f0f0f0 75%);
        background-size: 200% 100%;
        animation: skeleton-loading 1.5s infinite;
    }

    .skeleton-banner {
        height: 300px;
        background: #e9ecef;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-bottom: 30px;
    }

    .skeleton-banner-content {
        text-align: center;
    }

    .skeleton-page-title {
        height: 48px;
        width: 400px;
        margin: 0 auto 20px;
        border-radius: 4px;
    }

    .skeleton-page-subtitle {
        height: 24px;
        width: 600px;
        max-width: 100%;
        margin: 0 auto 20px;
        border-radius: 4px;
    }

    .skeleton-breadcrumb {
        height: 20px;
        width: 300px;
        margin: 0 auto;
        border-radius: 4px;
    }

    .skeleton-search-box {
        background: #f8f9fa;
        padding: 20px;
        border-radius: 8px;
        margin-bottom: 30px;
    }

    .skeleton-search-row {
        display: flex;
        gap: 15px;
        flex-wrap: wrap;
    }

    .skeleton-search-field {
        flex: 1;
        min-width: 200px;
        height: 40px;
        border-radius: 4px;
        background: #fff;
    }

    .skeleton-filters {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
        flex-wrap: wrap;
        gap: 15px;
    }

    .skeleton-filter-left {
        display: flex;
        gap: 10px;
    }

    .skeleton-filter-item {
        width: 100px;
        height: 36px;
        border-radius: 4px;
    }

    .skeleton-sort {
        width: 200px;
        height: 36px;
        border-radius: 4px;
    }

    .skeleton-project-card {
        background: #fff;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        margin-bottom: 20px;
    }

    .skeleton-project-image {
        height: 200px;
        position: relative;
    }

    .skeleton-project-badge {
        position: absolute;
        top: 10px;
        left: 10px;
        width: 80px;
        height: 24px;
        border-radius: 4px;
        background: rgba(255,255,255,0.8);
    }

    .skeleton-project-content {
        padding: 20px;
    }

    .skeleton-project-title {
        height: 24px;
        margin-bottom: 10px;
        border-radius: 4px;
    }

    .skeleton-project-location {
        height: 16px;
        width: 60%;
        margin-bottom: 15px;
        border-radius: 4px;
    }

    .skeleton-project-price {
        height: 20px;
        width: 50%;
        border-radius: 4px;
    }

    .skeleton-pagination {
        display: flex;
        justify-content: center;
        gap: 10px;
        margin-top: 30px;
        margin-bottom: 50px;
    }

    .skeleton-page-item {
        width: 40px;
        height: 40px;
        border-radius: 4px;
    }
</style>

<section class="main-homes">
    <div class="bgheadproject hidden-xs skeleton-banner">
        <div class="description">
            <div class="container-fluid w90">
                <div class="skeleton-banner-content">
                    <div class="skeleton-page-title skeleton-loading-bg"></div>
                    <div class="skeleton-page-subtitle skeleton-loading-bg"></div>
                    <div class="skeleton-breadcrumb skeleton-loading-bg"></div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="container-fluid w90 padtop30">
        <div class="projecthome">
            <div class="skeleton-search-box">
                <div class="skeleton-search-row">
                    <div class="skeleton-search-field skeleton-loading-bg"></div>
                    <div class="skeleton-search-field skeleton-loading-bg"></div>
                    <div class="skeleton-search-field skeleton-loading-bg"></div>
                    <div class="skeleton-search-field skeleton-loading-bg" style="max-width: 150px;"></div>
                </div>
            </div>

            <div class="skeleton-filters">
                <div class="skeleton-filter-left">
                    <div class="skeleton-filter-item skeleton-loading-bg"></div>
                    <div class="skeleton-filter-item skeleton-loading-bg"></div>
                </div>
                <div class="skeleton-sort skeleton-loading-bg"></div>
            </div>

            <div class="row rowm10">
                @for ($i = 0; $i < 12; $i++)
                    <div class="col-6 col-sm-4 col-md-3 colm10">
                        <div class="skeleton-project-card">
                            <div class="skeleton-project-image skeleton-loading-bg">
                                <div class="skeleton-project-badge skeleton-loading-bg"></div>
                            </div>
                            <div class="skeleton-project-content">
                                <div class="skeleton-project-title skeleton-loading-bg"></div>
                                <div class="skeleton-project-location skeleton-loading-bg"></div>
                                <div class="skeleton-project-price skeleton-loading-bg"></div>
                            </div>
                        </div>
                    </div>
                @endfor
            </div>
        </div>
    </div>
    
    <div class="col-sm-12">
        <div class="skeleton-pagination">
            @for ($i = 0; $i < 5; $i++)
                <div class="skeleton-page-item skeleton-loading-bg"></div>
            @endfor
        </div>
    </div>
</section>