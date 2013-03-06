$ ->
  if window.location.pathname == "/"
    # initiate page scroller plugin
    $("body").pageScroller navigation: "#nav-links"
    $(".next").bind "click", ->
      pageScroller.next()

    $("#submit").on "click", (e) ->
      e.preventDefault()

      # Find form and submit it
      $("#form").submit()
    $(document).keydown (e) ->
      unless $('#contact').css('display') == "block"
        if e.keyCode == 74
           pageScroller.next()
        else if e.keyCode == 75
           pageScroller.prev()
        false

