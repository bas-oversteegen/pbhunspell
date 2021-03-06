$PBExportHeader$u_pbh_rte.sru
forward
global type u_pbh_rte from richtextedit
end type
end forward

global type u_pbh_rte from richtextedit
integer width = 1015
integer height = 688
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
borderstyle borderstyle = stylelowered!
event ue_notify_suggestion ( string as_text )
event ue_notify_synonym ( string as_text )
end type
global u_pbh_rte u_pbh_rte

type prototypes

end prototypes

type variables
// Remarks about spellchecking support by built-in RichTextEdit control of
// PowerBuilder 12.X (TX Text Control) and PowerBuilder 17.0 (TE Edit control).
// 
// 1) The RTE control does not support text style 'wave underline'.
// 2) The RTE control allows setting the highlight color for individual words
//    only via the internal popmenu but not via a function call. However, we
//		can manipulate the rtf document string. 
// 3) The RTE control manages its color table dynamically to only contain the
//    colors actually used. Therefore we need to add our spellcheck highlight
//    color if not yet in the color table.
// 4) The RTE control rebuilds inserted rtf files/strings. I didn't find a way
//    to make it keep PBHunspell proprietary spell marks, which we could hide 
//    before and show again after actions like print preview. Hide&show is faster
//    than completely removing the spell marks and then spellcheck again, like we
//    do now. A related drawback is that the spellcheck highlight color must be a
//    color exclusively used for spellchecking. Also, to prevent losing the
//    actual text color we do not spellcheck colored text if it has the spellcheck
//    highlight style.

Private:
n_pbh_service inv_pbh_service
window iw_root

// RTF generators.
constant integer PBHH_RTF_GEN_DEFAULT = 0
constant integer PBHH_RTF_GEN_TXTEXT = 1
constant integer PBHH_RTF_GEN_TEEDIT = 2

// RTF generator of this RTE control.
integer ii_rtf_generator

// Last state of rte property PopMenu.
boolean ib_popmenu

// Popmenu list.
constant integer PBH_MNU_MAXSYNONYMS = 5
constant integer PBH_MNU_MAXSUGGESTIONS = 5

// Spellmarks of selected word.
string is_spellmarks[]

// Interface language currently active. One of the constants 'IFC_LNG...'.
integer ii_iface_language

Public:
// Spellcheck engine.
n_pbh_engine inv_pbh_engine

// PBHunspell module handles.
long il_hunhandle
long il_hyphenhandle
long il_mytheshandle

// Spellcheck properties.
boolean ib_auto_spellcheck
long il_markaction
string is_markcolorrgb
string is_tempdir
boolean ib_tvsyn_expandall

// Translations of the active interface language ii_iface_language.
string is_translations[]

// Interface language identifiers.
constant integer IFC_LNG_EN = 1
constant integer IFC_LNG_NL = 2

// Interface text identifiers.
constant integer IFC_TXT_MSGBOX_TITLE = 1
constant integer IFC_TXT_LNGNOTSUPPORTED = 2
constant integer IFC_TXT_NOSUGGESTIONS = 3
constant integer IFC_TXT_NOSYNONYMS = 4
constant integer IFC_TXT_SHOWMORE = 5

// rte container.
userobject iuo_rte_container
boolean ib_cont_replacements
boolean ib_cont_suggestions

// Selected word fed to replacements popmenu and list.
string is_word

end variables
forward prototypes
public subroutine of_set_engine (n_pbh_engine anv_pbh_engine, long al_hunhandle, long al_hyphenhandle, long al_mytheshandle)
public subroutine of_toggle_spellchecking ()
public subroutine of_set_interface_language (integer ai_language_id)
public function integer of_get_interface_language ()
public subroutine of_show_message (integer ai_text_id, string as_parm1, icon aicon_symbol)
public function window of_get_root_window ()
public function long of_show_replacements (boolean ab_popmenu)
public function string of_select_current_word ()
public function long of_add_suggestions_to_popmenu (ref m_pbh_suggestions am_pbh_suggestions)
public function long of_add_synonyms_to_popmenu (ref m_pbh_synonyms am_pbh_synonyms)
public subroutine of_init (long al_markaction, string as_markcolorrgb, string as_tempdir, ref userobject auo_rte_container)
public subroutine of_get_rtf_generator ()
public function long of_get_rtf_color_index (ref string as_rtf, string as_markcolorrgb)
public function long of_get_spellmarks (ref string as_rtf)
public function boolean of_has_spellmarks (ref string as_rtf)
public function long of_pos_rtf_unescaped (ref string as_source, string as_target, long al_startpos)
public function boolean of_is_rtf_backslash_literal (ref string as_source, long al_pos)
end prototypes

