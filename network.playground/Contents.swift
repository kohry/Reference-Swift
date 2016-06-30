//: Playground - noun: a place where people can play

import UIKit
import Foundation
import XCPlayground

func generateBoundaryString() -> String
{
    return "Boundary-\(NSUUID().UUIDString)"
}




func imageUploadRaw(image:UIImage){
    
    let request = NSMutableURLRequest(URL: NSURL(string: "https://api.projectoxford.ai/face/v1.0/detect?entities=true&returnFaceId=true&returnFaceLandmarks=true&returnFaceAttributes=age,facialHair,gender,glasses,headPose,smile")!)
    request.HTTPMethod = "POST"
    
    let imageData :NSData = UIImagePNGRepresentation(image)!
    
    
    let body = NSMutableData();
    
    
    body.appendData(imageData)
    
    request.setValue("application/octet-stream", forHTTPHeaderField: "Content-Type")
    request.setValue("efaa97f273a948798044a2f95f199b17",forHTTPHeaderField: "Ocp-Apim-Subscription-Key")
    
    request.HTTPBody = body
    
    let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
        data, response, error in
        
        if error != nil {
            print("error=\(error)")
            return
        }
        
        let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
        print("responseString = \(responseString!)")
        
        let data = responseString?.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!
        
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as! NSMutableArray
            let faceRaw = FaceRaw()
            
            print("\(json)")
            
            
            
            faceRaw.faceId = (json[0]["faceId"] as? String)!
            
            if faceRaw.faceId != "" {
                
                faceRaw.faceAttributes.age = (json[0]["faceAttributes"]!!["age"] as? Double)!
                faceRaw.faceAttributes.facialHair.beard = (json[0]["faceAttributes"]!!["facialHair"]!!["beard"] as? Double)!
                faceRaw.faceAttributes.facialHair.moustache = (json[0]["faceAttributes"]!!["facialHair"]!!["moustache"] as? Double)!
                    faceRaw.faceAttributes.facialHair.sideburns = (json[0]["faceAttributes"]!!["facialHair"]!!["sideburns"] as? Double)!
                faceRaw.faceAttributes.gender = (json[0]["faceAttributes"]!!["gender"] as? String)!
                faceRaw.faceAttributes.glasses = (json[0]["faceAttributes"]!!["glasses"] as? String)!
                faceRaw.faceAttributes.headPose.pitch = (json[0]["faceAttributes"]!!["headPose"]!!["pitch"] as? Double)!
                faceRaw.faceAttributes.headPose.roll = (json[0]["faceAttributes"]!!["headPose"]!!["roll"] as? Double)!
                faceRaw.faceAttributes.headPose.yaw = (json[0]["faceAttributes"]!!["headPose"]!!["yaw"] as? Double)!
                faceRaw.faceAttributes.smile = (json[0]["faceAttributes"]!!["smile"] as? Double)!
                
                    faceRaw.faceLandmarks.eyeLeftBottom.x = (json[0]["faceLandmarks"]!!["eyeLeftBottom"]!!["x"] as? Double)!
                faceRaw.faceLandmarks.eyeLeftBottom.y = (json[0]["faceLandmarks"]!!["eyeLeftBottom"]!!["y"] as? Double)!
                faceRaw.faceLandmarks.eyeLeftBottom.x = (json[0]["faceLandmarks"]!!["eyeLeftBottom"]!!["x"] as? Double)!
                faceRaw.faceLandmarks.eyeLeftBottom.y = (json[0]["faceLandmarks"]!!["eyeLeftBottom"]!!["y"] as? Double)!
                faceRaw.faceLandmarks.eyeLeftInner.x = (json[0]["faceLandmarks"]!!["eyeLeftInner"]!!["x"] as? Double)!
                faceRaw.faceLandmarks.eyeLeftInner.y = (json[0]["faceLandmarks"]!!["eyeLeftInner"]!!["y"] as? Double)!
                faceRaw.faceLandmarks.eyeLeftOuter.x = (json[0]["faceLandmarks"]!!["eyeLeftOuter"]!!["x"] as? Double)!
                faceRaw.faceLandmarks.eyeLeftOuter.y = (json[0]["faceLandmarks"]!!["eyeLeftOuter"]!!["y"] as? Double)!
                faceRaw.faceLandmarks.eyeLeftTop.x = (json[0]["faceLandmarks"]!!["eyeLeftTop"]!!["x"] as? Double)!
                faceRaw.faceLandmarks.eyeLeftTop.y = (json[0]["faceLandmarks"]!!["eyeLeftTop"]!!["y"] as? Double)!
                faceRaw.faceLandmarks.eyeRightBottom.x = (json[0]["faceLandmarks"]!!["eyeRightBottom"]!!["x"] as? Double)!
                faceRaw.faceLandmarks.eyeRightBottom.y = (json[0]["faceLandmarks"]!!["eyeRightBottom"]!!["y"] as? Double)!
                faceRaw.faceLandmarks.eyeRightInner.x = (json[0]["faceLandmarks"]!!["eyeRightInner"]!!["x"] as? Double)!
                faceRaw.faceLandmarks.eyeRightInner.y = (json[0]["faceLandmarks"]!!["eyeRightInner"]!!["y"] as? Double)!
                faceRaw.faceLandmarks.eyeRightOuter.x = (json[0]["faceLandmarks"]!!["eyeRightOuter"]!!["x"] as? Double)!
                faceRaw.faceLandmarks.eyeRightOuter.y = (json[0]["faceLandmarks"]!!["eyeRightOuter"]!!["y"] as? Double)!
                faceRaw.faceLandmarks.eyeRightTop.x = (json[0]["faceLandmarks"]!!["eyeRightTop"]!!["x"] as? Double)!
                faceRaw.faceLandmarks.eyeRightTop.y = (json[0]["faceLandmarks"]!!["eyeRightTop"]!!["y"] as? Double)!
                faceRaw.faceLandmarks.eyebrowLeftInner.x = (json[0]["faceLandmarks"]!!["eyebrowLeftInner"]!!["x"] as? Double)!
                faceRaw.faceLandmarks.eyebrowLeftInner.y = (json[0]["faceLandmarks"]!!["eyebrowLeftInner"]!!["y"] as? Double)!
                faceRaw.faceLandmarks.eyebrowLeftOuter.x = (json[0]["faceLandmarks"]!!["eyebrowLeftOuter"]!!["x"] as? Double)!
                faceRaw.faceLandmarks.eyebrowLeftOuter.y = (json[0]["faceLandmarks"]!!["eyebrowLeftOuter"]!!["y"] as? Double)!
                faceRaw.faceLandmarks.eyebrowRightInner.x = (json[0]["faceLandmarks"]!!["eyebrowRightInner"]!!["x"] as? Double)!
                faceRaw.faceLandmarks.eyebrowRightInner.y = (json[0]["faceLandmarks"]!!["eyebrowRightInner"]!!["y"] as? Double)!
                faceRaw.faceLandmarks.eyebrowRightOuter.x = (json[0]["faceLandmarks"]!!["eyebrowRightOuter"]!!["x"] as? Double)!
                faceRaw.faceLandmarks.eyebrowRightOuter.y = (json[0]["faceLandmarks"]!!["eyebrowRightOuter"]!!["y"] as? Double)!
                faceRaw.faceLandmarks.mouthLeft.x = (json[0]["faceLandmarks"]!!["mouthLeft"]!!["x"] as? Double)!
                faceRaw.faceLandmarks.mouthLeft.y = (json[0]["faceLandmarks"]!!["mouthLeft"]!!["y"] as? Double)!
                faceRaw.faceLandmarks.mouthRight.x = (json[0]["faceLandmarks"]!!["mouthRight"]!!["x"] as? Double)!
                faceRaw.faceLandmarks.mouthRight.y = (json[0]["faceLandmarks"]!!["mouthRight"]!!["y"] as? Double)!
                faceRaw.faceLandmarks.noseLeftAlarOutTip.x = (json[0]["faceLandmarks"]!!["noseLeftAlarOutTip"]!!["x"] as? Double)!
                faceRaw.faceLandmarks.noseLeftAlarOutTip.y = (json[0]["faceLandmarks"]!!["noseLeftAlarOutTip"]!!["y"] as? Double)!
                faceRaw.faceLandmarks.noseLeftAlarTop.x = (json[0]["faceLandmarks"]!!["noseLeftAlarTop"]!!["x"] as? Double)!
                faceRaw.faceLandmarks.noseLeftAlarTop.y = (json[0]["faceLandmarks"]!!["noseLeftAlarTop"]!!["y"] as? Double)!
                faceRaw.faceLandmarks.noseRightAlarOutTip.x = (json[0]["faceLandmarks"]!!["noseRightAlarOutTip"]!!["x"] as? Double)!
                faceRaw.faceLandmarks.noseRightAlarOutTip.y = (json[0]["faceLandmarks"]!!["noseRightAlarOutTip"]!!["y"] as? Double)!
                faceRaw.faceLandmarks.noseRightAlarTop.x = (json[0]["faceLandmarks"]!!["noseRightAlarTop"]!!["x"] as? Double)!
                faceRaw.faceLandmarks.noseRightAlarTop.y = (json[0]["faceLandmarks"]!!["noseRightAlarTop"]!!["y"] as? Double)!
                faceRaw.faceLandmarks.noseRootLeft.x = (json[0]["faceLandmarks"]!!["noseRootLeft"]!!["x"] as? Double)!
                faceRaw.faceLandmarks.noseRootLeft.y = (json[0]["faceLandmarks"]!!["noseRootLeft"]!!["y"] as? Double)!
                faceRaw.faceLandmarks.noseRootRight.x = (json[0]["faceLandmarks"]!!["noseRootRight"]!!["x"] as? Double)!
                faceRaw.faceLandmarks.noseRootRight.y = (json[0]["faceLandmarks"]!!["noseRootRight"]!!["y"] as? Double)!
                faceRaw.faceLandmarks.noseTip.x = (json[0]["faceLandmarks"]!!["noseTip"]!!["x"] as? Double)!
                faceRaw.faceLandmarks.noseTip.y = (json[0]["faceLandmarks"]!!["noseTip"]!!["y"] as? Double)!
                faceRaw.faceLandmarks.pupilLeft.x = (json[0]["faceLandmarks"]!!["pupilLeft"]!!["x"] as? Double)!
                faceRaw.faceLandmarks.pupilLeft.y = (json[0]["faceLandmarks"]!!["pupilLeft"]!!["y"] as? Double)!
                faceRaw.faceLandmarks.pupilRight.x = (json[0]["faceLandmarks"]!!["pupilRight"]!!["x"] as? Double)!
                faceRaw.faceLandmarks.pupilRight.y = (json[0]["faceLandmarks"]!!["pupilRight"]!!["y"] as? Double)!
                faceRaw.faceLandmarks.underLipBottom.x = (json[0]["faceLandmarks"]!!["underLipBottom"]!!["x"] as? Double)!
                faceRaw.faceLandmarks.underLipBottom.y = (json[0]["faceLandmarks"]!!["underLipBottom"]!!["y"] as? Double)!
                faceRaw.faceLandmarks.underLipTop.x = (json[0]["faceLandmarks"]!!["underLipTop"]!!["x"] as? Double)!
                faceRaw.faceLandmarks.underLipTop.y = (json[0]["faceLandmarks"]!!["underLipTop"]!!["y"] as? Double)!
                faceRaw.faceLandmarks.upperLipBottom.x = (json[0]["faceLandmarks"]!!["upperLipBottom"]!!["x"] as? Double)!
                faceRaw.faceLandmarks.upperLipBottom.y = (json[0]["faceLandmarks"]!!["upperLipBottom"]!!["y"] as? Double)!
                faceRaw.faceLandmarks.upperLipTop.x = (json[0]["faceLandmarks"]!!["upperLipTop"]!!["x"] as? Double)!
                faceRaw.faceLandmarks.upperLipTop.y = (json[0]["faceAttributes"]!!["upperLipTop"]!!["y"] as? Double)!
                
                    faceRaw.faceRectangle.height = (json[0]["faceRectangle"]!!["height"] as? Int)!
                    faceRaw.faceRectangle.left = (json[0]["faceRectangle"]!!["left"] as? Int)!
                    faceRaw.faceRectangle.top = (json[0]["faceRectangle"]!!["top"] as? Int)!
                    faceRaw.faceRectangle.width = (json[0]["faceRectangle"]!!["width"] as? Int)!
                
            }
            print (faceRaw)
            
            
            
            
            
            
            
        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)"   )
        }
        
        
    }
    
    task.resume()
    
}


