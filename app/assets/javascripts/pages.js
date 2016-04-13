// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// Smooth-scroll
function scrollToElement (selector) {
  $('html, body').animate({
    scrollTop: $(selector).offset().top
  }, 2000);
};

$(document).on('click', 'a.link-details', function () {
  scrollToElement($(this).attr('href'));
});