event ue_notify_suggestion(string as_text);// -----------------------------------------------------------------------------
// SCRIPT:     u_pbh_rte.ue_notify_suggestion()
//
// PURPOSE:    Replace selected word with suggestion clicked in replacements menu
//             or list.
//
// ARGUMENTS:  [string]. Text of suggestion. 
//
// RETURN:     None.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-04-01  Davros       Initial coding.
// -----------------------------------------------------------------------------

string ls_word, ls_rtf_word
long ll_currow, ll_curcol, ll_pos, ll_ndx

if as_text <> "" then
	ls_word = this.SelectedText()
	if (ls_word = is_word and ls_word <> "") then
		// Replace selected word with suggestion.
		This.ReplaceText(as_text)

		// Move cursor back into replacement word.
		this.Position(ll_currow, ll_curcol)
		this.SelectText(ll_currow, ll_curcol - 1, 0, 0)

		// Remove spellmarks from replacement word.
		this.SelectTextWord()
		ls_word = this.SelectedText()
		if ls_word <> "" then
			ls_rtf_word = this.CopyRTF(true)
			ll_pos = Pos(ls_rtf_word, is_markcolorrgb)
			if ll_pos > 0 then
				ls_rtf_word = Replace(ls_rtf_word, ll_pos, Len(is_markcolorrgb), "")
			end if
			for ll_ndx = 1 to UpperBound(is_spellmarks[])
				ls_rtf_word = inv_pbh_service.of_replace_all(ls_rtf_word, is_spellmarks[ll_ndx], "")
			next
			This.PasteRTF(ls_rtf_word)
		end if
	end if
end if

end event

event ue_notify_synonym(string as_text);// -----------------------------------------------------------------------------
// SCRIPT:     u_pbh_rte.ue_notify_synonym()
//
// PURPOSE:    Replace selected word with synonym clicked in replacements menu
//             or list.
//
// ARGUMENTS:  [string]. Text of synonym. 
//
// RETURN:     None.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-04-01  Davros       Initial coding.
// -----------------------------------------------------------------------------

string ls_word

if as_text <> "" then
	ls_word = this.SelectedText()
	if (ls_word = is_word and ls_word <> "") then
		This.ReplaceText(as_text)
	end if
end if

end event

public subroutine of_set_engine (n_pbh_engine anv_pbh_engine, long al_hunhandle, long al_hyphenhandle, long al_mytheshandle);// -----------------------------------------------------------------------------
// SCRIPT:     u_pbh_rte.of_Set_engine()
//
// PURPOSE:    Set pbhunspell engine used by this RichtTextEdit object. The passed
//             engine anv_pbh_engine must be a valid (instantiated) n_pbh_engine
//             object.
//
//             u_pbh_rte depends on an n_pbh_engine object created somewhere
//             else in the application. This engine can be used by several
//             RichtTextEdit objects or other word processing objects which can
//             switch on the fly to another engine or spell object handles.
//
// ARGUMENTS:  [n_pbh_engine] anv_pbh_engine. Valid instance of pbhunspell engine.
//             [long] al_hunhandle. Handle of Hunspell object to use. Possible values
//             are: NULL (Hunspell is inactive), < 0 (error), >= 0 (valid handle).
//             [long] al_hyphenhandle. Handle of Hyphen object to use. Possible values
//             are: NULL (Hyphen is inactive), < 0 (error), >= 0 (valid handle).
//             [long] al_mytheshandle. Handle of MyThes object to use. Possible values
//             are: NULL (MyThes is inactive), < 0 (error), >= 0 (valid handle).
//
// RETURN:     None.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-02-22  Davros       Initial coding.
// -----------------------------------------------------------------------------

inv_pbh_engine = anv_pbh_engine
il_hunhandle = al_hunhandle
il_hyphenhandle = al_hyphenhandle
il_mytheshandle = al_mytheshandle

end subroutine

public subroutine of_toggle_spellchecking ();// -----------------------------------------------------------------------------
// SCRIPT:     u_pbh_rte.of_Toggle_spellchecking()
//
// PURPOSE:    Toggle (enable/disable) automatic spellchecking.
//
// ARGUMENTS:  None. 
//
// RETURN:     None.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-03-30  Davros       Initial coding.
// -----------------------------------------------------------------------------

pointer lpt_oldpointer
string ls_filepath, ls_prefix, ls_ext
long ll_err

ls_prefix = "pbh"
ls_ext = ".rtf"

lpt_oldpointer = SetPointer(HourGlass!)
This.SetRedraw(false)

// Create temp .rtf file.
ls_filepath = inv_pbh_service.of_create_unique_temp_file(is_tempdir, ls_prefix, ls_ext)

