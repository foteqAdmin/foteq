// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
$(document).ready(function()
{
	$("#div_login").hide();
	var loginClick = false;
	$("#login").mouseover(function()
	{
		if (loginClick == false)
		{
			$("#login").css("color","pink");
			$("#login img").attr("src","/assets/setinhapink.png");
		}
	});
	$("#login").mouseout(function()
	{
		if (loginClick == false)
		{
			$("#login").css("color","white");
			$("#login img").attr("src","/assets/setinhabranca.png");
		}
	});
	$("#login").click(function()
	{
		var visibility = $("#div_login").css("display");
		if (visibility == "none") 
		{
			$("#login img").attr("src","/assets/setinhapreta.png");
			$("#div_login").show();
			$("#login").css("background-color","white");
			$("#login").css("border-top","4px solid #441d8d");
			$("#login").css("border-top-right-radius","10px");
			$("#login").css("color","black");
			loginClick = true;
		}
		else
		{
			$("#login img").attr("src","/assets/setinhabranca.png");
			$("#div_login").hide();
			$("#login").css("background-color","");
			$("#login").css("border-top","");
			$("#login").css("border-top-right-radius","");
			$("#login").css("color","white");
			loginClick = false;
		}
	});
})



