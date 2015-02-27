// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready(function(){

  $(".new_todo_link").on("click", function(event){
    event.preventDefault();
    console.log("hiiii");
    $("#new_todo_form").show();
    $(".new_todo_link").hide();
  })

  $("#new_todo_form").on("submit", function(event){
    event.preventDefault();
    $.ajax({
      url: "/todos",
      type: "post",
      dataType: "json",
      data: $("form").serialize()
    }).done(function(response){
      console.log(response);
      var sourceHTML = $("#new_todo").html();
      var questionTemplater = Handlebars.compile(sourceHTML);
      var content = { data: response}
      console.log(response.title);
      $(".list ol").append(questionTemplater(content));
      $(".new_todo_link").show();
      $("#new_todo_form").hide();
    });
});


});

