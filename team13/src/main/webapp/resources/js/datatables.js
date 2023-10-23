$(document).ready( function () {
    let $table = $('#myTable').DataTable({
    //search 창 오른쪽 상단으로 이동
    "dom": '<"top"i>rt<"bottom"flp><"clear">',

    pageLength : 10,
    order: [[0, 'desc']], // 0번째 컬럼을 기준으로 내림차순 정렬
    info: false,
    lengthChange: false, // show entries 제거
    language: {
    emptyTable: '등록된 게시글(이)가 없습니다.'
    }
    });

$('.dataTables_paginate').css({
    'textAlign':'center',
    'float': 'none',
    'margin-top':'10px',
});

$('.dataTables_filter').remove();  // dataTable 자체 search input 없애기

$('.select_filter').change(function () { // select 선택값에 따라  해당 선택 열 input이 검색하는곳 변경
        $table.columns('').search('').draw();
        $table.columns(Number($('.select_filter').val())).search($('.search_filter').val()).draw();
    });

$('.search_filter').keyup(function () { //input의 값대로 search
        let $value = $(this).val();
        $table.columns(Number($('.select_filter').val())).search($value).draw();
    })
});