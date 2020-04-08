//
//  MQTTConnector.swift
//  BedSideMonitor
//
//  Created by apple on 30/03/20.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation
import SwiftMQTT
import Combine

class MQTTConnector: MQTTSessionDelegate {

    let  mqttSession = MQTTSession(
        host: "broker.hivemq.com",
        port: 1883,
        clientID: "", // must be unique to the client
        cleanSession: true,
        keepAlive: 15,
        useSSL: false
    )
    
    let mqttPublisher = PassthroughSubject<Double,Error>()
    let connectionPublisher = PassthroughSubject<Bool,Error>()
    func connectToServer() {
        mqttSession.connect { (error) in
            if (error == .none) {
                self.mqttSession.delegate = self
                self.mqttSession.subscribe(to: "testtopic/1", delivering: .atLeastOnce) { (error) in
                    print("Sunscribed successfully")
                    self.connectionPublisher.send(true)
                }
            }
        }
    }
    
    func mqttDidReceive(message: MQTTMessage, from session: MQTTSession) {
        print(message.topic)
        print(message.stringRepresentation ?? "")
        guard let receivedvalue =  Double(message.stringRepresentation!) else {return}
        mqttPublisher.send(receivedvalue)
    }
       
    func mqttDidAcknowledgePing(from session: MQTTSession) {
           
    }
       
    func mqttDidDisconnect(session: MQTTSession, error: MQTTSessionError) {
           
    }
}
