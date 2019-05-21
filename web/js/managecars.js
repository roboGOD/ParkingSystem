function addCar() {
    document.getElementById("input-box-form").action = "AddCar";
    $("#input-box-div").find("#form-title").html("Add Car");
    $("#input-box-div").find(".text").prop("value", "");
    toggleInputBox();
}

function editCar(sno, make, model, year, plateno) {
    document.getElementById("input-box-form").action = "EditCar";
    $("#input-box-div").find("#form-title").html("Edit Car Details");
    $("#input-box-div").find("input[name=sno]").prop("value", sno);
    $("#input-box-div").find("input[name=make]").prop("value", make);
    $("#input-box-div").find("input[name=model]").prop("value", model);
    $("#input-box-div").find("input[name=year]").prop("value", year);
    $("#input-box-div").find("input[name=plateno]").prop("value", plateno);
    toggleInputBox();
}

function deleteCar(sno) {
    $("#confirm-box-div").find("#form-title").html("Delete Car Details");
    document.getElementById("confirm-box-form").action = "DeleteCar";
    $("#confirm-box-div").find("input[name=sno]").prop("value", sno);
    toggleConfirmBox();
}

function toggleInputBox() {
    $(document).ready(function() {
        $('#input-box-div').fadeToggle('fast');
    });
}

function toggleConfirmBox() {
    $(document).ready(function() {
        $('#confirm-box-div').fadeToggle('fast');
    });
}