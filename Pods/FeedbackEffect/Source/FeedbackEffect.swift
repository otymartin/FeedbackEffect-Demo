import AudioToolbox
import AVFoundation
import UIKit

/// A protocol for encapsulating the different ways that sound can be created, for use in `FeedbackEffect`.
public protocol SoundEmitting {
    
    func makeSound()
}

/// A protocol for encapsulating the different ways that haptic feedback can be created, for use in `FeedbackEffect`.
public protocol HapticEmitting {
    
    func generateFeedback()
}

/// An enum describing the different kinds of haptic feedback the taptic engine is capable of producing.
/// For use in `FeedbackEffect`, to give the user feedback when it's desired.
///
/// - impact: Used for calling `UIImpactFeedbackGenerator().impactOccurred()`.
/// - selection: Used for calling `UISelectionFeedbackGenerator().selectionChanged()`.
/// - notification: Used for calling `UINotificationFeedbackGenerator().notificationOccurred(notificationType)`.
public enum HapticFeedback: HapticEmitting {

    case impact(UIImpactFeedbackStyle)
    case selection
    case notification(UINotificationFeedbackType)
}

extension HapticFeedback {

    public func generateFeedback() {
        switch self {

        case .impact(let impactStyle):
            let impactGenerator = UIImpactFeedbackGenerator(style: impactStyle)
            impactGenerator.impactOccurred()

        case .selection:
            UISelectionFeedbackGenerator().selectionChanged()

        case .notification(let notificationType):
            UINotificationFeedbackGenerator().notificationOccurred(notificationType)
        }
    }
}

/// A set of text message sound effects that iOS provides through the `AudioServicesPlaySystemSound` subsystem.
public enum MessageTone: Int {

    case note = 1375
    case aurora = 1366
    case bamboo = 1361
    case chord = 1312
    case circles = 1368
    case complete = 1362
    case hello = 1363
    case input = 1369
    case keys = 1367
    case popcorn = 1364
    case pulse = 1120
    case synth = 1365
    case alert = 1005
    case anticipate = 1020
    case bell = 1013
    case bloom = 1021
    case calypso = 1022
    case chime = 1008
    case choochoo = 1023
    case descent = 1024
    case ding = 1000
    case electronic = 1014
    case fanfare = 1025
    case glass = 1009
    case horn = 1010
    case ladder = 1026
    case minuet = 1027
    case newsflash = 1028
    case noir = 1029
    case sherwoodforest = 1030
    case spell = 1031
    case suspence = 1032
    case swish = 1018
    case swoosh = 1001
    case telegraph = 1033
    case tiptoes = 1034
    case tritone = 1002
    case tweet = 1016
    case typewriters = 1035
    case update = 1036
    
    public var name: String {
        switch self {
        case .note:
            return "note"
        case .aurora:
            return "aurora"
        case .bamboo:
            return "bamboo"
        case .chord:
            return "chord"
        case .circles:
            return "circles"
        case .complete:
            return "complete"
        case .hello:
            return "hello"
        case .input:
            return "input"
        case .keys:
            return "keys"
        case .popcorn:
            return "popcorn"
        case .pulse:
            return "pulse"
        case .synth:
            return "synth"
        case .alert:
            return "alert"
        case .anticipate:
            return "anticipate"
        case .bell:
            return "bell"
        case .bloom:
            return "bloom"
        case .calypso:
            return "calypso"
        case .chime:
            return "chime"
        case .choochoo:
            return "choochoo"
        case .descent:
            return "descent"
        case .ding:
            return "ding"
        case .electronic:
            return "electronic"
        case .fanfare:
            return "fanfare"
        case .glass:
            return "glass"
        case .horn:
            return "horn"
        case .ladder:
            return "ladder"
        case .minuet:
            return "minuet"
        case .newsflash:
            return "newsflash"
        case .noir:
            return "noir"
        case .sherwoodforest:
            return "shwerwood"
        case .spell:
            return "spell"
        case .suspence:
            return "suspence"
        case .swish:
            return "swish"
        case .swoosh:
            return "swoosh"
        case .telegraph:
            return "telegraph"
        case .tiptoes:
            return "tiptoes"
        case .tritone:
            return "tritone"
        case .tweet:
            return "tweet"
        case .typewriters:
            return "typewriters"
        case .update:
            return "update"
        }
    }

}

extension MessageTone: SoundEmitting {

    public func makeSound() {
        AudioServicesPlaySystemSound(UInt32(self.rawValue))
    }
}

