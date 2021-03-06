$PBExportHeader$w_pbh_test_engine.srw
forward
global type w_pbh_test_engine from window
end type
type cb_12 from commandbutton within w_pbh_test_engine
end type
type mle_1 from multilineedit within w_pbh_test_engine
end type
type cb_11 from commandbutton within w_pbh_test_engine
end type
type cb_10 from commandbutton within w_pbh_test_engine
end type
type cb_9 from commandbutton within w_pbh_test_engine
end type
type cb_8 from commandbutton within w_pbh_test_engine
end type
type cb_7 from commandbutton within w_pbh_test_engine
end type
type cb_6 from commandbutton within w_pbh_test_engine
end type
type cb_5 from commandbutton within w_pbh_test_engine
end type
type cb_4 from commandbutton within w_pbh_test_engine
end type
type cb_3 from commandbutton within w_pbh_test_engine
end type
type cb_2 from commandbutton within w_pbh_test_engine
end type
type cb_1 from commandbutton within w_pbh_test_engine
end type
type cb_remove from commandbutton within w_pbh_test_engine
end type
type cb_addwithaffix from commandbutton within w_pbh_test_engine
end type
type cb_add from commandbutton within w_pbh_test_engine
end type
type cb_generate2 from commandbutton within w_pbh_test_engine
end type
type cb_generate from commandbutton within w_pbh_test_engine
end type
type cb_stem2 from commandbutton within w_pbh_test_engine
end type
type cb_stem from commandbutton within w_pbh_test_engine
end type
type cb_analyze from commandbutton within w_pbh_test_engine
end type
type cb_suggest from commandbutton within w_pbh_test_engine
end type
type cb_getdictionaries from commandbutton within w_pbh_test_engine
end type
type cb_destroyall from commandbutton within w_pbh_test_engine
end type
type cb_adddic from commandbutton within w_pbh_test_engine
end type
type cb_createkey from commandbutton within w_pbh_test_engine
end type
type cb_getdicencoding from commandbutton within w_pbh_test_engine
end type
type cb_spell from commandbutton within w_pbh_test_engine
end type
type cb_clear from commandbutton within w_pbh_test_engine
end type
type cb_destroy from commandbutton within w_pbh_test_engine
end type
type cb_create from commandbutton within w_pbh_test_engine
end type
type gb_1 from groupbox within w_pbh_test_engine
end type
type gb_3 from groupbox within w_pbh_test_engine
end type
type gb_2 from groupbox within w_pbh_test_engine
end type
type gb_4 from groupbox within w_pbh_test_engine
end type
type language from structure within w_pbh_test_engine
end type
end forward

type language from structure
	string		code
end type

global type w_pbh_test_engine from window
integer width = 3433
integer height = 2312
boolean titlebar = true
string title = "Test"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_12 cb_12
mle_1 mle_1
cb_11 cb_11
cb_10 cb_10
cb_9 cb_9
cb_8 cb_8
cb_7 cb_7
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
cb_remove cb_remove
cb_addwithaffix cb_addwithaffix
cb_add cb_add
cb_generate2 cb_generate2
cb_generate cb_generate
cb_stem2 cb_stem2
cb_stem cb_stem
cb_analyze cb_analyze
cb_suggest cb_suggest
cb_getdictionaries cb_getdictionaries
cb_destroyall cb_destroyall
cb_adddic cb_adddic
cb_createkey cb_createkey
cb_getdicencoding cb_getdicencoding
cb_spell cb_spell
cb_clear cb_clear
cb_destroy cb_destroy
cb_create cb_create
gb_1 gb_1
gb_3 gb_3
gb_2 gb_2
gb_4 gb_4
end type
global w_pbh_test_engine w_pbh_test_engine

type variables
n_pbh_engine inv_pbh_engine

long il_hunhandle_1, il_hunhandle_2
long il_theshandle_1, il_theshandle_2
long il_hyphenhandle_1, il_hyphenhandle_2
string is_affpath, is_dicpath
string is_idxpath, is_datpath


end variables

