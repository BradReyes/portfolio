// Generated by CoffeeScript 1.9.3
$(function() {
  var expand, height, revert;
  $(window).unload(function() {
    return $('body').scrollTop(0);
  });
  height = window.innerHeight + 4;
  $("#invisible-line").css({
    top: height
  });
  console.log($("#player")[0]);
  
	function isElementInViewport (el) {

	    //special bonus for those using jQuery
	    if (typeof jQuery === "function" && el instanceof jQuery) {
	        el = el[0];
	    }

	    var rect = el.getBoundingClientRect();

	    return (
	        rect.top >= 0 &&
	        rect.left >= 0 &&
	        rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) && /*or $(window).height() */
	        rect.right <= (window.innerWidth || document.documentElement.clientWidth) /*or $(window).width() */
	    );
	}
	;
  $(".post").bind('click', function(e) {
    var $extra, height_animate, id;
    id = $(this).attr('id');
    $extra = $("#extra" + id);
    if ($extra.attr('status') === "closed") {
      height_animate = $extra.attr('ht');
      if (height_animate == null) {
        height_animate = $extra.children().first().height();
      } else {
        height_animate = parseInt(height_animate);
      }
      $extra.attr('status', 'open');
      return $extra.velocity({
        height: (height_animate + 10) + "px"
      }, {
        duration: 500
      });
    } else {
      $extra.attr('status', 'closed');
      return $extra.velocity({
        height: "160px"
      }, {
        duration: 500
      });
    }
  });
  revert = function() {
    if (isElementInViewport($("#invisible-line-2"))) {
      $("#cover-page").velocity("reverse");
      $("#feed-content").velocity({
        translateY: '0px',
        duration: 500
      });
      $('.header').velocity({
        translateY: '0px'
      }, {
        duration: 500
      });
      $(".subheader").velocity({
        opacity: 0.85,
        translateY: '0px'
      }, {
        duration: 500
      });
      $('#profile').velocity({
        opacity: 1,
        translateY: '0px'
      }, {
        duration: 500
      });
      $(window).unbind('scroll');
      return $(window).scroll(expand);
    }
  };
  expand = function() {
    if (isElementInViewport($('#invisible-line'))) {
      console.log("In View");
      $("#cover-page").velocity({
        height: '80px'
      }, {
        duration: 500
      });
      $("#feed-content").velocity({
        translateY: '-230px'
      }, {
        duration: 500
      });
      $(".subheader").velocity({
        opacity: 0,
        translateY: '-150px'
      }, {
        duration: 500
      });
      $('#profile').velocity({
        opacity: 0,
        translateY: '-150px'
      }, {
        duration: 500
      });
      $('.header').velocity({
        translateY: '-153px'
      }, {
        duration: 500
      });
      $(window).unbind('scroll');
      return $(window).scroll(revert);
    }
  };
  return $(window).scroll(expand);
});
