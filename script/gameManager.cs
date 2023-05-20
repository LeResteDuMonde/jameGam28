using Godot;
using System;

public partial class gameManager : Node
{
	private static gameManager instance;
	public static gameManager Instance => instance;

	[Export] public Node2D Player;

	public override void _Ready()
	{
		if (instance == null)
			instance = this;
		else
			throw new InvalidOperationException("Only one instance of gameManager is allowed.");
	}

	// public static Node2D GetPlayer()
	// {
	// 	GD.Print(instance);
	// 	if (instance != null)
	// 		return instance.Player;
	// 	else
	// 		return null; // Handle the case when gameManager instance is not available
	// }
}
