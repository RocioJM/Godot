extends Node2D

#var miNombre:String = "Edgard"
#var miNombre:String
#var edad:int = 55
#var altura:float = 55.5
#var status:bool = true
# Called when the node enters the scene tree for the first time.
var puntos:int = 130
var contador:int = 1
var enemigos = ["orco","troll", 50]
var arma:int = 5
var salud_enemigos = {"orco":30,"vampiro":60}

@onready var sprite2d = get_node("Sprite2D")


func _ready():
	#miNombre = "Pepe"
	#print("Mi nombre es " + miNombre)
	#print("Mi edad es " , edad)
	#print("Mi altura es " , altura)
	#print("Mi status es " , status)
	#print("Suma es " , edad + altura)
	
	#if (puntos>100) :
		#print("Ganastes puntos extra!")
	#else :
		#print("Sigue participando")
	#
	#while (contador<=5) :
		#print(contador)
		#contador += 1
	#
	#enemigos.append("vampiro")
	#for enemigo in enemigos :
		#print(enemigo)
	#
	#var danioTotal = calcularDanio(10,arma)
	#print(danioTotal)
	#print(enemigos[1])
	#salud_enemigos["vampiro"] = 70
	#print(salud_enemigos["vampiro"])
	
	#print(sprite2d.texture.load_path)
	#print(sprite2d.transform)
	#sprite2d.position = Vector2(100,100)
	#print(sprite2d.position)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func calcularDanio(fuerza, arma):
	return fuerza*arma
