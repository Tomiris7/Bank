//
//  main.swift
//  Bank
//
//  Created by Tomiris Sultanbay on 11.02.2024.
//

import Foundation

class BankAccount {
    let accountNumber: String
    let accountOwner: String
    private var balance: Double
    
    init(accountNumber: String, accountOwner: String, initialBalance: Double) {
        self.accountNumber = accountNumber
        self.accountOwner = accountOwner
        self.balance = initialBalance
    }
    
    func deposit(amount: Double) {
        guard amount > 0 else {
            print("Сумма для депозита должна быть положительной.")
            return
        }
        balance += amount
        print("Депозит в размере \(amount) успешно выполнен. Новый баланс: \(balance)")
    }
    
    func withdraw(amount: Double) {
        guard amount > 0 else {
            print("Сумма для вывода должна быть положительной.")
            return
        }
        guard balance >= amount else {
            print("Недостаточно средств на счете.")
            return
        }
        balance -= amount
        print("Вывод \(amount) успешно выполнен. Новый баланс: \(balance)")
    }
    
    func getBalance() -> Double {
        return balance
    }
    
    func displayAccountInfo() {
        print("Номер счета: \(accountNumber)")
        print("Владелец счета: \(accountOwner)")
        print("Текущий баланс: \(balance)")
    }
}

print("Введите номер счета:")
let accountNumber = readLine() ?? ""
print("Введите имя владельца счета:")
let accountOwner = readLine() ?? ""
print("Введите начальный баланс:")
if let initialBalance = Double(readLine() ?? "") {
    let account = BankAccount(accountNumber: accountNumber, accountOwner: accountOwner, initialBalance: initialBalance)
    account.displayAccountInfo()
    
    while true {
        print("Выберите действие: (1) Внести депозит, (2) Вывести средства, (3) Проверить баланс, (4) Выйти")
        if let choice = readLine(), let action = Int(choice) {
            switch action {
            case 1:
                print("Введите сумму для депозита:")
                if let amount = Double(readLine() ?? "") {
                    account.deposit(amount: amount)
                } else {
                    print("Неверный формат суммы.")
                }
            case 2:
                print("Введите сумму для вывода:")
                if let amount = Double(readLine() ?? "") {
                    account.withdraw(amount: amount)
                } else {
                    print("Неверный формат суммы.")
                }
            case 3:
                print("Текущий баланс: \(account.getBalance())")
            case 4:
                print("Завершение работы.")
                exit(0)
            default:
                print("Неверный выбор.")
            }
        } else {
            print("Неверный выбор.")
        }
    }
} else {
    print("Неверный формат начального баланса.")
}