if IsValid(inv_pbh_engine) then
	This.SaveDocument(ls_filepath, FileTypeRichText!)
	if ib_auto_spellcheck then
		// Unhighlight misspelled words.
		ll_err = inv_pbh_engine.of_PBHunspell_unspellcheck_rtf_file(ls_filepath, &
				ls_filepath, il_markaction, is_markcolorrgb)
		if ll_err = 0 then
			This.InsertDocument(ls_filepath, true, FileTypeRichText!)
			ib_auto_spellcheck = false
			
			// Restore original state of RTE internal popmenu.
			this.PopMenu = ib_popmenu
		end if
	else
		// Highlight misspelled words.
		ll_err = inv_pbh_engine.of_PBHunspell_spellcheck_rtf_file(il_hunhandle, ls_filepath, &
				ls_filepath, il_markaction, is_markcolorrgb)
		if ll_err = 0 then
			This.InsertDocument(ls_filepath, true, FileTypeRichText!)
			ib_auto_spellcheck = true
			
			// In autospellcheck mode, RTE internal popmenu is replaced by PBH spellcheck popmenu.
			ib_popmenu = this.PopMenu
			this.PopMenu = false
		end if
	end if
end if

// Delete temp .rtf file.
if FileExists(ls_filepath) then
	FileDelete(ls_filepath)
end if

This.SetRedraw(true)
SetPointer(lpt_oldpointer)

end subroutine

public subroutine of_set_interface_language (integer ai_language_id);// -----------------------------------------------------------------------------
// SCRIPT:     u_pbh_rte.of_Set_interface_language()
//
// PURPOSE:    Set language for translations in interface. Technically this means
//             that the translation list is set up for that language.
//
// ARGUMENTS:  [integer] ai_language_id. Language identifier. Valid values are the
//             'IFC_LNG_...' constants declared in section 'Declare Instance Variables'.
//
// RETURN:     None.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-04-01  Davros       Initial coding.
// -----------------------------------------------------------------------------

choose case ai_language_id
case IFC_LNG_EN
	// English.
	// Set active interface language.
	ii_iface_language = ai_language_id

	// Set translations.
	is_translations[IFC_TXT_MSGBOX_TITLE] = "Document"
	is_translations[IFC_TXT_LNGNOTSUPPORTED] = "Language is not supported (%1)."
	is_translations[IFC_TXT_NOSUGGESTIONS] = "(No suggestions)"
	is_translations[IFC_TXT_NOSYNONYMS] = "(No synonyms)"
	is_translations[IFC_TXT_SHOWMORE] = "Show more..."
case IFC_LNG_NL
	// Dutch.
	// Set active interface language.
	ii_iface_language = ai_language_id

	// Set translations.
	is_translations[IFC_TXT_MSGBOX_TITLE] = "Document"
	is_translations[IFC_TXT_LNGNOTSUPPORTED] = "Taal wordt niet ondersteund (%1)."
	is_translations[IFC_TXT_NOSUGGESTIONS] = "(Geen suggesties)"
	is_translations[IFC_TXT_NOSYNONYMS] = "(Geen synoniemen)"
	is_translations[IFC_TXT_SHOWMORE] = "Toon meer..."
case else
	// Inform user that language is unsupported.
	of_Show_message(IFC_TXT_LNGNOTSUPPORTED, string(ai_language_id), Information!)
end choose

end subroutine

public function integer of_get_interface_language ();// -----------------------------------------------------------------------------
// SCRIPT:     u_pbh_rte.of_Get_interface_language()
//
// PURPOSE:    Get active language for translations in interface.
//
// ARGUMENTS:  None. 
//
// RETURN:     [Integer]. Language identifier. One of the 'IFC_LNG_...' constants
//             declared in section 'Declare Instance Variables'.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-04-01  Davros       Initial coding.
// -----------------------------------------------------------------------------

return ii_iface_language
end function

public subroutine of_show_message (integer ai_text_id, string as_parm1, icon aicon_symbol);// -----------------------------------------------------------------------------
// SCRIPT:     u_pbh_rte.of_Show_message()
//
// PURPOSE:    Show message to user.
//
// ARGUMENTS:  [integer] ai_text_id. Text identifier. Valid values are the
//             'IFC_TXT_...' constants declared in section 'Declare Instance Variables'.
//             [string] as_parm1. Parameter to substitute placeholder '%1' in message.
//             [icon] aicon_symbol. Icon to show with the message.
//
// RETURN:     None.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-04-01  Davros       Initial coding.
// -----------------------------------------------------------------------------

string ls_msg

ls_msg = inv_pbh_service.of_Replace_all(is_translations[ai_text_id], '%1', as_parm1)
MessageBox(is_translations[IFC_TXT_MSGBOX_TITLE], ls_msg, aicon_symbol)

end subroutine

public function window of_get_root_window ();// -----------------------------------------------------------------------------
// SCRIPT:     u_pbh_rte.of_Get_root_window()
//
// PURPOSE:    Get root window of this rte control. For MDI applications this
//             will be the frame window.
//
// ARGUMENTS:  None. 
//
// RETURN:     [window].
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-04-02  Davros       Initial coding.
// -----------------------------------------------------------------------------

