//
//  main.swift
//  DelegateDesignPattern
//
//  Created by Tolga Yakar on 11.01.2024.
//


import Foundation

//atm is the object for responsible informing corresponding object.
var atm = ATM()

//When engineer object instance is created, it set itself as a delegate.

/*  From this moment onward, whenever atm.performAtmTasks is called, the operations are carried out according to the engineer instance. */
var engineer = Engineer(atm: atm)
atm.performAtmTasks()

//When doctor object instance is created, it set itself as a delegate.

/*  From this moment onward, whenever atm.performAtmTasks is called, the operations are carried out according to the doctor instance. */
var doctor = Doctor(atm: atm)
atm.performAtmTasks()

//When pilot object instance is created, it set itself as a delegate.

/*  From this moment onward, whenever atm.performAtmTasks is called, the operations are carried out according to the pilot instance. */
var pilot = Pilot(atm: atm)
atm.performAtmTasks()

