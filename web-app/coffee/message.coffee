$=jQuery
class Button
  constructor: (@id) ->
    return $("<button>").attr("id", "#{@id}")
      .addClass("ui-button ui-widget ui-state-default ui-button-text-only ui-button-text button-decorator")      # ui-corner-all

class Elem
  constructor: (type, @elemclass, name) ->
    return $("<#{type}>").addClass("#{@elemclass}").attr("name","#{name}")

class MultiAutocompite
  constructor: (type, elemclass, name,id) ->
    return new Elem(type,elemclass,name).attr("id", id).attr("type","text")
      .bind( "keydown", ( event ) =>
        if event.keyCode is $.ui.keyCode.TAB and $( this ).data( "ui-autocomplete" ).menu.active
          event.preventDefault()
      ).autocomplete(
        minLength: 0
        source: ( request, response ) ->
          response( $.ui.autocomplete.filter(
            userTags, extractLast( request.term ) ) )
        focus: ->
          return false
        select: ( event, ui ) ->
          terms = split( this.value )
          terms.pop()
          terms.push( ui.item.value )
          terms.push( "" )
          this.value = terms.join( ", " )
          return false
      )

class TaskInput
  constructor: (@id, @elemclass, list,name) ->
    input = $("<input>").addClass("#{@elemclass}").attr("id", "#{@id}").attr("type", "text").attr("name","#{name}").click (e) =>
      clickAutocompl "#{@id}"
    createAutocomplete input, list
    return input

class FileInput
  constructor: (@id, @elemclass, list,name) ->
    input = $("<input>").addClass("#{@elemclass}").attr("id", "#{@id}").attr("type", "file").attr("name","#{name}")
    #changeIssueInput(this)       #???
    return input

class Select
  constructor: (@elemclass, @options,name) ->
    select = $("<select>").addClass("#{@elemclass}").attr("name","#{name}")
    select.append(new Option("", ""))
    if @options?
      for option in @options
        opt= new Option(option.value, option.value)
        select.append(opt)
    return select

class Br
  constructor: ->
    br = $("<br>")
    return br

class Div
  constructor:(elemClass) ->
    div = $("<div>").addClass("#{elemClass}")
    return div

class MessageDialog
  controller: (@userId)->
  createDialog: ->
    @dialogMainDiv = new Div("message-dialog ui-dialog ui-widget ui-widget-content ui-corner-all ui-front ui-dialog-buttons ui-draggable ui-resizable").css(
        position: "absolute"
        height: "auto"
        width: "350px"
        top: "23px"
        left: "116px"
        display: "block"
      ).append(
        $(".message-inner-div").show()
      )
    $("body").append @dialogMainDiv


$ ->
  $("#sendMessage").click (e) =>
    messageDialog = new MessageDialog $(e.target).attr("userid")
    messageDialog.createDialog()

