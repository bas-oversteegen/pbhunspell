$PBExportHeader$u_pbh_rte_container.sru
forward
global type u_pbh_rte_container from userobject
end type
type lb_1 from listbox within u_pbh_rte_container
end type
type rte_1 from u_pbh_rte within u_pbh_rte_container
end type
type tv_1 from treeview within u_pbh_rte_container
end type
type pb_1 from picturebutton within u_pbh_rte_container
end type
type pb_2 from picturebutton within u_pbh_rte_container
end type
end forward

global type u_pbh_rte_container from userobject
integer width = 3378
integer height = 792
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event ue_resize ( integer ai_width,  integer ai_height )
event type long ue_notify_suggestion ( )
event type long ue_notify_synonym ( )
lb_1 lb_1
rte_1 rte_1
tv_1 tv_1
pb_1 pb_1
pb_2 pb_2
end type
global u_pbh_rte_container u_pbh_rte_container

type prototypes

end prototypes

type variables

end variables

forward prototypes
public subroutine of_refresh_controls ()
end prototypes

event ue_resize(integer ai_width, integer ai_height);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_rte_container.ue_resize()
//
// PURPOSE:    Resize container and its controls based on their visibility.
//
// ARGUMENTS:  [integer] ai_width. New width for this container. 
//             [integer] ai_height. New height for this container.
//
// RETURN:     None.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-04-04  Davros       Initial coding.
// -----------------------------------------------------------------------------

integer li_buttonmarginLR, li_buttonmarginB, li_buttonmarginT

li_buttonmarginLR = 8
li_buttonmarginT = 8
li_buttonmarginB = 12

this.Width = ai_width
this.Height = ai_height
pb_1.Y = li_buttonmarginT
if pb_1.Visible then
	pb_2.Y = pb_1.Y + pb_1.Height + li_buttonmarginB
else
	pb_2.Y = pb_1.Y
end if
pb_1.X = this.Width - li_buttonmarginLR - pb_1.Width
pb_2.X = pb_1.X
lb_1.X = pb_1.X - li_buttonmarginLR - lb_1.Width
lb_1.Height = this.Height
tv_1.X = lb_1.X
tv_1.Y = lb_1.Y
tv_1.Width = lb_1.Width
tv_1.Height = lb_1.Height
rte_1.Height = this.Height
if lb_1.Visible or tv_1.Visible then
	rte_1.Width = lb_1.X - li_buttonmarginLR
elseif pb_1.Visible or pb_2.Visible then
	rte_1.Width = pb_1.X - li_buttonmarginLR
else
	rte_1.Width = this.Width
end if

end event

event type long ue_notify_suggestion();// -----------------------------------------------------------------------------
// SCRIPT:     u_pbh_rte.container.ue_notify_suggestion()
//
// PURPOSE:    Show suggestion list for currently selected word.
//
// ARGUMENTS:  None. 
//
// RETURN:     [long]. Number of suggestions added to list.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-04-06  Davros       Initial coding.
// -----------------------------------------------------------------------------

long ll_sugs, ll_ndx, ll_added
string ls_suggestionlist[]

ll_added = 0

if rte_1.is_word <> "" then
	// Delete current list.
	lb_1.Reset()
	
	// Get suggestions.
	ll_sugs = rte_1.inv_pbh_engine.of_Hunspell_suggest(rte_1.il_hunhandle, ls_suggestionlist[], rte_1.is_word)
	
	// Add suggestions to replacement list.
	if ll_sugs = 0 then
		lb_1.AddItem(rte_1.is_translations[rte_1.IFC_TXT_NOSUGGESTIONS])
	elseif ll_sugs > 0 then
		for ll_ndx = 1 to UpperBound(ls_suggestionlist[])
			lb_1.AddItem(ls_suggestionlist[ll_ndx])
			ll_added += 1
		next
	end if
	
	// Show suggestion list.
	lb_1.Visible = true
	tv_1.Visible = false
	rte_1.ib_cont_replacements = true
	rte_1.ib_cont_suggestions = true
	of_Refresh_controls()
	this.event ue_resize(this.Width, this.Height)
end if

return ll_added
end event

event type long ue_notify_synonym();// -----------------------------------------------------------------------------
// SCRIPT:     u_pbh_rte.container.ue_notify_synonym()
//
// PURPOSE:    Show synonym list for currently selected word.
//
// ARGUMENTS:  None. 
//
// RETURN:     [long]. Number of synonyms added to list.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-04-06  Davros       Initial coding.
// -----------------------------------------------------------------------------

