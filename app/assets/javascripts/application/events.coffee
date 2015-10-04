initialize = ->
  $('form input[type=checkbox]').on 'change', ->
    $(this).parents('form').submit()
  $('#tabs.cont li').on 'click', ->
    href = $(this).attr('href')
    $(this).siblings('li').removeClass('active')
    $(this).addClass('active')
    $('#tabs_content .tab_content').removeClass('active')
    $(href).addClass('active')

$(document).ready(initialize)
$(document).on('page:load', initialize)
