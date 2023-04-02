$(document).ready(function(){
    /* Step type 1 */
    var multiple_form_one_current_fs, 
    multiple_form_one_next_fs, 
    multiple_form_one_previous_fs; //fieldsets
    var multiple_form_one_opacity;
    
    $(".teksands_form .next").click(function(){
    	
    	var mem_value = $(this).attr('data-custom');
    	
    	if(mem_value == "teksands")
    	{
    		var steps = $(this).attr('data-steps');
    		var flag = validateMembershipTabs(steps);
    		if(!flag)
    		{
    			return false;
    		}
    	}
    	multiple_form_one_current_fs = $(this).parent();
        multiple_form_one_next_fs = $(this).parent().next();
        //Add Class Active
        $(".multiple-form-one #progressbar li").eq($(".multiple-form-one fieldset").index(multiple_form_one_next_fs)).addClass("active");
        //show the next fieldset
        multiple_form_one_next_fs.show();
        //hide the current fieldset with style
        multiple_form_one_current_fs.animate({opacity: 0}, {
            step: function(now) {
            // for making fielset appear animation
            multiple_form_one_opacity = 1 - now;
            multiple_form_one_current_fs.css({
                'display': 'none',
                'position': 'relative'
            });
            multiple_form_one_next_fs.css({'opacity': multiple_form_one_opacity});
            },
            duration: 600
        });
    });
    $(".teksands_form .previous").click(function(){    	
        $(this).closest('.panels').find('.next-q').prop('disabled', false);
    	multiple_form_one_current_fs = $(this).parent();
        multiple_form_one_previous_fs = $(this).parent().prev();
        //Remove class active
        $(".multiple-form-one #progressbar li").eq($(".multiple-form-one fieldset").index(multiple_form_one_current_fs)).removeClass("active");
        //show the previous fieldset
        multiple_form_one_previous_fs.show();
        //hide the current fieldset with style
        multiple_form_one_current_fs.animate({opacity: 0}, {
            step: function(now) {
                // for making fielset appear animation
                multiple_form_one_opacity = 1 - now;
                multiple_form_one_current_fs.css({
                    'display': 'none',
                    'position': 'relative'
                });
                multiple_form_one_previous_fs.css({'opacity': multiple_form_one_opacity});
            },
            duration: 600
        });
    });
    $('.radio-group .radio').click(function(){
        $(this).parent().find('.radio').removeClass('selected');
        $(this).addClass('selected');
    });
    $(".multiple-form-one .submit").click(function(){
        return false;
    })

});