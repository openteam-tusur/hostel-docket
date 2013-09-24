$ ->
  $('.clear').on 'click', ->
    $(this).closest('form').find('input:checked').prop('checked', false)
    false