on w_pbh_test_engine.create
this.cb_12=create cb_12
this.mle_1=create mle_1
this.cb_11=create cb_11
this.cb_10=create cb_10
this.cb_9=create cb_9
this.cb_8=create cb_8
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_remove=create cb_remove
this.cb_addwithaffix=create cb_addwithaffix
this.cb_add=create cb_add
this.cb_generate2=create cb_generate2
this.cb_generate=create cb_generate
this.cb_stem2=create cb_stem2
this.cb_stem=create cb_stem
this.cb_analyze=create cb_analyze
this.cb_suggest=create cb_suggest
this.cb_getdictionaries=create cb_getdictionaries
this.cb_destroyall=create cb_destroyall
this.cb_adddic=create cb_adddic
this.cb_createkey=create cb_createkey
this.cb_getdicencoding=create cb_getdicencoding
this.cb_spell=create cb_spell
this.cb_clear=create cb_clear
this.cb_destroy=create cb_destroy
this.cb_create=create cb_create
this.gb_1=create gb_1
this.gb_3=create gb_3
this.gb_2=create gb_2
this.gb_4=create gb_4
this.Control[]={this.cb_12,&
this.mle_1,&
this.cb_11,&
this.cb_10,&
this.cb_9,&
this.cb_8,&
this.cb_7,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.cb_remove,&
this.cb_addwithaffix,&
this.cb_add,&
this.cb_generate2,&
this.cb_generate,&
this.cb_stem2,&
this.cb_stem,&
this.cb_analyze,&
this.cb_suggest,&
this.cb_getdictionaries,&
this.cb_destroyall,&
this.cb_adddic,&
this.cb_createkey,&
this.cb_getdicencoding,&
this.cb_spell,&
this.cb_clear,&
this.cb_destroy,&
this.cb_create,&
this.gb_1,&
this.gb_3,&
this.gb_2,&
this.gb_4}
end on

on w_pbh_test_engine.destroy
destroy(this.cb_12)
destroy(this.mle_1)
destroy(this.cb_11)
destroy(this.cb_10)
destroy(this.cb_9)
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_remove)
destroy(this.cb_addwithaffix)
destroy(this.cb_add)
destroy(this.cb_generate2)
destroy(this.cb_generate)
destroy(this.cb_stem2)
destroy(this.cb_stem)
destroy(this.cb_analyze)
destroy(this.cb_suggest)
destroy(this.cb_getdictionaries)
destroy(this.cb_destroyall)
destroy(this.cb_adddic)
destroy(this.cb_createkey)
destroy(this.cb_getdicencoding)
destroy(this.cb_spell)
destroy(this.cb_clear)
destroy(this.cb_destroy)
destroy(this.cb_create)
destroy(this.gb_1)
destroy(this.gb_3)
destroy(this.gb_2)
destroy(this.gb_4)
end on

event close;if isvalid(inv_pbh_engine) then destroy inv_pbh_engine

close(this)
end event

event open;
This.x = 2400
This.Y = 100

 // Create spellcheck engine.
inv_pbh_engine = create n_pbh_engine
inv_pbh_engine.of_Set_interface_language(inv_pbh_engine.IFC_LNG_NL)


end event

type cb_12 from commandbutton within w_pbh_test_engine
integer x = 1829
integer y = 1696
integer width = 466
integer height = 104
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Get version"
end type

event clicked;long ll_ret, ll_ndx
str_pbhunspell_version lstr_pbhunspell_version[]

ll_ret = inv_pbh_engine.of_PBHunspell_get_version(lstr_pbhunspell_version[])

for ll_ndx = 1 to UpperBound(lstr_pbhunspell_version[])
	mle_1.Text += lstr_pbhunspell_version[ll_ndx].libname + " "
	mle_1.Text += lstr_pbhunspell_version[ll_ndx].major
	if lstr_pbhunspell_version[ll_ndx].major <> "" and lstr_pbhunspell_version[ll_ndx].minor <> "" then
		mle_1.Text += '.'
	end if
	mle_1.Text += lstr_pbhunspell_version[ll_ndx].minor
	if lstr_pbhunspell_version[ll_ndx].minor <> "" and lstr_pbhunspell_version[ll_ndx].revision <> "" then
		mle_1.Text += '.'
	end if
   mle_1.Text += lstr_pbhunspell_version[ll_ndx].revision
	if lstr_pbhunspell_version[ll_ndx].revision <> "" then
		mle_1.Text += ' '
	end if
	mle_1.Text += String(lstr_pbhunspell_version[ll_ndx].date, "YYYY-MM-DD") + "~r~n"
