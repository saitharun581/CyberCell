function validate() {
  var fullname = document.getElementById("name");
  var mobile = document.getElementById("mobile");
  var email = document.getElementById("email");
  var category = document.getElementById("category");

  var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

  if (fullname.value == "" || fullname.value.length < 6) {
    alert(" fullname should be more than 6 alphabets");
    fullname.focus();
    return false;
  }

  if (category.value == "Category") {
    alert("Please select Category");
    category.focus();
    return false;
  }

  if(mobile.value==''){
      alert('Please enter mobile number');
      mobile.focus();
      return false;
  }
  if (!(mobile.value.length > 6 && mobile.value.length < 11)) {
    alert("Please Enter Correct Contact Number");
    mobile.focus();
    return false;
}

  if (!email.value.match(mailformat)) {
    alert("invalid email");
    email.focus();
    return false;
  }

  return true;
}
