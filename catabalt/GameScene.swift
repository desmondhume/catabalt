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
		
		backgroundColor = SKColor.greenColor()
		foregroundNode = SKSpriteNode()
		
		catNode = SKSpriteNode(imageNamed: "cat.png")
		catNode!.size = CGSize(width: 50.0, height: 39.0)
		catNode!.position = CGPointMake(catNode!.size.width / 2 + 10.0, 100.0)
		catNode!.anchorPoint = CGPointMake(0.5, 0.5)
		catNode!.physicsBody = SKPhysicsBody(rectangleOfSize: catNode!.size)
		catNode!.physicsBody!.dynamic = true
		foregroundNode!.addChild(catNode)
		
		groundNode = SKSpriteNode()
		groundNode!.color = SKColor.brownColor()
		groundNode!.size = CGSize(width: size.width, height: 10.0)
		groundNode!.anchorPoint = CGPointMake(0.0, 0.5)
		groundNode!.position = CGPointMake(0.0, 0.0)
		groundNode!.physicsBody = SKPhysicsBody(rectangleOfSize: groundNode!.size)
		groundNode!.physicsBody!.dynamic = false
		
		foregroundNode!.addChild(groundNode)
		
		generateShelves(10)
		
		addChild(foregroundNode)
	}
	
	func generateShelves(amount: Int) {
		var position = CGPoint(x: 150.0, y: 50.0)
		
		for i in 1...amount {
			var shelfNode = SKSpriteNode(color: SKColor.brownColor(), size: CGSize(width: 100.0, height: 10.0))
			shelfNode.name = "SHELF"
			shelfNode.position = position
			shelfNode.physicsBody = SKPhysicsBody(rectangleOfSize: shelfNode.size)
			shelfNode.physicsBody!.dynamic = false
			
			foregroundNode!.addChild(shelfNode)
			
			position.x += 120.0
			let randomY = arc4random_uniform( UInt32(size.height) + 1 )
			position.y = CGFloat(randomY)
		}
	}
	
	override func didMoveToView(view: SKView) {
        /* Setup your scene here */
    }
	
}