next

end event

type mle_1 from multilineedit within w_pbh_test_engine
integer x = 18
integer y = 12
integer width = 1696
integer height = 2020
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_11 from commandbutton within w_pbh_test_engine
integer x = 2834
integer y = 1460
integer width = 466
integer height = 104
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Hyphenate Ext"
boolean cancel = true
end type

event clicked;long ll_ret, ll_ndx
string ls_word, ls_hyphword
long ll_lhmin, ll_rhmin, ll_clhmin, ll_crhmin
str_hyphen_ext lstr_hyphen_ext

ll_lhmin = 0
ll_rhmin = 0
ll_clhmin = 0
ll_crhmin = 0
ls_word = "omaatje" // (Dutch. nonstandard result should be 'oma=tje' instead of 'omaa=tje')
ls_word = "cafeetje" // (Dutch. nonstandard result should be 'café=tje' instead of 'cafee=tje')

ll_ret = inv_pbh_engine.of_Hyphen_hyphenate_ext(il_hyphenhandle_1, ls_word, ls_hyphword, ll_lhmin, ll_rhmin, ll_clhmin, ll_crhmin, lstr_hyphen_ext)

mle_1.Text += lstr_hyphen_ext.hyphens + "~r~n"
for ll_ndx = 1 to UpperBound(lstr_hyphen_ext.rep[])
	if lstr_hyphen_ext.rep[ll_ndx] <> "" then
		mle_1.Text += "rep[" + String(ll_ndx) + "] " + lstr_hyphen_ext.rep[ll_ndx] + "~r~n"
	end if
next
for ll_ndx = 1 to UpperBound(lstr_hyphen_ext.pos[])
	if lstr_hyphen_ext.pos[ll_ndx] <> 0 then
		mle_1.Text += "pos[" + String(ll_ndx) + "] " + String(lstr_hyphen_ext.pos[ll_ndx]) + "~r~n"
	end if
next
for ll_ndx = 1 to UpperBound(lstr_hyphen_ext.cut[])
	if lstr_hyphen_ext.cut[ll_ndx] <> 0 then
		mle_1.Text += "cut[" + String(ll_ndx) + "] " + String(lstr_hyphen_ext.cut[ll_ndx]) + "~r~n"
	end if
next

end event

type cb_10 from commandbutton within w_pbh_test_engine
integer x = 1829
integer y = 1336
integer width = 466
integer height = 104
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Create"
end type

event clicked;string ls_dicpath

ls_dicpath = "F:\temp\dictionaries\hyph_en_US.dic"
ls_dicpath = "F:\temp\dictionaries\hyph_nl_NL_ISO8859-1_omaatje-cafeetje.dic"

il_hyphenhandle_1 = inv_pbh_engine.of_Hyphen_create(ls_dicpath)

mle_1.Text += String(il_hyphenhandle_1) + "~r~n"

end event

type cb_9 from commandbutton within w_pbh_test_engine
integer x = 1829
integer y = 1460
integer width = 466
integer height = 104
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Destroy"
end type

event clicked;inv_pbh_engine.of_Hyphen_destroy(il_hyphenhandle_1)

end event

type cb_8 from commandbutton within w_pbh_test_engine
integer x = 2834
integer y = 1336
integer width = 503
integer height = 104
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Get dic encoding"
end type

event clicked;string ls_encoding

ls_encoding = inv_pbh_engine.of_Hyphen_get_dic_encoding(il_hyphenhandle_1)

mle_1.Text += ls_encoding + "~r~n"

end event

type cb_7 from commandbutton within w_pbh_test_engine
integer x = 2331
integer y = 1460
integer width = 466
integer height = 104
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Destroy all"
end type

event clicked;inv_pbh_engine.of_Hyphen_destroy_all()

end event

type cb_6 from commandbutton within w_pbh_test_engine
integer x = 2331
integer y = 1336
integer width = 466
integer height = 104
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Hyphenate"
end type

