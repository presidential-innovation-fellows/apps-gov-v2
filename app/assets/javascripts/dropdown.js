var appsGov = appsGov || {};

appsGov.dropdown = {
  bindDocumentClick: function() {
    $(document).on("click", function() {
      $(".submenu").removeClass("active");
    });
  },

  bindDropdownParent: function() {
    $(".dropdown-parent").on("click", function(e) {
      e.preventDefault();
      e.stopImmediatePropagation();
      $(this).find(".submenu").toggleClass("active");
    });
  },

  bindDropdownChildren: function() {
    $(".dropdown-parent li a").on("click", function(e){
      e.stopImmediatePropagation();
    });
  }
};

$(document).ready(function() {
  appsGov.dropdown.bindDocumentClick();
  appsGov.dropdown.bindDropdownParent();
  appsGov.dropdown.bindDropdownChildren();
});
