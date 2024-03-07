class_name Imbuements
extends Resource



var list: Dictionary = {
	"Heat"         = ["T1", "H", ""],
	"Cold"         = ["T1", "C", ""],
	"Electricity"  = ["T1", "E", ""],
	"Toxin"        = ["T1", "T", ""],
	
	"Plasma"       = ["T2", "P", "E+H"],
	"Radio"        = ["T2", "R", "E+C"],
	"Acid"         = ["T2", "A", "E+T"],
	"Gas"          = ["T2", "G", "H+C"],
	"Spores"       = ["T2", "Sp", "H+T"],
	"Fossil"       = ["T2", "Fo", "T+C"],
	
	"Explosive"    = ["T3", "X", "G+H"],
	"Corrosive"    = ["T3", "Cr", "A+T"],
	"Light"        = ["T3", "L", "P+H"],

	"Warding"      = ["T3", "W", "R+E"],
	"Infection"    = ["T3", "Ifc", "T+T"],
	"Freeze"       = ["T3", "Fr", "C+C"],
	
	"Radioactive"  = ["T4", "Rad", "R+E"],
	"Nox"          = ["T4", "N", "G+S"],
	"Frostburn"    = ["T4", "Fb", "Fr+H"],
	"Infestation"  = ["T4", "Ifst", "Ifc+Ifc"],
	"Psychic"      = ["T4", "Psy", "Ifc+L"],
	"Life"         = ["T4", "Lf", "L+T"],

	"Decay"        = ["T5", "D", "Cr+Ifc"],
	"Void"         = ["T5", "V", "Shd+Lf"],
	"Nuclear"      = ["T5", "Nc", "Rad+X"],
	"Hivemind"     = ["T5", "Hv", "Lf+Ifst"],
	
	
	"Failure"      = ["Unique", "F", ""],					# Fallback imbuement when trying to mix imbuements doesn't result in anything 
	"Prawnacus"    = ["Unique", "Pwn", ""],					# T2
	"Shadow"       = ["Unique", "Sh", ""],					# T3
	"Leech"        = ["Unique", "Lch", "Lf+Bld"],  			# Inspired to Sol upon using Blood for a while
	"Blood"        = ["Unique", "Bld", "Lf+Plasma"],  		# Inspired to Sol upon defeating [heart-under-blade]
	"Gray Goo"     = ["Unique", "GG", "Ifst+Ifst"],			# Please don't ever make this or it really will be GG
	"Antimatter"   = ["Unique", "Am", "Sh+V"],				# T6 
}


## Returns an Array[String] with imbuement data, in the following order:
## [Tier, Notation, Formula]
func _get(Imbuement: StringName) -> Array[String]:
	var imb = list[Imbuement].get()
	return imb
