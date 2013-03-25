$(document).ready(function() {
    $('#images').refineSlide({
        transition : 'cubeV',
        onInit : function () {
            var slider = this.slider;
        },
        controls : 'arrows'
    });
    $('#forms').refineSlide({
        transition : 'cubeV',
        onInit : function () {
            var slider = this.slider;
        },
        controls : 'arrows'
    });
    var width = window.innerWidth;
    $(".rs-slide-bg").css("width","560px");
    $('#forms').parent().parent().css("margin-left", width*0.50);
});