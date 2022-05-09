import Scenes
import Igis

  /*
     This class is responsible for the interaction Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */


class InteractionLayer : Layer, KeyDownHandler {

    let ball = Ball() //Initialize ball
    let paddle = Paddle(rect:Rect(size:Size(width:15, height:120))) //Initialize paddle
    var size = Size(width: 0, height: 0)  

    init() {
          // Using a meaningful name can be helpful for debugging
          super.init(name:"Interaction")

          // We insert our RenderableEntities in the constructor
          insert(entity: ball, at: .front)

          ball.changeVelocity(velocityX: 6, velocityY: 8)
          insert(entity: paddle, at: .front)
    }

    override func preSetup(canvasSize: Size, canvas: Canvas) { 
        paddle.move(to:Point(x: 5, y: canvasSize.center.y)) //Sets location of the paddle at game launch
        dispatcher.registerKeyDownHandler(handler: self)
        size = canvasSize
    }

    func onKeyDown(key:String, code:String, ctrlKey:Bool, shiftKey:Bool, altKey:Bool, metaKey:Bool) {
        if key == "w" && paddle.rectangle.rect.topLeft.y > 0 {
            paddle.rectangle.rect.topLeft.y -= 25 //If W is pressed, move paddle up 25 units
        }

        else if key == "s" { //If S is pressed, move paddle down 25 units
            paddle.rectangle.rect.topLeft.y += 25
        }
        
    }

    override func postTeardown() {
        dispatcher.unregisterKeyDownHandler(handler: self)
    }

    override func preCalculate(canvas: Canvas) {
        let ballBoundingRect = ball.boundingRect() //Creates rectangle around the ball using boundingRect() function found in Ball.swift
        let paddleBoundingRect = paddle.boundingRect() //Creates rectangle around paddle using boundingRect() function found in Ball.swift
        let containmentSet = paddleBoundingRect.containment(target: ballBoundingRect) //creates containment set where paddle hit boc targets the ball
        if !containmentSet.contains(.beyondRight) && !containmentSet.contains(.beyondVertically) { //If the ball is not to the right of, below or above the paddle...
            ball.velocityX *= -1 //Bounce off paddle
            increment() //Increase score by one
        }
    }
    
    func increment(){ //Function that references incrementScore function originally found in MainScene.swift
        mainScene().incrementScore()
    }

    func decrement(){ //Function that references decrementScore function originally found in MainScene.swift
        mainScene().decrementScore()
    }
    
    func mainScene()->MainScene{
        guard let scene = scene as? MainScene else{
            fatalError("")
        }
        
        return scene
    }
}

