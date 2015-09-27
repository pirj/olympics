initialize = ->
  $('form input[type=checkbox]').on 'change', ->
    $(this).parents('form').submit()

$(document).ready(initialize)
$(document).on('page:load', initialize)