event clicked;long ll_ret
string ls_word, ls_hyphword
long ll_lhmin, ll_rhmin, ll_clhmin, ll_crhmin

ll_lhmin = 0
ll_rhmin = 0
ll_clhmin = 0
ll_crhmin = 0
ls_word = "nondenominational"
ls_word = "nón-discrimëinatieïnbeginsel"

ll_ret = inv_pbh_engine.of_Hyphen_hyphenate(il_hyphenhandle_1, ls_word, ls_hyphword, ll_lhmin, ll_rhmin, ll_clhmin, ll_crhmin)

mle_1.Text += ls_hyphword + "~r~n"

end event

type cb_5 from commandbutton within w_pbh_test_engine
integer x = 2331
integer y = 948
integer width = 466
integer height = 104
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Lookup"
end type

event clicked;long ll_totsyns, ll_ndx, ll_ndy
string ls_word
str_mythes_meaningentry lstr_meaninglist[]

//ls_word = "strike"
//ls_word = "reçu"
//ls_word = "nordwärts"
ls_word = "normalerweise"

ll_totsyns = inv_pbh_engine.of_MyThes_lookup(il_theshandle_1, lstr_meaninglist[], ls_word)

for ll_ndx = 1 to UpperBound(lstr_meaninglist[])
	mle_1.Text += "Defn: " + lstr_meaninglist[ll_ndx].defn + "~r~n"
	mle_1.Text += "  Syns: " + String(lstr_meaninglist[ll_ndx].syncount) + "~r~n"
	mle_1.Text += "  "
	for ll_ndy = 1 to UpperBound(lstr_meaninglist[ll_ndx].synlist[])
		mle_1.Text += lstr_meaninglist[ll_ndx].synlist[ll_ndy]
		if ll_ndy <> UpperBound(lstr_meaninglist[ll_ndx].synlist[]) then
			mle_1.Text += "|"
		end if
	next
	mle_1.Text += "~r~n~r~n"
next

end event

type cb_4 from commandbutton within w_pbh_test_engine
integer x = 2331
integer y = 1072
integer width = 466
integer height = 104
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Destroy all"
end type

event clicked;inv_pbh_engine.of_MyThes_destroy_all()

end event

type cb_3 from commandbutton within w_pbh_test_engine
integer x = 2834
integer y = 948
integer width = 503
integer height = 104
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Get thes encoding"
end type

event clicked;string ls_encoding

ls_encoding = inv_pbh_engine.of_MyThes_get_th_encoding(il_theshandle_1)

mle_1.Text += ls_encoding + "~r~n"

end event

type cb_2 from commandbutton within w_pbh_test_engine
integer x = 1829
integer y = 1072
integer width = 466
integer height = 104
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Destroy"
end type

event clicked;inv_pbh_engine.of_MyThes_destroy(il_theshandle_1)

end event

type cb_1 from commandbutton within w_pbh_test_engine
integer x = 1829
integer y = 948
integer width = 466
integer height = 104
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Create"
end type

event clicked;string ls_idxpath, ls_datpath

//ls_idxpath = "F:\temp\dictionaries\th_en_US.idx"
//ls_datpath = "F:\temp\dictionaries\th_en_US.dat"
//ls_idxpath = "F:\temp\dictionaries\th_nl_v2.idx"
//ls_datpath = "F:\temp\dictionaries\th_nl_v2.dat"
ls_idxpath = "F:\temp\dictionaries\th_de_DE_UTF-8.idx"
ls_datpath = "F:\temp\dictionaries\th_de_DE_UTF-8.dat"

il_theshandle_1 = inv_pbh_engine.of_MyThes_create(ls_idxpath, ls_datpath)

mle_1.Text += String(il_theshandle_1) + "~r~n"

end event

type cb_remove from commandbutton within w_pbh_test_engine
integer x = 2834
integer y = 460
integer width = 466
integer height = 104
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Remove"
end type

event clicked;long ll_removed, ll_spell
string ls_word

ls_word = "bimbeër"

ll_spell = inv_pbh_engine.of_Hunspell_spell(il_hunhandle_1, ls_word)
ll_removed = inv_pbh_engine.of_Hunspell_remove(il_hunhandle_1, ls_word)
ll_spell = inv_pbh_engine.of_Hunspell_spell(il_hunhandle_1, ls_word)

