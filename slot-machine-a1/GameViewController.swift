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
    @IBOutlet weak var StartLabel: UILabel!
    @IBOutlet weak var EndLabel: UILabel!
    
    @IBOutlet weak var StartButton: UIButton!
    
    @IBOutlet weak var EndButton: UIButton!
    
    @IBOutlet weak var HelpBtn: UIButton!
    
    @IBOutlet weak var CloseBtn: UIButton!
    
    @IBOutlet weak var HelpDesc: UITextView!
    
    
    var currentScene: SKScene?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Initialize the lives and score
        EndButton.isHidden = true
        EndLabel.isHidden = true
        HelpDesc.isHidden = true
        CloseBtn.isHidden = true
        HelpBtn.isHidden = true
        
     
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
        HelpDesc.isHidden = true
        CloseBtn.isHidden = true
        HelpBtn.isHidden = true
    }
    
    func PresentEndScene()
    {
        EndButton.isHidden = false
        EndLabel.isHidden = false
        HelpDesc.isHidden = true
        CloseBtn.isHidden = true
        HelpBtn.isHidden = true
        SetScene(sceneName: "EndScene")
    }
    
    func PresentHelpScene()
    {
        EndButton.isHidden = true
        EndLabel.isHidden = true
        HelpDesc.isHidden = false
        CloseBtn.isHidden = false
        HelpBtn.isHidden = true
        SetScene(sceneName: "HelpScene")
    }
    
    @IBAction func StartButton_Pressed(_ sender: UIButton) {
        
        StartButton.isHidden = true
        StartLabel.isHidden = true
        HelpDesc.isHidden = true
        CloseBtn.isHidden = true
        HelpBtn.isHidden = false
        
        ScoreManager.Jackpot = 0
        ScoreManager.Coins = 5
        
        SetScene(sceneName: "GameScene")
    }
    
    
    @IBAction func EndButton_Pressed(_ sender: UIButton) {
        EndButton.isHidden = true
        EndLabel.isHidden = true
        HelpDesc.isHidden = true
        CloseBtn.isHidden = true
        HelpBtn.isHidden = false
        
        ScoreManager.Jackpot = 0
        ScoreManager.Coins = 5
        
        
        SetScene(sceneName: "GameScene")
    }
    
    @IBAction func HelpButton(_ sender: UIButton) {
        PresentHelpScene()
        
        
    }
    
    @IBAction func CloseButton_Pressed(_ sender: UIButton) {
        CloseBtn.isHidden = true
        HelpDesc.isHidden = true
        HelpBtn.isHidden = false
        SetScene(sceneName: "GameScene")
        
    }
    
}
