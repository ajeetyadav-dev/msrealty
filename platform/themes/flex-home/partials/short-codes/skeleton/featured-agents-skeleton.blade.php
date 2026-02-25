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

    .skeleton-agent-card {
        background: #fff;
        border-radius: 8px;
        padding: 30px;
        text-align: center;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }

    .skeleton-avatar {
        width: 120px;
        height: 120px;
        border-radius: 50%;
        margin: 0 auto 20px;
    }

    .skeleton-name {
        height: 24px;
        width: 60%;
        margin: 0 auto 10px;
        border-radius: 4px;
    }

    .skeleton-properties {
        height: 16px;
        width: 40%;
        margin: 0 auto 20px;
        border-radius: 4px;
    }

    .skeleton-contact {
        height: 36px;
        width: 100%;
        border-radius: 4px;
    }
</style>

<div class="padtop70">
    <div class="box_shadow">
        <div class="container-fluid w90">
            <div class="homehouse projecthome">
                <div class="row">
                    <div class="col-12">
                        <div class="skeleton-heading-title skeleton-loading-bg"></div>
                        <div class="skeleton-heading-subtitle skeleton-loading-bg"></div>
                    </div>
                </div>
                <div class="row rowm10 list-agency">
                    @for ($i = 0; $i < 4; $i++)
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="skeleton-agent-card">
                                <div class="skeleton-avatar skeleton-loading-bg"></div>
                                <div class="skeleton-name skeleton-loading-bg"></div>
                                <div class="skeleton-properties skeleton-loading-bg"></div>
                                <div class="skeleton-contact skeleton-loading-bg"></div>
                            </div>
                        </div>
                    @endfor
                </div>
            </div>
        </div>
    </div>
</div>