mle_1.Text += String(ll_removed) + "~r~n"

end event

type cb_addwithaffix from commandbutton within w_pbh_test_engine
integer x = 2834
integer y = 336
integer width = 466
integer height = 104
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Add with affix"
end type

event clicked;long ll_added, ll_suggest, ll_ndx, ll_spell
string ls_word, ls_suggestionlist[], ls_example

//ls_word = "bimbur"
//ls_example = "bar"
ls_word = "bimbeër"
ls_example = "zoöloog"

ll_added = inv_pbh_engine.of_Hunspell_add_with_affix(il_hunhandle_1, ls_word, ls_example)
ll_spell = inv_pbh_engine.of_Hunspell_spell(il_hunhandle_1, ls_word)
ll_suggest = inv_pbh_engine.of_Hunspell_stem(il_hunhandle_1, ls_suggestionlist[], ls_word)

for ll_ndx = 1 to UpperBound(ls_suggestionlist[])
	mle_1.Text += ls_suggestionlist[ll_ndx] + "~r~n"
next

end event

type cb_add from commandbutton within w_pbh_test_engine
integer x = 2834
integer y = 212
integer width = 466
integer height = 104
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Add"
end type

event clicked;long ll_added, ll_suggest, ll_ndx, ll_spell
string ls_word, ls_suggestionlist[]

//ls_word = "seguritask"
//ls_word = "ludiekiër"
ls_word = "bimbeër"

ll_added = inv_pbh_engine.of_Hunspell_add(il_hunhandle_1, ls_word)
ll_spell = inv_pbh_engine.of_Hunspell_spell(il_hunhandle_1, ls_word)
ll_suggest = inv_pbh_engine.of_Hunspell_stem(il_hunhandle_1, ls_suggestionlist[], ls_word)

for ll_ndx = 1 to UpperBound(ls_suggestionlist[])
	mle_1.Text += ls_suggestionlist[ll_ndx] + "~r~n"
next

end event

type cb_generate2 from commandbutton within w_pbh_test_engine
integer x = 2331
integer y = 584
integer width = 466
integer height = 104
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Generate2"
end type

event clicked;string ls_list[], ls_desc[], ls_word
long ll_n, ll_ndx

//ls_word = "boy"
//ls_desc[1] = "is:plural"

ls_word = "jongen"
ls_desc[1] = "is:plural"

ll_n = inv_pbh_engine.of_Hunspell_generate2(il_hunhandle_1, ls_list[], ls_word, ls_desc[], 1)

for ll_ndx = 1 to UpperBound(ls_list[])
	mle_1.Text += ls_list[ll_ndx] + "~r~n"
next

end event

type cb_generate from commandbutton within w_pbh_test_engine
integer x = 2331
integer y = 460
integer width = 466
integer height = 104
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Generate"
end type

event clicked;string ls_slst1[], ls_word1, ls_word2
long ll_n, ll_ndx

//ls_word1 = "telling"
//ls_word2 = "ran"
//// told

//ls_word1 = "bell"
//ls_word2 = "spells"
//// tell

//ls_word1 = "girl"
//ls_word2 = "boys"
// girls

ls_word1 = "meisje"
ls_word2 = "jongens"
// meisjes

ll_n = inv_pbh_engine.of_Hunspell_generate(il_hunhandle_1, ls_slst1[], ls_word1, ls_word2)

for ll_ndx = 1 to UpperBound(ls_slst1[])
	mle_1.Text += ls_slst1[ll_ndx] + "~r~n"
next

end event

type cb_stem2 from commandbutton within w_pbh_test_engine
integer x = 2331
integer y = 336
integer width = 466
integer height = 104
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Stem2"
end type

event clicked;string ls_slst1[], ls_slst2[], ls_word
long ll_n1, ll_n2, ll_ndx

//ls_word = "moped"
ls_word = "dadaïstische"

ll_n1 = inv_pbh_engine.of_Hunspell_analyze(il_hunhandle_1, ls_slst1[], ls_word)
ll_n2 = inv_pbh_engine.of_Hunspell_stem2(il_hunhandle_1, ls_slst2[], ls_slst1[], ll_n1)

