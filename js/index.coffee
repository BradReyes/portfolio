# This runs immediately once the DOM loads and all libraries are loaded
$ ->
	$("a[data-toggle='tooltip']").tooltip();

	$("#load").css
		display: 'none'
	$("#not-done").css
		display: 'none'
	$(".about-me").css
		display: 'none'


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

	dont_animate = false

	$("a[data-toggle='tooltip']").bind 'click', ()->
		dont_animate = true


	$(".post:not(a[data-toggle='tooltip'])").bind 'click', (e) ->
		if dont_animate
			dont_animate = false
			return
		id = $(@).attr 'id'
		$extra = $("#extra#{id}")
		if $extra.attr('status') is "closed"
			height_animate = $extra.attr('ht')
			if not height_animate?
				height_animate = $extra.children().first().height()
			else
				height_animate = parseInt height_animate
			$extra.attr('status', 'open')
			$extra.velocity
				height: "#{height_animate + 10}px"
			,
				duration: 500
		else
			$extra.attr('status', 'closed')
			$extra.velocity
				height: "160px"
			,
				duration: 500

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
				translateY: '-150px'
			,
				duration: 500

			$(window).unbind('scroll')
			$(window).scroll revert

	$(window).scroll expand

	tabs =
		'About Me': 'A'
		'Skills': 'S'
		'Projects': 'P'
		'Experience': 'E'
		'Contact Me': 'last-li'

	# add the tabs
	clone = $("#player").first().clone(true)

	$("#nav-id").bind 'click', (e)->
		clone = $("#player").first().clone(true)
		$clicked = $(e.target)
		if $clicked.prop("tagName") is "LI"
			new_tab = $clicked.text()
			new_tab = tabs["#{new_tab}"]
			$new_tab = $("##{new_tab}")
			$(".active").first().removeClass 'active'
			$new_tab.addClass "active"

			# now we 'reload' the page

			#first the tabs that are not implemented
			if new_tab is 'S' or new_tab is 'E' or new_tab is 'last-li'
				$('.about-me').css
					display: 'none'
				$("#not-done").css
					display: 'none'
				$(".projects").css
					display: 'none'
				$("#load").css
					display: 'block'

				setTimeout ()->
					$("#not-done").css
						display: 'block'
					$("#load").css
						display: 'none'
				, 300
			else if new_tab is 'P'
				$('.about-me').css
					display: 'none'
				$("#not-done").css
					display: 'none'
				$(".projects").css
					display: 'none'
				$("#load").css
					display: 'block'

				setTimeout ()->
					$(".projects").css
						display: 'block'
					$("#load").css
						display: 'none'
					$("#player").first().remove()
					$("#extra1").prepend(clone)
				, 300
			else #about me
				$('.about-me').css
					display: 'none'
				$("#not-done").css
					display: 'none'
				$(".projects").css
					display: 'none'
				$("#load").css
					display: 'block'

				setTimeout ()->
					$(".about-me").css
						display: 'block'
					$("#load").css
						display: 'none'
				, 300
