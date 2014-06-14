PShape p;
int vertex = 0;

int thisCount, strokeCount;
boolean capture = false;
boolean drawEntireStroke = false;
boolean drawSimuStroke = false;

void setup()
{
    size(1000, 700);
    p = loadShape("burd4.svg");
    background(255);
    strokeCount = 0;
    //frameRate(10);
    stroke(0,50);
}

void draw()
{
    thisCount = 0;
    recurseDraw(p);
    strokeCount++;
    //println(frameRate);
    if(capture) saveFrame("images/######.jpg");
}

void recurseDraw(PShape p)
{
    if(p.getChildCount()==0)
    {
           int vertex = 0;
           if(drawSimuStroke) thisCount = 0;
           
           boolean drawStroke = false;
           while(vertex+1<p.getVertexCount())
           {                 
               if(thisCount==strokeCount)
               {
                   PVector p0 = p.getVertex(vertex);
                   PVector p1 = p.getVertex(vertex+1);
                   if(PVector.dist(p0,p1)<50)line(p0.x, p0.y, p1.x, p1.y);
                   drawStroke = true;
               }
               thisCount++;
               vertex++;              
               
           }
           
           if(drawStroke && drawEntireStroke)
           {
               for(int i = 0; i+1<p.getVertexCount();i++)
               {
                   PVector p0 = p.getVertex(i);
                   PVector p1 = p.getVertex(i+1);
                   if(PVector.dist(p0,p1)<50)line(p0.x, p0.y, p1.x, p1.y);
               }
               
           }
           
    }
    else
    {
        if(thisCount<strokeCount)
        {
            for(int i = 0; i<p.getChildCount(); i++)
            {
                recurseDraw(p.getChild(i));
            }
        }
    }
    
}


