package dinosaur;

import java.awt.Canvas;
import java.awt.Color;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.awt.image.BufferStrategy;
import java.io.File;
import java.io.InputStream;
import java.io.BufferedInputStream;
import javax.imageio.ImageIO;

import java.util.ArrayList;
import java.util.Timer;
import java.util.TimerTask;

import java.awt.Rectangle;
import java.awt.FontMetrics;
import java.awt.geom.Rectangle2D;
import java.awt.Font;

public class Game extends Canvas implements Runnable {
    public static final int WIDTH = 720, HEIGHT = WIDTH/3;
    public static final int FPS = 60;
    private Thread thread;
    private boolean running = false;
    public Timer my_timer = new Timer();
    public TimerTask task = null;
    public long timer;
    public long start_time;
    public int frames = 0;
    public int display_fps = 0;
    public int my_score = 0;
    public Handler handler;
    public Player player;

    public Game(){
        new Window(WIDTH, HEIGHT, "Dinosaur Game", this);
    }

    public synchronized void start(){
        thread = new Thread(this);
        thread.start();
        running = true;
    }

    public synchronized void stop(){
        try{
            thread.join();
            running = false;
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    public void run(){
        task = new TimerTask(){
            @Override
            public void run(){
                if (running){
                    render();
                }
                frames++;
            }
        };
        start_time = System.currentTimeMillis();
        my_timer.scheduleAtFixedRate(task, 0, 17);
        stop();
    }

    private void tick(){

    }

    public void drawCenteredString(Graphics page, String s, int x, int y, int width, int height) {
        FontMetrics fm = page.getFontMetrics(page.getFont());
        Rectangle2D rect = fm.getStringBounds(s, page);
        int textHeight = (int)(rect.getHeight());
        int textWidth  = (int)(rect.getWidth());

        int textX = x + (width - textWidth)/2;
        int textY = y + (height - textHeight)/2 + fm.getAscent();
        page.drawString(s, textX, textY);
      }

    private void render(){
        BufferStrategy bs = this.getBufferStrategy();
        if (!running){
            task.cancel();
        }
        if (bs == null){
            this.createBufferStrategy(3);
            return;
        }
        Graphics g = bs.getDrawGraphics();
        g.setColor(Color.black);
        int fontSize = 25;
        g.setFont(new Font("TimesRoman", Font.BOLD, fontSize));
        g.fillRect(0, 0, WIDTH, HEIGHT);
        if (player.dead && System.currentTimeMillis() - start_time > 1000){
            g.setColor(Color.white);
            fontSize = 50;
            g.setFont(new Font("TimesRoman", Font.BOLD, fontSize));
            drawCenteredString(g, "Final Score: " + my_score, 0, 0, WIDTH, HEIGHT);
            g.setColor(Color.RED);
            drawCenteredString(g, "YOU DIED", 0, 0, WIDTH, (int)(HEIGHT / 2));
            
        }
        else if (System.currentTimeMillis() - start_time > 2250 || player.dead){
            //player.has_started = true;
            handler.render(g);
            g.setColor(Color.red);
            g.drawString("Score: " + my_score, WIDTH - 125, 450);
            if (System.currentTimeMillis() - timer > 1000){
                timer += 1000;
                display_fps = frames;
                frames = 0;
            }
            if (display_fps > 0){
                g.drawString("FPS: " + display_fps, 0, 450);
            }
        }
        else {
            timer = System.currentTimeMillis();
            frames = 0;
            g.setColor(Color.green);
            fontSize = 50;
            g.setFont(new Font("TimesRoman", Font.BOLD, fontSize));
            drawCenteredString(g, "Dinosaur Game", 0, 0, WIDTH, HEIGHT);
            g.setColor(Color.white);
            drawCenteredString(g, "By Pranav Kadekodi", 0, 0, WIDTH, (int)(11 * HEIGHT) / 8);
        }
        g.dispose();
        bs.show();
    }


    public static void main(String[] args){
        new Game();
    }
}