/// A set of sound effects that iOS provides through the `AudioServicesPlaySystemSound` subsystem.
public enum SoundEffect: Int {
    case traditionalPhoneRing = 30
    case hangedUpPhone = 32
    case longPressNumberDial = 33
    case vibrate = 1002
    case quickVibrate = 1003
    case doubleVibrate = 1007
    case dialTone1 = 1070
    case dialTone2 = 1071
    case phoneTone1 = 1074
    case phoneTone2 = 1075
    case phoneTone3 = 1254
    case phoneTone4 = 1255
    case phoneTone5 = 1256
    case phoneTone6 = 1257
    case phoneTone7 = 1259
    case heySiri = 1110
    case siriResponse = 1111
    case siriComeAgain = 1112
    case siriSound1 = 1115
    case siriSound2 = 1116
    case `operator` = 1073
    case subtleHarmonica = 1150
    case newiMessage = 1300
    case messageSent = 1301
    case newMail = 1302
    case bellSound1 = 1308
    case bellSound2 = 1309
    case bellSound3 = 1313
    case mrClean = 1331
    case messageTone1 = 1391
    case messageTone2 = 1405
    case messageTone3 = 1406
    case messageTone4 = 1109
    
    public var name: String {
        switch self {
        case .traditionalPhoneRing:
            return "traditionalPhoneRing"
        case .hangedUpPhone:
            return "hangedUpPhone"
        case .longPressNumberDial:
            return "longPressNumberDial"
        case .vibrate:
            return "vibrate"
        case .quickVibrate:
            return "quickVibrate"
        case .doubleVibrate:
            return "doubleVibrate"
        case .dialTone1:
            return "dialTone1"
        case .dialTone2:
            return "dialTone2"
        case .phoneTone1:
            return "phoneTone1"
        case .phoneTone2:
            return "phoneTone2"
        case .phoneTone3:
            return "phoneTone3"
        case .phoneTone4:
            return "phoneTone4"
        case .phoneTone5:
            return "phoneTone5"
        case .phoneTone6:
            return "phoneTone6"
        case .phoneTone7:
            return "phoneTone7"
        case .heySiri:
            return "heySiri"
        case .siriResponse:
            return "siriResponse"
        case .siriComeAgain:
            return "siriComeAgain"
        case .siriSound1:
            return "siriSound1"
        case .siriSound2:
            return "siriSound2"
        case .`operator`:
            return "operator"
        case .subtleHarmonica:
            return "subtleHarmonic"
        case .newiMessage:
            return "newIMessage"
        case .messageSent:
            return "messageSent"
        case .newMail:
            return "newMail"
        case .bellSound1:
            return "bellSound1"
        case .bellSound2:
            return "bellSound2"
        case .bellSound3:
            return "bellSound3"
        case .mrClean:
            return "mrClean"
        case .messageTone1:
            return "messageTone1"
        case .messageTone2:
            return "messageTone2"
        case .messageTone3:
            return "messageTone3"
        case .messageTone4:
            return "messageTone4"
        }
    }

}

extension SoundEffect: SoundEmitting {

    public func makeSound() {
        AudioServicesPlaySystemSound(UInt32(self.rawValue))
    }
}

/// A set of vibration patterns that iOS uses through the `AudioServicesPlaySystemSound` subsystem
/// to generate vibrations on devices that do not have a taptic engine.
public enum VibrationFeedback {

    case selection
    case impact
    case notification

}

private extension VibrationFeedback {

    var audioServicesCode: UInt32 {
        switch self {
            
        case .selection:
            return 1519
            
        case .impact:
            return 1520
            
        case .notification:
            return 1521
            
        }
    }

}

extension VibrationFeedback: HapticEmitting {

    public func generateFeedback() {
        AudioServicesPlaySystemSound(self.audioServicesCode)
    }
}

extension URL: SoundEmitting {

    public func makeSound() {
        FeedbackEffect.player.removeAllItems()
        let item = AVPlayerItem(url: self)
        FeedbackEffect.player.insert(item, after: nil)
        FeedbackEffect.player.play()
    }
}

/// A type which encapsulates sound and haptic feedback. This is useful for providing feedback on user
/// interaction, or when an app would like to signal a noteworthy event.
public struct FeedbackEffect {

    // The player needs to be retained, so we make it a property.
    static let player = AVQueuePlayer()

    /// A function that allows a user to provide feedback to a user.
    ///
    /// - Parameters:
    ///   - sound: A `SoundEmitting` type to play when feedback occurs.
    ///   - feedback: A `HapticEmitting` type to play when feedback occurs.
    public static func play(sound: SoundEmitting?, feedback: HapticEmitting? = nil) {
        if let sound = sound {
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient, with: .mixWithOthers)
                sound.makeSound()
            } catch {
                print("Couldn't play a sound")
            }
        }

        if let feedback = feedback {
            feedback.generateFeedback()
        }
    }
}
