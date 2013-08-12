$ ->
  $('.icon-thumbs-up, .icon-thumbs-down').on 'click', (e) ->
    $hidden = $(@).parents('.hero-unit').children().first()
    number = $hidden.attr("id")
    quote = $hidden.val()
    $.ajax
      method: "GET"
      data: {direction: "up", id: quote, number: number}
      url: "/quotes/rank"
    .done (data) ->
      $hidden = $('#' + data.number)
      $hidden.val(data.new_quote_id)
      $hidden.siblings().first().text(data.new_quote_description)


    
    
  
