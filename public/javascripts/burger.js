$(function(){

    $('.fas.fa-bars').on('click', function() {
       $('.dropdown-child2').slideToggle(300, function(){
            if( $(this).css('display') === "none"){
                $(this).removeAttr('style');
            }
       });

    });

});