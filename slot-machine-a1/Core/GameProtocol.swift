protocol GameProtocol
{
    // Keep objects inside the screen
    func CheckBounds()
    
    // Reset GameObject offscreen
    func Reset()
    
    // Initialize properties of GameObject
    func Start()
    
    // Update will be called every frame
    func Update()
}