for ll_ndx = 1 to UpperBound(ls_slst2[])
	mle_1.Text += ls_slst2[ll_ndx] + "~r~n"
next

end event

type cb_stem from commandbutton within w_pbh_test_engine
integer x = 2331
integer y = 212
integer width = 466
integer height = 104
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Stem"
end type

event clicked;long ll_suggest, ll_ndx
string ls_word, ls_suggestionlist[]

//ls_word = "printers"
//ls_word = "industrieën"
//ls_word = "aardoliën"
ls_word = "algebraïsche"

ll_suggest = inv_pbh_engine.of_Hunspell_stem(il_hunhandle_1, ls_suggestionlist[], ls_word)

for ll_ndx = 1 to UpperBound(ls_suggestionlist[])
	mle_1.Text += ls_suggestionlist[ll_ndx] + "~r~n"
next

end event

type cb_analyze from commandbutton within w_pbh_test_engine
integer x = 2331
integer y = 88
integer width = 466
integer height = 104
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Analyze"
end type

event clicked;long ll_suggest, ll_ndx
string ls_word, ls_suggestionlist[]
blob lblb_word

//ls_word = "drinkable"
//ls_word = "gigantisch"
//ls_word = "colloïdaal"
ls_word = "dadaïstisch"

ll_suggest = inv_pbh_engine.of_Hunspell_analyze(il_hunhandle_1, ls_suggestionlist[], ls_word)

for ll_ndx = 1 to UpperBound(ls_suggestionlist[])
	mle_1.Text += ls_suggestionlist[ll_ndx] + "~r~n"
next

end event

type cb_suggest from commandbutton within w_pbh_test_engine
integer x = 1829
integer y = 708
integer width = 466
integer height = 104
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Suggest"
end type

event clicked;long ll_suggest, ll_ndx
string ls_word, ls_suggestionlist[]

//ls_word = "occas"
//ls_word = "coöper"
ls_word = "αβαθμίδωτ"
//ls_word = "Änder"

ll_suggest = inv_pbh_engine.of_Hunspell_suggest(il_hunhandle_1, ls_suggestionlist[], ls_word)

for ll_ndx = 1 to UpperBound(ls_suggestionlist[])
	mle_1.Text += ls_suggestionlist[ll_ndx] + "~r~n"
next

end event

type cb_getdictionaries from commandbutton within w_pbh_test_engine
integer x = 2331
integer y = 708
integer width = 466
integer height = 104
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Get dictionaries"
end type

event clicked;long ll_ndx
str_hunspell_filebundle lstr_bundle

lstr_bundle = inv_pbh_engine.of_Hunspell_get_file_bundle(il_hunhandle_1)

mle_1.Text += lstr_bundle.affpath + "~r~n"
for ll_ndx = 1 to UpperBound(lstr_bundle.dicpath[])
	mle_1.Text += lstr_bundle.dicpath[ll_ndx] + "~r~n"
next

end event

type cb_destroyall from commandbutton within w_pbh_test_engine
integer x = 2834
integer y = 584
integer width = 466
integer height = 104
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Destroy all"
end type

event clicked;inv_pbh_engine.of_Hunspell_destroy_all()

end event

type cb_adddic from commandbutton within w_pbh_test_engine
integer x = 1829
integer y = 336
integer width = 466
integer height = 104
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Add dic"
end type

event clicked;string ls_dicpath
long ll_ret

ls_dicpath = "F:\temp\dictionaries\en_GB.dic"

ll_ret = inv_pbh_engine.of_hunspell_add_dic(il_hunhandle_1, ls_dicpath)

mle_1.Text += String(ll_ret) + "~r~n"

end event

type cb_createkey from commandbutton within w_pbh_test_engine
integer x = 1829
integer y = 212
integer width = 466
integer height = 104
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Create key"
end type

event clicked;string ls_affpath, ls_dicpath
string ls_key

ls_key = "yibbëdïjibbidah"
//ls_affpath = "F:\temp\dictionaries\en_US.aff"
//ls_dicpath = "F:\temp\dictionaries\en_US.dic"
ls_affpath = "F:\temp\dictionaries\nl_NL.aff"
ls_dicpath = "F:\temp\dictionaries\nl_NL.dic"
//ls_affpath = "F:\temp\dictionaries\el_GR2.aff"
//ls_dicpath = "F:\temp\dictionaries\el_GR2.dic"

