var appsGov = appsGov || {};

appsGov.productIndex = {
  bindSearchSubmit: function() {
    $("#product-search-form").submit(function() {
      if ($.trim($("#product-search-form .aa-input").val()) === "") {
          return false;
      }
    });
  }
};

$(document).ready(function() {
  appsGov.productIndex.bindSearchSubmit();
});
