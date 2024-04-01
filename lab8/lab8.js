$(document).ready(function() {
    $.ajax({
        type: "GET",
        url: "../lab8/lab8json.json", // Ensure this path is correct
        dataType: "json",
        success: function(responseData, status){
            var output = "<ul>";  
            $.each(responseData.menuItem, function(i, item) { // Changed from 'items' to 'menuItem'
                output += '<h3>' + item.lab_title + '</h3>';
                output += '<h3>'+ item.name +'</h3>';
                output += '<h4>'+ item.description +'</h4>';
                output += '<li><a href="' + item.path + '">' + item.landing_title + '</a></li>';
                // Consider adding item.name or item.description if you want more details displayed
                output += '<br>';
            });
            output += "</ul>";
            $('#projects-menu').html(output);
        }, 
        error: function(msg) {
            // there was a problem
            alert("There was a problem: " + msg.status + " " + msg.statusText);
        }
    });
    $("#hideText").click(function() {
        $("#projects-menu").fadeOut(500);
      });
     
      $("#showText").click(function() {
        $("#projects-menu").fadeIn(500);
      });
     
});