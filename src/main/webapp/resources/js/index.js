// https://dribbble.com/shots/2308755-Search-Transform-Principle-Freebie
$('button').on('click', function(e) {
  $('form').addClass('opened');
  $('input[type="text"]').focus();
});

$('input[type="text"]').on('focusout', function(e) {
  $('form').removeClass('opened');
});