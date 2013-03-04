$ ->

  # initiate page scroller plugin
  $("body").pageScroller navigation: "#nav-links"
  $(".next").bind "click", ->
    pageScroller.next()

  $("#submit").on "click", (e) ->
    e.preventDefault()

    # Find form and submit it
    $("#form").submit()


_gaq = _gaq or []
_gaq.push ["_setAccount", "UA-38947228-1"]
_gaq.push ["_trackPageview"]
(->
  ga = document.createElement("script")
  ga.type = "text/javascript"
  ga.async = true
  ga.src = ((if "https:" is document.location.protocol then "https://ssl" else "http://www")) + ".google-analytics.com/ga.js"
  s = document.getElementsByTagName("script")[0]
  s.parentNode.insertBefore ga, s
)()