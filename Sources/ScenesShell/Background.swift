import Scenes
import Igis

/*
 This class is responsible for rendering the background.
 */


class Background : RenderableEntity {

    init() {
          // Using a meaningful name can be helpful for debugging
        super.init(name:"Background")
    }
    
     override func render(canvas: Canvas) {

            //SKY
            let s = Rect (topLeft:Point (x:0, y: 0), size:Size(width: 2000, height: 800))
            let sky = Rectangle(rect:s)
            let skyfill = FillStyle(color:Color(red:135,green:206,blue:250))

            
            //GROUND
            let g = Rect (topLeft:Point (x:0, y: 800), size:Size(width: 2000, height: 800))
            let ground = Rectangle(rect:g)
            let groundfill = FillStyle(color:Color(red:98,green:176,blue:69))

            let d = Rect (topLeft:Point (x:0, y: 840), size:Size(width: 2000, height: 800))
            let dirt = Rectangle(rect:d)
            let dirtfill = FillStyle(color:Color(red:155, green:118, blue:83))

            let d2 = Rect (topLeft:Point (x:0, y: 827), size:Size(width: 2000, height: 13))
            let dirt2 = Rectangle(rect:d2)
            let dirtfill2 = FillStyle(color:Color(red:122, green:93, blue:66))

            
            //TREE
            let t = Rect (topLeft:Point (x:1300, y: 670), size:Size(width: 40, height: 130))
            let tree = Rectangle(rect:t)
            let treefill = FillStyle(color:Color(red:193, green:154, blue:107))

            let l = Rect (topLeft:Point (x:1220, y: 655), size:Size(width: 100, height: 50))
            let leaves = Rectangle(rect:l)
            let leavesfill = FillStyle(color:Color(red:85, green:255, blue:0))

            let l2 = Rect (topLeft:Point (x:1320, y: 645), size:Size(width: 100, height: 50))
            let leaves2 = Rectangle(rect:l2)
            let leavesfill2 = FillStyle(color:Color(red:85, green:255, blue:0))

            let l3 = Rect (topLeft:Point (x:1260, y: 605), size:Size(width: 100, height: 50))
            let leaves3 = Rectangle(rect:l3)
            let leavesfill3 = FillStyle(color:Color(red:85, green:255, blue:0))

            let l4 = Rect (topLeft:Point (x:1280, y: 625), size:Size(width: 100, height: 50))
            let leaves4 = Rectangle(rect:l4)
            let leavesfill4 = FillStyle(color:Color(red:85, green:255, blue:0))


            //CLOUDS
            let c = Rect (topLeft:Point (x:440, y: 100), size:Size(width: 100, height: 40))
            let cloud = Rectangle(rect:c)
            let cloudfill = FillStyle(color:Color(.white))

            let c2 = Rect (topLeft:Point (x:465, y: 80), size:Size(width: 50, height: 40))
            let cloud2 = Rectangle(rect:c2)
            let cloudfill2 = FillStyle(color:Color(.white))

            let c3 = Rect (topLeft:Point (x:1560, y: 260), size:Size(width: 40, height: 30))
            let cloud3 = Rectangle(rect:c3)
            let cloudfill3 = FillStyle(color:Color(.white))

            let c4 = Rect (topLeft:Point (x:1600, y: 230), size:Size(width: 80, height: 60))
            let cloud4 = Rectangle(rect:c4)
            let cloudfill4 = FillStyle(color:Color(.white))

            let c5 = Rect (topLeft:Point (x:1665, y: 245), size:Size(width: 45, height: 45))
            let cloud5 = Rectangle(rect:c5)
            let cloudfill5 = FillStyle(color:Color(.white))

            //SUN
            let sun = Ellipse(center:Point(x:70, y:70), radiusX: 50, radiusY:50, fillMode: .fill)
            let sunfill = FillStyle(color:Color(red:255, green:247, blue:0))
            
            //***
            let rect = Rect (topLeft:Point (x:0, y: 0), size:Size(width: 2000, height: 2000))
            let rectangle = Rectangle(rect:rect)
            let fillstyle = FillStyle(color:Color(.white))
             
            canvas.render(fillstyle, rectangle, skyfill, sky, groundfill, ground, dirtfill, dirt, dirtfill2, dirt2, treefill, tree, leavesfill, leaves, leavesfill2, leaves2, leavesfill3, leaves3, leavesfill4, leaves4, cloudfill, cloud, cloudfill2, cloud2, cloudfill3, cloud3, cloudfill4, cloud4, cloudfill5, cloud5, sunfill, sun)

        }
}

