// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
  $('.insta-applier-item').on('click', function(elem){
    console.log(elem);
    var app_id = $(elem.target).data("idApp");
    var cpgn_id = $(elem.target).data("idCpgn");
    // /campaigns/:campaign_id/applications/:id
    vex.defaultOptions.className = 'vex-theme-default';

    $.ajax({
     url: 'http://localhost:3000/campaigns/'+ cpgn_id + '/applications/' + app_id,
     type:'GET',
     success: function(data){
      // console.log(data);
        response = $($.parseHTML(data)).filter(".insta-business-card-container");
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


