$PBExportHeader$w_pbh_test_spellchecker.srw
forward
global type w_pbh_test_spellchecker from window
end type
type cbx_2 from checkbox within w_pbh_test_spellchecker
end type
type cbx_1 from checkbox within w_pbh_test_spellchecker
end type
type cb_5 from commandbutton within w_pbh_test_spellchecker
end type
type cb_4 from commandbutton within w_pbh_test_spellchecker
end type
type cb_3 from commandbutton within w_pbh_test_spellchecker
end type
type cb_2 from commandbutton within w_pbh_test_spellchecker
end type
type mle_1 from multilineedit within w_pbh_test_spellchecker
end type
type uo_1 from u_pbh_rte_container within w_pbh_test_spellchecker
end type
type cb_1 from commandbutton within w_pbh_test_spellchecker
end type
type language from structure within w_pbh_test_spellchecker
end type
end forward

type language from structure
	string		code
end type

global type w_pbh_test_spellchecker from window
integer width = 3941
integer height = 2356
boolean titlebar = true
string title = "Test"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cbx_2 cbx_2
cbx_1 cbx_1
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
mle_1 mle_1
uo_1 uo_1
cb_1 cb_1
end type
global w_pbh_test_spellchecker w_pbh_test_spellchecker

type variables
n_pbh_engine inv_pbh_engine

end variables

on w_pbh_test_spellchecker.create
this.cbx_2=create cbx_2
this.cbx_1=create cbx_1
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.mle_1=create mle_1
this.uo_1=create uo_1
this.cb_1=create cb_1
this.Control[]={this.cbx_2,&
this.cbx_1,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.mle_1,&
this.uo_1,&
this.cb_1}
end on

on w_pbh_test_spellchecker.destroy
destroy(this.cbx_2)
destroy(this.cbx_1)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.mle_1)
destroy(this.uo_1)
destroy(this.cb_1)
end on

event close;if isvalid(inv_pbh_engine) then destroy inv_pbh_engine

close(this)
end event

event open;long ll_hunhandle, ll_hyphenhandle, ll_mytheshandle, ll_markaction
string ls_affpath, ls_dicpath, ls_markcolorrgb, ls_tempdir
string ls_idxpath, ls_datpath

This.x = 2400
This.Y = 100

// Prepare spellcheck arguments.
//ls_affpath = "F:\temp\dictionaries\en_US.aff"
//ls_dicpath = "F:\temp\dictionaries\en_US.dic"
ls_affpath = "F:\temp\dictionaries\nl_NL.aff"
ls_dicpath = "F:\temp\dictionaries\nl_NL.dic"
//ls_affpath = "F:\temp\dictionaries\el_GR_UTF-8.aff"
//ls_dicpath = "F:\temp\dictionaries\el_GR_UTF-8.dic"
//ls_idxpath = "F:\temp\dictionaries\th_en_US.idx"
//ls_datpath = "F:\temp\dictionaries\th_en_US.dat"
ls_idxpath = "F:\temp\dictionaries\th_nl_v2.idx"
ls_datpath = "F:\temp\dictionaries\th_nl_v2.dat"
//ls_idxpath = "F:\temp\dictionaries\th_el_GR_UTF-8.idx"
//ls_datpath = "F:\temp\dictionaries\th_el_GR_UTF-8.dat"
ls_tempdir = "F:\temp\"


ls_markcolorrgb = "\red255\green255\blue1" // Yellow.
ll_markaction = n_pbh_engine.PBHH_MARKBACKGROUNDCOLOR
//ls_markcolorrgb = "\red255\green0\blue1" // Red.
//ll_markaction = n_pbh_engine.PBHH_MARKFOREGROUNDCOLOR

// Create spellcheck engine.
inv_pbh_engine = create n_pbh_engine
inv_pbh_engine.of_Set_interface_language(inv_pbh_engine.IFC_LNG_NL)
uo_1.rte_1.of_Set_interface_language(uo_1.rte_1.IFC_LNG_NL)

