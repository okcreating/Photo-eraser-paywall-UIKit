//
//  UIColor hex extension.swift
//  phoro eraser paywall
//
//  Created by Oksana Kazarinova on 22/11/2024.
//

import UIKit

// Расширение класса UIColor
extension UIColor {

  // Конструктор для инициализации цвета из шестнадцатеричной строки
  convenience init(hex: String, alpha: CGFloat? = nil) {
    // Убираем пробелы и приводим к верхнему регистру
    var hex = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    // Если строка начинается с символа '#', удаляем его
    if hex.hasPrefix("#") {
      hex.remove(at: hex.startIndex)
    }

    var rgbValue: UInt64 = 0
    Scanner(string: hex).scanHexInt64(&rgbValue)

    var aValue: UInt64
    let rValue, gValue, bValue: UInt64

    switch hex.count {
      case 3:
        (aValue, rValue, gValue, bValue) = (255, (rgbValue >> 4 & 0xF) * 17, (rgbValue >> 4 & 0xF) * 17, (rgbValue & 0xF) * 17)
      case 6: // RGB (24-bit)
        (aValue, rValue, gValue, bValue) = (255, rgbValue >> 16, rgbValue >> 8 & 0xFF, rgbValue & 0xFF)
      case 8: // ARGB (32-bit)
        (aValue, rValue, gValue, bValue) = (rgbValue >> 24, rgbValue >> 16 & 0xFF, rgbValue >> 8 & 0xFF, rgbValue & 0xFF)
      default:
        // Если строка не соответствует ожидаемым форматам, создается серый цвет
        (aValue, rValue, gValue, bValue) = (255, 123, 123, 129)
    }

    // Если передано значение alpha, обновляем значение aValue
    if let alpha = alpha, alpha >= 0, alpha <= 1 {
      aValue = UInt64(alpha * 255)
    }

    // Создаем UIColor, используя полученные значения RGB и alpha
    self.init(
      red: CGFloat(rValue) / 255,
      green: CGFloat(gValue) / 255,
      blue: CGFloat(bValue) / 255,
      alpha: CGFloat(aValue) / 255)
  }

  // Метод для получения шестнадцатеричной строки из цвета
  func hexStringFromColor() -> String {
    // Получаем компоненты цвета
    let components = self.cgColor.components
    let r: CGFloat = components?[0] ?? 0.0
    let g: CGFloat = components?[1] ?? 0.0
    let b: CGFloat = components?[2] ?? 0.0

    // Формируем шестнадцатеричную строку вида "#RRGGBB"
    let hexString = String(format: "#%02lX%02lX%02lX", lroundf(Float(r * 255)), lroundf(Float(g * 255)), lroundf(Float(b * 255)))
    return hexString
  }
}



