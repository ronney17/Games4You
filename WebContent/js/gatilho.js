$(document).ready(function () {

    $('input[type="radio"]').click(function () {
        if ($(this).attr("value") == "boleto") {
        	$(".Box").hide('slow');
            $(".Box2").show('slow');
        }
        if ($(this).attr("value") == "debito") {
        	$(".Box2").hide('slow');
            $(".Box").show('slow');

        }
        if ($(this).attr("value") == "credito") {
        	$(".Box2").hide('slow');
            $(".Box").show('slow');

        }
    });

    $('input[type="radio"]').trigger('click');  // trigger the event
});