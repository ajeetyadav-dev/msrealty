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
        width: 200px;
        margin-bottom: 10px;
        border-radius: 4px;
    }

    .skeleton-heading-subtitle {
        height: 20px;
        width: 350px;
        margin-bottom: 10px;
        border-radius: 4px;
    }

    .skeleton-news-card {
        background: #fff;
        overflow: hidden;
    }

    .skeleton-thumbnail {
        height: 180px;
    }

    .skeleton-content {
        padding: 20px;
    }

    .skeleton-blog-title {
        height: 24px;
        margin-bottom: 8px;
        border-radius: 4px;
    }

    .skeleton-blog-title-line2 {
        height: 24px;
        width: 80%;
        margin-bottom: 12px;
        border-radius: 4px;
    }

    .skeleton-meta {
        height: 16px;
        width: 180px;
        margin-bottom: 10px;
        border-radius: 4px;
    }

    .skeleton-excerpt {
        height: 16px;
        margin-bottom: 8px;
        border-radius: 4px;
    }

    .skeleton-excerpt-line2 {
        height: 16px;
        width: 90%;
        border-radius: 4px;
    }
</style>

<div class="box_shadow" style="margin-bottom: 0;padding-bottom: 80px;">
    <div class="container-fluid w90">
        <div class="discover">
            <div class="row">
                <div class="col-12">
                    <div class="skeleton-heading-title skeleton-loading-bg"></div>
                    <div class="skeleton-heading-subtitle skeleton-loading-bg"></div>
                    <br>
                    <div class="blog-container">
                        <div class="row">
                            @for ($i = 0; $i < 4; $i++)
                                <div class="col-md-3 col-sm-6 container-grid">
                                    <div class="grid-in">
                                        <div class="grid-shadow">
                                            <div class="hourseitem" style="margin-top: 0;">
                                                <div class="skeleton-thumbnail skeleton-loading-bg"></div>
                                            </div>
                                            <div class="grid-h">
                                                <div class="blog-title">
                                                    <div class="skeleton-blog-title skeleton-loading-bg"></div>
                                                    <div class="skeleton-blog-title-line2 skeleton-loading-bg"></div>
                                                    <div class="post-meta">
                                                        <div class="skeleton-meta skeleton-loading-bg"></div>
                                                    </div>
                                                </div>
                                                <div class="blog-excerpt">
                                                    <div class="skeleton-excerpt skeleton-loading-bg"></div>
                                                    <div class="skeleton-excerpt-line2 skeleton-loading-bg"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @endfor
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

