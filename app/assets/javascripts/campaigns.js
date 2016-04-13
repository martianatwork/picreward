// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// Create a campaign form
$(function(){

   $("input[name*='campaign[reward_type]']").on("change", function(e){
      var elementID = $(this).attr("id");

      if(elementID == "campaign_reward_type_paid_job"){
        $(".campaign_target_location").addClass("hidden");
        $("#campaign_target_location").val("");

      } else if(elementID == "campaign_reward_type_local_swap"){
         $(".campaign_target_location").removeClass("hidden");
      }
   })

});