// Set spelling objects.
ll_hunhandle = inv_pbh_engine.of_Hunspell_create(ls_affpath, ls_dicpath)
SetNull(ll_hyphenhandle)
ll_mytheshandle = inv_pbh_engine.of_MyThes_create(ls_idxpath, ls_datpath)

// Set properties of rtf editor.
uo_1.rte_1.PopMenu = true
//uo_1.rte_1.showheadfoot(true, false)
uo_1.rte_1.ib_tvsyn_expandall = true

// Activate spellchecking of rtf editor.
uo_1.rte_1.of_Set_engine(inv_pbh_engine, ll_hunhandle, ll_hyphenhandle, ll_mytheshandle)
uo_1.rte_1.of_Init(ll_markaction, ls_markcolorrgb, ls_tempdir, uo_1)
uo_1.of_Refresh_controls()

end event

event resize;mle_1.Y = newheight - mle_1.Height
mle_1.Width = newwidth - mle_1.X
cb_2.Y = mle_1.Y + 24
cb_4.Y = cb_2.Y
cb_1.Y = cb_4.Y + cb_4.Height + 32
cb_3.Y = cb_1.Y
cb_5.Y = cb_1.Y + cb_1.Height + 32
cbx_1.Y = cb_5.Y + cb_5.Height + 32
cbx_2.Y = cbx_1.Y + cbx_1.Height + 32

uo_1.event ue_resize(newwidth, mle_1.Y - 12)

end event

type cbx_2 from checkbox within w_pbh_test_spellchecker
integer x = 32
integer y = 2060
integer width = 649
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Inputfieldnames visible"
end type

event clicked;uo_1.rte_1.inputfieldnamesvisible = this.checked
end event

type cbx_1 from checkbox within w_pbh_test_spellchecker
integer x = 32
integer y = 1964
integer width = 503
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Inputfields visible"
end type

event clicked;uo_1.rte_1.inputfieldsvisible = this.checked
end event

type cb_5 from commandbutton within w_pbh_test_spellchecker
integer x = 32
integer y = 1828
integer width = 462
integer height = 104
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Insert inputfield"
end type

event clicked;string ls_inputfieldname, ls_inputfieldvalue

ls_inputfieldname = "Surname"
ls_inputfieldvalue = "Janssens"
uo_1.rte_1.inputfieldinsert(ls_inputfieldname)
uo_1.rte_1.inputfieldchangedata(ls_inputfieldname, ls_inputfieldvalue)


end event

type cb_4 from commandbutton within w_pbh_test_spellchecker
integer x = 32
integer y = 1520
integer width = 462
integer height = 104
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Clear RTF"
end type

event clicked;uo_1.rte_1.ClearAll()
end event

type cb_3 from commandbutton within w_pbh_test_spellchecker
integer x = 535
integer y = 1656
integer width = 462
integer height = 104
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "MLE to RTF"
end type

event clicked;string ls_rtf

ls_rtf = mle_1.text
uo_1.rte_1.pasteRTF(ls_rtf)


end event

type cb_2 from commandbutton within w_pbh_test_spellchecker
integer x = 535
integer y = 1520
integer width = 462
integer height = 104
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Clear MLE"
end type

event clicked;mle_1.text = ""
end event

type mle_1 from multilineedit within w_pbh_test_spellchecker
integer x = 1056
integer y = 1508
integer width = 2798
integer height = 700
integer taborder = 70
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

type uo_1 from u_pbh_rte_container within w_pbh_test_spellchecker
integer width = 3867
integer height = 1480
integer taborder = 60
end type

on uo_1.destroy
call u_pbh_rte_container::destroy
end on

type cb_1 from commandbutton within w_pbh_test_spellchecker
integer x = 32
integer y = 1656
integer width = 462
integer height = 104
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "RTF to MLE"
end type

event clicked;string ls_rtf

ls_rtf = uo_1.rte_1.CopyRTF(false)
mle_1.text = ls_rtf

end event

