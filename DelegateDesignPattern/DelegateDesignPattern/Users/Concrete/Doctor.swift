//
//  Doctor.swift
//  DelegateDesignPattern
//
//  Created by Tolga Yakar on 11.01.2024.
//
class Doctor: User
{    
    init(atm: ATM)
    {
        //atm object is an ATM type object instance.
        //It has a property that named delegate and type of User.
        //atm.delegate = self means assigning Doctor object itself as a delegate.
        //Assigning process is provided by "self" because Doctor is also a User Type object.
        atm.delegate = self
    }
    
    //Implementation of User protocol withdraw function.
    func withdraw() {
        print("The doctor has withdrawn money.")
    }
    
    //Implementation of User protocol deposit function.
    func deposit() {
        print("The doctor has deposited money.")
    }
}
