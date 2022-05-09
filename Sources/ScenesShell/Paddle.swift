import Igis
import Scenes

class Paddle : RenderableEntity {
    var rectangle : Rectangle //Creating rectangle variable for the paddle

    func move (to point:Point) { //Function that moves the rectangle to a point
        rectangle.rect.topLeft = point
    }

    init(rect:Rect) {
        rectangle = Rectangle(rect:rect, fillMode: .fillAndStroke)
        super.init(name: "Paddle")
    }

    override func render (canvas:Canvas) { //Renders paddle
        let strokeStyle = StrokeStyle(color:Color(.black))
        let fillStyle = FillStyle(color:Color(red:255, green:77, blue:77))
        let lineWidth = LineWidth(width:3)
        canvas.render(strokeStyle, fillStyle, lineWidth, rectangle)
    }

    override func boundingRect() -> Rect { //Creates a rectangle around the paddle used for hit detection
        return rectangle.rect
    }
}