window lw_root, lw_temp
powerobject lo_object
object lo_type

lo_object = this.GetParent()
do while (IsValid(lo_object))
	lo_type = lo_object.TypeOf()
	if lo_type = window! then
		lw_root = lo_object
		exit
	end if
	lo_object = lo_object.GetParent()
loop
lw_temp = lw_root
do while (IsValid(lw_temp))
	lw_root = lw_temp
	lw_temp = lw_temp.ParentWindow()
loop

return lw_root
end function

public function long of_show_replacements (boolean ab_popmenu);// -----------------------------------------------------------------------------
// SCRIPT:     u_pbh_rte.of_Show_replacements()
//
// PURPOSE:    Select current word and show replacements for it. 
//
// ARGUMENTS:  [boolean] ab_popmenu. True if popmenu, false if list. 
//
// RETURN:     [long]. Error status. SUCCESS or FAILURE.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-03-30  Davros       Initial coding.
// -----------------------------------------------------------------------------

long ll_ret, ll_n, ll_items
boolean lb_misspelled
string ls_rtf_word
m_pbh_suggestions lm_pbh_suggestions
m_pbh_synonyms lm_pbh_synonyms

ll_ret = SUCCESS
is_word = ""

if ib_auto_spellcheck then
	// Select current word.
	is_word = of_Select_current_word()
	if is_word <> "" then
		ls_rtf_word = this.CopyRTF(true)
		// Check if word is misspelled via the spellmark color in the rtf color table.
		// Get spellmarks for misspelled word based on color table and current mark color.
		ll_n = of_get_spellmarks(ls_rtf_word)
		if ll_n = -1 then
			// Error.
			return FAILURE
		end if
		choose case ii_rtf_generator
		case PBHH_RTF_GEN_TXTEXT
			// TX Text Control only includes in the color table the colors used in the current
			// rtf selection. This means that if the spellmark color is in the color table we
			// can safely assume that the selected word is misspelled.
			lb_misspelled = (ll_n > 0)
		case PBHH_RTF_GEN_TEEDIT
			// TE Edit Control always includes the full color table independent of the current
			// selection. Therefore, we must check for the existence of the spellmark(s) in the
			// current rtf selection to find out if the selected word is misspelled.
			lb_misspelled = of_Has_spellmarks(ls_rtf_word)
		case PBHH_RTF_GEN_DEFAULT
			lb_misspelled = (ll_n > 0)
		end choose
		
		if lb_misspelled then
			// Word misspelled. 
			if not IsNull(il_hunhandle) then
				if ab_popmenu then
					// Add suggestions to popmenu.
					lm_pbh_suggestions = CREATE m_pbh_suggestions
					lm_pbh_suggestions.iuo_pbh_rte = this
					ll_items = of_Add_suggestions_to_popmenu(lm_pbh_suggestions)
					
					// Display popmenu.
					lm_pbh_suggestions.PopMenu(iw_root.PointerX(), iw_root.PointerY())
					if IsValid(lm_pbh_suggestions) then DESTROY lm_pbh_suggestions
				else
					ll_items = iuo_rte_container.event dynamic ue_notify_suggestion()
				end if
			end if
		else
			// Word correctly spelled.
			if not IsNull(il_mytheshandle) then
				if ab_popmenu then
					// Add synonyms to popmenu.
					lm_pbh_synonyms = CREATE m_pbh_synonyms
					lm_pbh_synonyms.iuo_pbh_rte = this
					ll_items = of_Add_synonyms_to_popmenu(lm_pbh_synonyms)
					
					// Display popmenu.
					lm_pbh_synonyms.PopMenu(iw_root.PointerX(), iw_root.PointerY())
					if IsValid(lm_pbh_synonyms) then DESTROY lm_pbh_synonyms
				else
					ll_items = iuo_rte_container.event dynamic ue_notify_synonym()
				end if
			end if
		end if
	end if
elseif ((not this.PopMenu) or (not ab_popmenu)) then
	if not IsNull(il_mytheshandle) then
		// Select current word.
		is_word = of_Select_current_word()
		if is_word <> "" then
			if ab_popmenu then
				// Add synonyms to popmenu.
				lm_pbh_synonyms = CREATE m_pbh_synonyms
				lm_pbh_synonyms.iuo_pbh_rte = this
				ll_items = of_Add_synonyms_to_popmenu(lm_pbh_synonyms)
				
				// Display popmenu.
				lm_pbh_synonyms.PopMenu(iw_root.PointerX(), iw_root.PointerY())
				if IsValid(lm_pbh_synonyms) then DESTROY lm_pbh_synonyms
			else
				ll_items = iuo_rte_container.event dynamic ue_notify_synonym()
			end if
		end if
	end if
end if

return ll_ret
end function

