//
//  HomeCalendarView.swift
//  TimetravelDiary
//
//  Created by 최민경 on 9/14/24.
//

import SwiftUI
import SwiftData

struct HomeCalendarView: View {
    
    @Query var diaryModels: [DiaryModel]
    @State private var selectedDate: Date? = Date()
    @State private var isPopupVisible: Bool = false
    
    
    var body: some View {
        // 얘를 없애면 일기작성 화면에서 갤러리 버튼 클릭시 뒤로감 ㅠ
        NavigationView {
            ZStack {

                if isPopupVisible {
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            isPopupVisible = false
                        }
                }
                    CalendarView(month: Date(), selectedDate: $selectedDate, isPopupVisible: $isPopupVisible)
                        .frame(width: 380, height: 200)
                        .offset(y: -80)  // 캘린더 뷰 위치 조정
                    
                    FloatingMenu(selectedDate: $selectedDate)
                        .padding(.bottom, 100)
                        .padding(.leading, 260)
            }
            .gradientBackground(startColor: Diary.color.timeTravelNavyColor, mediumColor:  Diary.color.timeTravelNavyColor, endColor: Diary.color.timeTravelPurpleColor, starCount: 100)
        }
    }
}

#Preview {
    HomeCalendarView()
}
