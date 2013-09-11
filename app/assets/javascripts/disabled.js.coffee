$ ->
  items = $('.disabled')
  items.attr('disabled', 'disabled')
  items.closest('form').on 'submit', ->
    items.removeAttr('disabled')
