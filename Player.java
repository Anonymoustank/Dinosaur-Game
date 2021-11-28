package dinosaur;
import java.awt.Graphics;

public class Player extends GameObject{
    protected long cooldown = System.currentTimeMillis() - 200;
    protected int moves_remaining = 12;
    protected boolean dead = false;
    public Player(int x, int y, ID id){
        super(x, y, id);
    }
    @Override
    public void render(Graphics g){
        if (getMovement() && this.moves_remaining > 0){
            if (this.dead == false){
                this.inputImage = this.image_array[this.moves_remaining];
            }
        }
        g.drawImage(inputImage, x, y, null);
    }
}