using Godot;
using System;

public partial class player : CharacterBody2D
{
	public const float Speed = 300.0f;
	public const float MaxSpeed = 500.0f;
	public const float Acceleration = 5000.0f;
	public const float Deceleration = 8000.0f;
	public const float MinVelocity = 10.0f;

	// Get the gravity from the project settings to be synced with RigidBody nodes.
	public float gravity = ProjectSettings.GetSetting("physics/2d/default_gravity").AsSingle();

 	public override void _PhysicsProcess(double delta)
	{
		Vector2 direction = Input.GetVector("left", "right", "up", "down").Normalized();
		Vector2 velocity = Velocity;

		// Apply acceleration
		if (direction != Vector2.Zero)
		{
			velocity += direction * Acceleration * (float)delta;
			velocity = velocity.LimitLength(MaxSpeed);
		}
		// Apply deceleration when no input
		else
		{
			float decelerationAmount = Deceleration * (float)delta;
			float currentSpeed = velocity.Length();
			if (currentSpeed > MinVelocity)
			{
				float newSpeed = Mathf.Max(currentSpeed - decelerationAmount, 0.0f);
				velocity = velocity.Normalized() * newSpeed;
			}
			else
			{
				velocity = Vector2.Zero;
			}
		}

		Velocity = velocity;
		MoveAndSlide();
	}
}
