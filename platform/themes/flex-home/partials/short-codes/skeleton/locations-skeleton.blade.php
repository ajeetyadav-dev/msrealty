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

    .skeleton-location-item {
        position: relative;
        margin: 0 10px;
    }

    .skeleton-location-image {
        height: 200px;
        border-radius: 8px;
        overflow: hidden;
    }

    .skeleton-location-name {
        position: absolute;
        bottom: 20px;
        left: 20px;
        right: 20px;
        height: 24px;
        background: rgba(255,255,255,0.9);
        border-radius: 4px;
    }
</style>

<div class="container-fluid w90">
    <div class="padtop70">
        <div class="areahome">
            <div class="row">
                <div class="col-12">
                    <div class="skeleton-heading-title skeleton-loading-bg"></div>
                    <div class="skeleton-heading-subtitle skeleton-loading-bg"></div>
                </div>
            </div>
            <div style="position:relative;">
                <div class="owl-carousel">
                    @for ($i = 0; $i < 5; $i++)
                        <div class="skeleton-location-item">
                            <div class="skeleton-location-image skeleton-loading-bg">
                                <div class="skeleton-location-name skeleton-loading-bg"></div>
                            </div>
                        </div>
                    @endfor
                </div>
            </div>
        </div>
    </div>
</div>

