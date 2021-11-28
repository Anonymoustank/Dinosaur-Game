package dinosaur;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
public class Keychecker extends KeyAdapter {
    public Player player;
    public Keychecker(Player player){
        this.player = player;
    }
    public void keyPressed(KeyEvent e){
        if (!player.dead && player.dead == false && player.getMovement() == false && System.currentTimeMillis() - player.cooldown > 100.0 && player.has_started){
            if (e.getKeyCode() == KeyEvent.VK_W || e.getKeyCode() == KeyEvent.VK_UP){
                player.setMovement(true);
            }
        }  
    }
}