public function string of_select_current_word ();// -----------------------------------------------------------------------------
// SCRIPT:     u_pbh_rte.of_Select_current_word()
//
// PURPOSE:    Select current word. If word is surrounded by single quotes, select
//             text between the quotes.
//
// ARGUMENTS:  None. 
//
// RETURN:     [string]. Selected word or empty string if no word is selected.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-04-27  Davros       Initial coding.
// -----------------------------------------------------------------------------

long ll_currow, ll_curcol, ll_startcol, ll_endcol
integer li_selected
string ls_word
char lc_singlequote = "'"

// Select word at current (cursor) position.
li_selected = this.SelectTextWord()
if li_selected >= 2 then
	ls_word = this.SelectedText()
	if Left(ls_word, 1) = lc_singlequote and Right(ls_word, 1) = lc_singlequote then
		// Word surrounded with single quotes. Get word position (row of word and
		// column of first character).
		this.Position(ll_currow, ll_curcol)
		
		// Deselect word.
		this.SelectText(ll_currow, ll_curcol, 0, 0)
		
		if li_selected > 2 then
			// Select text between single quotes.
			li_selected -= 2
			ll_startcol = ll_curcol + 1
			ll_endcol = ll_curcol + li_selected
			this.SelectText(ll_currow, ll_startcol, ll_currow, ll_endcol)
		end if
	end if
end if

ls_word = this.SelectedText()

return ls_word
end function

public function long of_add_suggestions_to_popmenu (ref m_pbh_suggestions am_pbh_suggestions);// -----------------------------------------------------------------------------
// SCRIPT:     u_pbh_rte.of_Add_suggestions_to_popmenu()
//
// PURPOSE:    Lookup suggestions of word in dictionary and add them to the suggestions popmenu.
//
// ARGUMENTS:  [ref m_pbh_suggestions] am_pbh_suggestions. Suggestions popmenu.
//
// RETURN:     [long]. Number of suggestions added to popmenu. 
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-04-02  Davros       Initial coding.
// -----------------------------------------------------------------------------

long ll_sugs, ll_ndx, ll_added
string ls_suggestionlist[]
boolean lb_found

ll_added = 0
ll_sugs = inv_pbh_engine.of_Hunspell_suggest(il_hunhandle, ls_suggestionlist[], is_word)

// Add suggestions to popmenu.
if ll_sugs = 0 then
	am_pbh_suggestions.m_pbh_sug0.Text = is_translations[IFC_TXT_NOSUGGESTIONS]
	am_pbh_suggestions.m_pbh_sug0.Visible = true
elseif ll_sugs > 0 then
	for ll_ndx = 1 to Min(ll_sugs, PBH_MNU_MAXSUGGESTIONS)
		am_pbh_suggestions.Item[ll_ndx + 1].Text = ls_suggestionlist[ll_ndx]
		am_pbh_suggestions.Item[ll_ndx + 1].Visible = true
		ll_added += 1
	next
	if ll_sugs > ll_ndx then
		am_pbh_suggestions.m_pbh_sugs_dash1.Visible = true
		am_pbh_suggestions.m_pbh_sugs_showmore.Text = is_translations[IFC_TXT_SHOWMORE]
		am_pbh_suggestions.m_pbh_sugs_showmore.Visible = true
	end if
end if

return ll_added

end function

public function long of_add_synonyms_to_popmenu (ref m_pbh_synonyms am_pbh_synonyms);// -----------------------------------------------------------------------------
// SCRIPT:     u_pbh_rte.of_Add_synonyms_to_popmenu()
//
// PURPOSE:    Lookup synonyms of word in thesaurus and add them to the synonyms popmenu.
//
// ARGUMENTS:  [ref m_pbh_synonyms] am_pbh_synonyms. Synonyms popmenu.
//
// RETURN:     [long]. Number of synonyms added to popmenu. 
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-04-02  Davros       Initial coding.
// -----------------------------------------------------------------------------

long ll_totsyns, ll_l, ll_ndx, ll_ndy, ll_ndz, ll_added, ll_uniquesyns
string ls_synonyms[], ls_synonyms_unique[], ls_word
boolean lb_continue, lb_found
boolean lb_first_lower, lb_all_lower, lb_all_upper
str_mythes_meaningentry lstr_meaninglist[]

ll_added = 0

// Lookup.
ll_totsyns = inv_pbh_engine.of_MyThes_lookup(il_mytheshandle, lstr_meaninglist[], is_word)
lb_first_lower = (Lower(Left(is_word, 1)) = Left(is_word, 1))
lb_all_lower = (Lower(is_word) = is_word)
lb_all_upper = (Upper(is_word) = is_word)
if ll_totsyns = 0 and (not lb_all_lower) then
	ls_word = Lower(is_word)
	ll_totsyns = inv_pbh_engine.of_MyThes_lookup(il_mytheshandle, lstr_meaninglist[], ls_word)
