$(document).ready(function(){
    var start = 5;

    $(".boardlist1").slice(5).hide();
    $(".boardlist2").slice(5).hide();
    $(".boardlist3").slice(5).hide();
    $(".boardlist4").slice(5).hide();
    $(".boardlist5").slice(5).hide();
    $(".boardlist6").slice(5).hide();
    $(".boardlist7").slice(5).hide();

    $("#check11").click(function(e){
        e.preventDefault();
        start += 5;
        $(".boardlist1").slice(0,start).show();

        if($(".boardlist1").length <= start){
            $(".error11").html("더이상 표시할 내용이 없습니다.");
        };
    });
    $("#check12").click(function(e){
        e.preventDefault();
        start += 5;
        $(".boardlist2").slice(0,start).show();

        if($(".boardlist2").length <= start){
            $(".error12").html("더이상 표시할 내용이 없습니다.");
        };
    });
    $("#check13").click(function(e){
        e.preventDefault();
        start += 5;
        $(".boardlist3").slice(0,start).show();

        if($(".boardlist3").length <= start){
            $(".error13").html("더이상 표시할 내용이 없습니다.");
        };
    });
    $("#check14").click(function(e){
        e.preventDefault();
        start += 5;
        $(".boardlist4").slice(0,start).show();

        if($(".boardlist4").length <= start){
            $(".error14").html("더이상 표시할 내용이 없습니다.");
        };
    });
    $("#check15").click(function(e){
        e.preventDefault();
        start += 5;
        $(".boardlist5").slice(0,start).show();

        if($(".boardlist5").length <= start){
            $(".error15").html("더이상 표시할 내용이 없습니다.");
        };
    });
    $("#check16").click(function(e){
        e.preventDefault();
        start += 5;
        $(".boardlist6").slice(0,start).show();

        if($(".boardlist6").length <= start){
            $(".error16").html("더이상 표시할 내용이 없습니다.");
        };
    });
    $("#check17").click(function(e){
        e.preventDefault();
        start += 5;
        $(".boardlist7").slice(0,start).show();

        if($(".boardlist7").length <= start){
            $(".error17").html("더이상 표시할 내용이 없습니다.");
        };
    });
    $(".commentlist1").slice(5).hide();
    $(".commentlist2").slice(5).hide();
    $(".commentlist3").slice(5).hide();
    $(".commentlist4").slice(5).hide();
    $(".commentlist5").slice(5).hide();
    $(".commentlist6").slice(5).hide();
    $(".commentlist7").slice(5).hide();

    $("#check21").click(function(e){
        e.preventDefault();
        start += 5;
        $(".commentlist1").slice(0,start).show();

        if($(".commentlist1").length <= start){
            $(".error21").html("더이상 표시할 내용이 없습니다.");
        };
    });
    $("#check22").click(function(e){
        e.preventDefault();
        start += 5;
        $(".commentlist2").slice(0,start).show();

        if($(".commentlist2").length <= start){
            $(".error22").html("더이상 표시할 내용이 없습니다.");
        };
    });
    $("#check23").click(function(e){
        e.preventDefault();
        start += 5;
        $(".commentlist3").slice(0,start).show();

        if($(".commentlist3").length <= start){
            $(".error23").html("더이상 표시할 내용이 없습니다.");
        };
    });
    $("#check24").click(function(e){
        e.preventDefault();
        start += 5;
        $(".commentlist4").slice(0,start).show();

        if($(".commentlist4").length <= start){
            $(".error24").html("더이상 표시할 내용이 없습니다.");
        };
    });
    $("#check25").click(function(e){
        e.preventDefault();
        start += 5;
        $(".commentlist5").slice(0,start).show();

        if($(".commentlist5").length <= start){
            $(".error25").html("더이상 표시할 내용이 없습니다.");
        };
    });
    $("#check26").click(function(e){
        e.preventDefault();
        start += 5;
        $(".commentlist6").slice(0,start).show();

        if($(".commentlist6").length <= start){
            $(".error26").html("더이상 표시할 내용이 없습니다.");
        };
    });
    $("#check27").click(function(e){
        e.preventDefault();
        start += 5;
        $(".commentlist7").slice(0,start).show();

        if($(".commentlist7").length <= start){
            $(".error27").html("더이상 표시할 내용이 없습니다.");
        };
    });
});