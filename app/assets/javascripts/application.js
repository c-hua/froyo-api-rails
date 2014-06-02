// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

window.loadYogurts = function() {

// glossing over this today, we'll talk more about it next week

$.ajax({
	type: 'GET',
	url: 'http://localhost:3000/yogurts.json', 
	dataType: 'json'
}).done(function(data) {
	console.log(data);
	// grab the template we're going to use

	var source = $("#yogurts-template").html();


	// compile it with Handlebars

	var template = Handlebars.compile(source);

	// displays compiled template with our comic books filled in

	$('#yogurts-destination').html(template(data));

})

};