using Godot;
using System;
using System.Numerics;

public class Player : KinematicBody2D
{
	// Declare member variables here. Examples:
	// private int a = 2;
	// private string b = "text";
	
	private float gravity = 400.0;
	private Vector2 velocity = Vector2(0, 0);

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		
	}
	
	public override void _physics_process(delta: float){
		velocity.y += gravity * delta
		velocity = MoveAndSlide(velocity);
	}

//  // Called every frame. 'delta' is the elapsed time since the previous frame.
//  public override void _Process(float delta)
//  {
//      
//  }
}
