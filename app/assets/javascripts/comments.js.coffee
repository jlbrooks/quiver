# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
class Comment
  constructor: (data) ->
    data = data ? {}
    @body = ko.observable(data.body)


class CommentViewModel
  constructor: (data) ->
    @show_new_comment = ko.observable(false)
    @comments = ko.observableArray()
    @comment_hash = JSON.parse(data.comments)
    for id,body of @comment_hash
      @comments.push(new Comment({id: id, body: body}))
    @post_id = data.post
    @newMessage = ko.observable()
    @errorMessage = ko.observable()
    @temp_comment = new Comment()

  addComment: () =>
    json_data = ko.toJS(@temp_comment)
    $.ajax(
      type: 'POST'
      url: '/posts/' + @post_id + '/comments.json'
      dataType: "json"
      data: { comment: json_data }
      success: (createdItem) =>
        @newMessage("Comment successfully created")
        @temp_comment = new Comment()
      error: (msg) =>
        response = JSON.parse(msg.responseText)
        @errorMessage(response.body)
    )

  show_comment_function: () =>
    if @show_new_comment() is true then @show_new_comment(false) else @show_new_comment(true)

window.CommentViewModel = CommentViewModel