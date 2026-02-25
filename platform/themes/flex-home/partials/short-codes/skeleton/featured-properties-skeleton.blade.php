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

    .skeleton-heading-title {
        height: 36px;
        width: 300px;
        margin-bottom: 10px;
        border-radius: 4px;
    }

    .skeleton-heading-subtitle {
        height: 20px;
        width: 450px;
        margin-bottom: 10px;
        border-radius: 4px;
    }

    .skeleton-property-card {
        background: #fff;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }

    .skeleton-image {
        height: 240px;
        position: relative;
    }

    .skeleton-badge {
        position: absolute;
        top: 10px;
        left: 10px;
        width: 60px;
        height: 24px;
        border-radius: 4px;
        background: rgba(255,255,255,0.8);
    }

    .skeleton-content {
        padding: 20px;
    }

    .skeleton-title {
        height: 20px;
        margin-bottom: 10px;
        border-radius: 4px;
    }

    .skeleton-location {
        height: 16px;
        width: 70%;
        margin-bottom: 15px;
        border-radius: 4px;
    }

    .skeleton-features {
        display: flex;
        gap: 15px;
        margin-bottom: 15px;
    }

    .skeleton-feature {
        height: 16px;
        width: 50px;
        border-radius: 4px;
    }

    .skeleton-price {
        height: 24px;
        width: 40%;
        border-radius: 4px;
    }
</style>

<div class="container-fluid w90">
    <div class="homehouse padtop30">
        <div class="row">
            <div class="col-12">
                <div class="skeleton-heading-title skeleton-loading-bg"></div>
                <div class="skeleton-heading-subtitle skeleton-loading-bg"></div>
            </div>
        </div>
        <div class="projecthome mb-2">
            <div class="row rowm10">
                @for ($i = 0; $i < 8; $i++)
                    <div class="col-sm-6 col-lg-4 col-xl-3 colm10">
                        <div class="skeleton-property-card">
                            <div class="skeleton-image skeleton-loading-bg">
                                <div class="skeleton-badge skeleton-loading-bg"></div>
                            </div>
                            <div class="skeleton-content">
                                <div class="skeleton-title skeleton-loading-bg"></div>
                                <div class="skeleton-location skeleton-loading-bg"></div>
                                <div class="skeleton-features">
                                    <div class="skeleton-feature skeleton-loading-bg"></div>
                                    <div class="skeleton-feature skeleton-loading-bg"></div>
                                    <div class="skeleton-feature skeleton-loading-bg"></div>
                                </div>
                                <div class="skeleton-price skeleton-loading-bg"></div>
                            </div>
                        </div>
                    </div>
                @endfor
            </div>
        </div>
    </div>
</div>