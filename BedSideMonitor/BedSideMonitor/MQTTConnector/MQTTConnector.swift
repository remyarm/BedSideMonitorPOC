//
//  MQTTConnector.swift
//  BedSideMonitor
//
//  Created by apple on 30/03/20.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation
import SwiftMQTT

class MQTTConnector: MQTTSessionDelegate {

    let  mqttSession = MQTTSession(
        host: "broker.hivemq.com",
        port: 1883,
        clientID: "", // must be unique to the client
        cleanSession: true,
        keepAlive: 15,
        useSSL: false
    )
    
    func subscribe() {
        mqttSession.connect { (error) in
            if (error == .none) {
                self.mqttSession.delegate = self
                self.mqttSession.subscribe(to: "testtopic/1", delivering: .atLeastOnce) { (error) in
                    print("Sunscribed successfully")
                }
            }
        }
    }
    
    func mqttDidReceive(message: MQTTMessage, from session: MQTTSession) {
           print(message.topic)
           print(message.stringRepresentation)
    }
       
    func mqttDidAcknowledgePing(from session: MQTTSession) {
           
    }
       
    func mqttDidDisconnect(session: MQTTSession, error: MQTTSessionError) {
           
    }
}
