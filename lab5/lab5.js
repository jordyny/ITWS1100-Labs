/* Lab 5 JavaScript File 
   Place variables and functions in this file */

function validate(formObj) {
   // put your validation code here
   // it will be a series of if statements

   if (formObj.firstName.value == "") {
      alert("You must enter a first name");
      formObj.firstName.focus();
      return false;
   } else if (formObj.lastName.value == "") {
      alert("You must enter a last name");
      formObj.lastName.focus();
      return false;
   }else if (formObj.title.value == "") {
      alert("You must enter a title");
      formObj.title.focus();
      return false;
   }else if (formObj.org.value == "") {
      alert("You must enter an organization");
      formObj.org.focus();
      return false;
   }else if (formObj.pseudonym.value == "") {
      alert("You must enter a nickname");
      formObj.pseudonym.focus();
      return false;
   }else if (formObj.comments.value == "") {
      alert("You must enter comments");
      formObj.comments.focus();
      return false;
   }else{
      alert("Form successfully submitted!");
   }
   return true;
}

function clearComments(){
   var text = document.getElementById("comments");
   if(text.value == "Please enter your comments"){
      text.value = "";
   }
}


document.addEventListener("DOMContentLoaded",function() {
  //EXTRA
  var firstInput = document.getElementById("firstName");

  if(firstInput){
    firstInput.focus();
  }


  document.getElementById("comments").addEventListener("blur",function() {
    var text = document.getElementById("comments");
    if (text.value == "") {
      text.value = "Please enter your comments";
    }
  });
});

function highlightName(formObj){
   alert(formObj.firstName.value + " " + formObj.lastName.value + " is " + formObj.pseudonym.value);
}