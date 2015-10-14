# This runs immediately once the DOM loads and all libraries are loaded
$ ->

	# $(window).on 'beforeunload', ()->
	# 	$(window).scrollTop(0)
	# 	"Fuck"

	$(window).unload ()->
		$('body').scrollTop(0)

	`
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
	`

	revert = () ->
		if isElementInViewport($("#invisible-line-2"))
			$("#cover-page").velocity("reverse")
			$("#feed-content").velocity
				translateY: '0px'
				,
				duration: 500
			# $(".subheader").velocity 'fadeIn',
			# 	duration: 300
			# $('#profile').velocity 'fadeIn',
			# 	duration: 300
			$('.header').velocity
				translateY: '0px'
			,
				duration: 500
				complete: ()->
					$(".subheader").velocity 'fadeIn',
						duration: 300
					$('#profile').velocity 'fadeIn',
						duration: 300
			$(window).unbind('scroll')
			$(window).scroll expand

	expand = () ->
		if isElementInViewport($('#invisible-line'))
			console.log "In View"
			$("#cover-page").velocity
				height: '110px'
			,
				duration: 500
			$("#feed-content").velocity
				translateY: '-230px'
			,
				duration: 500
			# $(".subheader").velocity 'fadeOut',
			# 	duration: 300
			# $('#profile').velocity 'fadeOut',
			# 	duration: 300

			$(".subheader").velocity
				opacity: 0
			,
				duration: 300
			$('#profile').velocity
				opacity: 0
			,
				duration: 300
			$('.header').velocity
				translateY: '-157px'
			,
				duration: 500

			$(window).unbind('scroll')
			$(window).scroll revert

	$(window).scroll expand