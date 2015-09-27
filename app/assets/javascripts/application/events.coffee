autoSubmitHook = ->
  $('form input[type=checkbox]').on 'change', ->
    $(this).parents('form').submit()

$(document).ready(autoSubmitHook)
$(document).on('page:load', autoSubmitHook)
