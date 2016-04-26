var appsGov = appsGov || {};

appsGov.modal = {

  bindCloseFunctions: function() {
    $(".modal-close").on("click", function() {
      appsGov.modal.closeModal();
    });
  },

  bindModalTriggers: function() {
    $(".modal-trigger").on("click", function(e) {
      e.preventDefault();

      var modalId = $(this).data("modal-id"),
          modal = $("#" + modalId);

      $(modal).addClass("active");
      appsGov.modal.openOverlay();
    });
  },

  closeModal: function() {
    $(".modal").removeClass("active");
    appsGov.modal.closeOverlay();
  },

  closeOverlay: function() {
    $(".overlay").removeClass("active");
  },

  openOverlay: function() {
    $(".overlay").addClass("active");
  }
};

$(document).ready(function() {
  appsGov.modal.bindCloseFunctions();
  appsGov.modal.bindModalTriggers();
});

$(document).keyup(function(e) {

  if (e.keyCode === 27) {
    appsGov.modal.closeModal();
  }
});
