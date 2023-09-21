$(function(){
    $(".btn_box li .vs_btn").click(function(){
        var par = $(this).parents("li").index();
        $(".img_box li").removeClass("active");
        $(".img_box li").eq(par).addClass("active");
        $(".btn_box li").removeClass("active");
        $(".btn_box li").eq(par).addClass("active");
    });
    var sw = 1;
    var int1 = setInterval(function(){
        if(sw==1){
            autoplay(1);
            sw = 0;
        } else {
            autoplay(0);
            sw = 1;
        }
    }, 4500);

    function autoplay(n){
        $(".img_box li").removeClass("active");
        $(".img_box li").eq(n).addClass("active");
        $(".btn_box li").removeClass("active");
        $(".btn_box li").eq(n).addClass("active");
    }

    $(".play_btn").click(function(){
        if($(this).hasClass("active")){
            $(this).removeClass("active");
            sw = 1;
            int1 = setInterval(function(){
                if(sw==1){
                    autoplay(1);
                    sw = 0;
                } else {
                    autoplay(0);
                    sw = 1;
                }
            }, 3500);
        } else {
            $(this).addClass("active");
            sw = 0;
            clearInterval(int1);
        }
    });
});    