end if

// Get number of unique synonyms.
ll_uniquesyns = 0
lb_continue = true
if ll_totsyns > 0 then
	for ll_ndx = 1 to UpperBound(lstr_meaninglist[])
		if not lb_continue then exit
		for ll_ndy = 1 to UpperBound(lstr_meaninglist[ll_ndx].synlist[])
			lb_found = false
			for ll_ndz = 1 to UpperBound(ls_synonyms_unique[])
				if ls_synonyms_unique[ll_ndz] = lstr_meaninglist[ll_ndx].synlist[ll_ndy] then
					lb_found = true
					exit
				end if
			next
			if not lb_found then
				ll_uniquesyns += 1
				ls_synonyms_unique[ll_uniquesyns] = lstr_meaninglist[ll_ndx].synlist[ll_ndy]
				if ll_uniquesyns > PBH_MNU_MAXSYNONYMS then
					lb_continue = false
					exit
				end if
			end if
		next
	next
end if

// Get synonyms to display.
lb_continue = true
if ll_totsyns > 0 then
	for ll_l = 1 to PBH_MNU_MAXSYNONYMS
		if not lb_continue then exit
		for ll_ndx = 1 to UpperBound(lstr_meaninglist[])
			if not lb_continue then exit
			if UpperBound(lstr_meaninglist[ll_ndx].synlist[]) >= ll_l then
				lb_found = false
				for ll_ndz = 1 to UpperBound(ls_synonyms[])
					if ls_synonyms[ll_ndz] = lstr_meaninglist[ll_ndx].synlist[ll_l] then
						lb_found = true
						exit
					end if
				next
				if not lb_found then
					ll_added += 1
					ls_synonyms[ll_added] = lstr_meaninglist[ll_ndx].synlist[ll_l]
					if ll_added = PBH_MNU_MAXSYNONYMS then
						lb_continue = false
					end if
				end if
			end if
		next
	next
end if

// Convert synonyms to lowercase/uppercase.
if (not lb_all_lower) then
	for ll_ndx = 1 to UpperBound(ls_synonyms[])
		if lb_first_lower then
			ls_word = Lower(ls_synonyms[ll_ndx])
		elseif lb_all_upper then
			ls_word = Upper(ls_synonyms[ll_ndx])
		else
			ls_word = Upper(Left(ls_synonyms[ll_ndx], 1)) + Lower(Right(ls_synonyms[ll_ndx], Len(ls_synonyms[ll_ndx]) - 1))
		end if
		ls_synonyms[ll_ndx] = ls_word
	next
end if

// Add synonyms to popmenu.
if ll_added = 0 then
	am_pbh_synonyms.m_pbh_syn0.Text = is_translations[IFC_TXT_NOSYNONYMS]
	am_pbh_synonyms.m_pbh_syn0.Visible = true
elseif ll_added > 0 then
	for ll_ndx = 1 to ll_added
		am_pbh_synonyms.Item[ll_ndx + 1].Text = ls_synonyms[ll_ndx]
		am_pbh_synonyms.Item[ll_ndx + 1].Visible = true
	next
	if ll_uniquesyns > ll_added then
		am_pbh_synonyms.m_pbh_syns_dash1.Visible = true
		am_pbh_synonyms.m_pbh_syns_showmore.Text = is_translations[IFC_TXT_SHOWMORE]
		am_pbh_synonyms.m_pbh_syns_showmore.Visible = true
	end if
end if

return ll_added

end function

public subroutine of_init (long al_markaction, string as_markcolorrgb, string as_tempdir, ref userobject auo_rte_container);// -----------------------------------------------------------------------------
// SCRIPT:     u_pbh_rte.of_Init()
//
// PURPOSE:    Initialize RichTextEdit control.
//
// ARGUMENTS:  [long] al_markaction. Mark action to perform. See comments in
//             n_pbh_engine.of_PBHunspell_spellcheck_rtf_file().
//             [string] as_markcolorrgb. Mark color in rtf color table. See comments in
//             n_pbh_engine.of_PBHunspell_spellcheck_rtf_file().
//             [string] as_tempdir. Directory where temporary files should be created.
//             [ref userobject] auo_rte_container. User object that contains this rte
//             control.
//
// RETURN:     None.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-03-29  Davros       Initial coding.
// -----------------------------------------------------------------------------

il_markaction = al_markaction
is_markcolorrgb = as_markcolorrgb

is_tempdir = as_tempdir
if Right(is_tempdir, 1) <> "\" then
	is_tempdir += "\"
end if

iuo_rte_container = auo_rte_container
end subroutine

public subroutine of_get_rtf_generator ();// -----------------------------------------------------------------------------
// SCRIPT:     u_pbh_rte.of_Get_rtf_generator()
//
// PURPOSE:    Get rtf generator of this RichTextEdit control.
//
// ARGUMENTS:  None. 
//
// RETURN:     None.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-06-16  Davros       Initial coding.
// -----------------------------------------------------------------------------

