$(document).ready(function() {
    $.ajax({
        // HTTP method used for the request
        type: "GET",
        url: "../lab8/lab8json.json",
        dataType: "json",
        // function for successful response
        success: function(responseData, status){
            var output = "<ul>";  
            // loops through each item in the json response
            $.each(responseData.menuItem, function(i, item) { 
                output += '<h3>' + item.lab_title + '</h3>';
                output += '<h3>'+ item.name +'</h3>';
                output += '<h4>'+ item.description +'</h4>';
                output += '<li><a href="' + item.path + '">' + item.landing_title + '</a></li>';
                output += '<br>';
            });
            output += "</ul>";
            //insert html into the div with the id projects-menu
            $('#projects-menu').html(output);
        }, 
        // error handle
        error: function(msg) {
            alert("There was a problem: " + msg.status + " " + msg.statusText);
        }
    });
    // hide and show the projects menu
    $("#hideText").click(function() {
        $("#projects-menu").fadeOut(500);
      });
     
      $("#showText").click(function() {
        $("#projects-menu").fadeIn(500);
      });
     
});