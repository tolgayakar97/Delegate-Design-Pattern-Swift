//
//  ATM.swift
//  DelegateDesignPattern
//
//  Created by Tolga Yakar on 11.01.2024.
//
class ATM
{
    //delegate property of ATM can be any type of object which must implement User protocol.
    //delegate can be one of the followings: Engineer, Doctor, Pilot according to this example.
    var delegate: User?
    
    func signIn()
    {
        print("Sign in completed.")
    }
    
    func withdrawMoney()
    {
        //When this method is called, it calls withdraw method of corresponding delegate.
        delegate?.withdraw()
    }
    
    func depositMoney()
    {
        //When this method is called, it calls deposit method of corresponding delegate.
        delegate?.deposit()
    }
    
    func performAtmTasks()
    {
        //The withdrawMoney and depositMoney methods are executed based on the delegate type.
        self.signIn()
        self.withdrawMoney()
        self.depositMoney()
        print("------------------------")
    }
}
