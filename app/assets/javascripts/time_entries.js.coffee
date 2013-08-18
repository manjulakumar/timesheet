$(document).ready ->
  $(document).on "click","a.edit-time-entry", ->
    location=$(this).attr('href')
    parent=$(this).parent().parent()
    console.log(parent)
    $.get location, {}, (contents)->
      $(parent).html(contents)
    false
  $(document).on "ajax:success","form.edit_time_entry", (xhr,data,status)->
    parent = $(this).parent()
    parent.replaceWith(data)
    # $("form[data-update-target]").live "ajax:success", (evt, data) ->
    # target = $(this).data("updated_timeentries")
    # $("#" + target).html data

  $("#new_time_entry").bind("ajax:beforeSend", (evt, xhr, settings) ->
    $submitButton = $(this).find("input[name=\"commit\"]")
    $submitButton.data "origText", $(this).text()
    $submitButton.text "Submitting..."
  ).bind("ajax:success", (evt, data, status, xhr) ->
    $form = $(this)
    $form.find("textarea,input[type=\"text\"],input[type=\"file\"]").val ""
    $form.find("div.validation-error").empty()
    $("#timeentries").append xhr.responseText
  ).bind("ajax:complete", (evt, xhr, status) ->
    $submitButton = $(this).find("input[name=\"commit\"]")
    $submitButton.text $(this).data("origText")
  ).bind "ajax:error", (evt, xhr, status, error) ->
    $form = $(this)
    errors = undefined
    errorText = undefined
    try
      errors = $.parseJSON(xhr.responseText)
    catch err
      errors = message: "Please reload the page and try again"
    errorText = "There were errors with the submission: \n<ul>"
    for error of errors
      errorText += "<li>" + error + ": " + errors[error] + "</li> "
    errorText += "</ul>"
    $form.find("div.validation-error").html errorText