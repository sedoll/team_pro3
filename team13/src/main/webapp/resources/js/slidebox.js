$(function(){
    $(".sl-btn-box .btn.next").click(function(){
        var ln = parseInt($(".card_lst").css("margin-left"));
        if(ln>-1480) {
            var mv = ln - 370;
            $(".card_lst").not(":animated").animate({"margin-left":mv+"px"});
        }
    });
    $(".sl-btn-box .btn.prev").click(function(){
        var ln = parseInt($(".card_lst").css("margin-left"));
        if(ln<0){
            var mv = ln + 370;
            $(".card_lst").not(":animated").animate({"margin-left":mv+"px"});
        }
    });
});  