extends Node

@onready var ComboP1 : int
@onready var ComboP2 : int

@export var P1HP : int
@export var P2HP : int


func ClearHP():
	P1HP = 100
	P2HP = 100
