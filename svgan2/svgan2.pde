PShape p;
int vertex = 0;

int thisCount, strokeCount;
boolean capture = false;

void setup()
{
    size(1000, 700);
    p = loadShape("marshal2.svg");
    background(255);
    strokeCount = 0;
    frameRate(300);
}

void draw()
{
    thisCount = 0;
    recurseDraw(p);
    strokeCount++;
    println(frameRate);
    if(capture) saveFrame("images/######.jpg");
}

void recurseDraw(PShape p)
{
    if(p.getChildCount()==0)
    {
           int vertex = 0;
           while(vertex+1<p.getVertexCount())
           {  
               //println(thisCount);
               thisCount++;
               vertex++;
               
               if(thisCount==strokeCount)
               {
                   PVector p0 = p.getVertex(vertex);
                   PVector p1 = p.getVertex(vertex+1);
                   if(PVector.dist(p0,p1)<50)line(p0.x, p0.y, p1.x, p1.y);
                   break;
               }
           }
           
           //if(vertex+1<p.getVertexCount())
           
    }
    else
    {
        if(thisCount<=strokeCount)
        {
            for(int i = 0; i<p.getChildCount(); i++)
            {
                recurseDraw(p.getChild(i));
            }
        }
    }
}


