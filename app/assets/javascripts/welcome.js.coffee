$ ->
  $('li.type').on 'click', (e) ->
    e.stopPropagation()
    e.preventDefault()
    $('.hero-unit h1').text "Worked"
