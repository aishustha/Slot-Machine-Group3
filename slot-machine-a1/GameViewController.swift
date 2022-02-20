//
//  GameViewController.swift
//  slot-machine-a1
//
//  Students: Aishwarya Shrestha(301138662), Keshav Dulal(301209947), Poojan Patel(301228811)
//  Course: Advanced IOS Development - 724
//  Submission Date: 23/01/2022
//  Exercise Number: A1 - Slot Machine App - Part 1 - Create the app UI
//  Github Repo: https://github.com/aishustha/Slot-Machine-Group3
//  Figma Link: https://www.figma.com/file/Twrlrzgrl6Kvq6w90xJb9f/SlotMachine?node-id=8%3A2
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController, GameManager {

  
    @IBOutlet weak var ScoreLabel: UILabel!
    
    
    @IBOutlet weak var LivesLabel: UILabel!
    
    
    @IBOutlet weak var StartLabel: UILabel!
    @IBOutlet weak var EndLabel: UILabel!
    
    @IBOutlet weak var StartButton: UIButton!
    
    @IBOutlet weak var EndButton: UIButton!
    
    var currentScene: SKScene?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Initialize the lives and score
        LivesLabel.isHidden = true
        ScoreLabel.isHidden = true
        EndButton.isHidden = true
        EndLabel.isHidden = true
        
     
//        ScoreManager.gameViewController = self
        
        SetScene(sceneName: "StartScene")
        
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func updateScoreLabel() -> Void
    {
        ScoreLabel.text = "Score: \(ScoreManager.Jackpot)"
    }
    
    func updateLivesLabel() -> Void
    {
        LivesLabel.text = "Lives: \(ScoreManager.Coins)"
    }
    
    
    //LOADING the scene
    func SetScene(sceneName: String) -> Void
    {
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            // store a reference in currentscene
            
            currentScene = SKScene(fileNamed: sceneName)
            
            if let gameScene = currentScene as? GameScene
            {
                gameScene.gameManager = self
            }
            
            // Set the scale mode to scale to fit the window
            currentScene?.scaleMode = .aspectFill
            
            // Present the scene
            view.presentScene(currentScene)
            
            view.ignoresSiblingOrder = true
        }
    }
    
    func PresentStartScene()
    {
        StartButton.isHidden = false
        StartLabel.isHidden = false
        ScoreLabel.isHidden = true
        LivesLabel.isHidden = true
    }
    
    func PresentEndScene()
    {
        EndButton.isHidden = false
        EndLabel.isHidden = false
        ScoreLabel.isHidden = true
        LivesLabel.isHidden = true
        SetScene(sceneName: "EndScene")
    }
    
    @IBAction func StartButton_Pressed(_ sender: UIButton) {
        
        StartButton.isHidden = true
        StartLabel.isHidden = true
        ScoreLabel.isHidden = false
        LivesLabel.isHidden = false

        ScoreManager.Jackpot = 0
        ScoreManager.Coins = 5
        updateLivesLabel()
        updateScoreLabel()
        
        SetScene(sceneName: "GameScene")
    }
    
    
    @IBAction func EndButton_Pressed(_ sender: UIButton) {
        EndButton.isHidden = true
        EndLabel.isHidden = true
        
        ScoreLabel.isHidden = false
        LivesLabel.isHidden = false

        ScoreManager.Jackpot = 0
        ScoreManager.Coins = 5
        updateLivesLabel()
        updateScoreLabel()
        SetScene(sceneName: "GameScene")
    }
    
    
}
