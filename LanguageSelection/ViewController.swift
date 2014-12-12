//
//  ViewController.swift
//  LanguageSelection
//
//  Created by Scott Martindale on 11/26/2014.
//  Copyright (c) 2014 Scott Martindale. All rights reserved.
//

import Cocoa
import Foundation

class ViewController: NSViewController {
    
    @IBAction func setEnglish(sender: AnyObject) {
        setLanguage("English")
    }
    @IBAction func setChinese(sender: AnyObject) {
        setLanguage("Chinese")
    }
    @IBAction func setFrench(sender: AnyObject) {
        setLanguage("French")
    }
    @IBAction func setGerman(sender: AnyObject) {
        setLanguage("German")
    }
    @IBAction func setItalian(sender: AnyObject) {
        setLanguage("Italian")
    }
    @IBAction func setJapanese(sender: AnyObject) {
        setLanguage("Japanese")
    }
    @IBAction func setRussian(sender: AnyObject) {
        setLanguage("Russian")
    }
    @IBAction func setSpanish(sender: AnyObject) {
        setLanguage("Spanish")
    }
    
    func setLanguage(languageName: String) {
        let task = NSTask()
        task.launchPath = "/usr/bin/defaults"
        if languageName == "English" {
            println(languageName)
            task.arguments = ["write", "NSGlobalDomain", "AppleLanguages", "-array", "en"]
        } else if languageName == "Chinese" {
            println(languageName)
            task.arguments = ["write", "NSGlobalDomain", "AppleLanguages", "-array", "zh-Hans", "en"]
        } else if languageName == "French" {
            println(languageName)
            task.arguments = ["write", "NSGlobalDomain", "AppleLanguages", "-array", "fr", "en"]
        } else if languageName == "German" {
            println(languageName)
            task.arguments = ["write", "NSGlobalDomain", "AppleLanguages", "-array", "de", "en"]
        } else if languageName == "Italian" {
            println(languageName)
            task.arguments = ["write", "NSGlobalDomain", "AppleLanguages", "-array", "it", "en"]
        } else if languageName == "Japanese" {
            println(languageName)
            task.arguments = ["write", "NSGlobalDomain", "AppleLanguages", "-array", "ja", "en"]
        } else if languageName == "Russian" {
            println(languageName)
            task.arguments = ["write", "NSGlobalDomain", "AppleLanguages", "-array", "ru", "en"]
        } else if languageName == "Spanish" {
            println(languageName)
            task.arguments = ["write", "NSGlobalDomain", "AppleLanguages", "-array", "es-MX", "en"]
        }
        
        
        // Set System Language
        let pipe = NSPipe()
        task.standardOutput = pipe
        task.launch()
        
        //Kill Apps in English
        killApps()
        
        //Kill Self
        killApp()
    }
    
    func killApps() {
        let task = NSTask()
        task.launchPath = "/usr/bin/killall"
        task.arguments = ["Finder"]
        task.arguments = ["Dock"]
        
        // Kill Finder and Dock so that it reloads in target language.
        let pipe = NSPipe()
        task.standardOutput = pipe
        task.launch()
    }
    
    func killApp() {
        //Quit App
        NSApplication.sharedApplication().terminate(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("loaded")
        // Do any additional setup after loading the view.
    }
    
    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    
}

