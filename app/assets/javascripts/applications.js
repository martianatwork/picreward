// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
  $('.test').on('click', function(elem){
    // console.log(elem);
    var app_id = $(elem.target).data("idApp");
    var cpgn_id = $(elem.target).data("idCpgn");
    // /campaigns/:campaign_id/applications/:id
    $.ajax({
     url: '/campaigns/'+ cpgn_id + '/applications/' + app_id,
     type:'PUT',
     data: {status: "reject"},
     success: function(data){
     console.log(data);

      response = $($.parseHTML(data));

        // console.log(hello);
      }
    });
  });
});

//$("body").on('click') car on doit attendre que la page charge
//listener sur body car on change le html de body
$(document).ready(function() {
  // $("#cf7_controls").on('click', 'span', function() {
  $("body").on('click', '#cf7_controls span', function() {
    $("#cf7 div").removeClass("opaque");
    // $("#cf7 div i").removeClass("opaque");

    var newImage = $(this).index();

    $("#cf7 div").eq(newImage).addClass("opaque");
    // $("#cf7 div i").eq(newImage).addClass("opaque");

    $("#cf7_controls span").removeClass("selected");
    $(this).addClass("selected");
  });
});

// Smooth-scroll
function scrollToElement (selector) {
  $('html, body').animate({
    scrollTop: $(selector).offset().top
  }, 1000);
};

$(document).on('click', 'a.link-details', function (e) {
  e.preventDefault();
  scrollToElement($(this).attr('href'));
});

