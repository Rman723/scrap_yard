$(function () {
    function display(bool) {
        if (bool) {
            $("#container").show();
        } else {
            $("#container").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })
    // if the person uses the escape key, it will exit the resource
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('http://scrap_yard/exit', JSON.stringify({}));
            return
        }
    };
    $("#close").click(function () {
        $.post('http://scrap_yard/exit', JSON.stringify({}));
        return
    })
    $("#give").click(function () {
        $.post('http://scrap_yard/gi', JSON.stringify({}));
        return
    })
    $("#give2").click(function () {
        $.post('http://scrap_yard/gi2', JSON.stringify({}));
        return
    })
    $("#give3").click(function () {
        $.post('http://scrap_yard/gi3', JSON.stringify({}));
        return
    })
    $("#give4").click(function () {
        $.post('http://scrap_yard/gi4', JSON.stringify({}));
        return
    })
    $("#give5").click(function () {
        $.post('http://scrap_yard/gi5', JSON.stringify({}));
        return
    })
    $("#give6").click(function () {
        $.post('http://scrap_yard/gi6', JSON.stringify({}));
        return
    })
    $("#give7").click(function () {
        $.post('http://scrap_yard/gi7', JSON.stringify({}));
        return
    })
    $("#give8").click(function () {
        $.post('http://scrap_yard/gi8', JSON.stringify({}));
        return
    })
    $("#sell").click(function () {
        $.post('http://scrap_yard/s1', JSON.stringify({}));
        return
    })

})