string ls_rtfdoc, ls_rtfgen
long ll_pos

// Get rtf document string.
this.ReplaceText(" ")
ls_rtfdoc = this.CopyRTF(false)
this.SelectTextAll()
this.ReplaceText("")

// TX Text Control (Sybase PowerBuilder 12.X).
ls_rtfgen = "{\*\generator TX_RTF32"
ll_pos = Pos(ls_rtfdoc, ls_rtfgen)
if ll_pos > 0 then
	ii_rtf_generator = PBHH_RTF_GEN_TXTEXT
	return
end if

// TE Edit Control (Appeon PowerBuilder 17.0 aka Appeon PowerBuilder 2017).
ls_rtfgen = "{\*\revtbl{Unknown"
ll_pos = Pos(ls_rtfdoc, ls_rtfgen)
if ll_pos > 0 then
	ii_rtf_generator = PBHH_RTF_GEN_TEEDIT
	return
end if

// Default generator.
ii_rtf_generator = PBHH_RTF_GEN_DEFAULT

end subroutine

public function long of_get_rtf_color_index (ref string as_rtf, string as_markcolorrgb);// -----------------------------------------------------------------------------
// SCRIPT:     u_pbh_rte.of_Get_rtf_color_index()
//
// PURPOSE:    Get index of is_markcolorrgb into color table of supplied rtf string.
//             Indexes start at with 0.
//
// ARGUMENTS:  [ref string] as_rtf. RTF string. Must have a color table. 
//             [string] as_markcolorrgb. Mark color in rtf color table. See comments in
//             n_pbh_engine.of_PBHunspell_spellcheck_rtf_file(). 
//
// RETURN:     [long]. Index into color table. >= 0 if found, -1 if not found.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-03-31  Davros       Initial coding.
// -----------------------------------------------------------------------------

long ll_ret, ll_pos1, ll_pos2, ll_n, ll_ndx
string ls_colors, ls_colorlist[], ls_compare
string ls_colortabletag

ls_colortabletag = "{\colortbl"
ll_ret = -1

ll_pos1 = Pos(as_rtf, ls_colortabletag)
if ll_pos1 > 0 then
	ll_pos1 += Len(ls_colortabletag)
	ll_pos2 = Pos(as_rtf, "}", ll_pos1)
	if ll_pos2 > 0 then
		ls_colors = Mid(as_rtf, ll_pos1, ll_pos2 - ll_pos1)
		ll_n = inv_pbh_service.of_parse_string_to_array(ls_colors, ls_colorlist[], ";")
		for ll_ndx = 1 to ll_n -1
			ls_compare = Trim(ls_colorlist[ll_ndx])
			if ls_compare = as_markcolorrgb then
				ll_ret = ll_ndx - 1
				exit
			end if
		next
	end if
end if

return ll_ret
end function

public function long of_get_spellmarks (ref string as_rtf);// -----------------------------------------------------------------------------
// SCRIPT:     u_pbh_rte.of_Get_spellmarks()
//
// PURPOSE:    Get list of spellmarks based on color table of supplied rtf string
//             and on PBH spellcheck settings. 
//
// ARGUMENTS:  [ref string] as_rtf. RTF string with color table.
//
// RETURN:     [long]. Number of spellmarks, -1 on error.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-03-31  Davros       Initial coding.
// -----------------------------------------------------------------------------

long ll_ret, ll_colorindex
string ls_spellmarks[], ls_colorindex
string mark_bg1 = "\cb";
string mark_bg2 = "\chcbpat";
string mark_fg = "\cf";

is_spellmarks[] = ls_spellmarks[]
ll_ret = 0 

ll_colorindex = of_Get_rtf_color_index(as_rtf, is_markcolorrgb)
if ll_colorindex >= 0 then
	ls_colorindex = String(ll_colorindex)
	choose case il_markaction
	case n_pbh_engine.PBHH_MARKBACKGROUNDCOLOR
		ls_spellmarks[1] = mark_bg1 + ls_colorindex
		ls_spellmarks[2] = mark_bg2 + ls_colorindex
		ll_ret = UpperBound(ls_spellmarks[])
	case n_pbh_engine.PBHH_MARKFOREGROUNDCOLOR
		ls_spellmarks[1] = mark_fg + ls_colorindex
		ll_ret = UpperBound(ls_spellmarks[])
	case else
		ll_ret = -1
	end choose
end if

is_spellmarks[] = ls_spellmarks[]
return ll_ret
end function

