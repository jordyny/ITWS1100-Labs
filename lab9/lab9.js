$(document).ready(function() {
    $.ajax({
        type: "GET",
        url: "../lab4/rssFeed.xml",
        dataType: "xml",
        success: function(responseData, status){
            var output = "<ul>";  
            $(responseData).find("item").each(function() {
                output += '<li><a href="' + $(this).find("link").text() + '" target="_blank">';
                output += $(this).find("title").text();
                output += '</a></li>';
                output += "<div id='date'>" + $(this).find("pubDate").text() + "</div><br />";
            });
            output += "</ul>";
            $('#lab9RSS').html(output);
        },
        error: function(msg) {
            // there was a problem
            alert("There was a problem: " + msg.status + " " + msg.statusText);
        }
    });

    $.ajax({
        type: "GET",
        url: "../lab4/atomFeed.xml",
        dataType: "xml",
        success: function(responseData, status){
            var output = "<ul>";  
            $(responseData).find("entry").each(function() { // Changed "item" to "entry"
                output += '<li><a href="' + $(this).find("link").attr("href") + '" target="_blank">'; // Changed .text() to .attr("href")
                output += $(this).find("title").text();
                output += '</a></li>';
                output += "<div id='summary'>" + $(this).find("summary").text() + "</div><br />"; // Changed id='date' to id='summary'
            });
            output += "</ul>";
            $('#lab9Atom').html(output);
        },
        error: function(msg) {
            // there was a problem
            alert("There was a problem: " + msg.status + " " + msg.statusText);
        }
    });

    $("#hideRSS").click(function() {
        $("#lab9RSS").fadeOut(500);
      });
     
      $("#showRSS").click(function() {
        $("#lab9RSS").fadeIn(500);
      });


    $("#hideAtom").click(function() {
        $("#lab9Atom").fadeOut(500);
      });
     
      $("#showAtom").click(function() {
        $("#lab9Atom").fadeIn(500);
    });
});
