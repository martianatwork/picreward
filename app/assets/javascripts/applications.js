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
     type:'PATCH',
     data: {status: "reject"},
     success: function(data){
     console.log(data);

      response = $($.parseHTML(data));

        // console.log(hello);
      }
    });
  });
});
