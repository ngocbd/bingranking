$(document).ready(function(){
	var i = 0;
	$("#str").focus(function(){
		i = 1;
	});
	$("#str").blur(function(){
		i = 0;
	});
	$("#button").click(function(){
		check();
	});
	document.onkeydown = function(e){
        if (e == null) { // ie
          keycode = event.keyCode;
        } else { // mozilla
          keycode = e.which;
        }
        if(keycode == 13 && i==1){ // escape, close box
        	check();
        }
	};
	function check()
	{
		if($("#str").val() != "")
		{
			var check = 1;
			$(".new_search li a").each(function(){
				if($(this).text() == $("#str").val())
				{
					check = 0;
				}
			});
			if(check==1)
			{
				$(".new_search").append("<li><a href=\"/keyword/"+$("#str").val().trim()+"\" target=\"_blank\">"+$("#str").val()+"</a></li>");
			}				
			
			$("#content").css("text-align","center");
			$("#content").html("<img src='/images/ajax-loader.gif'/>");
			$.get(
					'/check',
					{name:encodeURIComponent($("#str").val()),domain:$("#domain").val()},				
					function(data)
					{
						$("#content").css("text-align","left");
						$("#content").html(data);					
					}
			);

		} else {
			alert("Please enter your search keywords");
		}
	}
});