window.Chathead ?= {}

class Chathead.ChatView
  constructor: (container) ->
    @container = $(container)
    return false if @container.length < 1

    @bindEvents()

  bindEvents: ->
    @container.on "click.chathead", (event) =>
      if @isCollapsed()
        @_collapsedViewClickHandler(event)
      else
        @_expandedViewClickHandler(event)

  isCollapsed: -> @container.hasClass("collapsed")
  isExpanded: -> @container.hasClass("expanded")

  collapse: ->
    @container.addClass("collapsed")
    @container.removeClass("expanded")
    @resetAllHeadsPosition()

  close: -> @collapse()

  expand: ->
    @container.addClass("expanded")
    @container.removeClass("collapsed")
    @calcAndSetHeadsPosition()

  getHeads: -> @container.find(".ch-head")

  calcAndSetHeadsPosition: ->
    $heads = @getHeads()

    $heads.each (index, head) ->
      rightValue = ($heads.length - index - 1) * 80
      $(head).css("right", "#{rightValue}px")

  resetAllHeadsPosition: ->
    $heads = @getHeads()
    $heads.css("right", "")


  # Event Handlers
  _collapsedViewClickHandler: (event) ->
    @expand()
    event.preventDefault()

  _expandedViewClickHandler: (event) ->
    @collapse()
    event.preventDefault()

chatview = new Chathead.ChatView("ul.ch-head-list")
