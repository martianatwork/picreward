// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

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
