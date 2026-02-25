@extends(Theme::getThemeNamespace('layouts.base'))

@section('content')
@php
    SeoHelper::setTitle(__('404 - Page Not Found'));
    Theme::fireEventGlobalAssets();
@endphp

    {!! Theme::partial('header') !!}

    <style>
        .error-404-container {
            min-height: 70vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 80px 0;
            background: linear-gradient(135deg, #f5f7fa 0%, #f0f3f7 100%);
        }

        .error-404-content {
            text-align: center;
            max-width: 600px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .error-404-icon {
            position: relative;
            margin-bottom: 30px;
        }

        .error-404-number {
            font-size: 180px;
            font-weight: 700;
            line-height: 1;
            color: var(--primary-color, #1d5f6f);
            opacity: 0.15;
            margin: 0;
            position: relative;
        }

        .error-404-illustration {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 120px;
            height: 120px;
        }

        .house-icon {
            width: 100%;
            height: 100%;
            background: var(--primary-color, #1d5f6f);
            border-radius: 20px;
            position: relative;
            opacity: 0.9;
        }

        .house-icon::before {
            content: '';
            position: absolute;
            width: 0;
            height: 0;
            border-left: 60px solid transparent;
            border-right: 60px solid transparent;
            border-bottom: 50px solid var(--primary-color, #1d5f6f);
            top: -40px;
            left: 0;
        }

        .house-icon::after {
            content: '?';
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 48px;
            color: white;
            font-weight: bold;
        }

        .error-404-title {
            font-size: 32px;
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 20px;
            line-height: 1.3;
        }

        .error-404-message {
            font-size: 18px;
            color: #718096;
            margin-bottom: 40px;
            line-height: 1.6;
        }

        .error-404-actions {
            display: flex;
            gap: 15px;
            justify-content: center;
            flex-wrap: wrap;
            margin-bottom: 50px;
        }

        .error-404-btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 14px 28px;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 500;
            text-decoration: none;
            transition: all 0.3s ease;
            border: 2px solid transparent;
        }

        .error-404-btn-primary {
            background: var(--primary-color, #1d5f6f);
            color: white;
        }

        .error-404-btn-primary:hover {
            background: var(--primary-color, #1d5f6f);
            opacity: 0.9;
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(29, 95, 111, 0.2);
            color: white;
        }

        @media (max-width: 768px) {
            .error-404-container {
                padding: 60px 0;
            }

            .error-404-number {
                font-size: 120px;
            }

            .error-404-illustration {
                width: 80px;
                height: 80px;
            }

            .house-icon::before {
                border-left-width: 40px;
                border-right-width: 40px;
                border-bottom-width: 35px;
                top: -28px;
            }

            .house-icon::after {
                font-size: 32px;
            }

            .error-404-title {
                font-size: 24px;
            }

            .error-404-message {
                font-size: 16px;
            }

            .error-404-actions {
                flex-direction: column;
                align-items: stretch;
            }

            .error-404-btn {
                justify-content: center;
            }
        }

        @media (max-width: 480px) {
            .error-404-number {
                font-size: 100px;
            }

            .error-404-illustration {
                width: 60px;
                height: 60px;
            }

            .house-icon::before {
                border-left-width: 30px;
                border-right-width: 30px;
                border-bottom-width: 25px;
                top: -20px;
            }

            .house-icon::after {
                font-size: 24px;
            }
        }
    </style>

    <div class="error-404-container">
        <div class="container">
            <div class="error-404-content">
                <div class="error-404-icon">
                    <h1 class="error-404-number">404</h1>
                    <div class="error-404-illustration">
                        <div class="house-icon"></div>
                    </div>
                </div>

                <h2 class="error-404-title">{{ __('Oops! Page Not Found') }}</h2>

                <p class="error-404-message">
                    {{ __('The page you are looking for might have been removed, had its name changed, or is temporarily unavailable.') }}
                </p>

                <div class="error-404-actions">
                    <a href="{{ BaseHelper::getHomepageUrl() }}" class="error-404-btn error-404-btn-primary">
                        <span>← </span>
                        {{ __('Back to Homepage') }}
                    </a>
                </div>
            </div>
        </div>
    </div>

    {!! Theme::partial('footer') !!}
@endsection


