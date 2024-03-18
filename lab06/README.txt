Resources used: stackoverflow, geeksforgeeks, jquery api docs

Answer to Question 4b:
what happens when you click on the new li?  Why? (Explain in your readme file)
ie if it works as after #3 above, why? if it doesn't, why not?  How would you fix it?

When you click on the new li, nothing happens and it doesn't turn red like the original list items.
This is because the event listeners for clicking on the list items and turning them red are only attatched to the list items that exist
when the page is loaded for the first time. Any new items that are added to the DOM after the event listeners are attatched do not 
automatically have these event handlers attatched to them once the DOM has already loaded. 

To fix it, we can implement something called event delegation. This will allow us to attatch an event handler to a parent element that already 
exists in the DOM which will ensure that events are handled on its elements even after the elements are added after the event handlers have been attatched. 

The new code will look as follows:
$(document).ready(function() {
  alert("The DOM is now loaded and can be manipulated.");
  alert("The instructions for this lab are in the lab6.js file.");

  // Problem 1: Change the <h1> content when clicked
  $("h1 .myName").click(function () {
    $(this).html("Jordyn Young").css({
      "color": "green",
      "font-variant": "small-caps",
      "font-size": "110%"
    });
  });

  // Problem 2: Hide/show "Lorem ipsum" paragraphs
  $("#hideText").click(function() {
    $("#showHideBlock p").fadeOut(400);
  });

  $("#showText").click(function() {
    $("#showHideBlock p").fadeIn(2000);
  });

  // Problem 3: Toggle list items color using event delegation
  $("#labList").on("click", "li", function() {
    $(this).toggleClass("red");
  });

  // Problem 4: Add new list items
  $("#AddListItem").click(function() {
    var totalItems = $("#labList li").length;
    var newItem = $("<li>List item " + (totalItems + 1) + "</li>");
    $("#labList").append(newItem);
  });

  // Problem 5: Toggle text visibility
  $("#toggleText").click(function() {
    $("#showHideBlock p").toggle(400);
  });
});


Post-Lab Review: 
Overall, this lab was manageable. It required a lot of research on the syntax of jQuery, but I learned a lot in the end. 

URL To Personal Website:
https://youngj22rpi.eastus.cloudapp.azure.com/iit/index.html

Link to Repo: 
https://github.com/RPI-ITWS/itws1100-youngj22