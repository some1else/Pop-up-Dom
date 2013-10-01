$ ->
  $('.new-dim').each (i, el) ->
    $(el).append($('<span class="top-right"></span>'))
    $(el).append($('<span class="right"></span>'))
    $(el).append($('<span class="bottom-right"></span>'))
    $(el).append($('<span class="bottom"></span>'))
    $(el).append($('<span class="bottom-left"></span>'))