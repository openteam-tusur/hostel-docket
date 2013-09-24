$ ->
  $('.clear').on 'click', ->
    form = $(this).closest('form')
    form.find('input:checked').prop('checked', false)
    form.find('input.datepicker').val('')
    false