class FaceRaw {
    
    var   faceId:String = "";
    var   faceRectangle:FaceRectangle = FaceRectangle();
    var   faceLandmarks:FaceLandmarks = FaceLandmarks();
    var   faceAttributes:FaceAttribute = FaceAttribute();
    
    
    class FaceRectangle {
        var  width :Int = 0
        var  height :Int = 0
        var  left :Int = 0
        var  top :Int = 0
    }
    
    class FaceLandmarks {
        var pupilLeft:FeatureCoordinate = FeatureCoordinate();
        var pupilRight:FeatureCoordinate = FeatureCoordinate();
        var noseTip:FeatureCoordinate = FeatureCoordinate();
        var mouthLeft:FeatureCoordinate = FeatureCoordinate();
        var mouthRight:FeatureCoordinate = FeatureCoordinate();
        var eyebrowLeftOuter:FeatureCoordinate = FeatureCoordinate();
        var eyebrowLeftInner:FeatureCoordinate = FeatureCoordinate();
        var eyeLeftOuter:FeatureCoordinate = FeatureCoordinate();
        var eyeLeftTop:FeatureCoordinate = FeatureCoordinate();
        var eyeLeftBottom:FeatureCoordinate = FeatureCoordinate();
        var eyeLeftInner:FeatureCoordinate = FeatureCoordinate();
        var eyebrowRightInner:FeatureCoordinate = FeatureCoordinate();
        var eyebrowRightOuter:FeatureCoordinate = FeatureCoordinate();
        var eyeRightInner:FeatureCoordinate = FeatureCoordinate();
        var eyeRightTop:FeatureCoordinate = FeatureCoordinate();
        var eyeRightBottom:FeatureCoordinate = FeatureCoordinate();
        var eyeRightOuter:FeatureCoordinate = FeatureCoordinate();
        var noseRootLeft:FeatureCoordinate = FeatureCoordinate();
        var noseRootRight:FeatureCoordinate = FeatureCoordinate();
        var noseLeftAlarTop:FeatureCoordinate = FeatureCoordinate();
        var noseRightAlarTop:FeatureCoordinate = FeatureCoordinate();
        var noseLeftAlarOutTip:FeatureCoordinate = FeatureCoordinate();
        var noseRightAlarOutTip:FeatureCoordinate = FeatureCoordinate();
        var upperLipTop:FeatureCoordinate = FeatureCoordinate();
        var upperLipBottom:FeatureCoordinate = FeatureCoordinate();
        var underLipTop:FeatureCoordinate = FeatureCoordinate();
        var underLipBottom:FeatureCoordinate = FeatureCoordinate();
    }
    
    
    class FaceAttribute {
        var  age : Double = 0
        var  gender : String = ""
        var  smile : Double = 0
        var  facialHair : FacialHair = FacialHair()
        var  headPose : HeadPose = HeadPose()
        var  glasses : String = ""
        
    }
    
    
    
    class FeatureCoordinate {
        var  x: Double = 0
        var  y: Double = 0
    }
    
    class FacialHair {
        var  moustache:Double = 0
        var  beard:Double = 0
        var  sideburns:Double = 0
        
    }
    
    class HeadPose {
        var  roll:Double = 0
        var  yaw:Double = 0
        var  pitch:Double = 0
    }
    
    
}





XCPSetExecutionShouldContinueIndefinitely()

var  image = UIImage(named : "male1.png")
//test()
imageUploadRaw(image!)



//efaa97f273a948798044a2f95f199b17

