$(document).ready(function() {
  $('.question_container').on('click', 'a', function(event){
    event.preventDefault();
    var ajxUrl = ($(this).attr("href"));
    var request = $.ajax({
                    url: ajxUrl,
                    method: 'POST'
    });
    request.done(function(response){
      $('#vote_for_questions').text(response["votes"]);
    });
  });

  $(".arrows a").on('click', function(event){
    event.preventDefault();
    var ajxUrl = ($(this).attr("href"));
    var pId = ($(this).attr("class"));
    var request = $.ajax({
                    url: ajxUrl,
                    method: 'POST'
    });
    request.done(function(response){
      $("p[class = " + pId + "]").text(response["votes"]);
    });
  });

  $('#question_comment_button').on('click', function(event){
    event.preventDefault();
    var ajaxUrl = ($(this).parent().attr("action"));
    var newComment = $('#new_question_comment').val();
    var request = $.ajax({
                    url: ajaxUrl,
                    method: 'POST',
                    data: {"body": newComment}
    });
    request.done(function(response){
      $('#show_question_comments').prepend(response);
    });
  });

  $(".answer_comment_button").on("click", function(event) {
    event.preventDefault();
    var formNum = $(this).parent();
    var ajaxUrl = formNum.attr("action");
    var thisClass = formNum.children().eq(0).attr("class");
    var newComment = formNum.children().eq(0).val();
    var request = $.ajax({
                        url: ajaxUrl,
                        method: "POST",
                        data: {"body": newComment}
    });

    request.done(function(response) {
      $("div ." + thisClass).prepend(response);

    });

  });






});
