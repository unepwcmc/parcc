window.VerticalNav = class VerticalNav
  constructor: ($containerEl) ->
    debugger
    $containerEl.find('.js-toggle-section').click( (ev) ->
      $el = $(this)

      $el.toggleClass('vertical-nav__element--opened vertical-nav__element--closed')
      $el.next('div').toggleClass('u-hide')

      ev.preventDefault()
    )
