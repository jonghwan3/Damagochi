//
//  DamagochiInfo.swift
//  Damagochi
//
//  Created by 박종환 on 2022/07/23.
//

import Foundation
import UIKit

enum DamagochiKind: Int {
    case dagum = 1
    case bangsil = 2
    case banjack =  3
    case notready = 0
    
    func damagochiName() -> String {
        switch self {
        case .dagum : return "따끔따끔 다마고치"
        case .bangsil : return "방실방실 다마고치"
        case .banjack : return "반짝반짝 다마고치"
        case .notready : return "준비중이예요"
        }
    }
    
    func damagochiDescript() -> String {
        switch self {
        case .dagum : return "저는 따끔따금 다마고치입니당\n 키는 적당히 크구요.몸무게는 수분이 없어 다른 다마고치보다는 조금 나가요\n성격은 세심한 편이라 자기방어가 있답니다.\n밥알과 물을 잘 주시면, 점점 커가는 저의 모습을 보실 수 있을거예요~!"
        case .bangsil : return "저는 방실방실 다마고치입니당\n키는 제일 크구요. 몸무게는 다른 다마고치보다 제가 더 나가요 ㅎㅎ\n성격은 화끈하고 날라다니답니당~!\n열심히 잘 먹고 잘 클 자신은 있답니당 방실방실!"
        case .banjack : return "저는 반짝반짝 다마고치입니당\n 키와 몸무게는 적당해요 ㅎㅎ\n성격은 차분하고 온화합니다. \n밥알과 물을 잘 주시면, 점점 커가는 저의 모습을 보실 수 있을거예요~!"
        case .notready : return "준비중이예요"
        }
    }
    
    func initialImage() -> UIImage? {
        if self == .notready {
            return UIImage(named: "noImage")
        } else {
            return UIImage(named: "\(self.rawValue)-6")
        }
    }
    
}

struct Damagochi {
    var damagochiKind: DamagochiKind
    var rice: Int
    var water: Int
    
    func getLevel() -> Int {
        let number: Double = (Double(rice) / 5) + (Double(water) / 2)
        if number >= 0 && number < 10 {
            return 1
        } else if number >= 10 && number < 20 {
            return 1
        } else if number >= 20 && number < 30 {
            return 2
        } else if number >= 30 && number < 40 {
            return 3
        } else if number >= 40 && number < 50 {
            return 4
        } else if number >= 50 && number < 60 {
            return 5
        } else if number >= 60 && number < 70 {
            return 6
        } else if number >= 70 && number < 80 {
            return 7
        } else if number >= 80 && number < 90 {
            return 8
        } else if number >= 90 && number < 100 {
            return 9
        } else if number >= 100 {
            return 10
        }
        return 0
    }
    
    mutating func levelImage() -> UIImage? {
        return UIImage(named: "\(damagochiKind.rawValue)-\(getLevel())")
    }
}

struct DamagochiInfo {
    let damagochiList: [Damagochi] = [
        Damagochi(damagochiKind: .dagum, rice: 0, water: 0),
        Damagochi(damagochiKind: .bangsil, rice: 0, water: 0),
        Damagochi(damagochiKind: .banjack, rice: 0, water: 0),
        Damagochi(damagochiKind: .notready, rice: 0, water: 0),
        Damagochi(damagochiKind: .notready, rice: 0, water: 0),
        Damagochi(damagochiKind: .notready, rice: 0, water: 0),
        Damagochi(damagochiKind: .notready, rice: 0, water: 0),
        Damagochi(damagochiKind: .notready, rice: 0, water: 0),
        Damagochi(damagochiKind: .notready, rice: 0, water: 0),
        Damagochi(damagochiKind: .notready, rice: 0, water: 0),
        Damagochi(damagochiKind: .notready, rice: 0, water: 0),
        Damagochi(damagochiKind: .notready, rice: 0, water: 0),
        Damagochi(damagochiKind: .notready, rice: 0, water: 0),
        Damagochi(damagochiKind: .notready, rice: 0, water: 0),
        Damagochi(damagochiKind: .notready, rice: 0, water: 0),
        Damagochi(damagochiKind: .notready, rice: 0, water: 0),
        Damagochi(damagochiKind: .notready, rice: 0, water: 0),
        Damagochi(damagochiKind: .notready, rice: 0, water: 0),
        Damagochi(damagochiKind: .notready, rice: 0, water: 0),
        Damagochi(damagochiKind: .notready, rice: 0, water: 0)
    ]
}
