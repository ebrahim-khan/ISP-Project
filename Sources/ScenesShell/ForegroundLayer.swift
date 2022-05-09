import Scenes
import Igis
  /*
     This class is responsible for the foreground Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */


class ForegroundLayer : Layer {
    var board : Score //Calls Score class 
    var size = Size(width:0,height:0)

    func incrementScore(){ //Function to increase score
        board.score+=1
    }

        func decrementScore(){ //Function to decrease score
        board.score-=1
    }
    
    override func preSetup(canvasSize:Size,canvas:Canvas){
        size = canvasSize
    } 

      init() {
          // Using a meaningful name can be helpful for debugging
          board = Score(location:Point(x:950, y:500)) //Calls location variable to set where the score text will be placed
          super.init(name:"Foreground")
          insert(entity:board,at:.front)
          // We insert our RenderableEntities in the constructor

      }
}


