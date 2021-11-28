package dinosaur;
import java.awt.Graphics;
import java.io.File;
import java.io.InputStream;
import java.io.BufferedInputStream;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;

public class Player extends GameObject{
    protected long cooldown = System.currentTimeMillis() - 200;
    protected int moves_remaining = 12;
    protected boolean dead = false;
    protected boolean has_started = false;
    public Player(int x, int y, ID id){
        super(x, y, id);
    }
    @Override
    public void render(Graphics g){
        if (getMovement() && this.moves_remaining > 0){
            if (this.dead == false){
                this.inputImage = this.image_array_jump[this.moves_remaining];
            }
        }
        g.drawImage(inputImage, x, y, null);
    }
    @Override
    public void initialize(){
        try {
            this.image_array_jump = new BufferedImage[12];
            for (int i = 0; i < image_array_jump.length; i++){
                this.image_array_jump[i] = ImageIO.read(Game.class.getResourceAsStream("Images/Jump (" + Integer.toString(i + 1) + ").png"));
            }
            this.image_array_ground = new BufferedImage[8];
            for (int i = 0; i < image_array_ground.length; i++){
                this.image_array_ground[i] = ImageIO.read(Game.class.getResourceAsStream("Images/Run (" + Integer.toString(i + 1) + ").png"));
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        
    }
}