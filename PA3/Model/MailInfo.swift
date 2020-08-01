//
//  MailInfo.swift
//  PA3
//
//  Created by SHIN YOON AH on 2020/07/31.
//  Copyright © 2020 SHIN YOON AH. All rights reserved.
//

import UIKit

struct MailInfo {
    var title: String
    var content: String
    var documents: String?
    var isRead: Bool = false
}

extension MailInfo {
    static var mailInfo: [MailInfo] = [
        MailInfo(title: "신윤아", content: "안녕하세요 어쩌구 저쩌구 반갑습니다. 저는 여러분과 함께 그룹과외를 하고 있는 신윤아라고 합니다. 혹시 이 메일을 보신다면 답신 부탁드리겠습니다. 다들 방학 잘 보내시고 안녕히계십셔~~", documents: "발표기획"),
        MailInfo(title: "한국장학재단", content: "귀하가 첨부하신 자료에 문제가 생겨 연락드립니다. 보시면 답신 부탁드리겠습니다. 감사합니다.", documents: "첨부자료"),
        MailInfo(title: "Todoist", content: "당신의 할일 목록을 그만 미워하는 5가지 방법 체계적으로 일하는 것에 어려움이 있다면, 저희의 인기 블로그 게시물, 당신의 할일 목록을 그만 미워하기 위한 5가지 방법에서 다음의 신속하고 실행 가능한 팁과 유용한 정보를 얻으세요:", documents: nil, isRead: true),
        MailInfo(title: "유니티코리아", content: "안녕하세요,유니티 코리아에서는 실시간 단말 발열과 게임 성능을 추적하여 전류와 게임 품질을 동적으로 조절하여 안정적인 성능을 유지하고 유저의 게임 만족도를 높일 수 있는 방법, Adaptive Performance를 7월 30일(목) 오후 4시, 삼성전자 GameDev 담당자와 함께 웨비나를 통해 소개합니다. 모바일 단말에서 고사양 게임을 개발 중이라면, 성능 저하로 고민중인 개발자라면 꼭 확인하세요.", documents: nil),
        MailInfo(title: "넥슨", content: "넥슨 회원가입을 축하합니다. 가입하신 넥슨ID를 확인해주세요.", documents: nil),
        MailInfo(title: "Google Play", content: "감사합니다 Google Play의 Kakao Corp.에서 구매하셨습니다. 주문 번호: GPA.3386-2875-2147-65283 주문 날짜: 2020. 6. 29. 오후 5시 1분 13초 GMT+9", documents: "주문 영수증"),
        MailInfo(title: "YouTube <noreply-purchases@youtube.com>", content: "윤아님, 안녕하세요. YouTube Premium 멤버십의 최근 결제를 완료하지 못했습니다. 며칠 내에 다시 청구될 예정이지만 결제가 완료되지 않으면 YouTube Premium를 더 이상 이용할 수 없게 됩니다. 지금 결제 수단 업데이트", documents: nil, isRead: true),
        MailInfo(title: "YouTube", content: "윤아님, 안녕하세요. YouTube Premium 멤버십의 최근 결제를 완료하지 못했습니다. 며칠 내에 다시 청구될 예정이지만 결제가 완료되지 않으면 YouTube Premium를 더 이상 이용할 수 없게 됩니다. 지금 결제 수단 업데이트", documents: "membership"),
        MailInfo(title: "무신사", content: "무신사 20% 할인 쿠폰 지급", documents: "안녕하세요.여러분 20% 할인 쿠폰입니다. 안녕하세요"),
        MailInfo(title: "신윤아", content: "안녕하세요 어쩌구 저쩌구 반갑습니다. 저는 여러분과 함께 그룹과외를 하고 있는 신윤아라고 합니다. 혹시 이 메일을 보신다면 답신 부탁드리겠습니다. 다들 방학 잘 보내시고 안녕히계십셔~~", documents: "발표기획"),
        MailInfo(title: "한국장학재단", content: "귀하가 첨부하신 자료에 문제가 생겨 연락드립니다. 보시면 답신 부탁드리겠습니다. 감사합니다.", documents: "첨부자료"),
        MailInfo(title: "Todoist", content: "당신의 할일 목록을 그만 미워하는 5가지 방법 체계적으로 일하는 것에 어려움이 있다면, 저희의 인기 블로그 게시물, 당신의 할일 목록을 그만 미워하기 위한 5가지 방법에서 다음의 신속하고 실행 가능한 팁과 유용한 정보를 얻으세요:", documents: nil),
        MailInfo(title: "유니티코리아", content: "안녕하세요,유니티 코리아에서는 실시간 단말 발열과 게임 성능을 추적하여 전류와 게임 품질을 동적으로 조절하여 안정적인 성능을 유지하고 유저의 게임 만족도를 높일 수 있는 방법, Adaptive Performance를 7월 30일(목) 오후 4시, 삼성전자 GameDev 담당자와 함께 웨비나를 통해 소개합니다. 모바일 단말에서 고사양 게임을 개발 중이라면, 성능 저하로 고민중인 개발자라면 꼭 확인하세요.", documents: nil),
        MailInfo(title: "넥슨", content: "넥슨 회원가입을 축하합니다. 가입하신 넥슨ID를 확인해주세요.", documents: nil),
        MailInfo(title: "Google Play", content: "감사합니다 Google Play의 Kakao Corp.에서 구매하셨습니다. 주문 번호: GPA.3386-2875-2147-65283 주문 날짜: 2020. 6. 29. 오후 5시 1분 13초 GMT+9", documents: "주문 영수증", isRead: true),
        MailInfo(title: "YouTube <noreply-purchases@youtube.com>", content: "윤아님, 안녕하세요. YouTube Premium 멤버십의 최근 결제를 완료하지 못했습니다. 며칠 내에 다시 청구될 예정이지만 결제가 완료되지 않으면 YouTube Premium를 더 이상 이용할 수 없게 됩니다. 지금 결제 수단 업데이트", documents: nil),
        MailInfo(title: "YouTube", content: "윤아님, 안녕하세요. YouTube Premium 멤버십의 최근 결제를 완료하지 못했습니다. 며칠 내에 다시 청구될 예정이지만 결제가 완료되지 않으면 YouTube Premium를 더 이상 이용할 수 없게 됩니다. 지금 결제 수단 업데이트", documents: "membership"),
        MailInfo(title: "무신사", content: "무신사 20% 할인 쿠폰 지급", documents: nil)
    ]
}
