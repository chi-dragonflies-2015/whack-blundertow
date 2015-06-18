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

  $(".answer").on('click', 'a', function(event){
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







});
