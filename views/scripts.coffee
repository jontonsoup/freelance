$ ->

  # initiate page scroller plugin
  $("body").pageScroller navigation: "#nav-links"
  $(".next").bind "click", ->
    pageScroller.next()

  $("#submit").on "click", (e) ->
    e.preventDefault()

    # Find form and submit it
    $("#form").submit()


