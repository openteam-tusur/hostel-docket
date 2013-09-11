$ ->
  link = $('.new_record_link')
  href = link.attr('href')
  $('.need_autocomplete').autocomplete({
    source: '/points/search'
    delay: 500
    select: (evt, ui) ->
      link.attr('href', href+'?point_id='+ui.item.id).removeClass('disabled')
  })
  $('.need_autocomplete').on 'keyup', ->
    unless $(this).val().length
      link.attr('href', href).addClass('disabled')