public function boolean of_has_spellmarks (ref string as_rtf);// -----------------------------------------------------------------------------
// SCRIPT:     u_pbh_rte.of_Has_spellmarks()
//
// PURPOSE:    Check if the supplied RTF string has at least one of the current
//             spellmarks. 
//
// ARGUMENTS:  [ref string] as_rtf. RTF string to check.
//
// RETURN:     [boolean].
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-06-16  Davros       Initial coding.
// -----------------------------------------------------------------------------

boolean lb_found
long ll_ndx, ll_pos

lb_found = false

for ll_ndx = 1 to UpperBound(is_spellmarks[])
	ll_pos = of_Pos_rtf_unescaped(as_rtf, is_spellmarks[ll_ndx], 1)
	if ll_pos > 0 then
		lb_found = true
		exit
	end if
next

return lb_found
end function

public function long of_pos_rtf_unescaped (ref string as_source, string as_target, long al_startpos);// -----------------------------------------------------------------------------
// SCRIPT:     u_pbh_rte.of_Pos_rtf_unescaped()
//
// PURPOSE:    Find position of first unescaped target string in RTF source string.
//
// ARGUMENTS:  [ref string] as_source. RTF source string. 
//             [string] as_target. RTF target string
//             [long al_startpos]. Start position of search. 
//
// RETURN:     [long]. Position of unescaped target in source, 0 if not found.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-06-16  Davros       Initial coding.
// -----------------------------------------------------------------------------

long ll_pos, ll_startpos
boolean lb_lookfurther

If IsNull(as_source) or as_source = "" then return 0
If IsNull(as_target) or as_target = "" then return 0

lb_lookfurther = true
ll_pos = Pos(as_source, as_target, al_startpos)
do while ll_pos > 0 and lb_lookfurther
	if of_Is_rtf_backslash_literal(as_source, ll_pos) then
		ll_pos = Pos(as_source, as_target, ll_pos + Len(as_target))
	else
		lb_lookfurther = false
	end if
loop

return ll_pos
end function

public function boolean of_is_rtf_backslash_literal (ref string as_source, long al_pos);// -----------------------------------------------------------------------------
// SCRIPT:     u_pbh_rte.of_Is_rtf_backslash_literal()
//
// PURPOSE:    Check if character at specified position in RTF source string is
//             a backslash literal.
//
// ARGUMENTS:  [ref string] as_source. RTF source string. 
//             [long al_pos]. Position of character to check. 
//
// RETURN:     [boolean].
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-06-16  Davros       Initial coding.
// -----------------------------------------------------------------------------

boolean lb_ret
char lc_curchar
long ll_pos, ll_cnt

lb_ret = false
ll_cnt = 0
ll_pos = al_pos

lc_curchar = Mid(as_source, ll_pos, 1)
do while lc_curchar = "\"
	ll_cnt += 1
	ll_pos = (ll_pos - 1)
	lc_curchar = Mid(as_source, ll_pos, 1)
loop
if ll_cnt > 0 and inv_pbh_service.of_Is_even(ll_cnt) then
	lb_ret = true
end if

return lb_ret
end function

on u_pbh_rte.create
end on

on u_pbh_rte.destroy
end on

event rbuttondown;// -----------------------------------------------------------------------------
// SCRIPT:     u_pbh_rte.rbuttondown()
//
// PURPOSE:    Show replacements popmenu for current word.
//
// ARGUMENTS:  None. 
//
// RETURN:     [long]. Error state.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-03-31  Davros       Initial coding.
// -----------------------------------------------------------------------------

this.post of_Show_replacements(true)

end event

event constructor;// -----------------------------------------------------------------------------
// SCRIPT:     u_pbh_rte.constructor()
//
// PURPOSE:    Construct service object, set root window (needed to position the
//             spellcheck popmenu), and set interface language.
//
// ARGUMENTS:  None. 
//
// RETURN:     [long].
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-03-31  Davros       Initial coding.
// 2018-06-16  Davros       Get rtf generator.
// -----------------------------------------------------------------------------

inv_pbh_service = CREATE n_pbh_service

iw_root = of_Get_root_window()
of_Get_rtf_generator()

// Default interface language is English.
of_Set_interface_language(IFC_LNG_EN)

end event

event destructor;// -----------------------------------------------------------------------------
// SCRIPT:     u_pbh_rte.destructor()
//
// PURPOSE:    Destruct service object.
//
// ARGUMENTS:  None. 
//
// RETURN:     [long].
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-03-31  Davros       Initial coding.
// -----------------------------------------------------------------------------

if IsValid(inv_pbh_service) then DESTROY inv_pbh_service

end event

event mousedown;// -----------------------------------------------------------------------------
// SCRIPT:     u_pbh_rte.mousedown()
//
// PURPOSE:    Show replacements list for current word.
//
// ARGUMENTS:  None. 
//
// RETURN:     [long]. Error state.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-04-06  Davros       Initial coding.
// -----------------------------------------------------------------------------
if ib_cont_replacements then
	this.post of_Show_replacements(false)
end if

end event

