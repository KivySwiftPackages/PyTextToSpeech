//
//  TextToSpeech.swift
//

import AVFoundation

import PySwiftKit
import PySerializing
import PySwiftWrapper

@PyClass
public class TextToSpeech {
	
	let synth = AVSpeechSynthesizer()
	var voice: AVSpeechSynthesisVoice?
	
    @PyInit init() {}
    
    @PyMethod func set_locale(locale: String) {
        self.voice = .init(language: locale)
    }
    
    @PyMethod func speak(message: String) {
        if self.voice == nil {
            set_locale(locale: "en-US")
        }
        
        let utterance = AVSpeechUtterance(string: message)
        utterance.voice = self.voice
        
        synth.speak(utterance)
    }
}



@PyModule
struct tts: PyModuleProtocol {
    
    static var py_classes: [any (PyClassProtocol & AnyObject).Type] = [
        TextToSpeech.self
    ]
}
