//
//  GameScene.swift
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
import AVFoundation
import SpriteKit
import GameplayKit

let screenSize = UIScreen.main.bounds
var screenWidth: CGFloat?
var screenHeight: CGFloat?


class GameScene: SKScene {
    
    //initializers
    var backgroundImg : BackgroundImg?
    var quit : Quit?
    var spin : Spin?
    var reset: Reset?
    var jackpot: Jackpot?
    var coin: Coin?
    var plusBtn: Plus?
    var minusBtn: Minus?
    
    // Using images as nodes to change on button click
    var firstImage = SKSpriteNode()
    var secondImage = SKSpriteNode()
    var thirdImage = SKSpriteNode()
    
    // Array of texture to show the slot machine images
    var textures = [SKTexture]()
    
    // Labels
    var CreditLabel: SKLabelNode!
    var BetLabel: SKLabelNode!
    var JackpotAmount: SKLabelNode!
    var JackpotMessage: SKLabelNode!
     
    override func didMove(to view: SKView) {
        screenWidth = frame.width
        screenHeight = frame.height
        name = "SLOT MACHINE"
        
        // Adding background to scene
        backgroundImg = BackgroundImg()
        backgroundImg?.position = CGPoint(x: 0,y: 0)
        backgroundImg?.alpha = 0.5
        addChild(backgroundImg!)
        
        // Adding quit button to scene
        quit = Quit()
        quit?.name = "quit"
        quit?.position = CGPoint(x:190,y: 487)
        addChild(quit!)
        
        // Adding spin button to scene
        spin = Spin()
        spin?.name = "spin"
        spin?.position = CGPoint(x: 1.45, y: -410)
        addChild(spin!)
        
        
        // Adding reset button to scene
        reset = Reset()
        reset?.name = "reset"
        reset?.position = CGPoint(x: -230, y: -570)
        addChild(reset!)
        
        // Adding jackpot img to scene
        jackpot = Jackpot()
        jackpot?.name = "Jackpot"
        jackpot?.position = CGPoint(x: -219, y: 466)
        addChild(jackpot!)
        
        // adding credit label
        CreditLabel = SKLabelNode(fontNamed: "Arial")
        CreditLabel.text = String(ScoreManager.Credit)
        CreditLabel.color = .white
        CreditLabel.position = CGPoint(x: -190, y: 544)
        CreditLabel.zPosition = 1
        addChild(CreditLabel)
        
        // adding bet label
        BetLabel = SKLabelNode(fontNamed: "Arial")
        BetLabel.text = String(ScoreManager.Bet)
        BetLabel.color = .white
        BetLabel.position = CGPoint(x: 170, y: -585)
        BetLabel.zPosition = 1
        addChild(BetLabel)
        
        // adding jackpot amount label
        JackpotAmount = SKLabelNode(fontNamed: "Arial")
        JackpotAmount.color = .white
        JackpotAmount.position = CGPoint(x: 50, y: 450)
        JackpotAmount.zPosition = 1
        addChild(JackpotAmount)
        
        // adding jackpot message label
        JackpotMessage = SKLabelNode(fontNamed: "Arial")
        JackpotMessage.color = .white
        JackpotMessage.position = CGPoint(x: -65, y: 450)
        JackpotMessage.zPosition = 1
        addChild(JackpotMessage)

    
        // Adding coin img to scene
        coin = Coin()
        coin?.name = "Coin"
        coin?.position = CGPoint(x: -262, y: 556)
        addChild(coin!)
        

        // binding spritekit nodes to objects
        firstImage = (self.childNode(withName: "image1") as? SKSpriteNode)!
        secondImage = (self.childNode(withName: "image2") as? SKSpriteNode)!
        thirdImage = (self.childNode(withName: "image3") as? SKSpriteNode)!
       
        //appending images to textures array
        textures.append(SKTexture(imageNamed: "5"))
        textures.append(SKTexture(imageNamed: "6"))
        textures.append(SKTexture(imageNamed: "7"))
        textures.append(SKTexture(imageNamed: "8"))
        
        
    
        // Adding bet plus button
        plusBtn = Plus()
        plusBtn?.name = "increase"
        plusBtn?.position = CGPoint(x: 85, y: -570)
        plusBtn?.zPosition = 1
        addChild(plusBtn!)
        
        // Adding bet minus button
        minusBtn = Minus()
        minusBtn?.name = "decrease"
        minusBtn?.position = CGPoint(x: 255, y: -570)
        minusBtn?.zPosition = 1
        addChild(minusBtn!)
        
        // background music
//        let backgroundMusic = SKAudioNode(fileNamed: "backgroundMusicSerious.mp3")
        let backgroundMusic = SKAudioNode(fileNamed: "backgroundMusicLight.mp3")
        self.addChild(backgroundMusic)
        backgroundMusic.autoplayLooped = true // infinte loop
        
        // preload / prewarm impulse sounds
//        do{
//            let sounds:[String] = ["slotMachineRunning", "jackpot", "swordSpin", "error"]
//
//            for sound in sounds{
//                let path: String = Bundle.main.path(forResource: sound, ofType: "mp3")!
//                let url: URL = URL(fileURLWithPath: path)
//                let player: AVAudioPlayer = try AVAudioPlayer(contentsOf: url)
//                player.prepareToPlay()
//            }
//        }
//        catch{}
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
       
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
       
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
                
        for t in touches
        {
            self.touchDown(atPoint: t.location(in: self))
            
            // Current node - Node that is clicked
            let current_node = atPoint(t.location(in: self))
            
            // Conditions to check which button is clicked based on labels
            if current_node.name == "spin" {
            if ScoreManager.Bet == 0
            {
                let alert = UIAlertController(title: "Not allowed", message: "You cannot spin with 0$ bet. Please add bet", preferredStyle:UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.view?.window?.rootViewController?.present(alert, animated: true, completion: nil)
                
                // play sound #1
                // scene.run(SKAction.playSoundFileNamed("yay", waitForCompletion: false))
                
                // play sound #2
//                let errorFx = SKAudioNode(fileNamed: "error.mp3")
//                self.addChild(errorFx)
//                errorFx.autoplayLooped = false // infinte loop

            }
            else {
                
                // Random textures to display random image from available images
                let randX = Int(arc4random_uniform(UInt32(textures.count)))
                let randY = Int(arc4random_uniform(UInt32(textures.count)))
                let randZ = Int(arc4random_uniform(UInt32(textures.count)))
                                
                let texture1 = textures[randX] as SKTexture
                let texture2 = textures[randY] as SKTexture
                let texture3 = textures[randZ] as SKTexture
                
                firstImage.texture = texture1
                secondImage.texture = texture2
                thirdImage.texture = texture3
                
                // Condition to check if user won jackpot
                var jackpotTry = Int.random(in: 1...5)
                var jackporWin = Int.random(in: 1...5)
                if (jackporWin == jackpotTry)
                {
                    let alert = UIAlertController(title: "JackPot !!!", message: "You won a $3000 Jackpot", preferredStyle:UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Yayy !!", style: UIAlertAction.Style.default, handler: nil))
                    self.view?.window?.rootViewController?.present(alert, animated: true, completion: nil)
                    
                    ScoreManager.Jackpot = ScoreManager.Jackpot + 3000
                    JackpotAmount.text = String(ScoreManager.Jackpot)
                    self.updateRemainingCredit(winningAmount: ScoreManager.Jackpot)
                
                }
                
    
                // Winning condition
                if (texture1 == texture2 && texture2 == texture3)
                {
                    JackpotMessage.text = "You Won!"
                    
                    ScoreManager.Jackpot = (ScoreManager.Bet * 2)
                    JackpotAmount.text = String(ScoreManager.Jackpot)
                  
                    // Update credits
                    self.updateRemainingCredit(winningAmount: ScoreManager.Jackpot)
                }
                // if user lost
                else
                {
                    JackpotMessage.text = "Try again!"
                    
                    ScoreManager.Jackpot = 0
                    self.JackpotAmount.text = String(ScoreManager.Jackpot)
                    
                    // Update credits
                    self.updateRemainingCredit(winningAmount: ScoreManager.Jackpot)
                    }
                }
            }
            // Increasing bet
            else if current_node.name == "increase"{
               
                
                JackpotAmount.text = ""
                JackpotMessage.text = ""
                
                ScoreManager.Bet = ScoreManager.Bet + 10
                
                let credit = self.updateCredit(currentBet: ScoreManager.Bet)
                
                BetLabel.text = String(ScoreManager.Bet)
                CreditLabel.text = String(credit)
                
                // Check if user has enough credits to bet
                if credit <= 0
                {
                    let alert = UIAlertController(title: "Not enough credit!", message: "No more credits to bet. Please add more credits", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    self.view?.window?.rootViewController?.present(alert, animated: true, completion: nil)
                    
                   // isUserInteractionEnabled = false
                }
                
            }
            // Decreasing bet
            else if current_node.name == "decrease"{
                
                // If current bet is 0 and user tries to decrease it show alert
                if ScoreManager.Bet == 0
                {
                    let alert = UIAlertController(title: "Cannot decrease!", message: "The bet amount is already at 0$ cannot decrease more.", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    self.view?.window?.rootViewController?.present(alert, animated: true, completion: nil)                }
                else
                {
                    // Decreasing bet and increasing available credits
                    ScoreManager.Bet = ScoreManager.Bet - 10
                    ScoreManager.Coins = ScoreManager.Coins + 10
                    
                    BetLabel.text = String(ScoreManager.Bet)
                    CreditLabel.text = String(ScoreManager.Coins)
                }
            }
   
            else if current_node.name == "quit" {
                
                // Quit button - Exit app
                exit(0)
            }
            
            else if current_node.name == "reset"{
                
                // Reset - Reset initial credit to 200 $ and bet to 0 $
                ScoreManager.Credit = 200
                ScoreManager.Bet = 0
                CreditLabel.text = String(ScoreManager.Credit)
                BetLabel.text = String(ScoreManager.Bet)
            }
            
        }
    }
    
    
    // Update credit
    func updateCredit(currentBet: Int) -> Int
    {
        ScoreManager.Coins = (ScoreManager.Credit - ScoreManager.Bet)
        return ScoreManager.Coins
    }
    
    // Update available credit
    func updateRemainingCredit(winningAmount:Int)
    {
        ScoreManager.Bet = 0
        ScoreManager.Coins += winningAmount
        ScoreManager.Credit = ScoreManager.Coins
        CreditLabel.text = String(ScoreManager.Coins)
        BetLabel.text = String(ScoreManager.Bet)
    }
    
   
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}



