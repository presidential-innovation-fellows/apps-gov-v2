var appsGov = appsGov || {};

appsGov.registration = {
  addActiveClassToFirstInput: function() {
    $(".input:first").addClass("active");
  },

  bindInputFocusClass: function() {
    $(".input input").on("focus", function() {
      $(".input").removeClass("active");
      $(this).parent(".input").addClass("active");
    });
  }
};

$(document).ready(function() {
  appsGov.registration.bindInputFocusClass();
  appsGov.registration.addActiveClassToFirstInput();
});
