$ ->
  form_wrapper = $('.adding_new_record')
  show_link = $('.show_form')
  overlay = $('<div class="overlay_block"/>').appendTo('body')

  $('.new_record_link', form_wrapper).on 'click', ->
    false if $(this).hasClass('disabled')

  $('.cancel', form_wrapper).on 'click', ->
    overlay.hide()
    form_wrapper.hide()
    show_link.toggleClass('disabled enabled')
    false

  show_link.on 'click', ->
    $this = $(this)
    return false if $this.hasClass('disabled')

    overlay.show()
    form_wrapper.show()

    $this.toggleClass('disabled enabled')

    false
