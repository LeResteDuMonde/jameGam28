using Godot;
using System;

public partial class enemySpawner : Node
{
	private float timer = 0.0f;
	private float cooldown = 1.0f;
	[Export] public PackedScene EnemyScene;
	public const float distance = 200.0f;

	public override void _Ready(){

	}
	public override void _Process(double delta)
	{
		
		timer += (float)delta;
		if(timer > cooldown){
			timer = 0;
			SpawnEnemy();
		}
	}

	public void SpawnEnemy(){
		// EnemyScene.
		// Instantiate an enemy instance from the PackedScene
		// Node2D enemyInstance = (Node2D)EnemyScene.Instance();
	}
}
