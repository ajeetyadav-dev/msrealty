'use strict'

$(document).ready(function() {
    // Initialize FAQ accordion functionality
    function initFAQAccordion() {
        // Handle FAQ question clicks
        $(document).on('click', '.faq-question', function(e) {
            e.preventDefault()

            const $button = $(this)
            const $targetId = $button.attr('data-target')
            const $answer = $($targetId)
            const $faqList = $button.closest('.faq-list')
            const isExpanded = !$button.hasClass('collapsed')

            // Close all other items in the same FAQ list with animation
            $faqList.find('.faq-answer').each(function() {
                const $item = $(this)
                const $itemButton = $faqList.find(`[data-target="#${$item.attr('id')}"]`)

                if ($item.attr('id') !== $answer.attr('id') && $item.hasClass('show')) {
                    // Calculate current height before closing
                    const currentHeight = $item.find('.faq-answer-content').outerHeight(true)
                    $item.css('max-height', currentHeight + 'px')
                    
                    // Force reflow to ensure the max-height is applied
                    $item[0].offsetHeight
                    
                    // Now animate to closed state
                    $item.css('max-height', '0')
                    $item.removeClass('show')
                    $itemButton.addClass('collapsed').attr('aria-expanded', 'false')
                }
            })

            // Toggle current item with smooth animation
            if (isExpanded) {
                // Close current item
                const currentHeight = $answer.find('.faq-answer-content').outerHeight(true)
                $answer.css('max-height', currentHeight + 'px')
                
                // Force reflow
                $answer[0].offsetHeight
                
                // Animate to closed
                $answer.css('max-height', '0')
                
                setTimeout(() => {
                    $answer.removeClass('show')
                }, 10)
                
                $button.addClass('collapsed').attr('aria-expanded', 'false')
            } else {
                // Open current item
                $answer.addClass('show')
                
                // Get the natural height of the content
                const contentHeight = $answer.find('.faq-answer-content').outerHeight(true)
                
                // Set specific max-height for smooth animation
                $answer.css('max-height', contentHeight + 40 + 'px')
                
                $button.removeClass('collapsed').attr('aria-expanded', 'true')
                
                // After animation completes, set max-height to none for responsive behavior
                setTimeout(() => {
                    if ($answer.hasClass('show')) {
                        $answer.css('max-height', 'none')
                    }
                }, 400)
            }
        })
    }

    // Initialize on page load
    initFAQAccordion()

    // Reinitialize when content is dynamically loaded
    $(document).on('DOMContentLoaded', initFAQAccordion)

    // Handle window resize for responsive adjustments
    let resizeTimer
    $(window).on('resize', function() {
        clearTimeout(resizeTimer)
        resizeTimer = setTimeout(function() {
            // Reset max-heights for open items
            $('.faq-answer.show').each(function() {
                const $this = $(this)
                $this.css('max-height', 'none')
            })
        }, 250)
    })
})
