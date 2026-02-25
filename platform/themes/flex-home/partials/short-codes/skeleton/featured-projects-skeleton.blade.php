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
        width: 250px;
        margin-bottom: 10px;
        border-radius: 4px;
    }

    .skeleton-heading-subtitle {
        height: 20px;
        width: 400px;
        margin-bottom: 10px;
        border-radius: 4px;
    }

    .skeleton-card {
        background: #fff;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }

    .skeleton-image {
        height: 200px;
    }

    .skeleton-content {
        padding: 20px;
    }

    .skeleton-title {
        height: 24px;
        margin-bottom: 10px;
        border-radius: 4px;
    }

    .skeleton-subtitle {
        height: 16px;
        width: 60%;
        margin-bottom: 15px;
        border-radius: 4px;
    }

    .skeleton-price {
        height: 20px;
        width: 40%;
        border-radius: 4px;
    }
</style>

<div class="box_shadow" style="margin-top: 0;">
    <div class="container-fluid w90">
        <div class="projecthome">
            <div class="row">
                <div class="col-12">
                    <div class="skeleton-heading-title skeleton-loading-bg"></div>
                    <div class="skeleton-heading-subtitle skeleton-loading-bg"></div>
                </div>
            </div>
            <div class="row rowm10">
                @for ($i = 0; $i < 4; $i++)
                    <div class="col-6 col-sm-4 col-md-3 colm10">
                        <div class="skeleton-card">
                            <div class="skeleton-image skeleton-loading-bg"></div>
                            <div class="skeleton-content">
                                <div class="skeleton-title skeleton-loading-bg"></div>
                                <div class="skeleton-subtitle skeleton-loading-bg"></div>
                                <div class="skeleton-price skeleton-loading-bg"></div>
                            </div>
                        </div>
                    </div>
                @endfor
            </div>
        </div>
    </div>
</div>