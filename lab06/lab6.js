/* eslint-disable no-undef */
/* Lab 6 JavaScript File  */

// this is the block that allows code to execute only after the DOM
// is fully loaded:
$(document).ready(function () {

  alert("The DOM is now loaded and can be manipulated.");
  alert("The instructions for this lab are in the lab6.js file.");

  // example event handler:
  $('#labButton').click(function () {
    alert('You\'ve clicked the lab button');
 });



  // Problem 1 (10 pts): When the user clicks on the <h1>,
  //change the 'your name' to your own name (ie Joe Smith)
  //change the text to be your name in small caps
  //change the color to be something other than blue or black
  //change the text size to 110% of normal
  // (note that there is already a class defined for the area where your name should go)
  $("h1 .myName").click(function () {
    $(this).html("Jordyn Young").css({
      "color": "green",
      "font-variant": "small-caps",
      "font-size": "110%"
    });
  });



  // Problem 2 (10 pts): Make the "lorem ipsum" paragraphs
  //   vanish over a 4/10 sec duration when a user clicks "Hide text";
  //   make it appear with a 2 second duration when a user clicks "Show text":
 
    $("#hideText").click(function() {
      $("#showHideBlock p").fadeOut(400);
    });
   
    $("#showText").click(function() {
      $("#showHideBlock p").fadeIn(2000);
    });
   
   
  // Problem 3 (10 pts): When a normal list item is clicked, make it turn red using addClass.
  //            When a red list item is clicked change it back (you need to look up the appropriate jQuery method to do this)
  // (Note that there already is a css style named ".red" in lab6.css)

    // $("#labList li").click(function() {
    //   $(this).addClass("red");
    // });
   
    // $("#labList li.red").click(function() {
    //   $(this).removeClass("red");
    // });

  // Problem 3 (FIXING 4B): Toggle list items color using event delegation
    // Event delegation to handle clicks on list items
    $("#labList").on("click", "li", function() {
      if ($(this).hasClass("red")) {
        
        $(this).removeClass("red");
      } else {
        $(this).addClass("red");
      }
    });


  // Problem 4 (10 pts): When a user clicks on the "Add a list item" button, add a new list item to the end of the list.
    // $("#AddListItem").click(function() {
    //   // get the total number of list items
    //   var totalItems = $("#labList li").length;
   
    //   // create a new list item element with incremented number
    //   var newItem = $("<li>List item " + (totalItems + 1) + "</li>");

    //   $("#labList").append(newItem);s
    // });
   
  // Problem 4 (FIXING 4B): Add new list items
  $("#AddListItem").click(function() {
    var totalItems = $("#labList li").length;
    var newItem = $("<li>List item " + (totalItems + 1) + "</li>");
    $("#labList").append(newItem);
  });

   // Problem 4b (10 pts) - what happens when you click on the new li?  Why? (Explain in your readme file)
   //   ie if it works as after #3 above, why? if it doesn't, why not?  How would you fix it?
  //EXPLAINED IN README FILE
 

   // Problem 5 (10 pts): lookup another jquery method and use this code on the "Toggle Text"
   // link to show/hide the text:
    // Toggle the visibility of text when the "Toggle Text" link is clicked
    $("#toggleText").click(function() {
       $("#showHideBlock p").toggle(400);
    });

   // Problems: 60 pts
   // Validity: 10 pts
   // Website organization: 10 pts
   // Deployment: 10 pts
   // Readme file: 10 pts
   // Total: 100 pts
   // Bonus: 10 pts (for a max of 100 pts) if you fix 4b above

   /* When you are done:
     Post this lab to your iit website,
     link it from your projects page,
     and a link to your project page and repo in the readme file.
     Submit as normal to LMS
 */
});
