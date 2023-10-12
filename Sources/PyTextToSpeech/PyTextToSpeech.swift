//
//  TextToSpeech.swift
//  untitled
//
//  Created by MusicMaker on 22/12/2022.
//

import Foundation
import AVFoundation

public class TextToSpeech {
	
	let synth = AVSpeechSynthesizer()
	var voice: AVSpeechSynthesisVoice?
	
	init() {
		
	}
}

extension TextToSpeech: TextToSpeech_PyProtocol {
	public func set_locale(locale: String) {
		self.voice = .init(language: locale)
	}
	
	public func speak(message: String) {
		
		if self.voice == nil {
			set_locale(locale: "en-US")
		}
		
		let utterance = AVSpeechUtterance(string: message)
		utterance.voice = self.voice
		
		synth.speak(utterance)
	}
	
	
}
