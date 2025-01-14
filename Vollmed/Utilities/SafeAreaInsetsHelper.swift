//
//  SafeAreaInsetsHelper.swift
//  Vollmed
//
//  Created by Caio Mori on 14/01/25.
//

import UIKit

struct SafeAreaInsetsHelper {
    /// Calcula a área segura inferior para posicionar o Snackbar
    static func safeAreaBottomInset() -> CGFloat {
        UIApplication.shared.getKeyWindow?.safeAreaInsets.bottom ?? 0
    }
}