il_hunhandle_1 = inv_pbh_engine.of_hunspell_create_key(ls_affpath, ls_dicpath, ls_key)

mle_1.Text += String(il_hunhandle_1) + "~r~n"

end event

type cb_getdicencoding from commandbutton within w_pbh_test_engine
integer x = 1829
integer y = 584
integer width = 466
integer height = 104
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Get dic encoding"
end type

event clicked;string ls_encoding

ls_encoding = inv_pbh_engine.of_Hunspell_get_dic_encoding(il_hunhandle_1)

mle_1.Text += ls_encoding + "~r~n"

end event

type cb_spell from commandbutton within w_pbh_test_engine
integer x = 1829
integer y = 460
integer width = 466
integer height = 104
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Spell"
end type

event clicked;long ll_spell
string ls_word, ls_result

//ls_word = "kanoën"
//ls_word = "coöperatie"
//ls_word = "moedeloosheid"
//ls_word = "boerderij"
ls_word = "άβαθη"
//ls_word = "Ändern"

ll_spell = inv_pbh_engine.of_Hunspell_spell(il_hunhandle_1, ls_word)

ls_result = ls_word
if ll_spell = 1 then
	ls_result += " is spelled correctly"
else
	ls_result += " is misspelled"
end if
ls_result += " (" + String(ll_spell) + ")"

mle_1.Text += ls_result + "~r~n"

end event

type cb_clear from commandbutton within w_pbh_test_engine
integer x = 32
integer y = 2068
integer width = 343
integer height = 104
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Clear"
end type

event clicked;mle_1.Text = ""

end event

type cb_destroy from commandbutton within w_pbh_test_engine
integer x = 2834
integer y = 88
integer width = 466
integer height = 104
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Destroy"
end type

event clicked;inv_pbh_engine.of_hunspell_destroy(il_hunhandle_1)

end event

type cb_create from commandbutton within w_pbh_test_engine
integer x = 1829
integer y = 88
integer width = 466
integer height = 104
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Create"
end type

event clicked;string ls_affpath, ls_dicpath

//ls_affpath = "F:\temp\dictionaries\en_US.aff"
//ls_dicpath = "F:\temp\dictionaries\en_US.dic"
//ls_affpath = "F:\temp\dictionaries\nl_NL.aff"
//ls_dicpath = "F:\temp\dictionaries\nl_NL.dic"
ls_affpath = "F:\temp\dictionaries\el_GR_UTF-8.aff"
ls_dicpath = "F:\temp\dictionaries\el_GR_UTF-8.dic"
//ls_affpath = "F:\temp\dictionaries\el_GR_ISO8859-7.aff"
//ls_dicpath = "F:\temp\dictionaries\el_GR_ISO8859-7.dic"
//ls_affpath = "F:\temp\dictionaries\de_DE_ISO8859-1.aff"
//ls_dicpath = "F:\temp\dictionaries\de_DE_ISO8859-1.dic"
//ls_affpath = "F:\temp\dictionaries\de_DE_UTF-8.aff"
//ls_dicpath = "F:\temp\dictionaries\de_DE_UTF-8.dic"

il_hunhandle_1 = inv_pbh_engine.of_hunspell_create(ls_affpath, ls_dicpath)

mle_1.Text += String(il_hunhandle_1) + "~r~n"

end event

type gb_1 from groupbox within w_pbh_test_engine
integer x = 1778
integer y = 20
integer width = 1605
integer height = 844
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hunspell"
end type

type gb_3 from groupbox within w_pbh_test_engine
integer x = 1783
integer y = 1272
integer width = 1605
integer height = 340
integer taborder = 90
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hyphen (LibHnj)"
end type

type gb_2 from groupbox within w_pbh_test_engine
integer x = 1778
integer y = 884
integer width = 1605
integer height = 360
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "MyThes"
end type

type gb_4 from groupbox within w_pbh_test_engine
integer x = 1783
integer y = 1632
integer width = 1605
integer height = 208
integer taborder = 100
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "PBHunspell"
end type

