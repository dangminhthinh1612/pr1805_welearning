//= require ./lib/jquery
//= require ./lib/jquery.easing
//= require ./lib/sb-admin-2
//= require ./lib/Chart
//= require ./lib/chart-area-demo
//= require ./lib/chart-pie-demo
//= require rails-ujs
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load', function(){
  // Toggle the side navigation
  $('#sidebarToggle, #sidebarToggleTop').on('click', function(e) {
    $('body').toggleClass('sidebar-toggled');
    $('.sidebar').toggleClass('toggled');
    if ($('.sidebar').hasClass('toggled')) {
      $('.sidebar .collapse').collapse('hide');
    };
  });

  // Close any open menu accordions when window is resized below 768px
  $(window).resize(function() {
    if ($(window).width() < 768) {
      $('.sidebar .collapse').collapse('hide');
    };
  });

  // Prevent the content wrapper from scrolling when the fixed side navigation hovered over
  $('body.fixed-nav .sidebar').on('mousewheel DOMMouseScroll wheel', function(e) {
    if ($(window).width() > 768) {
      var e0 = e.originalEvent,
        delta = e0.wheelDelta || -e0.detail;
      this.scrollTop += (delta < 0 ? 1 : -1) * 30;
      e.preventDefault();
    }
  });

  // Scroll to top button appear
  $(document).on('scroll', function() {
    var scrollDistance = $(this).scrollTop();
    if (scrollDistance > 100) {
      $('.scroll-to-top').fadeIn();
    } else {
      $('.scroll-to-top').fadeOut();
    }
  });

  // Smooth scrolling using jQuery easing
  $(document).on('click', 'a.scroll-to-top', function(e) {
    var $anchor = $(this);
    $('html, body').stop().animate({
      scrollTop: ($($anchor.attr('href')).offset().top)
    }, 1000, 'easeInOutExpo');
    e.preventDefault();
  });

});

$(document).on('click', 'form .remove_contents', function(event) {
  $(this).prev('input[type=hidden]').val('1');
  $(this).closest('fieldset').hide();
  return event.preventDefault();
});

$(document).on('click', 'form .add_fields', function(event) {
  var regexp,time;
  var tabElement = document.getElementById('lesson_hiden_tab');
  time = parseInt(tabElement.value) + 1;
  tabElement.value = time;
  regexp = new RegExp($(this).data('id'), 'g');
  $('.btn-group-add-field').before($(this).data('contents').replace(regexp, time));
  return event.preventDefault();
});


