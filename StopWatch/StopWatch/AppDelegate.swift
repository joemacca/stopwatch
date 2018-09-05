//
//  AppDelegate.swift
//  StopWatch
//
//  Created by Joseph McManamon on 9/5/18.
//  Copyright © 2018 Joseph McManamon. All rights reserved.
//

import Cocoa

@NSApplicationMain

class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    @IBOutlet weak var outletLabel: NSTextField!
    @IBOutlet weak var outletReset: NSButton!
    @IBOutlet weak var outletStartStop: NSButton!
    
    var seconds:Int = 0
    var running:Bool = false
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @IBAction func actionStartStop(_ sender: NSButton) {
        if ( running == true ){
            stopTimer();
        } else { // running == false !!
            startTimer();
        }
    }
    
    func startTimer (){
        let theTimer = Foundation.Timer(timeInterval: 1, target: self, selector:#selector (AppDelegate.countUp(_ :)), userInfo: nil, repeats:true)
        let loop = RunLoop.current
        loop.add(theTimer, forMode: RunLoopMode . commonModes )
        self.running = true
        outletStartStop.title = "Stop"
//        outletStartStopMenu.title = "Stop"
        outletReset . isEnabled = false
    }
    
    @objc func countUp ( _ theTimer : Foundation . Timer ){
        if (running == true ){
            self.seconds += 1;
            updateLabel();
        } else {
            theTimer.invalidate ();
        }
    }
    func updateLabel () {
        var secondsLocal = seconds ;
        let hour = secondsLocal/3600;
        secondsLocal %= 3600;
        let min = secondsLocal/60;
        secondsLocal %= 60;
        outletLabel.stringValue = String(format:"%02ld:%02ld:%02ld", hour, min, secondsLocal);
    }
    
    func stopTimer () {
        self . running = false
        outletReset . isEnabled = true
        outletStartStop . title = "Start"
//        outletStartStopMenu . title = " Start "
    }
    
    // RESET
    @IBAction func actionReset(_ sender: NSButton) {
        resetTimer()
    }
    func resetTimer (){
        self.seconds = 0;
        updateLabel ()
    }
    
    
    // @IBOutlet weak var outletStartStopMenu :NSMenuItem!
    // @IBOutlet weak var outletResetMenu:NSMenuItem!
    // MENU
    //    override func validateMenuItem ( _ menuItem :
    //        NSMenuItem ) -> Bool {
    //        if ( menuItem == outletStartStopMenu ){
    //            return true
    //        } else if ( menuItem == outletResetMenu ){
    //            return !running
    //        } else {
    //            return true
    //        }
    //    }
}

