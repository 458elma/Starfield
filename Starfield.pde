//your code here
Particle []  star;
void setup()
{
	//your code here
	size(400,400);
	star = new Particle [500]; 
	for(int i = 0;i<star.length; i++) {
		if(i%2==0) {
			star[0] = new OddballParticle();
			star[i] = new NormalParticle();
		} else {
			star[1] = new OddballParticle();
			star[i] = new JumboParticle();			
		}
	}
}
void draw()
{
	//your code here
	background(0);
	for(int i = 0;i<star.length; i++){
		star[i].show();
    	star[i].move();
    	star[i].wrap();
	}
	noStroke();
    fill(0,0,0);
    ellipse(200,200,100,100);
}
void mousePressed() {
	for(int i = 0;i<star.length; i++) {

    	star[i].theSpeed = (Math.random()*10)+10;
    
	}
}
void mouseReleased() {
	for(int i = 0;i<star.length; i++) {
    	star[i].theSpeed = (Math.random()*3);
    }
}
class NormalParticle implements Particle
{
	//your code here
	double theX,theY,theAngle,theSpeed;
	int theClr,theSize;
	NormalParticle() {
		theX = (Math.random()*25)+187.5;
		theY = (Math.random()*25)+187.5;
		theAngle = Math.random()*(2*Math.PI);
		theSpeed = (Math.random()*2)+1;//+10;
		theClr = ((int)(Math.random()*80)+175);
		theSize = 5;
		

	}
	void move() {
        theX = theX + Math.cos(theAngle)*theSpeed;
        theY = theY + Math.sin(theAngle)*theSpeed;
        
	}
	void show() {
		noStroke();
		fill(theClr,theClr,255);
		ellipse(theX,theY,theSize,theSize);
	}
	void wrap() {
		if((theX<0)||(theX>400)||(theY<0)||(theY>400)) {
			theX = 200;
			theY = 200;
		}
	}
}
interface Particle
{
	//your code here
	public void move();
	public void show();
	public void wrap();
}
class OddballParticle implements Particle//uses an interface
{
	//your code here
	int leX,leY,laX,laY;
	OddballParticle(){
		leX = (int)(Math.random()*400);
		leY = 100;
		laX = (int)(Math.random()*400);
		laY = 300;
	}
	void move() {
		leY = leY - 1; 
		laY = laY + 1; 
		if(mousePressed) {
    		leY = leY - 5;
    		laY = laY + 5;
    	}
	}
	void show() {
		fill(100,100,255);
		ellipse(leX,leY,15,15);
		ellipse(laX,laY,15,15);
		ellipse(leY,leX,15,15);
		ellipse(laY,laX,15,15);
	}
	void wrap() {
		if(leY<0) {
			leX = (int)(Math.random()*400);
			leY = 100; 
		}
		if(laY>400) {
			laX = (int)(Math.random()*400);
			laY = 300;
		}
	}
}
class JumboParticle extends NormalParticle //uses inheritance
{
	//your code here
	JumboParticle() {
		theSize = 10;
	}

}

