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
}
