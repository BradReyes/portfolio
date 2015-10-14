# This runs immediately once the DOM loads and all libraries are loaded
$ ->
	$(window).unload ()->
		$('body').scrollTop(0)

	height = window.innerHeight + 4
	$("#invisible-line").css
		top: height

	console.log $("#player")[0]
	# $("#player").on 'click', ()->
	# 	$("#player").prop('muted', false); 


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
				# complete: ()->
					# $(".subheader").velocity
					# 	opacity: 0.85
					# ,
					# 	duration: 300
					# $('#profile').velocity
					# 	opacity: 1
					# ,
					# 	duration: 300
			$(".subheader").velocity
				opacity: 0.85
				translateY: '0px'
			,
				duration: 500
			$('#profile').velocity
				opacity: 1
				translateY: '0px'
			,
				duration: 500


			$(window).unbind('scroll')
			$(window).scroll expand

	expand = () ->
		if isElementInViewport($('#invisible-line'))
			console.log "In View"
			$("#cover-page").velocity
				height: '80px'
			,
				duration: 500
			$("#feed-content").velocity
				translateY: '-230px'
			,
				duration: 500

			$(".subheader").velocity
				opacity: 0
				translateY: '-150px'
			,
				duration: 500
			$('#profile').velocity
				opacity: 0
				translateY: '-150px'
			,
				duration: 500
			$('.header').velocity
				translateY: '-153px'
			,
				duration: 500

			$(window).unbind('scroll')
			$(window).scroll revert

	$(window).scroll expand