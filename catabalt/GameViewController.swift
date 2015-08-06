//
//  GameViewController.swift
//  catabalt
//
//  Created by Gregorio Setti on 06/08/15.
//  Copyright (c) 2015 Moze. All rights reserved.
//

import SpriteKit

class GameViewController: UIViewController {

	var scene: GameScene!
	
	override func viewDidLoad() {
		let skView = view as! SKView
		skView.showsFPS = true
		
		scene = GameScene(size: skView.bounds.size)
		scene.scaleMode = .AspectFill
		
		skView.presentScene(scene)
	}

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
