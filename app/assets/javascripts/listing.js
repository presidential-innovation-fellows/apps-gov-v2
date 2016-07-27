function offsetAnchor() {
  if(location.hash.length !== 0) {
      window.scrollTo(window.scrollX, window.scrollY - 200);
  }
}

function submenu_selector(id, setting){
  if (setting === 'show') {
    switchDisplayValue(id, 'inherit');
    switchFontAwesomeIcon(id, 'fa-angle-down', 'fa-angle-up');
  } else {
    switchDisplayValue(id, 'none');
    switchFontAwesomeIcon(id, 'fa-angle-up', 'fa-angle-down');
  }
}

function switchDisplayValue(id, value) {
  $('#' + $(id).attr('id') + '-list').css('display', value);
}

function switchFontAwesomeIcon(id, oldClass, newClass) {
  $(id).find('.fa').removeClass(oldClass).addClass(newClass);
}

var appsGov = appsGov || {};

appsGov.listing = {

  bindExpandClick: function(){
    $('#proc, #revs, #ato, #testing').on('click', function() {
      if ($('#' + $(this).attr('id') + '-list').css('display') === 'none'){
        submenu_selector(this, 'show')
      } else {
        submenu_selector(this, 'hide')
      }
    });
  },

  bindSidenavClick: function(){
    $('.usa-sidenav-list a').on('click', function(){
      $('.usa-sidenav-list a.usa-current').removeClass('usa-current');
      $(this).addClass('usa-current');
    });
  }
}

if ($("body").hasClass("pages-listing")) {
  $(document).ready(function(){

    appsGov.listing.bindExpandClick();
    appsGov.listing.bindSidenavClick();

    $(window).on("hashchange", function () {
        offsetAnchor();
    });

    window.setTimeout(function() {
        offsetAnchor();
    }, 1);
  });
}
