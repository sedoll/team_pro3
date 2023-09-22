$(function(){
    var $slide = $('#slide');
    var $nav = $('.nav').find('li');
    var enableNav = true; //클릭하여 내비게이션 이동 허용 여부(슬라이드 동작 중 클릭되는 것을 방지)
    var speed = 1000;//슬라이드 속도

    $slide.on('init reInit', function (event, slick) {//페이징이니셜
        if(!slick.$dots) return;
        $("#slide_paging").html('<b class="page">'+ (slick.currentSlide+1) +'</b> / ' + (slick.$dots[0].children.length));
    }).on('beforeChange', function(event, slick, currentSlide, nextSlide){ //슬라이드 변경 시 내비 및 페이징 변경
        //내비 변경
        if(enableNav){
            $nav.removeClass("on");
            $nav.eq(nextSlide).addClass("on");
            navStatus();
        }
        //페이징 변경
        if(!slick.$dots) return;
        var i = (nextSlide ? nextSlide : 0) + 1;
        $("#slide_paging").find(".page").text(i);
    });

    function navStatus(){ //슬라이드 동작 중 내비클릭 방지
        enableNav = false;
        setTimeout(function() {
            enableNav = true;
        }, speed);
    }

    $nav.on("click", function(){ //내비 클릭시 해당 인덱스로 이동
        if(enableNav){
            var slideNo = $(this).index();
            $slide.slick('slickGoTo', slideNo);
            $nav.removeClass("on");
            $(this).addClass("on")
            $("#slide_paging").find(".page").text(slideNo +1);
            navStatus();
        }
    });

    $slide.slick({
        arrows: true,
        prevArrow: '<button class="slide-arrow prev-arrow"><</button>',
        nextArrow: '<button class="slide-arrow next-arrow">></button>',
        dots: true,
        infinite: true,
        autoplay:false,
        fade:true,
        speed:speed,
        autoplay:true,
        autoplaySpeed:3000,
        draggable: true
    });
})