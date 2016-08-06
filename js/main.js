"use strict";
// Avoids links in the HTML
$(function () {
  $("#github").click(function () {
    location.href= "https://github.com/bekher";
  });
  $("#linkedin").click(function () {
    location.href= "https://linkedin.com/in/bekher";
  });
  $("#twitter").click(function () {
    location.href= "https://twitter.com/gregbekher";
  });
  $("#resume").click(function () {
    location.href= "/bekher-cv-ext.pdf";
  });
  $("#parapit").click(function () {
    location.href= "http://parapit.com/";
  });
});