long ll_tvi, ll_totsyns, ll_ndx, ll_ndy, ll_added
boolean lb_first_lower, lb_all_lower, lb_all_upper
string ls_word
str_mythes_meaningentry lstr_meaninglist[]

ll_added = 0

if rte_1.is_word <> "" then
	// Delete current list.
	do until tv_1.FindItem(RootTreeItem!, 0) = -1
		tv_1.DeleteItem(0)
	loop
	
	// Lookup.
	ll_totsyns = rte_1.inv_pbh_engine.of_MyThes_lookup(rte_1.il_mytheshandle, lstr_meaninglist[], rte_1.is_word)
	lb_first_lower = (Lower(Left(rte_1.is_word, 1)) = Left(rte_1.is_word, 1))
	lb_all_lower = (Lower(rte_1.is_word) = rte_1.is_word)
	lb_all_upper = (Upper(rte_1.is_word) = rte_1.is_word)
	if ll_totsyns = 0 and (not lb_all_lower) then
		ls_word = Lower(rte_1.is_word)
		ll_totsyns = rte_1.inv_pbh_engine.of_MyThes_lookup(rte_1.il_mytheshandle, lstr_meaninglist[], ls_word)
	end if

	// Add synonyms to replacement list.
	if ll_totsyns = 0 then
		tv_1.LinesAtRoot = false
		tv_1.InsertItemLast(0, rte_1.is_translations[rte_1.IFC_TXT_NOSYNONYMS], 1)
	elseif ll_totsyns > 0 then
		tv_1.LinesAtRoot = true
		for ll_ndx = 1 to UpperBound(lstr_meaninglist[])
			ll_tvi = tv_1.InsertItemLast(0, lstr_meaninglist[ll_ndx].defn, 0)
			for ll_ndy = 1 to UpperBound(lstr_meaninglist[ll_ndx].synlist[])
				if (not lb_all_lower) then
					if lb_first_lower then
						ls_word = Lower(lstr_meaninglist[ll_ndx].synlist[ll_ndy])
					elseif lb_all_upper then
						ls_word = Upper(lstr_meaninglist[ll_ndx].synlist[ll_ndy])
					else
						ls_word = Upper(Left(lstr_meaninglist[ll_ndx].synlist[ll_ndy], 1)) + &
							Lower(Right(lstr_meaninglist[ll_ndx].synlist[ll_ndy], Len(lstr_meaninglist[ll_ndx].synlist[ll_ndy]) - 1))
					end if
				else
					ls_word = lstr_meaninglist[ll_ndx].synlist[ll_ndy]
				end if
				tv_1.InsertItemLast(ll_tvi, ls_word, 0)
				ll_added += 1
			next
		next
	end if
	
	// Show synonym list.
	ll_tvi = tv_1.FindItem(RootTreeItem!, 0)
	if rte_1.ib_tvsyn_expandall then
		do while ll_tvi <> -1
			tv_1.ExpandItem(ll_tvi)
			ll_tvi = tv_1.FindItem(NextTreeItem!, ll_tvi)
		loop
	else
		tv_1.ExpandItem(ll_tvi)
	end if
	tv_1.Visible = true
	lb_1.Visible = false
	rte_1.ib_cont_replacements = true
	rte_1.ib_cont_suggestions = false
	of_Refresh_controls()
	this.event ue_resize(this.Width, this.Height)
end if

return ll_added
end event

public subroutine of_refresh_controls ();// -----------------------------------------------------------------------------
// SCRIPT:     u_pbh_rte_container.of_Refresh_controls()
//
// PURPOSE:    Show/Hide controls based on the current spelling engine properties.
//
// ARGUMENTS:  None. 
//
// RETURN:     None.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-04-06  Davros       Initial coding.
// -----------------------------------------------------------------------------
boolean lb_nothes

this.SetRedraw(false)

pb_1.Visible = false
pb_2.Visible = false
lb_1.Visible = false
tv_1.Visible = false
If IsValid(rte_1.inv_pbh_engine) then
	if rte_1.il_hunhandle >= 0 then
		pb_1.Visible = true
		lb_nothes = (not rte_1.ib_cont_suggestions) and (IsNull(rte_1.il_mytheshandle) or rte_1.il_mytheshandle < 0)
		if rte_1.ib_auto_spellcheck and (rte_1.ib_cont_suggestions or lb_nothes) then
			pb_2.Visible = true
			if rte_1.ib_cont_replacements then
				lb_1.Visible = true
			end if
		end if
	end if
	if rte_1.il_mytheshandle >= 0 then
		pb_2.Visible = true
		if rte_1.ib_cont_replacements and (not lb_1.Visible) then
			tv_1.Visible = true
		end if
	end if
