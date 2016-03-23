$(document).ready(function() {

   $(".rateYo").rateYo({
 
    onChange: function (rating, rateYoInstance) { 
      // $(this).next().text(rating);
      // var numStars = $("#rateYo").rateYo("option", "numStars"); //returns 10
      $(".review-rating").val(rating + 1);
    }
  });

   



  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
