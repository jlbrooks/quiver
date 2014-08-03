# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
class Comment
  constructor: (data) ->
    data = data ? {}
    @user = ko.observable(data.user)
    @body = ko.observable(data.body)
    @post = ko.observable(data.post)
    @id = data.id


class CommentViewModel
  constructor: (data) ->
    @show_new_comment = ko.observable(false)
    @comments = ko.observableArray()
    @post_id = data.post
    @current_user = data.user
    @comment_hash = JSON.parse(data.comments)
    for id,data of @comment_hash
      @comments.push(new Comment({id: id, body: data[0], user: data[1], post: @post_id}))
    @newMessage = ko.observable()
    @errorMessage = ko.observable()
    @temp_comment = new Comment(user: @current_user)

  addComment: () =>
    json_data = ko.toJS(@temp_comment)
    $.ajax(
      type: 'POST'
      url: '/posts/' + @post_id + '/comments.json'
      dataType: "json"
      data: { comment: json_data }
      success: (createdItem) =>
        @newMessage("Comment successfully created")
        @temp_comment.id = createdItem.id
        @comments.push(@temp_comment)
        @temp_comment = new Comment(user: @current_user)
        $("#comment_body").val("")
        @show_new_comment(false)
      error: (msg) =>
        response = JSON.parse(msg.responseText)
        @errorMessage("Error: comment " + response.body)
    )

  deleteComment: (comment) =>
    console.log comment
    $.ajax(
      type: 'DELETE'
      url: '/posts/' + @post_id + '/comments/' + comment.id
      dataType:"json"
      success: () =>
        @newMessage("Comment successfully deleted")
        @comments.remove(comment)
      error: (msg) =>
        response = JSON.parse(msg.responseText)
        @errorMessage("Error: comment " + response.body)
    )

  show_comment_function: () =>
    if @show_new_comment() is true then @show_new_comment(false) else @show_new_comment(true)
    @newMessage("")

window.CommentViewModel = CommentViewModel