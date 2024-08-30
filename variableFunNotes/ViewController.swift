//
//  ViewController.swift
//  variableFunNotes
//
//  Created by EVANGELINE NOFTZ on 8/26/24.
//

import UIKit

// steps to get return key to dismiss keyboard
// 1. add a delegate
// 2. attach the delegate to textfield
// 3. write textFieldShouldReturn function


// : is same thing as extends       adding delegate w/ UITextFieldDelegate (not extending another class, implementing another Interface/protocol)
class ViewController: UIViewController, UITextFieldDelegate {

    let pony = 6 // makes a constant variable (can't change it -- like "final" in java) -- declared and initialized (type inference)
    var dog = 7.5 // variable inference

    // always make a text field an outlet!
    @IBOutlet weak var textFieldOutlet: UITextField!
    
    // Question mark = optional variable (could be nil)
    var cat: Int? // creates an int (cannot declare a variable without putting something in it) -- declaring an Optional (could be nil -- is currently nil on this line of code) do not HAVE to put something in it
    
    var horse: Double! // declaring a non Optional (can't be nil -- exclamation mark guarentees it will never be nil, even though currently on this line of code it is nil) (guarenteeing that we will put something in it) (try to use w/o putting anything in it will cause a crash in the code -- do not have to unwrap because guarenteed that something is in it)
    
    var ant: String = "" // declaring a variable (must initialize in init/constructor)
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // purpose of a delegate is to listen to things happening and report back to textFieldOutlet
        // attatching the delegate to this class
        textFieldOutlet.delegate = self
        
        
        
        
        // converts pony to a double (is only a double in this small line of code)
        // does NOT make it an optional bc an Int can always be converted to a Double
        // passing it through the Double innit
        print(Double(pony) + dog)
        
        // Exclamation mark = force unwrap (guarenteeing that there is something in cat) -- do not force unwrap (may forget to put something in there and crash the code)
        //print(cat! + 5) be sure that there is something in it ALL the time if you're force unwrapping (if nil, will blow up)
        
        
        // Safe unwrap (stores cat in blah, but only does it if there is something in cat)
        // Doesn't execute if there is nothing in cat
        // This is a good way to unwrap!
        // blah is a local variable
        if let blah = cat {
            print(blah + 5)
            //print("cat is " + blah) doesn't work because they are two different data types (can't concatonate two different data types)
            print("cat is " + String(blah)) // works, but isn't the best solution
            
            // String interpolation
            print("cat is \(blah)") // can put anything in the () and it will convert it to a String (this is the better way to do this) ALWAYS WORKS
        } else {
            print("No value in cat")
        }
        
        
        
    }


    // change Any to UIButton, and sender becomes an outlet for the button
    // Any is like Object class in java!
    @IBAction func buttonAction(_ sender: UIButton) {
        
        // gets text out of text field (comes out as a String)
        // always comes out an optional variable bc there's a chance that there was nothing in the text field
        // putting the ! says you guarentee there will be something in the text field (Swift puts a blank String if there is nothing in there)
        // pig is nonoptional variable bc you guarenteed something will be in there
        // only time you should forcefully unwrap
        // forcefully unwrapping the Optional variable text that was made by Swift
        var pig = textFieldOutlet.text!
        
        // nil coalescing
        // if before ?? is nil, makes the value 0 (gives a default value if it is nil)
        // bad if you want an error message to show up, but good if you want to have a default value
        // Int(pig) is always makes an Optional
        var frog = Int(pig) ?? 0
        
        // Int initializer (innit) can't guarentee that pig will always be allowed to be converted to an Int, so stores it as an optional
        print(frog + 5)
        
        // makes keyboard disappear when the button is pressed
        textFieldOutlet.resignFirstResponder()
        
    }
    
    // this function is like a listener (automatically gets called when user hits return button on keyboard (keyboard on the phone screen))
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldOutlet.resignFirstResponder()
    }
    
    
    
    
    
}

