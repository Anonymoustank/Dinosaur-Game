package dinosaur;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.util.ArrayList;

public class GameObject{
    protected int x, y;
    protected ID id;
    protected BufferedImage inputImage;
    protected boolean inAnimation = false;
    protected BufferedImage[] image_array_jump;
    protected BufferedImage[] image_array_ground;
    public GameObject(int x, int y, ID id){
        this.x = x;
        this.y = y;
        this.id = id;
    }
    public void tick(){

    }
    public void render(Graphics g){
        g.drawImage(inputImage, x, y, null);
    }
    public void setX(int x){
        this.x = x;
    }
    public void setY(int y){
        this.y = y;
    }
    public int getX(){
        return x;
    }
    public int getY(){
        return y;
    }
    public void setID(ID id){
        this.id = id;
    }
    public ID getID(){
        return id;
    }
    public void setMovement(boolean inAnimation){
        this.inAnimation = inAnimation;
    }
    public boolean getMovement(){
        return inAnimation;
    }
    public void initialize(){
        
    }
}