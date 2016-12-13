$(document).ready(function(){
  $( "#faq-info" ).hide();
  $( "#macros-info" ).hide();
  $( "#mealprep-info" ).hide();
  $( "#mealprep-button" ).click(function() {
    $( "#faq-info" ).hide();
    $( "#macros-info" ).hide();
    $( "#mealprep-info" ).fadeToggle();
  });
  $( "#macros-button" ).click(function() {
    $( "#faq-info" ).hide();
    $( "#mealprep-info" ).hide();
    $( "#macros-info" ).fadeToggle();
  });
  $( "#faq-button" ).click(function() {
    $( "#macros-info" ).hide();
    $( "#mealprep-info" ).hide();
    $( "#faq-info" ).fadeToggle();
  });
});
