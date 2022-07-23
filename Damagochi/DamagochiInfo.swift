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
    lazy var level = rice * water
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