end if

this.SetRedraw(true)
end subroutine

on u_pbh_rte_container.create
this.lb_1=create lb_1
this.rte_1=create rte_1
this.tv_1=create tv_1
this.pb_1=create pb_1
this.pb_2=create pb_2
this.Control[]={this.lb_1,&
this.rte_1,&
this.tv_1,&
this.pb_1,&
this.pb_2}
end on

on u_pbh_rte_container.destroy
destroy(this.lb_1)
destroy(this.rte_1)
destroy(this.tv_1)
destroy(this.pb_1)
destroy(this.pb_2)
end on

type lb_1 from listbox within u_pbh_rte_container
boolean visible = false
integer x = 2437
integer width = 805
integer height = 500
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer tabstop[] = {0}
string item[] = {""}
end type

event doubleclicked;// -----------------------------------------------------------------------------
// SCRIPT:     u_pbh_rte_container.lb_1.doubleclicked()
//
// PURPOSE:    Notify rte control of suggestion doubleclicked in list.
//
// ARGUMENTS:  None. 
//
// RETURN:     None.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-04-07  Davros       Initial coding.
// -----------------------------------------------------------------------------

string ls_text

ls_text = this.Text(index)
if ls_text <> rte_1.is_translations[rte_1.IFC_TXT_NOSUGGESTIONS] then
	rte_1.event dynamic ue_notify_suggestion(ls_text)
end if

end event

type rte_1 from u_pbh_rte within u_pbh_rte_container
integer width = 2423
integer height = 596
integer taborder = 10
boolean init_hscrollbar = true
boolean init_vscrollbar = true
boolean init_wordwrap = true
boolean init_rulerbar = true
boolean init_tabbar = true
boolean init_toolbar = true
boolean init_headerfooter = true
boolean init_popmenu = true
borderstyle borderstyle = stylebox!
end type

type tv_1 from treeview within u_pbh_rte_container
boolean visible = false
integer x = 2437
integer y = 172
integer width = 731
integer height = 536
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean linesatroot = true
long picturemaskcolor = 536870912
long statepicturemaskcolor = 536870912
end type

event doubleclicked;// -----------------------------------------------------------------------------
// SCRIPT:     u_pbh_rte_container.tv_1.doubleclicked()
//
// PURPOSE:    Notify rte control of synonym doubleclicked in list.
//
// ARGUMENTS:  None. 
//
// RETURN:     None.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-04-07  Davros       Initial coding.
// -----------------------------------------------------------------------------

treeviewitem ltvi_item

this.GetItem(handle, ltvi_item)
if ltvi_item.Level = 2 then
	rte_1.event dynamic ue_notify_synonym(String(ltvi_item.Label))
end if
end event

type pb_1 from picturebutton within u_pbh_rte_container
boolean visible = false
integer x = 3255
integer y = 8
integer width = 110
integer height = 96
integer taborder = 30
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "RichTextEdit!"
alignment htextalign = left!
end type

event clicked;// -----------------------------------------------------------------------------
// SCRIPT:     u_pbh_rte_container.pb_1.clicked()
//
// PURPOSE:    Toggle automatic spellchecking.
//
// ARGUMENTS:  None. 
//
// RETURN:     None.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-03-30  Davros       Initial coding.
// -----------------------------------------------------------------------------

This.Enabled = false

rte_1.of_toggle_spellchecking()
of_Refresh_controls()
parent.event ue_resize(parent.Width, parent.Height)

This.Enabled = true

end event

type pb_2 from picturebutton within u_pbh_rte_container
boolean visible = false
integer x = 3255
integer y = 120
integer width = 110
integer height = 96
integer taborder = 40
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "InsertReturn!"
alignment htextalign = left!
end type

event clicked;// -----------------------------------------------------------------------------
// SCRIPT:     u_pbh_rte_container.pb_2.clicked()
//
// PURPOSE:    Show/Hide replacement list (suggestions xor synonyms).
//
// ARGUMENTS:  None. 
//
// RETURN:     None.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-04-06  Davros       Initial coding.
// -----------------------------------------------------------------------------

This.Enabled = false

parent.rte_1.ib_cont_replacements = (not parent.rte_1.ib_cont_replacements)
of_Refresh_controls()
parent.event ue_resize(parent.Width, parent.Height)

This.Enabled = true




end event

