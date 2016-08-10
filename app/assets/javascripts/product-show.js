var appsGov = appsGov || {};

appsGov.productShow = {

  bindGovernmentUserModalSubmit: function() {
    $("#government-user-signup .government_user").submit( function(e) {
      e.preventDefault();

      appsGov.productShow.showLoadingIcon();

      $.ajax({
        url: '/government_user',
        type: 'POST',
        data: 'authenticity_token='+ $('meta[name=csrf-token]').attr('content') +
          '&government_user[first_name]=' + $('#government_user_first_name').val() +
          '&government_user[last_name]=' + $('#government_user_last_name').val() +
          '&government_user[email]='+$('#government_user_email').val() +
          '&government_user[password]='+$('#government_user_password').val() +
          '&government_user[agency_id]='+$('#government_user_agency_id').val(),
        error: function(response) {
          console.log(response);
        },
        success: function() {
          appsGov.productShow.showSuccessMessage();
        }
      });
    });
  },

  hideForm: function() {
    $("#government-user-signup form").addClass("remove");
    $("#government-user-signup .slide-1-heading").addClass("remove");
  },

  insertSuccessMessage: function() {
    var form = $(".gov-user-sign-up .new_product_request").html();
    $("#government-user-signup .success-message").append(
      "<div class='slide-2'>" +
        "<h1>You’re all set!</h1>" +
        "<p>" +
          "Finish your Product Request by adding your Authorizing Official" +
          " and Contract Officer contact information." +
        "</p>" +
        form +
      "</div>"
    );
    $(".modal-actions .modal-trigger").unbind().removeClass("modal-trigger");
  },

  setModalHeight: function() {
    var fixedHeight = $("#government-user-signup").height();
    $("#government-user-signup").css("height", fixedHeight);
  },

  showLoadingIcon: function() {
    $("#government-user-signup .loading").addClass("active");
  },

  showSuccessMessage: function() {

    $("#government-user-signup .loading").removeClass("active");
    $("#government-user-signup .slide-1-heading").addClass("hide");
    $("#government-user-signup form").on("animationend webkitAnimationEnd oAnimationEnd MSAnimationEnd", function() {
      appsGov.productShow.setModalHeight();
      appsGov.productShow.hideForm();
      appsGov.productShow.insertSuccessMessage();
    });
    $("#government-user-signup form").addClass("hide");
  }
};

$(document).ready(function() {
  if ($("body").hasClass("products-show")) {
    appsGov.productShow.bindGovernmentUserModalSubmit();
  }
});

