

function init() {
    $(document).ready(function() {
        
        $("#select-slots").hide();
        
    });
}

 /* attach a submit handler to the form */
$("#bookingform").submit(function(event) {

    /* stop form from submitting normally */
    event.preventDefault();

    /* get some values from elements on the page: */
    var $form = $(this),
        date = $form.find('input[name="date"]').val(),
        starttime = $form.find('input[name="starttime"]').val(),
        hours = $form.find('input[name="hours"]').val(),
        category = $form.find('input[name="category"]').val(),
        vehicle = $form.find('select[name="vehicle"]').val(),
        url = $form.attr('action');

    /* Send the data using post */
    var posting = $.post(url, {
        date: date,
        starttime: starttime,
        hours: hours,
        category: category,
        vehicle: vehicle
    });

    /* Put the results in a div */
    posting.done(function(data) {
        showSlots();
    });
});


function showSlots() {
    $(document).ready(function() {
        $("#select-slots").slideDown(100);
    });
}



