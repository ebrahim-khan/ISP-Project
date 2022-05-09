import Scenes
import Igis

class Ball : RenderableEntity, EntityMouseClickHandler {

    //Creating the ball
    let ellipse = Ellipse(center:Point(x:0, y:0), radiusX:20, radiusY:20, fillMode:.fillAndStroke)
    let strokeStyle = StrokeStyle(color:Color(.black))
    let fillStyle = FillStyle(color:Color(red:126, green:137, blue:206))
    let lineWidth = LineWidth(width:3)

    //Initilizaing speed variables for the ball
    var velocityX : Int
    var velocityY : Int

    func onMouseMove(globalLocation: Point, movement: Point) {
        ellipse.center = globalLocation
    }

    //Sets speed of ball
    func changeVelocity(velocityX : Int, velocityY: Int) {
        self.velocityX = velocityX*2
        self.velocityY = velocityY*2
    }
    
    init() {
        // Using a meaningful name can be helpful for debugging
        velocityX = 0
        velocityY = 0
        super.init(name:"Ball")
    }

    override func setup(canvasSize: Size, canvas: Canvas) {
        // Position the ellipse at the center of the canvas
        ellipse.center = canvasSize.center
        dispatcher.registerEntityMouseClickHandler(handler:self)
    }

    //Renders ball onto screen
    override func render(canvas:Canvas) {
        canvas.render(fillStyle, strokeStyle, lineWidth, ellipse)
    }

    override func teardown() {
        dispatcher.unregisterEntityMouseClickHandler(handler:self)
    }

    func onEntityMouseClick(globalLocation: Point) {
        ellipse.center = globalLocation
    }

    //Function to form a rectangle around an object
    override func boundingRect() -> Rect {
        let topLeft = ellipse.center - Point(x: ellipse.radiusX, y: ellipse.radiusY)
        let size = Size(width: ellipse.radiusX, height:  ellipse.radiusY)
        return Rect(topLeft: topLeft, size: size)
        let topRight = ellipse.center - Point(x: ellipse.radiusX, y: ellipse.radiusY)
        let size1 = Size(width: ellipse.radiusX, height:  ellipse.radiusY)
        return Rect(topRight: topRight, size: size1) 
    }

    //Calculates the position of the ball
    override func calculate(canvasSize: Size) {
        ellipse.center += Point(x:velocityX, y:velocityY)
        let canvasBoundingRect = Rect(size:canvasSize) //Forms rectangle around the canvas
        let ballBoundingRect = Rect(topLeft:Point(x:ellipse.center.x-ellipse.radiusX, y:ellipse.center.y-ellipse.radiusY), size:Size(width:ellipse.radiusX*2, height:ellipse.radiusY*2)) //Forms rectangle around the ball
        let tooFarLeft = ballBoundingRect.topLeft.x < canvasBoundingRect.topLeft.x //A boolean; if the ball position is greater than the top left corner of the canvas aka edge of the screen
        let tooFarRight = ballBoundingRect.topLeft.x + ballBoundingRect.size.width > canvasBoundingRect.topLeft.x + canvasBoundingRect.size.width //A boolean; if the balls position is greater than the top right corner of the canvas aka left edge of the screen
        let tooFarUp = ballBoundingRect.topLeft.y < canvasBoundingRect.topLeft.y //A boolean; if the ball position is greater than the top of the canvas aka top of the screen
        let tooFarDown = ballBoundingRect.topLeft.y + ballBoundingRect.size.height > canvasBoundingRect.topLeft.y + canvasBoundingRect.size.height ////A boolean; if the ball position is greater than the bottom corner of the screen aka the bottom of the screen

        if tooFarLeft || tooFarRight { //If tooFarRight or tooFarLeft are true, change direction of travel of the ball
            velocityX = -velocityX
        }

        if tooFarLeft { //If tooFarLeft is true, subtract one point from the score
            ellipse.center.x = canvasBoundingRect.topLeft.x + ellipse.radiusX
            interactionLayer().decrement()
        }
        
        if tooFarRight { //If tooFarRight is true, add one point from the score
            ellipse.center.x = canvasBoundingRect.topLeft.x + canvasBoundingRect.size.width - ellipse.radiusX
            //interactionLayer().increment()
        }

        if tooFarUp { //If tooFarUp is true, change direction of ball and slow it down
            velocityY = -velocityY/2
            velocityX = velocityX/2
            ellipse.center.y = canvasBoundingRect.topLeft.y + ellipse.radiusY
        }

        if tooFarDown { //If tooFarDown is true, change direction of ball and increase speed
            velocityY = -velocityY*2
            velocityX = velocityX*2
            ellipse.center.y = canvasBoundingRect.topLeft.y + canvasBoundingRect.size.height - ellipse.radiusY
        }
    }

    func interactionLayer()->InteractionLayer{
        guard let layer = layer as? InteractionLayer
        else {
            fatalError("layer")
        }
        return layer
    }
}
