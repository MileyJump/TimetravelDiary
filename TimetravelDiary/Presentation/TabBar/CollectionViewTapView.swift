//
//  CollectionViewTapView.swift
//  TimetravelDiary
//
//  Created by 최민경 on 9/21/24.
//
import SwiftUI

enum TapInfo: String, CaseIterable {
    case diary = "diary"
    case memo = "memo"
    case album = "album"
    
    // 각 항목에 대해 로컬라이징된 문자열 반환
    func localizedString() -> String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}

struct CollectionViewTapView: View {
    @State private var selectedPicker: TapInfo = .diary // 기본 선택된 버튼

    var body: some View {
        VStack {
            // 버튼을 가로로 배치
            HStack(spacing: 15) { // 버튼 간의 간격을 조절
                ForEach(TapInfo.allCases, id: \.self) { item in
                    Button(action: {
                        selectedPicker = item // 클릭된 버튼 업데이트
                    }) {
                        Text(item.localizedString()) // 로컬라이즈된 값 사용
                            .padding()
                            .frame(maxWidth: .infinity, minHeight: 40) // 버튼의 가로 크기를 최대화하고 최소 높이를 설정
                            .background(Color.clear) // 배경 설정
                            .foregroundColor(selectedPicker == item ? Color.white : Color.white) // 텍스트 색상 변경
                            .cornerRadius(20) // 캡슐 모양으로 둥글게
                            .overlay(
                                selectedPicker == item ? // 선택된 버튼에 테두리 추가
                                Capsule().stroke(
                                        LinearGradient(
                                            gradient: Gradient(colors: [Diary.color.timeTravelBlueColor, Diary.color.timeTravelBlueColor, Color.white]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        ),
                                        lineWidth: 4
                                    ) : nil
                            )
                            .shadow(color: selectedPicker == item ? Diary.color.timeTravelGreenColor.opacity(0.8) : Color.white, radius: 10, x: 0, y: 0)
                            .shadow(color: selectedPicker == item ? Diary.color.timeTravelLightPinkColor.opacity(0.6) : Color.clear, radius: 20, x: 0, y: 0)
                            .shadow(color: selectedPicker == item ? Diary.color.timeTravelLightPinkColor.opacity(0.4) : Color.clear, radius: 30, x: 0, y: 0)
                            .animation(.easeInOut, value: selectedPicker) // 애니메이션 추가
                    }
                }
            }
            .padding(.horizontal, 25)
            .padding(.top, 20)
            
            // 선택된 버튼에 따라 화면 내용 변경
            Spacer()
            switch selectedPicker {
            case .album:
                Spacer(minLength: 20)
                AlbumView()
            case .diary:
                Spacer(minLength: 20)
                DiaryCollectionView()
            case .memo:
                Spacer(minLength: 20)
                MemoCollectionView()
            }
            Spacer()
        }
        .gradientBackground(startColor: Diary.color.timeTravelBlackColor, mediumColor: Diary.color.timeTravelLightBlackColor, endColor: Diary.color.timeTravelDarkNavyBlackColor, starCount: 120)
    }
}

#Preview {
    CollectionViewTapView()
}
