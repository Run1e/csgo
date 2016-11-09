#SingleInstance force
FileRead, play, player.txt
teams := []
for a, b in StrSplit(play, "//----------------------------------------------------") {
	team := SubStr(StrSplit(b, "`n")[2], 4, -1)
	if StrLen(team) = 0
		continue
	players := []
	for c, d in StrSplit(b, "End") {
		for e, f in StrSplit(d, "`n")
			if InStr(f, "Elite+") {
				player := SubStr(f, InStr(f, " ") + 1, -1)
				players.Insert(player)
				
			}
	} teams[team] := players
}

for s, d in ["ct", "t"] {
	for a, b in teams {
		asd := ""
		for f, g in b
			asd .= "bot_add_" d " " g "`n"
		FileAppend, % trim(asd, "`n"), % "res\" StrReplace(StrReplace(a, " ", ""), ".", "") "_" d ".cfg"
	}
}
return

m(x*){
	for a,b in x
		text.=b "`n"
	MsgBox,0,Columbus, % text
}

pa(array, depth=5, indentLevel:="   ") {
	for k,v in Array {
		lst.= indentLevel "[" k "]"
		if (IsObject(v) && depth>1)
			lst.="`n" pa(v, depth-1, indentLevel . "    ")
		else
			lst.=" => " v
		lst.="`n"
	} return rtrim(lst, "`r`n `t")
}

pap(array) {
	m(pa(array))
}