// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var page_content = $.ajax({
   url: 'http://localhost:3000/influencers/13',
   type:'GET',
   success: function(data){
    // console.log(data);
      response = $($.parseHTML(data)).filter(".wrapper-influencer-show");
      // console.log(hello);
   }
});


$(document).ready(function() {
$('.insta-pic-business-show').on('click', function(){
  vex.defaultOptions.className = 'vex-theme-default';
  vex.open({
  content: response,
  contentCSS: {width: '1200px',
  position:'absolute',
  // 'margin': 'auto',
  top:'10px',
  left:'40px',
},
  });
});

});


