//
//  GameScene.swift
//  catabalt
//
//  Created by Gregorio Setti on 06/08/15.
//  Copyright (c) 2015 Moze. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
	
	var catNode: SKSpriteNode!
	var groundNode: SKSpriteNode!
	var foregroundNode: SKSpriteNode!
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override init(size: CGSize) {
		super.init(size: size)
		
		physicsWorld.gravity = CGVector(dx: 0, dy: -13.0)
		
		backgroundColor = SKColor.greenColor()
		foregroundNode = SKSpriteNode()
		
		catNode = SKSpriteNode(imageNamed: "cat.png")
		catNode!.size = CGSize(width: 50.0, height: 39.0)
		catNode!.position = CGPointMake(catNode!.size.width / 2 + 50.0, 100.0)
		catNode!.anchorPoint = CGPointMake(0.5, 0.5)
		catNode!.physicsBody = SKPhysicsBody(rectangleOfSize: catNode!.size)
		catNode!.physicsBody!.dynamic = true
		catNode!.physicsBody!.allowsRotation = false
		addChild(catNode)
		
		groundNode = SKSpriteNode()
		groundNode!.color = SKColor.brownColor()
		groundNode!.size = CGSize(width: size.width, height: 10.0)
		groundNode!.anchorPoint = CGPointMake(0.0, 0.5)
		groundNode!.position = CGPointMake(0.0, 0.0)
		groundNode!.physicsBody = SKPhysicsBody(rectangleOfSize: groundNode!.size)
		groundNode!.physicsBody!.dynamic = false
		addChild(groundNode)
		
		generateShelves(100)
		
		addChild(foregroundNode)
	}
	
	override func update(currentTime: NSTimeInterval) {
		foregroundNode!.position = CGPoint(x: foregroundNode!.position.x - 4.0, y: foregroundNode!.position.y)
	}
	
	override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
		catNode!.physicsBody!.applyImpulse(CGVectorMake(0.0, 60.0))
	}

	
	func generateShelves(amount: Int) {
		var prevPosition: CGPoint
		var position = CGPoint(x: 150.0, y: 40.0)
		
		for i in 1...amount {
			var shelfNode = SKSpriteNode(color: SKColor.brownColor(), size: CGSize(width: 100.0, height: 10.0))
			shelfNode.name = "SHELF"
			shelfNode.position = position
			shelfNode.physicsBody = SKPhysicsBody(rectangleOfSize: shelfNode.size)
			shelfNode.physicsBody!.dynamic = false
			
			foregroundNode!.addChild(shelfNode)
			
			prevPosition = shelfNode.position
			
			position.x += 150.0
			let randomY = arc4random_uniform( UInt32(prevPosition.y + 120.0) + 1 )
			position.y = CGFloat(randomY)
		}
	}
}
