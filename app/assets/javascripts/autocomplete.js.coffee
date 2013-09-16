$ ->
  link = $('.new_record_link')
  href = link.attr('href')
  $('.need_autocomplete.for_points').autocomplete({
    source: '/points/search'
    delay: 500
    select: (evt, ui) ->
      link.attr('href', href+'?point_id='+ui.item.id).removeClass('disabled')
  })

  $('.need_autocomplete.for_points').on 'keyup', ->
    unless $(this).val().length
      link.attr('href', href).addClass('disabled')

  $('.need_autocomplete.for_emails').autocomplete({
    source: '/users'
    delay: 500
    select: (evt, ui) ->
      $('#permission_user_id').val(ui.item.id)
  })
