$ ->
  quote = quote_id
  $('.icon-thumbs-up').on 'click', (e) ->
    $.ajax
      method: "GET"
      data: {direction: "up", id: quote}
      url: "/quotes/rank"
    .done (data) ->
      quote = data.new_quote_id
      $('.hero-unit').children().first().text(data.new_quote_description)
      
  $('.icon-thumbs-down').on 'click', (e) ->
    $.ajax
      method: "GET"
      data: {direction: "down", id: quote}
      url: "/quotes/rank"
    .done (data) ->
      quote = data.new_quote_id
      $('.hero-unit').children().first().text(data.new_quote_description)
    
    
  
