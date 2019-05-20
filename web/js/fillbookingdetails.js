

function init() {
    $(document).ready(function() {
        
        $("#select-slots").hide();
        
    });
}

 /* attach a submit handler to the form */
$("#bookingform").submit(function(event) {
    
    hideSlots();
    
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
        
    var location = window.location.href.slice(window.location.href.indexOf('?') + 1).split('=')[1];

    /* Send the data using post */
    var posting = $.post(
        url, 
        {
            date: date,
            starttime: starttime,
            hours: hours,
            category: category,
            vehicle: vehicle,
            location: location
        },
        showSlots,
        'json'
    );
});


function showSlots(data) {
    data.forEach(function(item) {
        $("#slot-"+item).addClass("slot-disabled");
    });
    
    $(document).ready(function() {
        $("#select-slots").fadeIn(100);
    });
}

function hideSlots() {
    $(document).ready(function() {
        $("#select-slots").fadeOut(100);
    });
}

$(".slot").on('click', function(event){
    if(!$(this).hasClass("slot-disabled")) {
        if($(this).hasClass("slot-selected")) {
            $(this).removeClass("slot-selected");
        } else {
            $(".slot").removeClass("slot-selected");
            $(this).addClass("slot-selected");
        }
    }
});



