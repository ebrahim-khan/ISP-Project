import Igis
import Scenes

class Score: RenderableEntity {
    var score = 0 //sets a variable used to hold the score of the player

    let location:Point //Initializes a Point variable

    init(location:Point){ //Used to choose location of the score on the canvas in the Foreground.swift file
        self.location = location
    }

    override func render(canvas:Canvas){ //renders score text with color and size
        let text = Text(location:location,text:String(score))
        text.font = "60pt Impact"
        canvas.render(FillStyle(color:Color(.black)))
        canvas.render(text)
    }

    init(){
        location = Point(x:0,y:0)
    }
} 

