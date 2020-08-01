//
//  UserInfo.swift
//  PA3
//
//  Created by SHIN YOON AH on 2020/07/26.
//  Copyright © 2020 SHIN YOON AH. All rights reserved.
//

import UIKit

struct UserInfo {
    var profileImage : UIImage? = UIImage(named: "bluePerson")
    var userName : String
    var statusMessage : String?
    var profileMusic : String?
}

extension UserInfo {
    static var myInfo: UserInfo = UserInfo(profileImage: UIImage(named: "person2"), userName: "신윤아", statusMessage: "안녕", profileMusic: "juice")
    
    static var friendInfo: [UserInfo] = [
        UserInfo(profileImage: UIImage(named: "person3"), userName: "뽀로로", statusMessage: "노는게 제일 좋아", profileMusic: "아기상어"),
        UserInfo(profileImage: UIImage(named: "person4"), userName: "루피", statusMessage: "짱난다", profileMusic: "깡"),
        UserInfo(profileImage: UIImage(named: "person5"), userName: "크롱크롱크로로로롱크로로롱크롱크로로롱", statusMessage: "크롱?", profileMusic: "아아아아아ㅏ아아아아아아ㅇ아아ㅏ아앙아ㅏㅇ아ㅏ아아아아아아ㅏㅏㅏㅏㅏ아아ㅏ아아아아아ㅏ아아아아아ㅏ"),
        UserInfo(profileImage: UIImage(named: "person6"), userName: "에디", statusMessage: nil, profileMusic: nil),
        UserInfo(profileImage: UIImage(named: "person7"), userName: "안녕하세요고구마1kg에10000원입니다.", statusMessage: "고구마사세요. 맛난 고구마 고구마 짱맛", profileMusic: "감자돌이"),
        UserInfo(profileImage: UIImage(named: "person8"), userName: "해리포터", statusMessage: "귀찮다", profileMusic: "딴따라딴딴 따라 딴따라 딴딴딴"),
        UserInfo(profileImage: UIImage(named: "person3"), userName: "뽀로로", statusMessage: "노는게 제일 좋아", profileMusic: "아기상어"),
        UserInfo(profileImage: UIImage(named: "person4"), userName: "루피", statusMessage: "짱난다", profileMusic: "깡"),
        UserInfo(profileImage: UIImage(named: "person5"), userName: "크롱크롱크로로로롱크로로롱크롱크로로롱", statusMessage: "크롱?", profileMusic: "시끄러"),
        UserInfo(profileImage: UIImage(named: "person6"), userName: "에디", statusMessage: nil, profileMusic: nil),
        UserInfo(profileImage: UIImage(named: "person7"), userName: "안녕하세요고구마1kg에10000원입니다.", statusMessage: nil, profileMusic: "감자돌이"),
        UserInfo(profileImage: UIImage(named: "person8"), userName: "해리포터", statusMessage: "귀찮다", profileMusic: nil),
        UserInfo(profileImage: UIImage(named: "person3"), userName: "뽀로로", statusMessage:  nil, profileMusic: "아기상어"),
        UserInfo(profileImage: UIImage(named: "person4"), userName: "루피", statusMessage: "짱난다", profileMusic: nil),
        UserInfo(profileImage: UIImage(named: "person5"), userName: "크롱크롱크로로로롱크로로롱크롱크로로롱", statusMessage: "크롱?", profileMusic: "시끄러"),
        UserInfo(profileImage: UIImage(named: "person6"), userName: "에디", statusMessage: nil, profileMusic: nil),
        UserInfo(profileImage: UIImage(named: "person7"), userName: "고구마", statusMessage: nil, profileMusic: "감자돌이"),
        UserInfo(profileImage: UIImage(named: "person8"), userName: "해리포터", statusMessage: "귀찮다", profileMusic: "딴따라딴딴 따라 딴따라 딴딴딴"),
        UserInfo(profileImage: UIImage(named: "person3"), userName: "뽀로로", statusMessage: "노는게 제일 좋아", profileMusic: "아기상어"),
        UserInfo(profileImage: UIImage(named: "person4"), userName: "루피", statusMessage: "짱난다", profileMusic: "깡"),
        UserInfo(profileImage: UIImage(named: "person5"), userName: "크롱크롱크로로로롱크로로롱크롱크로로롱", statusMessage: nil, profileMusic: "시끄러"),
        UserInfo(profileImage: UIImage(named: "person6"), userName: "에디", statusMessage: nil, profileMusic: nil),
        UserInfo(profileImage: UIImage(named: "person7"), userName: "안녕하세요고구마1kg에10000원입니다.이이이이이이이이이이이이ㅣ이이잉이ㅣ잉이이이ㅣ잉이ㅣㅇ이이ㅣ이이이잉이이ㅣㅣㅇ이", statusMessage: "고구마사세요. 맛난 고구마 고구마 짱맛", profileMusic: nil),
        UserInfo(profileImage: UIImage(named: "person8"), userName: "해리포터", statusMessage: "귀찮다", profileMusic: "딴따라딴딴 따라 딴따라 딴딴딴"),
        UserInfo(profileImage: UIImage(named: "person3"), userName: "뽀로로", statusMessage: "노는게 제일 좋아", profileMusic: "아기상어"),
        UserInfo(profileImage: UIImage(named: "person4"), userName: "루피", statusMessage: "짱난다", profileMusic: "깡"),
        UserInfo(profileImage: UIImage(named: "person5"), userName: "크롱크롱크로로로롱크로로롱크롱크로로롱", statusMessage: "크롱?", profileMusic: "아아아아아ㅏ아아아아아아ㅇ아아ㅏ아앙아ㅏㅇ아ㅏ아아아아아아ㅏㅏㅏㅏㅏ아아ㅏ아아아아아ㅏ아아아아아ㅏ"),
        UserInfo(profileImage: UIImage(named: "person6"), userName: "에디", statusMessage: nil, profileMusic: nil),
        UserInfo(profileImage: UIImage(named: "person7"), userName: "안녕하세요고구마1kg에10000원입니다.", statusMessage: "고구마사세요. 맛난 고구마 고구마 짱맛", profileMusic: "감자돌이"),
        UserInfo(profileImage: UIImage(named: "person8"), userName: "해리포터", statusMessage: "귀찮다", profileMusic: "딴따라딴딴 따라 딴따라 딴딴딴"),
        UserInfo(profileImage: UIImage(named: "person3"), userName: "뽀로로", statusMessage: "노는게 제일 좋아", profileMusic: "아기상어"),
        UserInfo(profileImage: UIImage(named: "person4"), userName: "루피", statusMessage: "짱난다", profileMusic: "깡"),
        UserInfo(profileImage: UIImage(named: "person5"), userName: "크롱크롱크로로로롱크로로롱크롱크로로롱", statusMessage: "크롱?", profileMusic: "시끄러"),
        UserInfo(profileImage: UIImage(named: "person6"), userName: "에디", statusMessage: nil, profileMusic: nil),
        UserInfo(profileImage: UIImage(named: "person7"), userName: "안녕하세요고구마1kg에10000원입니다.", statusMessage: nil, profileMusic: "감자돌이"),
        UserInfo(profileImage: UIImage(named: "person8"), userName: "해리포터", statusMessage: "귀찮다", profileMusic: nil),
        UserInfo(profileImage: UIImage(named: "person3"), userName: "뽀로로", statusMessage:  nil, profileMusic: "아기상어"),
        UserInfo(profileImage: UIImage(named: "person4"), userName: "루피", statusMessage: "짱난다", profileMusic: nil),
        UserInfo(profileImage: UIImage(named: "person5"), userName: "크롱크롱크로로로롱크로로롱크롱크로로롱", statusMessage: "크롱?", profileMusic: "시끄러"),
        UserInfo(profileImage: UIImage(named: "person6"), userName: "에디", statusMessage: nil, profileMusic: nil),
        UserInfo(profileImage: UIImage(named: "person7"), userName: "고구마", statusMessage: nil, profileMusic: "감자돌이"),
        UserInfo(profileImage: UIImage(named: "person8"), userName: "해리포터", statusMessage: "귀찮다", profileMusic: "딴따라딴딴 따라 딴따라 딴딴딴"),
        UserInfo(profileImage: UIImage(named: "person3"), userName: "뽀로로", statusMessage: "노는게 제일 좋아", profileMusic: "아기상어"),
        UserInfo(profileImage: UIImage(named: "person4"), userName: "루피", statusMessage: "짱난다", profileMusic: "깡"),
        UserInfo(profileImage: UIImage(named: "person5"), userName: "크롱크롱크로로로롱크로로롱크롱크로로롱", statusMessage: nil, profileMusic: "시끄러"),
        UserInfo(profileImage: UIImage(named: "person6"), userName: "에디", statusMessage: nil, profileMusic: nil),
        UserInfo(profileImage: UIImage(named: "person7"), userName: "안녕하세요고구마1kg에10000원입니다.이이이이이이이이이이이이ㅣ이이잉이ㅣ잉이이이ㅣ잉이ㅣㅇ이이ㅣ이이이잉이이ㅣㅣㅇ이", statusMessage: "고구마사세요. 맛난 고구마 고구마 짱맛", profileMusic: nil),
        UserInfo(profileImage: UIImage(named: "person8"), userName: "해리포터", statusMessage: "귀찮다", profileMusic: "딴따라딴딴 따라 딴따라 딴딴딴")
        
    ]
}
