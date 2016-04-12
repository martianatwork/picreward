// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
  $('.show-influencer').on('click', function(elem){
    console.log(elem);
    var infl_id = $(elem.target).data("id");
    vex.defaultOptions.className = 'vex-theme-default';

    $.ajax({
     url: 'http://localhost:3000/influencers/' + infl_id,
     type:'GET',
     success: function(data){
      // console.log(data);
        response = $($.parseHTML(data)).filter(".business-card-container");
        vex.open({
          content: response,
          contentCSS: {
            width: '800px',
            // position:'absolute',
            // 'margin': 'auto',
            // top:'10px',
            // left:'40px',
          },
        });
        // console.log(hello);
     }
    });
  });
});


