package kr.co.teaspoon.util;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class Week {
    public List<String> getDate() {
        // 오늘 날짜 가져오기
        LocalDate today = LocalDate.now();

        List<String> date = new ArrayList<>();

        // 이번 주의 월요일 날짜 계산
        LocalDate monday = today;
        while (monday.getDayOfWeek() != DayOfWeek.MONDAY) {
            monday = monday.minusDays(1);
        }

        // 이번 주의 금요일 날짜 계산
        LocalDate friday = today;
        while (friday.getDayOfWeek() != DayOfWeek.FRIDAY) {
            friday = friday.plusDays(1);
        }

        // 날짜를 yyyyMMdd 형식으로 포맷팅
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
        String todayFormatted = today.format(formatter);
        String mondayFormatted = monday.format(formatter);
        String fridayFormatted = friday.format(formatter);

        // 결과 출력
        System.out.println("오늘 날짜: " + todayFormatted);
        System.out.println("이번 주 월요일: " + mondayFormatted);
        System.out.println("이번 주 금요일: " + fridayFormatted);

        // 저번 주 월요일과 금요일 날짜 계산
        LocalDate lastMonday = monday.minusWeeks(1);
        LocalDate lastFriday = friday.minusWeeks(1);
        String lastMondayFormatted = lastMonday.format(formatter);
        String lastFridayFormatted = lastFriday.format(formatter);

        // 결과 출력
        System.out.println("저번 주 월요일: " + lastMondayFormatted);
        System.out.println("저번 주 금요일: " + lastFridayFormatted);
        date.add(lastMondayFormatted);
        date.add(lastFridayFormatted);
        return date;
    }
}
