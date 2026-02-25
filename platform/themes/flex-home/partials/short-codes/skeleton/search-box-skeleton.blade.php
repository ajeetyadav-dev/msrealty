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
        background: #e9ecef;
        min-height: 580px;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .skeleton-search-container {
        width: 90%;
        max-width: 800px;
        text-align: center;
    }

    .skeleton-banner-title {
        height: 48px;
        width: 600px;
        max-width: 100%;
        margin: 0 auto 30px;
        border-radius: 4px;
    }

    .skeleton-search-tabs {
        display: flex;
        justify-content: center;
        gap: 20px;
        margin-bottom: 20px;
    }

    .skeleton-tab {
        width: 80px;
        height: 36px;
        border-radius: 4px;
    }

    .skeleton-search-box {
        background: rgba(255,255,255,0.9);
        padding: 8px;
        border-radius: 8px;
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .skeleton-input {
        flex: 1;
        height: 50px;
        border-radius: 4px;
        background: #f0f0f0;
    }

    .skeleton-button {
        width: 120px;
        height: 50px;
        border-radius: 4px;
    }
</style>

<div class="home_banner skeleton-banner">
    <div class="topsearch">
        <div class="skeleton-search-container">
            <div class="skeleton-banner-title skeleton-loading-bg"></div>
            
            <div class="skeleton-search-tabs">
                <div class="skeleton-tab skeleton-loading-bg"></div>
                <div class="skeleton-tab skeleton-loading-bg"></div>
                <div class="skeleton-tab skeleton-loading-bg"></div>
            </div>
            
            <div class="skeleton-search-box">
                <div class="skeleton-input skeleton-loading-bg"></div>
                <div class="skeleton-input skeleton-loading-bg" style="max-width: 200px;"></div>
                <div class="skeleton-button skeleton-loading-bg"></div>
            </div>
        </div>
    </div>
</div>