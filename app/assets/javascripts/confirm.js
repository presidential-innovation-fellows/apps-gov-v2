var appsGov = appsGov || {};

appsGov.confirm = {

  bindConfirmClose: function() {
    $("#close-confirm").on("click", function() {
      $(".confirm-account").removeClass("active");
    });
  }
};

$(document).ready(function() {
  appsGov.confirm.bindConfirmClose();
});
