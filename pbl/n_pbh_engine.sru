$PBExportHeader$n_pbh_engine.sru
forward
global type n_pbh_engine from nonvisualobject
end type
end forward

global type n_pbh_engine from nonvisualobject
event _license ( )
end type
global n_pbh_engine n_pbh_engine

type prototypes
Private:

Function long Hunspell_create_H(string affpath, string dicpath) Library "pbhunspell.dll" Alias for "Hunspell_create_H;Ansi"
Function long Hunspell_create_key_H(string affpath, string dicpath, string key) Library "pbhunspell.dll" Alias for "Hunspell_create_key_H;Ansi"
Subroutine Hunspell_destroy_H(long hHunspell) Library "pbhunspell.dll" Alias for "Hunspell_destroy_H;Ansi"
Subroutine Hunspell_destroy_all_H() Library "pbhunspell.dll" Alias for "Hunspell_destroy_all_H;Ansi"
Function long Hunspell_add_dic_H(long hHunspell, string dicpath) Library "pbhunspell.dll" Alias for "Hunspell_add_dic_H;Ansi"
Function long Hunspell_spell_H(long hHunspell, string word) Library "pbhunspell.dll" Alias for "Hunspell_spell_H;Ansi"
Function string Hunspell_get_dic_encoding_H(long hHunspell) Library "pbhunspell.dll" Alias for "Hunspell_get_dic_encoding_H;Ansi"
Function long Hunspell_suggest_H(long hHunspell, ref string slst[], string word, long maxlist, long maxitemlen) Library "pbhunspell.dll" Alias for "Hunspell_suggest_H;Ansi"
Function long Hunspell_analyze_H(long hHunspell, ref string slst[], string word, long maxlist, long maxitemlen) Library "pbhunspell.dll" Alias for "Hunspell_analyze_H;Ansi"
Function long Hunspell_stem_H(long hHunspell, ref string slst[], string word, long maxlist, long maxitemlen) Library "pbhunspell.dll" Alias for "Hunspell_stem_H;Ansi"
Function long Hunspell_stem2_H(long hHunspell, ref string slst[], string desc[], long n, long maxlist, long maxitemlen) Library "pbhunspell.dll" Alias for "Hunspell_stem2_H;Ansi"
Function long Hunspell_generate_H(long hHunspell, ref string slst[], string word, string word2, long maxlist, long maxitemlen) Library "pbhunspell.dll" Alias for "Hunspell_generate_H;Ansi"
Function long Hunspell_generate2_H(long hHunspell, ref string slst[], string word, string desc[], long n, long maxlist, long maxitemlen) Library "pbhunspell.dll" Alias for "Hunspell_generate2_H;Ansi"
Function long Hunspell_add_H(long hHunspell, string word) Library "pbhunspell.dll" Alias for "Hunspell_add_H;Ansi"
Function long Hunspell_add_with_affix_H(long hHunspell, string word, string example) Library "pbhunspell.dll" Alias for "Hunspell_add_with_affix_H;Ansi"
Function long Hunspell_remove_H(long hHunspell, string word) Library "pbhunspell.dll" Alias for "Hunspell_remove_H;Ansi"

Function long MyThes_create_H(string idxpath, string datpath) Library "pbhunspell.dll" Alias for "MyThes_create_H;Ansi"
Subroutine MyThes_destroy_H(long hMyThes) Library "pbhunspell.dll" Alias for "MyThes_destroy_H;Ansi"
Subroutine MyThes_destroy_all_H() Library "pbhunspell.dll" Alias for "MyThes_destroy_all_H;Ansi"
Function string MyThes_get_th_encoding_H(long hMyThes) Library "pbhunspell.dll" Alias for "MyThes_get_th_encoding_H;Ansi"
Function long MyThes_lookup_H(long hMyThes, string word, ref long nummeanings) Library "pbhunspell.dll" Alias for "MyThes_lookup_H;Ansi"
Function long MyThes_lookup_read_H(long hmentry, long pos, ref string defn, ref string synonyms[], long maxlist, long maxitemlen) Library "pbhunspell.dll" Alias for "MyThes_lookup_read_H;Ansi"
Subroutine MyThes_lookup_free_H(long hMyThes, long hmentry, long nummeanings) Library "pbhunspell.dll" Alias for "MyThes_lookup_free_H;Ansi"

Function long Hyphen_create_H(string dicpath) Library "pbhunspell.dll" Alias for "Hyphen_create_H;Ansi"
Subroutine Hyphen_destroy_H(long hHyphen) Library "pbhunspell.dll" Alias for "Hyphen_destroy_H;Ansi"
Subroutine Hyphen_destroy_all_H() Library "pbhunspell.dll" Alias for "Hyphen_destroy_all_H;Ansi"
Function string Hyphen_get_dic_encoding_H(long hHyphen) Library "pbhunspell.dll" Alias for "Hyphen_get_dic_encoding_H;Ansi"
Function long Hyphen_hyphenate_H(long hHyphen, string word, long wordsize, ref string hyphword, long lhmin, long rhmin, long clhmin, long crhmin) Library "pbhunspell.dll" Alias for "Hyphen_hyphenate_H;Ansi"
Function long Hyphen_hyphenate_ext_H(long hHyphen, string word, long wordsize, ref string hyphword, long lhmin, long rhmin, long clhmin, long crhmin, ref string hyphen, ref string rep[], ref long pos[], ref long cut[]) Library "pbhunspell.dll" Alias for "Hyphen_hyphenate_ext_H;Ansi"

Subroutine PBHunspell_get_version_H(ref string pbhh_version, ref string hunh_version, ref string hyph_version, ref string myth_version) Library "pbhunspell.dll" Alias for "PBHunspell_get_version_H;Ansi"
Function long PBHunspell_spellcheck_rtf_file_H(long hHunspell, string finpath, string foutpath, long markaction, string markcolorrgb) Library "pbhunspell.dll" Alias for "PBHunspell_spellcheck_rtf_file_H;Ansi"
Function long PBHunspell_unspellcheck_rtf_file_H(string finpath, string foutpath, long markaction, string markcolorrgb) Library "pbhunspell.dll" Alias for "PBHunspell_unspellcheck_rtf_file_H;Ansi"

end prototypes

type variables
Private:
n_pbh_service inv_pbh_service

// Array of flags for spell object handles indicating if these handles are valid (true) or not (false). 
boolean ib_hunhandle_0
boolean ib_hunhandle_1-n[]

boolean ib_hyphenhandle_0
boolean ib_hyphenhandle_1-n[]

boolean ib_mytheshandle_0
boolean ib_mytheshandle_1-n[]

// Array of loaded file bundles per spell object handle.
str_hunspell_filebundle istr_hunbundle_0
str_hunspell_filebundle istr_hunbundle_1-n[]

str_hyphen_filebundle istr_hyphbundle_0
str_hyphen_filebundle istr_hyphbundle_1-n[]

str_mythes_filebundle istr_mythbundle_0
str_mythes_filebundle istr_mythbundle_1-n[]

// Boundaries. Can be set to lower value than default value.
// Don't set to higher value than DLL default value.
long il_hunh_maxwordlen = 100        // DLL default 100.
long il_hunh_maxsuggestion = 15      // DLL default 15.
long il_hyph_maxwordlen = 100        // DLL default 100.
long il_myth_maxwordlen = 100        // DLL default 200 (we use il_hunh_maxwordlen DLL default).
long il_myth_maxsynonym = 100        // DLL default 100.
long il_myth_maxmeaningentry = 100   // DLL default 100.

// Translations of the active interface language ii_iface_language.
string is_translations[]

// Interface language currently active. One of the constants 'IFC_LNG_...'.
integer ii_iface_language

// File extensions.
constant string FILEEXTENSION_AFF = ".aff"
constant string FILEEXTENSION_DIC = ".dic"
constant string FILEEXTENSION_IDX = ".idx"
constant string FILEEXTENSION_DAT = ".dat"
constant string FILEEXTENSION_RTF = ".rtf"

// Interface text identifiers.
constant integer IFC_TXT_MAXSIZEREACHED = 1
constant integer IFC_TXT_HANDLEOUTOFRANGE = 2
constant integer IFC_TXT_HANDLEINVALID = 3
constant integer IFC_TXT_DICCANNOTOPEN = 4
constant integer IFC_TXT_AFFCANNOTOPEN = 5
constant integer IFC_TXT_MSGBOX_TITLE = 6
constant integer IFC_TXT_LNGNOTSUPPORTED = 7
constant integer IFC_TXT_DICENCODINGNOTOBTAINED = 8
constant integer IFC_TXT_DICSLOTSFULL = 9
constant integer IFC_TXT_DICALREADYLOADED = 10
constant integer IFC_TXT_FILEEXTENSIONINVALID = 11
constant integer IFC_TXT_WORDCANNOTADD = 12
constant integer IFC_TXT_WORDCANNOTREMOVE = 13
constant integer IFC_TXT_IDXCANNOTOPEN = 14
constant integer IFC_TXT_DATCANNOTOPEN = 15
constant integer IFC_TXT_THESENCODINGNOTOBTAINED = 16
constant integer IFC_TXT_HYPHENATIONERROR = 17
constant integer IFC_TXT_WORDMAXSIZEREACHED = 18
constant integer IFC_TXT_LIBVERSIONFORMATINVALID = 19
constant integer IFC_TXT_FILECANNOTOPEN = 20
constant integer IFC_TXT_RTFFORMATINVALID = 21
constant integer IFC_TXT_RTFNOCOLORTABLE = 22
constant integer IFC_TXT_RTFNOPLAINTEXT = 23
constant integer IFC_TXT_MARKACTIONUNSUPPORTED = 24

// pbhunspell.dll constants.
// Range of error codes (always < 0).
// Errors HUNH_DICCANNOTOPEN, HUNH_AFFCANNOTOPEN, MYTH_IDXCANNOTOPEN and MYTH_DATCANNOTOPEN
// may occur in case of ANSI/Unicode and 32 bit/64 bit issues between PowerBuilder external
// function declaration and pbhunspell.dll, e.g. path truncated to one character because of
// Unicode 0-bytes.
constant long HUNH_MAXSIZEREACHED = -400
constant long HUNH_HANDLEOUTOFRANGE = -401
constant long HUNH_HANDLEINVALID = -402
constant long HUNH_DICCANNOTOPEN = -403
constant long HUNH_AFFCANNOTOPEN = -404

constant long HYPH_MAXSIZEREACHED = -500
constant long HYPH_HANDLEOUTOFRANGE = -501
constant long HYPH_HANDLEINVALID = -502
constant long HYPH_DICCANNOTOPEN = -503

constant long MYTH_MAXSIZEREACHED = -600
constant long MYTH_HANDLEOUTOFRANGE = -601
constant long MYTH_HANDLEINVALID = -602
constant long MYTH_IDXCANNOTOPEN = -603
constant long MYTH_DATCANNOTOPEN = -604

constant long PBHH_FILECANNOTOPEN = -700
constant long PBHH_RTFFORMATINVALID = -701
constant long PBHH_RTFNOCOLORTABLE = -702
constant long PBHH_RTFNOPLAINTEXT = -703
constant long PBHH_MARKACTIONUNSUPPORTED = -704

// Boundaries.
constant long HUNH_MAXSIZE = 250
constant long HYPH_MAXSIZE = 250
constant long MYTH_MAXSIZE = 250

// PowerBuilder internal constants.
// Range of error codes (always < 0).
constant long PBH_DICALREADYLOADED = -15000
constant long PBH_FILEEXTENSIONINVALID = -15001
constant long PBH_WORDCANNOTADD = -15002
constant long PBH_WORDCANNOTREMOVE = -15003

// Libraries.
constant string PBH_LIB_PBHH = "PBHunspell"
constant string PBH_LIB_HUNH = "Hunspell"
constant string PBH_LIB_HYPH = "Hyphen"
constant string PBH_LIB_MYTH = "MyThes"
constant long PBH_VERSION_LEN = 25

// Dictionary encodings
constant string DIC_ENCODING_UTF8 = "UTF-8"

Public:
// Interface language identifiers.
constant integer IFC_LNG_EN = 1
constant integer IFC_LNG_NL = 2

// Spellcheck mark actions
constant long PBHH_MARKBACKGROUNDCOLOR = 10
constant long PBHH_MARKFOREGROUNDCOLOR = 11


end variables

forward prototypes
public function long of_hunspell_create (string as_affpath, string as_dicpath)
public subroutine of_set_interface_language (integer ai_language_id)
public subroutine of_hunspell_destroy (long al_hunhandle)
public function long of_hunspell_spell (long al_hunhandle, string as_word)
public function long of_hunspell_add_dic (long al_hunhandle, string as_dicpath)
public function long of_hunspell_create_key (string as_affpath, string as_dicpath, string as_key)
public function integer of_get_interface_language ()
public function string of_hunspell_get_dic_encoding (long al_hunhandle)
public function long of_hunspell_suggest (long al_hunhandle, ref string as_slst[], string as_word)
public subroutine of_hunspell_destroy_all ()
public function long of_hunspell_analyze (long al_hunhandle, ref string as_slst[], string as_word)
public function long of_hunspell_stem (long al_hunhandle, ref string as_slst[], string as_word)
public function long of_hunspell_stem2 (long al_hunhandle, ref string as_slst[], string as_desc[], long al_n)
public function long of_hunspell_generate (long al_hunhandle, ref string as_slst[], string as_word, string as_word2)
public function long of_hunspell_generate2 (long al_hunhandle, ref string as_slst[], string as_word, string as_desc[], long al_n)
public function long of_hunspell_add (long al_hunhandle, string as_word)
public function long of_hunspell_add_with_affix (long al_hunhandle, string as_word, string as_example)
public function long of_hunspell_remove (long al_hunhandle, string as_word)
public function long of_mythes_create (string as_idxpath, string as_datpath)
public subroutine of_mythes_destroy (long al_mytheshandle)
public subroutine of_mythes_destroy_all ()
public function string of_mythes_get_th_encoding (long al_mytheshandle)
public function long of_mythes_lookup (long al_mytheshandle, ref str_mythes_meaningentry astr_mythes_mentry[], string as_word)
public function long of_hyphen_create (string as_dicpath)
public subroutine of_hyphen_destroy (long al_hyphenhandle)
public subroutine of_hyphen_destroy_all ()
public function string of_hyphen_get_dic_encoding (long al_hyphenhandle)
public function long of_hyphen_hyphenate (long al_hyphenhandle, string as_word, ref string as_hyphword, long al_lhmin, long al_rhmin, long al_clhmin, long al_crhmin)
public function boolean of_hunspell_is_dic_loaded (long al_hunhandle, string as_dicpath)
public function boolean of_hyphen_is_dic_loaded (long al_hyphenhandle, string as_dicpath)
public function boolean of_hunspell_is_aff_loaded (long al_hunhandle, string as_affpath)
public function boolean of_mythes_is_idx_loaded (long al_mytheshandle, string as_idxpath)
public function boolean of_mythes_is_dat_loaded (long al_mytheshandle, string as_datpath)
public function boolean of_hunspell_is_valid (long al_hunhandle)
public function boolean of_hyphen_is_valid (long al_hyphenhandle)
public function boolean of_mythes_is_valid (long al_mytheshandle)
public function str_hunspell_filebundle of_hunspell_get_file_bundle (long al_hunhandle)
public function str_hyphen_filebundle of_hyphen_get_file_bundle (long al_hyphenhandle)
public function str_mythes_filebundle of_mythes_get_file_bundle (long al_mytheshandle)
public function long of_hyphen_hyphenate_ext (long al_hyphenhandle, string as_word, ref string as_hyphword, long al_lhmin, long al_rhmin, long al_clhmin, long al_crhmin, ref str_hyphen_ext astr_hyphen_ext)
public function long of_pbhunspell_get_version (ref str_pbhunspell_version astr_pbhunspell_version[])
public function long of_pbhunspell_unspellcheck_rtf_file (string as_finpath, string as_foutpath, long al_markaction, string as_markcolorrgb)
public subroutine of_show_message (integer ai_text_id, string as_parm1, icon aicon_symbol)
public subroutine of_show_message (integer ai_text_id, string as_parm1, string as_parm2, icon aicon_symbol)
public function long of_pbhunspell_spellcheck_rtf_file (long al_hunhandle, string as_finpath, string as_foutpath, long al_markaction, string as_markcolorrgb)
public function string of_pbhunspell_encode_dll_input (ref string as_value, ref string as_dic_encoding)
public function string of_pbhunspell_encode_dll_output (ref string as_value, ref string as_dic_encoding)
end prototypes

event _license();/* ***** BEGIN LICENSE BLOCK *****
* Version: MPL 1.1/GPL 2.0/LGPL 2.1
*
* PBHunspell (Hunspell for PowerBuilder), Copyright (C) 2018 Davros
*
* PBHunspell is a wrapper to spellcheck library Hunspell, hyphenation and
* justification library LibHnj (aka Hyphen), and thesaurus library MyThes.
*
* - Hunspell is Copyright (C) 2002-2017 László Németh. Hunspell is based on
*   MySpell which is Copyright (C) 2002 Kevin Hendricks.
* 
* - LibHnj is Copyright (C) 1998 Raph Levien, (C) 2001 ALTLinux, Moscow
*   (http://www.alt-linux.org), (C) 2001 Peter Novodvorsky (nidd@cs.msu.su), 
*   (C) 2006, 2007, 2008, 2010 László Németh (nemeth at OOo).
*
* - MyThes is Copyright (C) 2003 Kevin Hendricks.
*
* The contents of this file are subject to the Mozilla Public License Version
* 1.1 (the "License"); you may not use this file except in compliance with
* the License. You may obtain a copy of the License at
* http://www.mozilla.org/MPL/
*
* Software distributed under the License is distributed on an "AS IS" basis,
* WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
* for the specific language governing rights and limitations under the
* License.
*
* Alternatively, the contents of this file may be used under the terms of
* either the GNU General Public License Version 2 or later (the "GPL"), or
* the GNU Lesser General Public License Version 2.1 or later (the "LGPL"),
* in which case the provisions of the GPL or the LGPL are applicable instead
* of those above. If you wish to allow use of your version of this file only
* under the terms of either the GPL or the LGPL, and not to allow others to
* use your version of this file under the terms of the MPL, indicate your
* decision by deleting the provisions above and replace them with the notice
* and other provisions required by the GPL or the LGPL. If you do not delete
* the provisions above, a recipient may use your version of this file under
* the terms of any one of the MPL, the GPL or the LGPL.
*
* ***** END LICENSE BLOCK ***** */
/*
* Copyright 2018 Davros, Eindhoven, The Netherlands. All rights reserved.
*
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions
* are met:
*
* 1. Redistributions of source code must retain the above copyright
*    notice, this list of conditions and the following disclaimer.
*
* 2. Redistributions in binary form must reproduce the above copyright
*    notice, this list of conditions and the following disclaimer in the
*    documentation and/or other materials provided with the distribution.
*
* 3. All modifications to the source code must be clearly marked as
*    such. Binary redistributions based on modified source code
*    must be clearly marked as modified versions in the documentation
*    and/or other materials provided with the distribution.
*
* THIS SOFTWARE IS PROVIDED BY DAVROS ``AS IS'' AND ANY EXPRESS OR IMPLIED
* WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
* MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN
* NO EVENT SHALL DAVROS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
* SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
* TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
* PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
* LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
* NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
* SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

end event

public function long of_hunspell_create (string as_affpath, string as_dicpath);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_Hunspell_create()
//
// PURPOSE:    Create Hunspell spell checking object.
//
// ARGUMENTS:  [string] as_affpath. path\filename of affix file, e.g.
//             'F:\Data\Spell dictionaries\en_US.aff'.
//             [string] as_dicpath. path\filename of dictionary file, e.g.
//             'F:\Data\Spell dictionaries\en_US.dic'.
//
// RETURN:     [long]. One of the following values:
//             - Handle of Hunspell object. In range 0 to HUNH_MAXSIZE - 1.
//             - PBH_FILEEXTENSIONINVALID.
//             - HUNH_MAXSIZEREACHED.
//             - HUNH_DICCANNOTOPEN.
//             - HUNH_AFFCANNOTOPEN.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2017-12-28  Davros       Initial coding.
// -----------------------------------------------------------------------------

long ll_ret
string ls_affpath, ls_dicpath

ls_affpath = as_affpath
ls_dicpath = as_dicpath

// Check file extension of as_affpath and as_dicpath.
if Lower(Right(ls_affpath, Len(FILEEXTENSION_AFF))) <> FILEEXTENSION_AFF then
	of_Show_message(IFC_TXT_FILEEXTENSIONINVALID, ls_affpath, FILEEXTENSION_AFF, Information!)
	return PBH_FILEEXTENSIONINVALID
end if
if Lower(Right(ls_dicpath, Len(FILEEXTENSION_DIC))) <> FILEEXTENSION_DIC then
	of_Show_message(IFC_TXT_FILEEXTENSIONINVALID, ls_dicpath, FILEEXTENSION_DIC, Information!)
	return PBH_FILEEXTENSIONINVALID
end if

// Check if files as_affpath and as_dicpath exist.
if not FileExists(ls_affpath) then
	of_Show_message(IFC_TXT_AFFCANNOTOPEN, ls_affpath, Information!)
	return HUNH_AFFCANNOTOPEN
elseif not FileExists(ls_dicpath) then
	of_Show_message(IFC_TXT_DICCANNOTOPEN, ls_dicpath, Information!)
	return HUNH_DICCANNOTOPEN
end if

// Create Hunspell object.
ll_ret = Hunspell_create_H(ls_affpath, ls_dicpath)

choose case ll_ret
case HUNH_MAXSIZEREACHED
	of_Show_message(IFC_TXT_MAXSIZEREACHED, string(ll_ret), Information!)
case HUNH_AFFCANNOTOPEN
	of_Show_message(IFC_TXT_AFFCANNOTOPEN, string(ll_ret), Information!)
case HUNH_DICCANNOTOPEN
	of_Show_message(IFC_TXT_DICCANNOTOPEN, string(ll_ret), Information!)
case 0
	// Save hunhandle 0 and initialize dictionary bundle.
	ib_hunhandle_0 = true
	istr_hunbundle_0.affpath = ls_affpath
	istr_hunbundle_0.dicpath[1] = ls_dicpath
case 1 to HUNH_MAXSIZE
	// Save hunhandle 1 to HUNH_MAXSIZE and initialize dictionary bundle.
	ib_hunhandle_1-n[ll_ret] = true
	istr_hunbundle_1-n[ll_ret].affpath = ls_affpath
	istr_hunbundle_1-n[ll_ret].dicpath[1] = ls_dicpath
end choose

return ll_ret
end function

public subroutine of_set_interface_language (integer ai_language_id);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_Set_interface_language()
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
// 2017-12-29  Davros       Initial coding.
// -----------------------------------------------------------------------------

choose case ai_language_id
case IFC_LNG_EN
	// English.
	// Set active interface language.
	ii_iface_language = ai_language_id

	// Set translations.
	is_translations[IFC_TXT_MAXSIZEREACHED] = "Maximum number of spell objects has been reached (%1)."
	is_translations[IFC_TXT_HANDLEOUTOFRANGE] = "Spell object handle is out of range (%1)."
	is_translations[IFC_TXT_HANDLEINVALID] = "Spell object handle is invalid (%1)."
	is_translations[IFC_TXT_DICCANNOTOPEN] = "Dictionary file could not be opened (%1)."
	is_translations[IFC_TXT_AFFCANNOTOPEN] = "Affix file could not be opened (%1)."
	is_translations[IFC_TXT_MSGBOX_TITLE] = "Spell check"
	is_translations[IFC_TXT_LNGNOTSUPPORTED] = "Language is not supported (%1)."
	is_translations[IFC_TXT_DICENCODINGNOTOBTAINED] = "Dictionary character encoding could not be determined."
	is_translations[IFC_TXT_DICSLOTSFULL] = "Dictionary file could not be opened because all slots are occupied (%1)."
	is_translations[IFC_TXT_DICALREADYLOADED] = "Dictionary is already loaded (%1)."
	is_translations[IFC_TXT_FILEEXTENSIONINVALID] = "File extension of (%1) is invalid. Should be (%2)."
	is_translations[IFC_TXT_WORDCANNOTADD] = "Word (%1) could not be added to dictionary."
	is_translations[IFC_TXT_WORDCANNOTREMOVE] = "Word (%1) could not be removed from dictionary."
	is_translations[IFC_TXT_IDXCANNOTOPEN] = "Thesaurus index file could not be opened (%1)."
	is_translations[IFC_TXT_DATCANNOTOPEN] = "Thesaurus data file could not be opened (%1)."
	is_translations[IFC_TXT_THESENCODINGNOTOBTAINED] = "Thesaurus character encoding could not be determined."
	is_translations[IFC_TXT_HYPHENATIONERROR] = "Hyphenation could not be determined (%1)."
	is_translations[IFC_TXT_WORDMAXSIZEREACHED] = "Word (%1) is longer than maximum length (%2)."
	is_translations[IFC_TXT_LIBVERSIONFORMATINVALID] = "Version format of library (%1) is invalid."
	is_translations[IFC_TXT_FILECANNOTOPEN] = "File could not be opened (%1)."
	is_translations[IFC_TXT_RTFFORMATINVALID] = "RTF format is invalid (%1)."
	is_translations[IFC_TXT_RTFNOCOLORTABLE] = "RTF color table not found (%1)."
	is_translations[IFC_TXT_RTFNOPLAINTEXT] = "RTF control word for plain text not found (%1)."
	is_translations[IFC_TXT_MARKACTIONUNSUPPORTED] = "Mark action is unsupported (%1)."
case IFC_LNG_NL
	// Dutch.
	// Set active interface language.
	ii_iface_language = ai_language_id

	// Set translations.
	is_translations[IFC_TXT_MAXSIZEREACHED] = "Het maximum aantal spellingsobjecten is bereikt (%1)."
	is_translations[IFC_TXT_HANDLEOUTOFRANGE] = "Handle van spellingsobject ligt buiten het toegestane bereik (%1)."
	is_translations[IFC_TXT_HANDLEINVALID] = "Handle van spellingsobject is ongeldig (%1)."
	is_translations[IFC_TXT_DICCANNOTOPEN] = "Woordenlijstbestand kon niet worden geopend (%1)."
	is_translations[IFC_TXT_AFFCANNOTOPEN] = "Affixbestand kon niet worden geopend (%1)."
	is_translations[IFC_TXT_MSGBOX_TITLE] = "Spellingscontrole"
	is_translations[IFC_TXT_LNGNOTSUPPORTED] = "Taal wordt niet ondersteund (%1)."
	is_translations[IFC_TXT_DICENCODINGNOTOBTAINED] = "Tekencodering van woordenlijst kon niet worden bepaald."
	is_translations[IFC_TXT_DICSLOTSFULL] = "Woordenlijstbestand kon niet worden geopend omdat alle plaatsen bezet zijn (%1)."
	is_translations[IFC_TXT_DICALREADYLOADED] = "Woordenlijst is al geladen (%1)."
	is_translations[IFC_TXT_FILEEXTENSIONINVALID] = "Bestandsextensie van (%1) is ongeldig. Moet (%2) zijn."
	is_translations[IFC_TXT_WORDCANNOTADD] = "Woord (%1) kon niet worden toegevoegd aan woordenlijst."
	is_translations[IFC_TXT_WORDCANNOTREMOVE] = "Woord (%1) kon niet worden verwijderd uit woordenlijst."
	is_translations[IFC_TXT_IDXCANNOTOPEN] = "Indexbestand van thesaurus kon niet worden geopend (%1)."
	is_translations[IFC_TXT_DATCANNOTOPEN] = "Databestand van thesaurus kon niet worden geopend (%1)."
	is_translations[IFC_TXT_THESENCODINGNOTOBTAINED] = "Tekencodering van thesaurus kon niet worden bepaald."
	is_translations[IFC_TXT_HYPHENATIONERROR] = "Woordafbreking kon niet worden bepaald (%1)."
	is_translations[IFC_TXT_WORDMAXSIZEREACHED] = "Woord (%1) is langer dan maximum lengte (%2)."
	is_translations[IFC_TXT_LIBVERSIONFORMATINVALID] = "Versieformat van bibliotheek (%1) is ongeldig."
	is_translations[IFC_TXT_FILECANNOTOPEN] = "Bestand kon niet worden geopend (%1)."
	is_translations[IFC_TXT_RTFFORMATINVALID] = "RTF format is ongeldig (%1)."
	is_translations[IFC_TXT_RTFNOCOLORTABLE] = "RTF kleurentabel niet gevonden (%1)."
	is_translations[IFC_TXT_RTFNOPLAINTEXT] = "RTF sleutelwoord voor platte tekst niet gevonden (%1)."
	is_translations[IFC_TXT_MARKACTIONUNSUPPORTED] = "Markeringsactie wordt niet ondersteund (%1)."
case else
	// Inform user that language is unsupported.
	of_Show_message(IFC_TXT_LNGNOTSUPPORTED, string(ai_language_id), Information!)
end choose

end subroutine

public subroutine of_hunspell_destroy (long al_hunhandle);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_Hunspell_destroy()
//
// PURPOSE:    Destroy Hunspell spell checking object.
//
// ARGUMENTS:  [long] al_hunhandle. Handle of Hunspell object to destroy.
//
// RETURN:     None.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2017-12-29  Davros       Initial coding.
// -----------------------------------------------------------------------------

str_hunspell_filebundle lstr_bundle

choose case al_hunhandle
case 0
	// Reset bundle of hunhandle 0.
	istr_hunbundle_0 = lstr_bundle
	
	// Remove and destroy hunhandle 0.
	if ib_hunhandle_0 then
		ib_hunhandle_0 = false
		Hunspell_destroy_H(al_hunhandle)
	end if
case 1 to HUNH_MAXSIZE
	// Reset bundle of hunhandle 1 to HUNH_MAXSIZE.
	if UpperBound(istr_hunbundle_1-n[]) >= al_hunhandle then
		istr_hunbundle_1-n[al_hunhandle] = lstr_bundle
	end if

	// Remove and destroy hunhandle 1 to HUNH_MAXSIZE.
	if UpperBound(ib_hunhandle_1-n[]) >= al_hunhandle then
		if ib_hunhandle_1-n[al_hunhandle] then
			ib_hunhandle_1-n[al_hunhandle] = false
			Hunspell_destroy_H(al_hunhandle)
		end if
	end if
end choose


end subroutine

public function long of_hunspell_spell (long al_hunhandle, string as_word);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_Hunspell_spell()
//
// PURPOSE:    Check if word is correctly spelled.
//
// ARGUMENTS:  [long] al_hunhandle. Handle of Hunspell object.
//             [string] as_word. Word to spell check.
//
// RETURN:     [long]. One of the following values:
//             - 0 (Word spelled incorrectly).
//             - 1 (Word spelled correctly).
//             - HUNH_HANDLEOUTOFRANGE.
//             - HUNH_HANDLEINVALID.
//
// EXAMPLE:    long ll_n, ll_hunhandle
//             ll_hunhandle = of_Hunspell_create('F:\Data\Dicts\en_US.aff', 'F:\Data\Dicts\en_US.dic')
//             ll_n = of_Hunspell_spell(ll_hunhandle, 'houuse')
//
//             OUTPUT:
//             ll_n 0
//
//             ll_n = of_Hunspell_spell(ll_hunhandle, 'house')
//
//             OUTPUT:
//             ll_n 1
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2017-12-29  Davros       Initial coding.
// 2018-06-06  Davros       Encode input string.
// -----------------------------------------------------------------------------

long ll_ret
string ls_word, ls_dic_encoding

ls_dic_encoding = of_Hunspell_get_dic_encoding(al_hunhandle)
ls_word = of_PBHunspell_encode_dll_input(as_word, ls_dic_encoding)
ll_ret = Hunspell_spell_H(al_hunhandle, ls_word)

choose case ll_ret
case HUNH_HANDLEOUTOFRANGE
	of_Show_message(IFC_TXT_HANDLEOUTOFRANGE, string(ll_ret), Information!)
case HUNH_HANDLEINVALID
	of_Show_message(IFC_TXT_HANDLEINVALID, string(ll_ret), Information!)
end choose

return ll_ret
end function

public function long of_hunspell_add_dic (long al_hunhandle, string as_dicpath);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_Hunspell_add_dic()
//
// PURPOSE:    Load extra dictionary (.dic) file for loaded affix (.aff) file.
//
// ARGUMENTS:  [long] al_hunhandle. Handle of Hunspell object.
//             [string] as_dicpath. path\filename of dictionary file, e.g.
//             'F:\Data\Spell dictionaries\medical_en_US.dic'
//
// RETURN:     [long]. One of the following values:
//             - 0 (extra .dic file loaded)
//             - 1 (extra .dic file could not be loaded because all 20 dictionary
//             slots are already occupied)
//             - PBH_FILEEXTENSIONINVALID.
//             - HUNH_DICCANNOTOPEN.
//             - HUNH_HANDLEOUTOFRANGE.
//             - HUNH_HANDLEINVALID.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2017-12-30  Davros       Initial coding.
// -----------------------------------------------------------------------------

long ll_ret, ll_ndx
string ls_dicpath

ls_dicpath = as_dicpath

// Check file extension of as_dicpath.
if Lower(Right(ls_dicpath, Len(FILEEXTENSION_DIC))) <> FILEEXTENSION_DIC then
	of_Show_message(IFC_TXT_FILEEXTENSIONINVALID, ls_dicpath, FILEEXTENSION_DIC, Information!)
	return PBH_FILEEXTENSIONINVALID
end if

// Check if file as_dicpath exists.
if not FileExists(ls_dicpath) then
	of_Show_message(IFC_TXT_DICCANNOTOPEN, ls_dicpath, Information!)
	return HUNH_DICCANNOTOPEN
end if

// Check if file as_dicpath is already loaded.
if of_Hunspell_is_dic_loaded(al_hunhandle, ls_dicpath) then
	of_Show_message(IFC_TXT_DICALREADYLOADED, ls_dicpath, Information!)
	return PBH_DICALREADYLOADED
end if

// Add dictionary.
ll_ret = Hunspell_add_dic_H(al_hunhandle, ls_dicpath)

choose case ll_ret
case HUNH_DICCANNOTOPEN
	of_Show_message(IFC_TXT_DICCANNOTOPEN, string(ll_ret), Information!)
case HUNH_HANDLEOUTOFRANGE
	of_Show_message(IFC_TXT_HANDLEOUTOFRANGE, string(ll_ret), Information!)
case HUNH_HANDLEINVALID
	of_Show_message(IFC_TXT_HANDLEINVALID, string(ll_ret), Information!)
case 0
	choose case al_hunhandle
	case 0
		// Add dictionary to bundle of hunhandle 0.
		ll_ndx = UpperBound(istr_hunbundle_0.dicpath[]) + 1
		istr_hunbundle_0.dicpath[ll_ndx] = ls_dicpath
	case 1 to HUNH_MAXSIZE
		// Add dictionary to bundle of hunhandle 1 to HUNH_MAXSIZE.
		ll_ndx = UpperBound(istr_hunbundle_1-n[al_hunhandle].dicpath[]) + 1
		istr_hunbundle_1-n[al_hunhandle].dicpath[ll_ndx] = ls_dicpath
	end choose
case 1
	of_Show_message(IFC_TXT_DICSLOTSFULL, string(ll_ret), Information!)
end choose

return ll_ret
end function

public function long of_hunspell_create_key (string as_affpath, string as_dicpath, string as_key);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_Hunspell_create_key()
//
// PURPOSE:    Create Hunspell spell checking object.
//
// ARGUMENTS:  [string] as_affpath. path\filename of affix file, e.g.
//             'F:\Data\Spell dictionaries\en_US.aff'.
//             [string] as_dicpath. path\filename of dictionary file, e.g.
//             'F:\Data\Spell dictionaries\en_US.dic'.
//             [string] as_key. key value for dictionary encrypted by the Hunspell hzip tool.
//             If dictionary is not encrypted of_Hunspell_create_key() ignores the key (behaves
//             like of_Hunspell_create().
//
// RETURN:     [long]. One of the following values:
//             - Handle of Hunspell object. In range 0 to HUNH_MAXSIZE - 1.
//             - PBH_FILEEXTENSIONINVALID.
//             - HUNH_MAXSIZEREACHED.
//             - HUNH_DICCANNOTOPEN.
//             - HUNH_AFFCANNOTOPEN.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2017-12-28  Davros       Initial coding.
// -----------------------------------------------------------------------------

long ll_ret
string ls_affpath, ls_dicpath

ls_affpath = as_affpath
ls_dicpath = as_dicpath

// Check file extension of as_affpath and as_dicpath.
if Lower(Right(ls_affpath, Len(FILEEXTENSION_AFF))) <> FILEEXTENSION_AFF then
	of_Show_message(IFC_TXT_FILEEXTENSIONINVALID, ls_affpath, FILEEXTENSION_AFF, Information!)
	return PBH_FILEEXTENSIONINVALID
end if
if Lower(Right(ls_dicpath, Len(FILEEXTENSION_DIC))) <> FILEEXTENSION_DIC then
	of_Show_message(IFC_TXT_FILEEXTENSIONINVALID, ls_dicpath, FILEEXTENSION_DIC, Information!)
	return PBH_FILEEXTENSIONINVALID
end if

// Check if files as_affpath and as_dicpath exist.
if not FileExists(ls_affpath) then
	of_Show_message(IFC_TXT_AFFCANNOTOPEN, ls_affpath, Information!)
	return HUNH_AFFCANNOTOPEN
elseif not FileExists(ls_dicpath) then
	of_Show_message(IFC_TXT_DICCANNOTOPEN, ls_dicpath, Information!)
	return HUNH_DICCANNOTOPEN
end if

// Create Hunspell object.
ll_ret = Hunspell_create_key_H(ls_affpath, ls_dicpath, as_key)

choose case ll_ret
case HUNH_MAXSIZEREACHED
	of_Show_message(IFC_TXT_MAXSIZEREACHED, string(ll_ret), Information!)
case HUNH_AFFCANNOTOPEN
	of_Show_message(IFC_TXT_AFFCANNOTOPEN, string(ll_ret), Information!)
case HUNH_DICCANNOTOPEN
	of_Show_message(IFC_TXT_DICCANNOTOPEN, string(ll_ret), Information!)
case 0
	// Save hunhandle 0 and initialize dictionary bundle.
	ib_hunhandle_0 = true
	istr_hunbundle_0.affpath = ls_affpath
	istr_hunbundle_0.dicpath[1] = ls_dicpath
case 1 to HUNH_MAXSIZE
	// Save hunhandle 1 to HUNH_MAXSIZE and initialize dictionary bundle.
	ib_hunhandle_1-n[ll_ret] = true
	istr_hunbundle_1-n[ll_ret].affpath = ls_affpath
	istr_hunbundle_1-n[ll_ret].dicpath[1] = ls_dicpath
end choose

return ll_ret
end function

public function integer of_get_interface_language ();// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_Get_interface_language()
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
// 2017-12-31  Davros       Initial coding.
// -----------------------------------------------------------------------------

return ii_iface_language
end function

public function string of_hunspell_get_dic_encoding (long al_hunhandle);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_Hunspell_get_dic_encoding()
//
// PURPOSE:    Get spell encoding. Default "ISO8859-1" or the character encoding
//             defined with keyword "SET" in the loaded affix file.
//
// ARGUMENTS:  [long] al_hunhandle. Handle of Hunspell object.
//
// RETURN:     [string]. One of the following values:
//             - <empty> (error because of HUNH_HANDLEOUTOFRANGE or HUNH_HANDLEINVALID).
//             - character encoding.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2017-12-29  Davros       Initial coding.
// -----------------------------------------------------------------------------

string ls_ret

ls_ret = Hunspell_get_dic_encoding_H(al_hunhandle)

if ls_ret = "" then
	of_Show_message(IFC_TXT_DICENCODINGNOTOBTAINED, "", Information!)
end if

return ls_ret
end function

public function long of_hunspell_suggest (long al_hunhandle, ref string as_slst[], string as_word);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_Hunspell_suggest()
//
// PURPOSE:    Give suggestions for a (misspelled) word.
//
// ARGUMENTS:  [long] al_hunhandle. Handle of Hunspell object.
//             [ref string array] as_slst[]. Suggestion list for as_word.
//             [string] as_word. Word to do suggestions for.
//
// RETURN:     [long]. One of the following values:
//             - Number of items in list as_slst[].
//             - HUNH_HANDLEOUTOFRANGE.
//             - HUNH_HANDLEINVALID.
//
// EXAMPLE:    string ls_suggestionlist[]
//             long ll_n, ll_hunhandle
//             ll_hunhandle = of_Hunspell_create('F:\Data\Dicts\en_US.aff', 'F:\Data\Dicts\en_US.dic')
//             ll_n = of_Hunspell_suggest(ll_hunhandle, ls_suggestionlist[], 'perfec')
//
//             OUTPUT:
//             ls_suggestionlist[1] 'perfect'
//             ls_suggestionlist[2] 'perforce'
//             ls_suggestionlist[3] 'perfumer'
//             ls_suggestionlist[4] 'perfume'
//             ls_suggestionlist[5] 'superfix'
//             ll_n 5
//
//             ll_n = of_Hunspell_suggest(ll_hunhandle, ls_suggestionlist[], 'occas')
//
//             OUTPUT:
//             ls_suggestionlist[1] 'cocas'
//             ls_suggestionlist[2] 'occasion'
//             ls_suggestionlist[3] 'Occam'
//             ls_suggestionlist[4] 'cassock'
//             ls_suggestionlist[5] 'Jocasta'
//             ls_suggestionlist[6] 'O'Casey'
//             ls_suggestionlist[7] 'oxcart'
//             ll_n 7
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2017-12-31  Davros       Initial coding.
// 2018-06-06  Davros       Encode input and output strings.
// -----------------------------------------------------------------------------

long ll_ret, ll_ndx, ll_n
string ls_slst[], ls_val, ls_word, ls_dic_encoding

as_slst[] = ls_slst[]

// Allocate memory for output list.
for ll_ndx = 1 to il_hunh_maxsuggestion
	ls_slst[ll_ndx] = Space(il_hunh_maxwordlen)
next

ls_dic_encoding = of_Hunspell_get_dic_encoding(al_hunhandle)
ls_word = of_PBHunspell_encode_dll_input(as_word, ls_dic_encoding)
ll_ret = Hunspell_suggest_H(al_hunhandle, ls_slst[], ls_word, il_hunh_maxsuggestion, il_hunh_maxwordlen)

choose case ll_ret
case HUNH_HANDLEOUTOFRANGE
	of_Show_message(IFC_TXT_HANDLEOUTOFRANGE, string(ll_ret), Information!)
case HUNH_HANDLEINVALID
	of_Show_message(IFC_TXT_HANDLEINVALID, string(ll_ret), Information!)
case else
	// Fill suggestion list returned by this function.
	for ll_ndx = 1 to UpperBound(ls_slst[])
		ls_val = Trim(ls_slst[ll_ndx])
		if Len(ls_val) > 0 then
			ls_val = of_PBHunspell_encode_dll_output(ls_val, ls_dic_encoding)
			ll_n = UpperBound(as_slst[]) + 1
			as_slst[ll_n] = ls_val
		end if
	next
end choose

return ll_ret
end function

public subroutine of_hunspell_destroy_all ();// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_Hunspell_destroy_all()
//
// PURPOSE:    Destroy all instantiated Hunspell spell checking objects.
//
// ARGUMENTS:  None.
//
// RETURN:     None.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2017-12-31  Davros       Initial coding.
// -----------------------------------------------------------------------------

boolean lb_hunhandle_0, lb_hunhandle_1-n[]
str_hunspell_filebundle lstr_hunbundle_0, lstr_hunbundle_1-n[]

Hunspell_destroy_all_H()

// Handle 0.
ib_hunhandle_0 = lb_hunhandle_0
istr_hunbundle_0 = lstr_hunbundle_0

// Handles 1 to HUNH_MAXSIZE.
ib_hunhandle_1-n[] = lb_hunhandle_1-n[]
istr_hunbundle_1-n[] = lstr_hunbundle_1-n[]


end subroutine

public function long of_hunspell_analyze (long al_hunhandle, ref string as_slst[], string as_word);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_Hunspell_analyze()
//
// PURPOSE:    Analyze a word morphologically.
//
// ARGUMENTS:  [long] al_hunhandle. Handle of Hunspell object.
//             [ref string array] as_slst[]. A list of items with space separated
//             morphological description fields for as_word, optionally starting
//             with a 3-character (2 letters and an colon) field ID.
//             [string] as_word. Word to describe morphologically.
//
// RETURN:     [long]. One of the following values:
//             - Number of items in list as_slst[].
//             - HUNH_HANDLEOUTOFRANGE.
//             - HUNH_HANDLEINVALID.
//
// EXAMPLE:    string ls_morphlist[]
//             long ll_n, ll_hunhandle
//             ll_hunhandle = of_Hunspell_create('F:\Data\Dicts\en_US.aff', 'F:\Data\Dicts\en_US.dic')
//             ll_n = of_Hunspell_analyze(ll_hunhandle, ls_morphlist[], 'drinkable')
//
//             OUTPUT:
//             ls_morphlist[1] 'po:verb ds:able'
//             ll_n 1
//
//             ll_n = of_Hunspell_analyze(ll_hunhandle, ls_morphlist[], 'boardings')
//
//             OUTPUT:
//             ls_morphlist[1] 'st:boarding fl:S'
//             ll_n 1
//
//             ll_n = of_Hunspell_analyze(ll_hunhandle, ls_morphlist[], 'greedy')
//
//             OUTPUT:
//             ls_morphlist[1] 'st:greedy'
//             ll_n 1
//
//             ll_n = of_Hunspell_analyze(ll_hunhandle, ls_morphlist[], 'moped')
//
//             OUTPUT:
//             ls_morphlist[1] 'st:moped'
//             ls_morphlist[2] 'st:mop fl:D'
//             ll_n 2
//
//             ll_n = of_Hunspell_analyze(ll_hunhandle, ls_morphlist[], 'wicked')
//
//             OUTPUT:
//             ls_morphlist[1] 'st:wicked'
//             ls_morphlist[2] 'st:wick fl:D'
//             ll_n 2
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-01-15  Davros       Initial coding.
// 2018-06-08  Davros       Encode input and output strings.
// -----------------------------------------------------------------------------

long ll_ret, ll_ndx, ll_n
string ls_slst[], ls_val, ls_word, ls_dic_encoding

as_slst[] = ls_slst[]

// Allocate memory for output list.
for ll_ndx = 1 to il_hunh_maxsuggestion
	ls_slst[ll_ndx] = Space(il_hunh_maxwordlen)
next

ls_dic_encoding = of_Hunspell_get_dic_encoding(al_hunhandle)
ls_word = of_PBHunspell_encode_dll_input(as_word, ls_dic_encoding)
ll_ret = Hunspell_analyze_H(al_hunhandle, ls_slst[], ls_word, il_hunh_maxsuggestion, il_hunh_maxwordlen)

choose case ll_ret
case HUNH_HANDLEOUTOFRANGE
	of_Show_message(IFC_TXT_HANDLEOUTOFRANGE, string(ll_ret), Information!)
case HUNH_HANDLEINVALID
	of_Show_message(IFC_TXT_HANDLEINVALID, string(ll_ret), Information!)
case else
	// Fill morphological item list returned by this function.
	for ll_ndx = 1 to UpperBound(ls_slst[])
		ls_val = Trim(ls_slst[ll_ndx])
		if Len(ls_val) > 0 then
			ls_val = of_PBHunspell_encode_dll_output(ls_val, ls_dic_encoding)
			ll_n = UpperBound(as_slst[]) + 1
			as_slst[ll_n] = ls_val
		end if
	next
end choose

return ll_ret
end function

public function long of_hunspell_stem (long al_hunhandle, ref string as_slst[], string as_word);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_Hunspell_stem()
//
// PURPOSE:    Get word stem.
//
// ARGUMENTS:  [long] al_hunhandle. Handle of Hunspell object.
//             [ref string array] as_slst[]. A list of stems of as_word.
//             [string] as_word. Word to get the stem of.
//
// RETURN:     [long]. One of the following values:
//             - Number of items in list as_slst[].
//             - HUNH_HANDLEOUTOFRANGE.
//             - HUNH_HANDLEINVALID.
//
// EXAMPLE:    string ls_stemlist[]
//             long ll_n, ll_hunhandle
//             ll_hunhandle = of_Hunspell_create('F:\Data\Dicts\en_US.aff', 'F:\Data\Dicts\en_US.dic')
//             ll_n = of_Hunspell_stem(ll_hunhandle, ls_stemlist[], 'drinkable')
//
//             OUTPUT:
//             ls_stemlist[1] 'drinkable'
//             ls_stemlist[2] 'drink'
//             ll_n 2
//
//             ll_n = of_Hunspell_stem(ll_hunhandle, ls_stemlist[], 'worried')
//
//             OUTPUT:
//             ls_stemlist[1] 'worried'
//             ls_stemlist[2] 'worry'
//             ll_n 2
//
//             ll_n = of_Hunspell_stem(ll_hunhandle, ls_stemlist[], 'printers')
//
//             OUTPUT:
//             ls_stemlist[1] 'printers'
//             ll_n 1
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-01-15  Davros       Initial coding.
// 2018-06-09  Davros       Encode input and output strings.
// -----------------------------------------------------------------------------

long ll_ret, ll_ndx, ll_n
string ls_slst[], ls_val, ls_word, ls_dic_encoding

as_slst[] = ls_slst[]

// Allocate memory for output list.
for ll_ndx = 1 to il_hunh_maxsuggestion
	ls_slst[ll_ndx] = Space(il_hunh_maxwordlen)
next

ls_dic_encoding = of_Hunspell_get_dic_encoding(al_hunhandle)
ls_word = of_PBHunspell_encode_dll_input(as_word, ls_dic_encoding)
ll_ret = Hunspell_stem_H(al_hunhandle, ls_slst[], ls_word, il_hunh_maxsuggestion, il_hunh_maxwordlen)

choose case ll_ret
case HUNH_HANDLEOUTOFRANGE
	of_Show_message(IFC_TXT_HANDLEOUTOFRANGE, string(ll_ret), Information!)
case HUNH_HANDLEINVALID
	of_Show_message(IFC_TXT_HANDLEINVALID, string(ll_ret), Information!)
case else
	// Fill stem item list returned by this function.
	for ll_ndx = 1 to UpperBound(ls_slst[])
		ls_val = Trim(ls_slst[ll_ndx])
		if Len(ls_val) > 0 then
			ls_val = of_PBHunspell_encode_dll_output(ls_val, ls_dic_encoding)
			ll_n = UpperBound(as_slst[]) + 1
			as_slst[ll_n] = ls_val
		end if
	next
end choose

return ll_ret
end function

public function long of_hunspell_stem2 (long al_hunhandle, ref string as_slst[], string as_desc[], long al_n);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_Hunspell_stem2()
//
// PURPOSE:    Get stems from a morphological analysis.
//                  
// ARGUMENTS:  [long] al_hunhandle. Handle of Hunspell object.
//             [ref string array] as_slst[]. A list of stems of as_desc[].
//             [string array] as_desc[]. Morphologically analyzed items to get the stem of.
//             [long] al_n. Number of items in as_desc[].
//
// RETURN:     [long]. One of the following values:
//             - Number of items in list as_slst[].
//             - HUNH_HANDLEOUTOFRANGE.
//             - HUNH_HANDLEINVALID.
//
// EXAMPLE:    string ls_morphlist[], ls_stemlist[]
//             long ll_n1, ll_n2, ll_hunhandle
//             ll_hunhandle = of_Hunspell_create('F:\Data\Dicts\en_US.aff', 'F:\Data\Dicts\en_US.dic')
//             ll_n1 = of_Hunspell_analyze(ll_hunhandle, ls_morphlist[], 'moped')
//
//             OUTPUT:
//             ls_morphlist[1] 'st:moped'
//             ls_morphlist[2] 'st:mop fl:D'
//             ll_n1 2
//
//             ll_n2 = of_Hunspell_stem2(ll_hunhandle, ls_stemlist[], ls_morphlist[], ll_n1)
//
//             OUTPUT:
//             ls_stemlist[1] 'moped'
//             ls_stemlist[2] 'mop'
//             ll_n2 2               
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-01-16  Davros       Initial coding.
// 2018-06-09  Davros       Encode input and output strings.
// -----------------------------------------------------------------------------

long ll_ret, ll_ndx, ll_n
string ls_slst[], ls_desc[], ls_val, ls_dic_encoding

as_slst[] = ls_slst[]

// Allocate memory for output list.
for ll_ndx = 1 to il_hunh_maxsuggestion
	ls_slst[ll_ndx] = Space(il_hunh_maxwordlen)
next

ls_dic_encoding = of_Hunspell_get_dic_encoding(al_hunhandle)
for ll_ndx = 1 to UpperBound(as_desc[])
	ls_desc[ll_ndx] = of_PBHunspell_encode_dll_input(as_desc[ll_ndx], ls_dic_encoding)
next
ll_ret = Hunspell_stem2_H(al_hunhandle, ls_slst[], ls_desc[], al_n, il_hunh_maxsuggestion, il_hunh_maxwordlen)

choose case ll_ret
case HUNH_HANDLEOUTOFRANGE
	of_Show_message(IFC_TXT_HANDLEOUTOFRANGE, string(ll_ret), Information!)
case HUNH_HANDLEINVALID
	of_Show_message(IFC_TXT_HANDLEINVALID, string(ll_ret), Information!)
case else
	// Fill stem item list returned by this function.
	for ll_ndx = 1 to UpperBound(ls_slst[])
		ls_val = Trim(ls_slst[ll_ndx])
		if Len(ls_val) > 0 then
			ls_val = of_PBHunspell_encode_dll_output(ls_val, ls_dic_encoding)
			ll_n = UpperBound(as_slst[]) + 1
			as_slst[ll_n] = ls_val
		end if
	next
end choose

return ll_ret
end function

public function long of_hunspell_generate (long al_hunhandle, ref string as_slst[], string as_word, string as_word2);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_Hunspell_generate()
//
// PURPOSE:    Generate inflected forms of a word from an example word.
//
// ARGUMENTS:  [long] al_hunhandle. Handle of Hunspell object.
//             [ref string array] as_slst[]. A list of inflected forms of as_word
//             based on example as_word2.
//             [string] as_word. A word to inflect.
//             [string] as_word2. An example word.
//
// RETURN:     [long]. One of the following values:
//             - Number of items in list as_slst[].
//             - HUNH_HANDLEOUTOFRANGE.
//             - HUNH_HANDLEINVALID.
//
// EXAMPLE:    string ls_generationlist[]
//             long ll_n, ll_hunhandle
//             ll_hunhandle = of_Hunspell_create('F:\Data\Dicts\en_US.aff', 'F:\Data\Dicts\en_US.dic')
//             ll_n = of_Hunspell_generate(ll_hunhandle, ls_generationlist[], 'girl', 'boys')
//
//             OUTPUT:
//             ls_generationlist[1] 'girls'
//             ll_n 1
//
//             ll_n = of_Hunspell_generate(ll_hunhandle, ls_generationlist[], 'telling', 'ran')
//
//             OUTPUT:
//             ls_generationlist[1] 'told'
//             ll_n 1            
//
//             ll_n = of_Hunspell_generate(ll_hunhandle, ls_generationlist[], 'told', 'run')
//
//             OUTPUT:
//             ls_generationlist[1] 'tell'
//             ll_n 1            
//
// NOTES:      This wrapper function and the orignal hunspell function always return an empty
//             generate list, although technically everything seems fine. I reported this issue
//             to hunspell project on github (https://github.com/hunspell/hunspell/issues/554).
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-01-17  Davros       Initial coding.
// 2018-06-09  Davros       Encode input and output strings.
// -----------------------------------------------------------------------------

long ll_ret, ll_ndx, ll_n
string ls_slst[], ls_val, ls_word, ls_word2, ls_dic_encoding

as_slst[] = ls_slst[]

// Allocate memory for output list.
for ll_ndx = 1 to il_hunh_maxsuggestion
	ls_slst[ll_ndx] = Space(il_hunh_maxwordlen)
next

ls_dic_encoding = of_Hunspell_get_dic_encoding(al_hunhandle)
ls_word = of_PBHunspell_encode_dll_input(as_word, ls_dic_encoding)
ls_word2 = of_PBHunspell_encode_dll_input(as_word2, ls_dic_encoding)
ll_ret = Hunspell_generate_H(al_hunhandle, ls_slst[], ls_word, ls_word2, il_hunh_maxsuggestion, il_hunh_maxwordlen)

choose case ll_ret
case HUNH_HANDLEOUTOFRANGE
	of_Show_message(IFC_TXT_HANDLEOUTOFRANGE, string(ll_ret), Information!)
case HUNH_HANDLEINVALID
	of_Show_message(IFC_TXT_HANDLEINVALID, string(ll_ret), Information!)
case else
	// Fill inflection item list returned by this function.
	for ll_ndx = 1 to UpperBound(ls_slst[])
		ls_val = Trim(ls_slst[ll_ndx])
		if Len(ls_val) > 0 then
			ls_val = of_PBHunspell_encode_dll_output(ls_val, ls_dic_encoding)
			ll_n = UpperBound(as_slst[]) + 1
			as_slst[ll_n] = ls_val
		end if
	next
end choose

return ll_ret
end function

public function long of_hunspell_generate2 (long al_hunhandle, ref string as_slst[], string as_word, string as_desc[], long al_n);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_Hunspell_generate2()
//
// PURPOSE:    Generate inflected forms of a word from a list of morphological descriptions.
//
// ARGUMENTS:  [long] al_hunhandle. Handle of Hunspell object.
//             [ref string array] as_slst[]. A list of inflected forms of as_word
//             based on morphological description list as_desc[].
//             [string] as_word. A word to inflect.
//             [string array] as_desc[]. A list of morphological descriptions.
//             [long] al_n. Number of items in list as_desc[].
//
// RETURN:     [long]. One of the following values:
//             - Number of items in list as_slst[].
//             - HUNH_HANDLEOUTOFRANGE.
//             - HUNH_HANDLEINVALID.
//
// EXAMPLE:    string ls_generationlist[], ls_descriptionlist[]
//             long ll_n, ll_hunhandle
//             ls_descriptionlist[1] = 'is:plural'
//             ll_hunhandle = of_Hunspell_create('F:\Data\Dicts\en_US.aff', 'F:\Data\Dicts\en_US.dic')
//             ll_n = of_Hunspell_generate2(ll_hunhandle, ls_generationlist[], 'girl', ls_descriptionlist[], 1)
//
//             OUTPUT:
//             ls_generationlist[1] 'girls'
//             ll_n 1            
//
// NOTES:      This wrapper function and the orignal hunspell function always return an empty
//             generate list, although technically everything seems fine. I reported this issue
//             to hunspell project on github (https://github.com/hunspell/hunspell/issues/554).
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-01-17  Davros       Initial coding.
// 2018-06-09  Davros       Encode input and output strings.
// -----------------------------------------------------------------------------

long ll_ret, ll_ndx, ll_n
string ls_slst[], ls_desc[], ls_val, ls_word, ls_dic_encoding

as_slst[] = ls_slst[]

// Allocate memory for output list.
for ll_ndx = 1 to il_hunh_maxsuggestion
	ls_slst[ll_ndx] = Space(il_hunh_maxwordlen)
next

ls_dic_encoding = of_Hunspell_get_dic_encoding(al_hunhandle)
ls_word = of_PBHunspell_encode_dll_input(as_word, ls_dic_encoding)
for ll_ndx = 1 to UpperBound(as_desc[])
	ls_desc[ll_ndx] = of_PBHunspell_encode_dll_input(as_desc[ll_ndx], ls_dic_encoding)
next
ll_ret = Hunspell_generate2_H(al_hunhandle, ls_slst[], ls_word, ls_desc[], al_n, il_hunh_maxsuggestion, il_hunh_maxwordlen)

choose case ll_ret
case HUNH_HANDLEOUTOFRANGE
	of_Show_message(IFC_TXT_HANDLEOUTOFRANGE, string(ll_ret), Information!)
case HUNH_HANDLEINVALID
	of_Show_message(IFC_TXT_HANDLEINVALID, string(ll_ret), Information!)
case else
	// Fill inflection item list returned by this function.
	for ll_ndx = 1 to UpperBound(ls_slst[])
		ls_val = Trim(ls_slst[ll_ndx])
		if Len(ls_val) > 0 then
			ls_val = of_PBHunspell_encode_dll_output(ls_val, ls_dic_encoding)
			ll_n = UpperBound(as_slst[]) + 1
			as_slst[ll_n] = ls_val
		end if
	next
end choose

return ll_ret
end function

public function long of_hunspell_add (long al_hunhandle, string as_word);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_Hunspell_add()
//
// PURPOSE:    Add word to loaded (run-time) dictionary. The added word only
//             exists in memory and will not be written to the physical dictionary.
//             Word must be a stem form.
//
// ARGUMENTS:  [long] al_hunhandle. Handle of Hunspell object.
//             [string] as_word. Word to add.
//
// RETURN:     [long]. One of the following values:
//             - 0 (Word added successfully).
//             - PBH_WORDCANNOTADD (Word could not be added).
//             - HUNH_HANDLEOUTOFRANGE.
//             - HUNH_HANDLEINVALID.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-01-17  Davros       Initial coding.
// 2018-06-09  Davros       Encode input string.
// -----------------------------------------------------------------------------

long ll_ret
string ls_word, ls_dic_encoding

ls_dic_encoding = of_Hunspell_get_dic_encoding(al_hunhandle)
ls_word = of_PBHunspell_encode_dll_input(as_word, ls_dic_encoding)
ll_ret = Hunspell_add_H(al_hunhandle, ls_word)

choose case ll_ret
case HUNH_HANDLEOUTOFRANGE
	of_Show_message(IFC_TXT_HANDLEOUTOFRANGE, string(ll_ret), Information!)
case HUNH_HANDLEINVALID
	of_Show_message(IFC_TXT_HANDLEINVALID, string(ll_ret), Information!)
case IS < 0, IS > 0
	of_Show_message(IFC_TXT_WORDCANNOTADD, as_word, Information!)
	return PBH_WORDCANNOTADD
end choose

return ll_ret
end function

public function long of_hunspell_add_with_affix (long al_hunhandle, string as_word, string as_example);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_Hunspell_add_with_affix()
//
// PURPOSE:    Add word including affixes to loaded (run-time) dictionary based
//             on example word. The added word and affixes only exist in memory
//             and will not be written to the physical dictionary. Word and example
//             word must be stem forms.
//
// ARGUMENTS:  [long] al_hunhandle. Handle of Hunspell object.
//             [string] as_word. Word to add.
//             [string] as_example. Example word by which to add as_word including
//             affixes.
//
// RETURN:     [long]. One of the following values:
//             - 0 (Word added successfully).
//             - PBH_WORDCANNOTADD (Word could not be added).
//             - HUNH_HANDLEOUTOFRANGE.
//             - HUNH_HANDLEINVALID.
//
// EXAMPLE:    long ll_n, ll_hunhandle
//             ll_hunhandle = of_Hunspell_create('F:\Data\Dicts\en_US.aff', 'F:\Data\Dicts\en_US.dic')
//             ll_n = of_Hunspell_add_with_affix(ll_hunhandle, 'entodork', 'cow')
//
//             'entodork' will be added to the currently loaded dictionary including
//             its plural form 'entodorks' by analogy with plural 'cows'.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-01-18  Davros       Initial coding.
// 2018-06-09  Davros       Encode input strings.
// -----------------------------------------------------------------------------

long ll_ret
string ls_word, ls_example, ls_dic_encoding

ls_dic_encoding = of_Hunspell_get_dic_encoding(al_hunhandle)
ls_word = of_PBHunspell_encode_dll_input(as_word, ls_dic_encoding)
ls_example = of_PBHunspell_encode_dll_input(as_example, ls_dic_encoding)
ll_ret = Hunspell_add_with_affix_H(al_hunhandle, ls_word, ls_example)

choose case ll_ret
case HUNH_HANDLEOUTOFRANGE
	of_Show_message(IFC_TXT_HANDLEOUTOFRANGE, string(ll_ret), Information!)
case HUNH_HANDLEINVALID
	of_Show_message(IFC_TXT_HANDLEINVALID, string(ll_ret), Information!)
case IS < 0, IS > 0
	of_Show_message(IFC_TXT_WORDCANNOTADD, as_word, Information!)
	return PBH_WORDCANNOTADD
end choose

return ll_ret
end function

public function long of_hunspell_remove (long al_hunhandle, string as_word);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_Hunspell_remove()
//
// PURPOSE:    Remove word from run-time dictionary.
//
// ARGUMENTS:  [long] al_hunhandle. Handle of Hunspell object.
//             [string] as_word. Word to remove from dictionary.
//
// RETURN:     [long]. One of the following values:
//             - 0 (Word removed successfully or not in dictionary).
//             - PBH_WORDCANNOTREMOVE (Word could not be removed).
//             - HUNH_HANDLEOUTOFRANGE.
//             - HUNH_HANDLEINVALID.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-01-18  Davros       Initial coding.
// 2018-06-09  Davros       Encode input string.
// -----------------------------------------------------------------------------

long ll_ret
string ls_word, ls_dic_encoding

ls_dic_encoding = of_Hunspell_get_dic_encoding(al_hunhandle)
ls_word = of_PBHunspell_encode_dll_input(as_word, ls_dic_encoding)
ll_ret = Hunspell_remove_H(al_hunhandle, ls_word)

choose case ll_ret
case HUNH_HANDLEOUTOFRANGE
	of_Show_message(IFC_TXT_HANDLEOUTOFRANGE, string(ll_ret), Information!)
case HUNH_HANDLEINVALID
	of_Show_message(IFC_TXT_HANDLEINVALID, string(ll_ret), Information!)
case IS < 0, IS > 0
	of_Show_message(IFC_TXT_WORDCANNOTREMOVE, as_word, Information!)
	return PBH_WORDCANNOTREMOVE
end choose

return ll_ret
end function

public function long of_mythes_create (string as_idxpath, string as_datpath);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_MyThes_create()
//
// PURPOSE:    Create MyThes thesaurus object.
//
// ARGUMENTS:  [string] as_idxpath. path\filename of index file, e.g.
//             'F:\Data\Spell dictionaries\th_en_US.idx'.
//             [string] as_datpath. path\filename of data file, e.g.
//             'F:\Data\Spell dictionaries\th_en_US.dat'.
//
// RETURN:     [long]. One of the following values:
//             - Handle of MyThes object. In range 0 to MYTH_MAXSIZE - 1.
//             - PBH_FILEEXTENSIONINVALID.
//             - MYTH_MAXSIZEREACHED.
//             - MYTH_DATCANNOTOPEN.
//             - MYTH_IDXCANNOTOPEN.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-02-03  Davros       Initial coding.
// -----------------------------------------------------------------------------

long ll_ret
string ls_idxpath, ls_datpath

ls_idxpath = as_idxpath
ls_datpath = as_datpath

// Check file extension of as_idxpath and as_datpath.
if Lower(Right(ls_idxpath, Len(FILEEXTENSION_IDX))) <> FILEEXTENSION_IDX then
	of_Show_message(IFC_TXT_FILEEXTENSIONINVALID, ls_idxpath, FILEEXTENSION_IDX, Information!)
	return PBH_FILEEXTENSIONINVALID
end if
if Lower(Right(ls_datpath, Len(FILEEXTENSION_DAT))) <> FILEEXTENSION_DAT then
	of_Show_message(IFC_TXT_FILEEXTENSIONINVALID, ls_datpath, FILEEXTENSION_DAT, Information!)
	return PBH_FILEEXTENSIONINVALID
end if

// Check if files as_idxpath and as_datpath exist.
if not FileExists(ls_idxpath) then
	of_Show_message(IFC_TXT_IDXCANNOTOPEN, ls_idxpath, Information!)
	return MYTH_IDXCANNOTOPEN
elseif not FileExists(ls_datpath) then
	of_Show_message(IFC_TXT_DATCANNOTOPEN, ls_datpath, Information!)
	return MYTH_DATCANNOTOPEN
end if

// Create MyThes object.
ll_ret = MyThes_create_H(ls_idxpath, ls_datpath)

choose case ll_ret
case MYTH_MAXSIZEREACHED
	of_Show_message(IFC_TXT_MAXSIZEREACHED, string(ll_ret), Information!)
case MYTH_IDXCANNOTOPEN
	of_Show_message(IFC_TXT_IDXCANNOTOPEN, string(ll_ret), Information!)
case MYTH_DATCANNOTOPEN
	of_Show_message(IFC_TXT_DATCANNOTOPEN, string(ll_ret), Information!)
case 0
	// Save mytheshandle 0 and initialize thesaurus bundle.
	ib_mytheshandle_0 = true
	istr_mythbundle_0.idxpath = ls_idxpath
	istr_mythbundle_0.datpath = ls_datpath
case 1 to MYTH_MAXSIZE
	// Save mytheshandle 1 to MYTH_MAXSIZE and initialize thesaurus bundle.
	ib_mytheshandle_1-n[ll_ret] = true
	istr_mythbundle_1-n[ll_ret].idxpath = ls_idxpath
	istr_mythbundle_1-n[ll_ret].datpath = ls_datpath
end choose

return ll_ret
end function

public subroutine of_mythes_destroy (long al_mytheshandle);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_MyThes_destroy()
//
// PURPOSE:    Destroy MyThes thesaurus object.
//
// ARGUMENTS:  [long] al_mytheshandle. Handle of MyThes object to destroy.
//
// RETURN:     None.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-02-03  Davros       Initial coding.
// -----------------------------------------------------------------------------

str_mythes_filebundle lstr_bundle

choose case al_mytheshandle
case 0
	// Reset bundle of mytheshandle 0.
	istr_mythbundle_0 = lstr_bundle
	
	// Remove and destroy mytheshandle 0.
	if ib_mytheshandle_0 then
		ib_mytheshandle_0 = false
		MyThes_destroy_H(al_mytheshandle)
	end if
case 1 to MYTH_MAXSIZE
	// Reset bundle of mytheshandle 1 to MYTH_MAXSIZE.
	if UpperBound(istr_mythbundle_1-n[]) >= al_mytheshandle then
		istr_mythbundle_1-n[al_mytheshandle] = lstr_bundle
	end if

	// Remove and destroy mytheshandle 1 to MYTH_MAXSIZE.
	if UpperBound(ib_mytheshandle_1-n[]) >= al_mytheshandle then
		if ib_mytheshandle_1-n[al_mytheshandle] then
			ib_mytheshandle_1-n[al_mytheshandle] = false
			MyThes_destroy_H(al_mytheshandle)
		end if
	end if
end choose


end subroutine

public subroutine of_mythes_destroy_all ();// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_MyThes_destroy_all()
//
// PURPOSE:    Destroy all instantiated MyThes thesaurus objects.
//
// ARGUMENTS:  None.
//
// RETURN:     None.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-02-03  Davros       Initial coding.
// -----------------------------------------------------------------------------

boolean lb_mytheshandle_0, lb_mytheshandle_1-n[]
str_mythes_filebundle lstr_mythbundle_0, lstr_mythbundle_1-n[]

MyThes_destroy_all_H()

// Handle 0.
ib_mytheshandle_0 = lb_mytheshandle_0
istr_mythbundle_0 = lstr_mythbundle_0

// Handles 1 to MYTH_MAXSIZE.
ib_mytheshandle_1-n[] = lb_mytheshandle_1-n[]
istr_mythbundle_1-n[] = lstr_mythbundle_1-n[]


end subroutine

public function string of_mythes_get_th_encoding (long al_mytheshandle);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_MyThes_get_th_encoding()
//
// PURPOSE:    Get thesaurus encoding. Value is first line of loaded .idx file,
//             e.g. "ISO8859-1".
//
// ARGUMENTS:  [long] al_mytheshandle. Handle of MyThes object.
//
// RETURN:     [string]. One of the following values:
//             - <empty> (error because of MYTH_HANDLEOUTOFRANGE or MYTH_HANDLEINVALID).
//             - character encoding.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-02-03  Davros       Initial coding.
// -----------------------------------------------------------------------------

string ls_ret

ls_ret = MyThes_get_th_encoding_H(al_mytheshandle)

if ls_ret = "" then
	of_Show_message(IFC_TXT_THESENCODINGNOTOBTAINED, "", Information!)
end if

return ls_ret
end function

public function long of_mythes_lookup (long al_mytheshandle, ref str_mythes_meaningentry astr_mythes_mentry[], string as_word);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_MyThes_lookup()
//
// PURPOSE:    Give synonyms for each meaning of a word.
//
// ARGUMENTS:  [long] al_mytheshandle. Handle of MyThes object.
//             [ref str_mythes_meaningentry array] astr_mythes_mentry[]. Meaning entry list with synonyms for as_word.
//             [string] as_word. Word to get synonyms for.
//
// RETURN:     [long]. One of the following values:
//             - Total number of synonyms in list astr_mythes_mentry[].
//             - MYTH_HANDLEOUTOFRANGE.
//             - MYTH_HANDLEINVALID.
//
// EXAMPLE:    str_mythes_meaningentry lstr_meaninglist[]
//             long ll_n, ll_mytheshandle
//             ll_mytheshandle = of_MyThes_create('F:\Data\Dicts\th_en_US.idx', 'F:\Data\Dicts\th_en_US.dat')
//             ll_n = of_MyThes_lookup(ll_mytheshandle, lstr_meaninglist[], 'base')
//
//             OUTPUT:
//             lstr_meaninglist[1].defn '(adj) basal'
//             lstr_meaninglist[1].syncount 2
//             lstr_meaninglist[1].synlist[1] 'basal'
//             lstr_meaninglist[1].synlist[2] 'basic'
//             lstr_meaninglist[2].defn '(adj) dishonorable'
//             lstr_meaninglist[2].syncount 5
//             lstr_meaninglist[2].synlist[1] 'dishonorable'
//             lstr_meaninglist[2].synlist[2] 'dishonourable'
//             lstr_meaninglist[2].synlist[3] 'immoral'
//             lstr_meaninglist[2].synlist[4] 'unethical'
//             lstr_meaninglist[2].synlist[5] 'wrong'
//             lstr_meaninglist[3].defn '(adj) inferior'
//             lstr_meaninglist[3].syncount 1
//             lstr_meaninglist[3].synlist[1] 'inferior'
//             lstr_meaninglist[4].defn '(noun) alkali'
//             lstr_meaninglist[4].syncount 3
//             lstr_meaninglist[4].synlist[1] 'alkali'
//             lstr_meaninglist[4].synlist[2] 'compound'
//             lstr_meaninglist[4].synlist[3] 'chemical compound'
//             lstr_meaninglist[5].defn '(noun) foundation'
//             lstr_meaninglist[5].syncount 7
//             lstr_meaninglist[5].synlist[1] 'foundation'
//             lstr_meaninglist[5].synlist[2] 'fundament'
//             lstr_meaninglist[5].synlist[3] 'foot'
//             lstr_meaninglist[5].synlist[4] 'groundwork'
//             lstr_meaninglist[5].synlist[5] 'substructure'
//             lstr_meaninglist[5].synlist[6] 'understructure'
//             lstr_meaninglist[5].synlist[7] 'support'
//             lstr_meaninglist[6].defn '(noun) part'
//             lstr_meaninglist[6].syncount 2
//             lstr_meaninglist[6].synlist[1] 'part'
//             lstr_meaninglist[6].synlist[2] 'piece'
//             lstr_meaninglist[7].defn '(verb) establish'
//             lstr_meaninglist[7].syncount 3
//             lstr_meaninglist[7].synlist[1] 'establish'
//             lstr_meaninglist[7].synlist[2] 'ground'
//             lstr_meaninglist[7].synlist[3] 'found'
//             lstr_meaninglist[8].defn '(verb) station'
//             lstr_meaninglist[8].syncount 6
//             lstr_meaninglist[8].synlist[1] 'station'
//             lstr_meaninglist[8].synlist[2] 'post'
//             lstr_meaninglist[8].synlist[3] 'send'
//             lstr_meaninglist[8].synlist[4] 'place'
//             lstr_meaninglist[8].synlist[5] 'move'
//             lstr_meaninglist[8].synlist[6] 'displace'
//             ll_n 29
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-02-03  Davros       Initial coding.
// 2018-06-10  Davros       Encode input and output strings.
// -----------------------------------------------------------------------------

long ll_ret, ll_ndx, ll_ndy, ll_n1, ll_n2
string ls_val, ls_defn, ls_synonyms[], ls_word, ls_th_encoding
long ll_mentryhandle, ll_pos, ll_syncount
long ll_nummeanings, ll_maxmeanings, ll_numsyns
str_mythes_meaningentry lstr_mythes_mentry[], lstr_mythes_mentry_empty[]

astr_mythes_mentry[] = lstr_mythes_mentry_empty[]
ll_ret = 0

// Get handle of meaning entry array.
ls_th_encoding = of_MyThes_get_th_encoding(al_mytheshandle)
ls_word = of_PBHunspell_encode_dll_input(as_word, ls_th_encoding)
ll_mentryhandle = MyThes_lookup_H(al_mytheshandle, ls_word, ll_nummeanings)
if ll_mentryhandle < 0 then
	// Error.
	ll_ret = ll_mentryhandle
else
	// Get maximum number of meaning entries to retrieve.
	ll_maxmeanings = Min(ll_nummeanings, il_myth_maxmeaningentry)

	for ll_ndx = 1 to ll_maxmeanings
		// Allocate memory for individual meaning entry.
		ls_defn = Space(il_myth_maxwordlen)
		for ll_ndy = 1 to il_myth_maxsynonym
			ls_synonyms[ll_ndy] = Space(il_myth_maxwordlen)
		next
		
		// Retrieve meaning entry.
		ll_pos = ll_ndx - 1
		ll_numsyns = MyThes_lookup_read_H(ll_mentryhandle, ll_pos, ls_defn, ls_synonyms[], il_myth_maxsynonym, il_myth_maxwordlen)
		if ll_numsyns < 0 then
			// Error.
			ll_ret = ll_numsyns
			exit
		elseif ll_numsyns > 0 then
			ll_ret += ll_numsyns
			// Add meaning entry to output list returned by this fucntion.
			ll_n1 = UpperBound(lstr_mythes_mentry[]) + 1
			ls_val = of_PBHunspell_encode_dll_output(ls_defn, ls_th_encoding)
			lstr_mythes_mentry[ll_n1].defn = ls_val
			lstr_mythes_mentry[ll_n1].syncount = ll_numsyns
			for ll_ndy = 1 to UpperBound(ls_synonyms[])
				ls_val = Trim(ls_synonyms[ll_ndy])
				if Len(ls_val) > 0 then
					ls_val = of_PBHunspell_encode_dll_output(ls_val, ls_th_encoding)
					ll_n2 = UpperBound(lstr_mythes_mentry[ll_n1].synlist[]) + 1
					lstr_mythes_mentry[ll_n1].synlist[ll_n2] = ls_val
				end if
			next
		end if
	next
	// Free memory for entire meaning entry array.
	MyThes_lookup_free_H(al_mytheshandle, ll_mentryhandle, ll_nummeanings)
end if

choose case ll_ret
case MYTH_HANDLEOUTOFRANGE
	astr_mythes_mentry[] = lstr_mythes_mentry_empty[]
	of_Show_message(IFC_TXT_HANDLEOUTOFRANGE, string(ll_ret), Information!)
case MYTH_HANDLEINVALID
	astr_mythes_mentry[] = lstr_mythes_mentry_empty[]
	of_Show_message(IFC_TXT_HANDLEINVALID, string(ll_ret), Information!)
case else
	astr_mythes_mentry[] = lstr_mythes_mentry[]
end choose

return ll_ret
end function

public function long of_hyphen_create (string as_dicpath);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_Hyphen_create()
//
// PURPOSE:    Create Hyphen spell checking object.
//
// ARGUMENTS:  [string] as_dicpath. path\filename of dictionary file, e.g.
//             'F:\Data\Spell dictionaries\hyph_en_US.dic'.
//
// RETURN:     [long]. One of the following values:
//             - Handle of Hyphen object. In range 0 to HYPH_MAXSIZE - 1.
//             - PBH_FILEEXTENSIONINVALID.
//             - HYPH_MAXSIZEREACHED.
//             - HYPH_DICCANNOTOPEN.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-02-10  Davros       Initial coding.
// -----------------------------------------------------------------------------

long ll_ret
string ls_dicpath

ls_dicpath = as_dicpath

// Check file extension of as_dicpath.
if Lower(Right(ls_dicpath, Len(FILEEXTENSION_DIC))) <> FILEEXTENSION_DIC then
	of_Show_message(IFC_TXT_FILEEXTENSIONINVALID, ls_dicpath, FILEEXTENSION_DIC, Information!)
	return PBH_FILEEXTENSIONINVALID
end if

// Check if file as_dicpath exists.
if not FileExists(ls_dicpath) then
	of_Show_message(IFC_TXT_DICCANNOTOPEN, ls_dicpath, Information!)
	return HYPH_DICCANNOTOPEN
end if

// Create Hyphen object.
ll_ret = Hyphen_create_H(ls_dicpath)

choose case ll_ret
case HYPH_MAXSIZEREACHED
	of_Show_message(IFC_TXT_MAXSIZEREACHED, string(ll_ret), Information!)
case HYPH_DICCANNOTOPEN
	of_Show_message(IFC_TXT_DICCANNOTOPEN, string(ll_ret), Information!)
case 0
	// Save hyphenhandle 0 and initialize dictionary bundle.
	ib_hyphenhandle_0 = true
	istr_hyphbundle_0.dicpath = ls_dicpath
case 1 to HYPH_MAXSIZE
	// Save hyphenhandle 1 to HYPH_MAXSIZE and initialize dictionary bundle.
	ib_hyphenhandle_1-n[ll_ret] = true
	istr_hyphbundle_1-n[ll_ret].dicpath = ls_dicpath
end choose

return ll_ret
end function

public subroutine of_hyphen_destroy (long al_hyphenhandle);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_Hyphen_destroy()
//
// PURPOSE:    Destroy Hyphen spell checking object.
//
// ARGUMENTS:  [long] al_hyphenhandle. Handle of Hyphen object to destroy.
//
// RETURN:     None.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-02-10  Davros       Initial coding.
// -----------------------------------------------------------------------------

str_hyphen_filebundle lstr_bundle

choose case al_hyphenhandle
case 0
	// Reset bundle of hyphenhandle 0.
	istr_hyphbundle_0 = lstr_bundle
	
	// Remove and destroy hyphenhandle 0.
	if ib_hyphenhandle_0 then
		ib_hyphenhandle_0 = false
		Hyphen_destroy_H(al_hyphenhandle)
	end if
case 1 to HYPH_MAXSIZE
	// Reset bundle of hyphenhandle 1 to HYPH_MAXSIZE.
	if UpperBound(istr_hyphbundle_1-n[]) >= al_hyphenhandle then
		istr_hyphbundle_1-n[al_hyphenhandle] = lstr_bundle
	end if

	// Remove and destroy hyphenhandle 1 to HYPH_MAXSIZE.
	if UpperBound(ib_hyphenhandle_1-n[]) >= al_hyphenhandle then
		if ib_hyphenhandle_1-n[al_hyphenhandle] then
			ib_hyphenhandle_1-n[al_hyphenhandle] = false
			Hyphen_destroy_H(al_hyphenhandle)
		end if
	end if
end choose


end subroutine

public subroutine of_hyphen_destroy_all ();// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_Hyphen_destroy_all()
//
// PURPOSE:    Destroy all instantiated Hyphen spell checking objects.
//
// ARGUMENTS:  None.
//
// RETURN:     None.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-02-10  Davros       Initial coding.
// -----------------------------------------------------------------------------

boolean lb_hyphenhandle_0, lb_hyphenhandle_1-n[]
str_hyphen_filebundle lstr_hyphbundle_0, lstr_hyphbundle_1-n[]

Hyphen_destroy_all_H()

// Handle 0.
ib_hyphenhandle_0 = lb_hyphenhandle_0
istr_hyphbundle_0 = lstr_hyphbundle_0

// Handles 1 to HYPH_MAXSIZE.
ib_hyphenhandle_1-n[] = lb_hyphenhandle_1-n[]
istr_hyphbundle_1-n[] = lstr_hyphbundle_1-n[]


end subroutine

public function string of_hyphen_get_dic_encoding (long al_hyphenhandle);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_Hyphen_get_dic_encoding()
//
// PURPOSE:    Get hyphenation encoding. Value is first line of loaded .dic file,
//             e.g. "ISO8859-1".
//
// ARGUMENTS:  [long] al_hyphenhandle. Handle of Hyphen object.
//
// RETURN:     [string]. One of the following values:
//             - <empty> (error because of HYPH_HANDLEOUTOFRANGE or HYPH_HANDLEINVALID).
//             - character encoding.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-02-10  Davros       Initial coding.
// -----------------------------------------------------------------------------

string ls_ret

ls_ret = Hyphen_get_dic_encoding_H(al_hyphenhandle)

if ls_ret = "" then
	of_Show_message(IFC_TXT_DICENCODINGNOTOBTAINED, "", Information!)
end if

return ls_ret
end function

public function long of_hyphen_hyphenate (long al_hyphenhandle, string as_word, ref string as_hyphword, long al_lhmin, long al_rhmin, long al_clhmin, long al_crhmin);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_Hyphen_hyphenate()
//
// PURPOSE:    Hyphenate word.
//
// ARGUMENTS:  [long] al_hyphenhandle. Handle of Hyphen object.
//             [string] as_word. Word to hyphenate.
//             [ref string] as_hyphword. Word signed with = hyphens.
//             [long] al_lhmin. Minimum hyphen distance from the left side of as_word.
//             [long] al_rhmin. Minimum hyphen distance from the right side of as_word.
//             [long] al_clhmin. Minimum hyphen distance from the left compound boundary of as_word.
//             [long] al_crhmin. Minimum hyphen distance from the right compound boundary of as_word.
//
// RETURN:     [long]. One of the following values:
//             - 0 (Hyphenation of word was successful).
//             - 1 (Hyphenation of word failed).
//             - HYPH_HANDLEOUTOFRANGE.
//             - HYPH_HANDLEINVALID.
//
// EXAMPLE:    long ll_ret, ll_hyphenhandle
//             string ls_hyphword
//             ll_hyphenhandle = of_Hyphen_create('F:\Data\Dicts\hyph_en_US.dic')
//             ll_ret = of_Hyphen_hyphenate(ll_hyphenhandle, 'nondenominational', ls_hyphword, 0, 0, 0, 0)
//
//             OUTPUT:
//             ls_hyphword 'non=de=no=mi=na=ti=o=nal'
//             ll_ret 0
//
//             ll_ret = of_Hyphen_hyphenate(ll_hyphenhandle, 'nondenominational', ls_hyphword, 4, 7, 0, 0)
//
//             OUTPUT:
//             ls_hyphword 'nonde=no=mi=national'
//             ll_ret 0
//
//             ll_ret = of_Hyphen_hyphenate(ll_hyphenhandle, 'nondenominational', ls_hyphword, 0, 0, 8, 0)
//
//             OUTPUT:
//             ls_hyphword 'non=de=no=mi=na=tional'
//             ll_ret 0
//
//             ll_ret = of_Hyphen_hyphenate(ll_hyphenhandle, 'nondenominational', ls_hyphword, 0, 0, 0, 8)
//
//             OUTPUT:
//             ls_hyphword 'non=denomina=ti=o=nal'
//             ll_ret 0
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-02-10  Davros       Initial coding.
// 2018-06-10  Davros       Encode input and output strings.
// -----------------------------------------------------------------------------

long ll_ret, ll_wordlen
string ls_hyphword, ls_val, ls_word, ls_dic_encoding

as_hyphword = ls_hyphword
ll_wordlen = Len(as_word)

// Check maximum word length.
if ll_wordlen > il_hyph_maxwordlen then
	of_Show_message(IFC_TXT_WORDMAXSIZEREACHED, as_word, string(il_hyph_maxwordlen), Information!)
	return 1
end if

// Allocate memory for output value.
ls_hyphword = Space(ll_wordlen * 2)

ls_dic_encoding = of_Hyphen_get_dic_encoding(al_hyphenhandle)
ls_word = of_PBHunspell_encode_dll_input(as_word, ls_dic_encoding)
ll_ret = Hyphen_hyphenate_H(al_hyphenhandle, ls_word, ll_wordlen, ls_hyphword, al_lhmin, al_rhmin, al_clhmin, al_crhmin)

choose case ll_ret
case HYPH_HANDLEOUTOFRANGE
	of_Show_message(IFC_TXT_HANDLEOUTOFRANGE, string(ll_ret), Information!)
case HYPH_HANDLEINVALID
	of_Show_message(IFC_TXT_HANDLEINVALID, string(ll_ret), Information!)
case 1
	of_Show_message(IFC_TXT_HYPHENATIONERROR, string(ll_ret), Information!)
case 0
	ls_val = of_PBHunspell_encode_dll_output(ls_hyphword, ls_dic_encoding)
	as_hyphword = ls_val
end choose

return ll_ret
end function

public function boolean of_hunspell_is_dic_loaded (long al_hunhandle, string as_dicpath);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_Hunspell_is_dic_loaded()
//
// PURPOSE:    Report if dictionary file is loaded for al_hunhandle (true) or not (false).
//
// ARGUMENTS:  [long] al_hunhandle. Handle of Hunspell object.
//             [string] as_dicpath. path\filename of dictionary file, e.g.
//             'F:\Data\Spell dictionaries\medical_en_US.dic'
//
// RETURN:     [boolean].
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2017-12-31  Davros       Initial coding.
// -----------------------------------------------------------------------------

boolean lb_loaded
long ll_ndx
string ls_path1, ls_path2

lb_loaded = false
ls_path1 = Lower(as_dicpath)

// Check file extension of as_dicpath.
if Right(ls_path1, Len(FILEEXTENSION_DIC)) <> FILEEXTENSION_DIC then
	of_Show_message(IFC_TXT_FILEEXTENSIONINVALID, ls_path1, FILEEXTENSION_DIC, Information!)
	return lb_loaded
end if

choose case al_hunhandle
case 0
	// Hunhandle 0.
	for ll_ndx = 1 to UpperBound(istr_hunbundle_0.dicpath[])
		ls_path2 = Lower(istr_hunbundle_0.dicpath[ll_ndx])
		if ls_path1 = ls_path2 then
			lb_loaded = true
			exit
		end if
	next
case 1 to HUNH_MAXSIZE
	// Hunhandle 1 to HUNH_MAXSIZE.
	if UpperBound(istr_hunbundle_1-n[]) >= al_hunhandle then
		for ll_ndx = 1 to UpperBound(istr_hunbundle_1-n[al_hunhandle].dicpath[])
			ls_path2 = Lower(istr_hunbundle_1-n[al_hunhandle].dicpath[ll_ndx])
			if ls_path1 = ls_path2 then
				lb_loaded = true
				exit
			end if
		next
	end if
end choose

return lb_loaded
end function

public function boolean of_hyphen_is_dic_loaded (long al_hyphenhandle, string as_dicpath);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_Hyphen_is_dic_loaded()
//
// PURPOSE:    Report if dictionary file is loaded for al_hyphenhandle (true) or not (false).
//
// ARGUMENTS:  [long] al_hyphenhandle. Handle of Hyphen object.
//             [string] as_dicpath. path\filename of dictionary file, e.g.
//             'F:\Data\Spell dictionaries\hyph_medical_en_US.dic'
//
// RETURN:     [boolean].
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-02-15  Davros       Initial coding.
// -----------------------------------------------------------------------------

boolean lb_loaded
long ll_ndx
string ls_path1, ls_path2

lb_loaded = false
ls_path1 = Lower(as_dicpath)

// Check file extension of as_dicpath.
if Right(ls_path1, Len(FILEEXTENSION_DIC)) <> FILEEXTENSION_DIC then
	of_Show_message(IFC_TXT_FILEEXTENSIONINVALID, ls_path1, FILEEXTENSION_DIC, Information!)
	return lb_loaded
end if

choose case al_hyphenhandle
case 0
	// Hyphenhandle 0.
	ls_path2 = Lower(istr_hyphbundle_0.dicpath)
	if ls_path1 = ls_path2 then
		lb_loaded = true
	end if
case 1 to HYPH_MAXSIZE
	// Hyphenhandle 1 to HYPH_MAXSIZE.
	if UpperBound(istr_hyphbundle_1-n[]) >= al_hyphenhandle then
		ls_path2 = Lower(istr_hyphbundle_1-n[al_hyphenhandle].dicpath)
		if ls_path1 = ls_path2 then
			lb_loaded = true
		end if
	end if
end choose

return lb_loaded
end function

public function boolean of_hunspell_is_aff_loaded (long al_hunhandle, string as_affpath);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_Hunspell_is_aff_loaded()
//
// PURPOSE:    Report if affix file is loaded for al_hunhandle (true) or not (false).
//
// ARGUMENTS:  [long] al_hunhandle. Handle of Hunspell object.
//             [string] as_affpath. path\filename of affix file, e.g.
//             'F:\Data\Spell dictionaries\medical_en_US.aff'
//
// RETURN:     [boolean].
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-02-15  Davros       Initial coding.
// -----------------------------------------------------------------------------

boolean lb_loaded
long ll_ndx
string ls_path1, ls_path2

lb_loaded = false
ls_path1 = Lower(as_affpath)

// Check file extension of as_affpath.
if Right(ls_path1, Len(FILEEXTENSION_AFF)) <> FILEEXTENSION_AFF then
	of_Show_message(IFC_TXT_FILEEXTENSIONINVALID, ls_path1, FILEEXTENSION_AFF, Information!)
	return lb_loaded
end if

choose case al_hunhandle
case 0
	// Hunhandle 0.
	ls_path2 = Lower(istr_hunbundle_0.affpath)
	if ls_path1 = ls_path2 then
		lb_loaded = true
	end if
case 1 to HUNH_MAXSIZE
	// Hunhandle 1 to HUNH_MAXSIZE.
	if UpperBound(istr_hunbundle_1-n[]) >= al_hunhandle then
		ls_path2 = Lower(istr_hunbundle_1-n[al_hunhandle].affpath)
		if ls_path1 = ls_path2 then
			lb_loaded = true
		end if
	end if
end choose

return lb_loaded
end function

public function boolean of_mythes_is_idx_loaded (long al_mytheshandle, string as_idxpath);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_MyThes_is_idx_loaded()
//
// PURPOSE:    Report if index file is loaded for al_mytheshandle (true) or not (false).
//
// ARGUMENTS:  [long] al_mytheshandle. Handle of MyThes object.
//             [string] as_idxpath. path\filename of index file, e.g.
//             'F:\Data\Spell dictionaries\th_medical_en_US.idx'
//
// RETURN:     [boolean].
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-02-15  Davros       Initial coding.
// -----------------------------------------------------------------------------

boolean lb_loaded
long ll_ndx
string ls_path1, ls_path2

lb_loaded = false
ls_path1 = Lower(as_idxpath)

// Check file extension of as_idxpath.
if Right(ls_path1, Len(FILEEXTENSION_IDX)) <> FILEEXTENSION_IDX then
	of_Show_message(IFC_TXT_FILEEXTENSIONINVALID, ls_path1, FILEEXTENSION_IDX, Information!)
	return lb_loaded
end if

choose case al_mytheshandle
case 0
	// MyTheshandle 0.
	ls_path2 = Lower(istr_mythbundle_0.idxpath)
	if ls_path1 = ls_path2 then
		lb_loaded = true
	end if
case 1 to MYTH_MAXSIZE
	// MyTheshandle 1 to MYTH_MAXSIZE.
	if UpperBound(istr_mythbundle_1-n[]) >= al_mytheshandle then
		ls_path2 = Lower(istr_mythbundle_1-n[al_mytheshandle].idxpath)
		if ls_path1 = ls_path2 then
			lb_loaded = true
		end if
	end if
end choose

return lb_loaded
end function

public function boolean of_mythes_is_dat_loaded (long al_mytheshandle, string as_datpath);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_MyThes_is_dat_loaded()
//
// PURPOSE:    Report if data file is loaded for al_mytheshandle (true) or not (false).
//
// ARGUMENTS:  [long] al_mytheshandle. Handle of MyThes object.
//             [string] as_datpath. path\filename of data file, e.g.
//             'F:\Data\Spell dictionaries\th_medical_en_US.dat'
//
// RETURN:     [boolean].
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-02-15  Davros       Initial coding.
// -----------------------------------------------------------------------------

boolean lb_loaded
long ll_ndx
string ls_path1, ls_path2

lb_loaded = false
ls_path1 = Lower(as_datpath)

// Check file extension of as_datpath.
if Right(ls_path1, Len(FILEEXTENSION_DAT)) <> FILEEXTENSION_DAT then
	of_Show_message(IFC_TXT_FILEEXTENSIONINVALID, ls_path1, FILEEXTENSION_DAT, Information!)
	return lb_loaded
end if

choose case al_mytheshandle
case 0
	// MyTheshandle 0.
	ls_path2 = Lower(istr_mythbundle_0.datpath)
	if ls_path1 = ls_path2 then
		lb_loaded = true
	end if
case 1 to MYTH_MAXSIZE
	// MyTheshandle 1 to MYTH_MAXSIZE.
	if UpperBound(istr_mythbundle_1-n[]) >= al_mytheshandle then
		ls_path2 = Lower(istr_mythbundle_1-n[al_mytheshandle].datpath)
		if ls_path1 = ls_path2 then
			lb_loaded = true
		end if
	end if
end choose

return lb_loaded
end function

public function boolean of_hunspell_is_valid (long al_hunhandle);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_Hunspell_is_valid()
//
// PURPOSE:    Report if al_hunhandle points to an instantiated Hunspell object.
//
// ARGUMENTS:  [long] al_hunhandle. Handle of Hunspell object.
//
// RETURN:     [boolean].
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2017-12-31  Davros       Initial coding.
// -----------------------------------------------------------------------------

boolean lb_valid

lb_valid = false

choose case al_hunhandle
case 0
	lb_valid = ib_hunhandle_0
case 1 to HUNH_MAXSIZE
	if UpperBound(ib_hunhandle_1-n[]) >= al_hunhandle then
		lb_valid = ib_hunhandle_1-n[al_hunhandle]
	end if
end choose

return lb_valid
end function

public function boolean of_hyphen_is_valid (long al_hyphenhandle);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_Hyphen_is_valid()
//
// PURPOSE:    Report if al_hyphenhandle points to an instantiated Hyphen object.
//
// ARGUMENTS:  [long] al_hyphenhandle. Handle of Hyphen object.
//
// RETURN:     [boolean].
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-02-15  Davros       Initial coding.
// -----------------------------------------------------------------------------

boolean lb_valid

lb_valid = false

choose case al_hyphenhandle
case 0
	lb_valid = ib_hyphenhandle_0
case 1 to HYPH_MAXSIZE
	if UpperBound(ib_hyphenhandle_1-n[]) >= al_hyphenhandle then
		lb_valid = ib_hyphenhandle_1-n[al_hyphenhandle]
	end if
end choose

return lb_valid
end function

public function boolean of_mythes_is_valid (long al_mytheshandle);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_MyThes_is_valid()
//
// PURPOSE:    Report if al_mytheshandle points to an instantiated MyThes object.
//
// ARGUMENTS:  [long] al_mytheshandle. Handle of MyThes object.
//
// RETURN:     [boolean].
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-02-15  Davros       Initial coding.
// -----------------------------------------------------------------------------

boolean lb_valid

lb_valid = false

choose case al_mytheshandle
case 0
	lb_valid = ib_mytheshandle_0
case 1 to MYTH_MAXSIZE
	if UpperBound(ib_mytheshandle_1-n[]) >= al_mytheshandle then
		lb_valid = ib_mytheshandle_1-n[al_mytheshandle]
	end if
end choose

return lb_valid
end function

public function str_hunspell_filebundle of_hunspell_get_file_bundle (long al_hunhandle);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_Hunspell_get_file_bundle()
//
// PURPOSE:    Get the loaded file bundle for al_hunhandle.
//
// ARGUMENTS:  [long] al_hunhandle. Handle of Hunspell object.
//
// RETURN:     [str_hunspell_filebundle]. Example:
//
//               str_hunspell_filebundle.affpath 'F:\Data\Spell dictionaries\en_US.aff'
//               str_hunspell_filebundle.dicpath[1] 'F:\Data\Spell dictionaries\en_US.dic'
//               str_hunspell_filebundle.dicpath[2] 'F:\Data\Spell dictionaries\medical_en_US.dic'
//               str_hunspell_filebundle.dicpath[3] 'F:\Data\Spell dictionaries\healthcare_en_GB.dic'
//
//             An empty structure is returned if al_hunhandle is invalid, affpath 
//             is empty or all dicpaths are empty.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2017-12-31  Davros       Initial coding.
// -----------------------------------------------------------------------------

str_hunspell_filebundle lstr_bundle
long ll_ndx

choose case al_hunhandle
case 0
	// Hunhandle 0.
	if of_Hunspell_is_valid(al_hunhandle) then
		if istr_hunbundle_0.affpath <> "" then
			for ll_ndx = 1 to UpperBound(istr_hunbundle_0.dicpath[])
				if istr_hunbundle_0.dicpath[ll_ndx] <> "" then
					lstr_bundle = istr_hunbundle_0
					exit
				end if
			next
		end if
	end if
case 1 to HUNH_MAXSIZE
	// Hunhandle 1 to HUNH_MAXSIZE.
	if UpperBound(istr_hunbundle_1-n[]) >= al_hunhandle then
		if of_Hunspell_is_valid(al_hunhandle) then
			if istr_hunbundle_1-n[al_hunhandle].affpath <> "" then
				for ll_ndx = 1 to UpperBound(istr_hunbundle_1-n[al_hunhandle].dicpath[])
					if istr_hunbundle_1-n[al_hunhandle].dicpath[ll_ndx] <> "" then
						lstr_bundle = istr_hunbundle_1-n[al_hunhandle]
						exit
					end if
				next
			end if
		end if
	end if
end choose

return lstr_bundle

end function

public function str_hyphen_filebundle of_hyphen_get_file_bundle (long al_hyphenhandle);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_Hyphen_get_file_bundle()
//
// PURPOSE:    Get the loaded file bundle for al_hyphenhandle.
//
// ARGUMENTS:  [long] al_hyphenhandle. Handle of Hyphen object.
//
// RETURN:     [str_hyphen_filebundle]. Example:
//
//               str_hyphen_filebundle.dicpath 'F:\Data\Spell dictionaries\hyph_en_US.dic'
//
//             An empty structure is returned if al_hyphenhandle is invalid or dicpath 
//             is empty.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-02-15  Davros       Initial coding.
// -----------------------------------------------------------------------------

str_hyphen_filebundle lstr_bundle

choose case al_hyphenhandle
case 0
	// Hyphenhandle 0.
	if of_Hyphen_is_valid(al_hyphenhandle) then
		if istr_hyphbundle_0.dicpath <> "" then
			lstr_bundle = istr_hyphbundle_0
		end if
	end if
case 1 to HYPH_MAXSIZE
	// Hyphhandle 1 to HYPH_MAXSIZE.
	if UpperBound(istr_hyphbundle_1-n[]) >= al_hyphenhandle then
		if of_Hyphen_is_valid(al_hyphenhandle) then
			if istr_hyphbundle_1-n[al_hyphenhandle].dicpath <> "" then
				lstr_bundle = istr_hyphbundle_1-n[al_hyphenhandle]
			end if
		end if
	end if
end choose

return lstr_bundle

end function

public function str_mythes_filebundle of_mythes_get_file_bundle (long al_mytheshandle);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_MyThes_get_file_bundle()
//
// PURPOSE:    Get the loaded file bundle for al_mytheshandle.
//
// ARGUMENTS:  [long] al_mytheshandle. Handle of MyThes object.
//
// RETURN:     [str_mythes_filebundle]. Example:
//
//               str_mythes_filebundle.idxpath 'F:\Data\Spell dictionaries\th_en_US.idx'
//               str_mythes_filebundle.datpath 'F:\Data\Spell dictionaries\th_en_US.dat'
//
//             An empty structure is returned if al_mytheshandle is invalid, idxpath 
//             is empty or datpath is empty.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-02-15  Davros       Initial coding.
// -----------------------------------------------------------------------------

str_mythes_filebundle lstr_bundle

choose case al_mytheshandle
case 0
	// MyTheshandle 0.
	if of_MyThes_is_valid(al_mytheshandle) then
		if istr_mythbundle_0.idxpath <> "" then
			if istr_mythbundle_0.datpath <> "" then
				lstr_bundle = istr_mythbundle_0
			end if
		end if
	end if
case 1 to MYTH_MAXSIZE
	// MyTheshandle 1 to MYTH_MAXSIZE.
	if UpperBound(istr_mythbundle_1-n[]) >= al_mytheshandle then
		if of_MyThes_is_valid(al_mytheshandle) then
			if istr_mythbundle_1-n[al_mytheshandle].idxpath <> "" then
				if istr_mythbundle_1-n[al_mytheshandle].datpath <> "" then
					lstr_bundle = istr_mythbundle_1-n[al_mytheshandle]
				end if
			end if
		end if
	end if
end choose

return lstr_bundle

end function

public function long of_hyphen_hyphenate_ext (long al_hyphenhandle, string as_word, ref string as_hyphword, long al_lhmin, long al_rhmin, long al_clhmin, long al_crhmin, ref str_hyphen_ext astr_hyphen_ext);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_Hyphen_hyphenate_ext()
//
// PURPOSE:    Hyphenate word and fill extended attributes in case of non-standard hyphenation.
//
// ARGUMENTS:  [long] al_hyphenhandle. Handle of Hyphen object.
//             [string] as_word. Word to hyphenate.
//             [ref string] as_hyphword. Word signed with = hyphens.
//             [long] al_lhmin. Minimum hyphen distance from the left side of as_word.
//             [long] al_rhmin. Minimum hyphen distance from the right side of as_word.
//             [long] al_clhmin. Minimum hyphen distance from the left compound boundary of as_word.
//             [long] al_crhmin. Minimum hyphen distance from the right compound boundary of as_word.
//             [ref str_hyphen_ext] astr_hyphen_ext. Extended output values filled only in case of
//             non-standard hyphenation.
//
// RETURN:     [long]. One of the following values:
//             - 0 (Hyphenation of word was successful).
//             - 1 (Hyphenation of word failed).
//             - HYPH_HANDLEOUTOFRANGE.
//             - HYPH_HANDLEINVALID.
//
// EXAMPLE:    long ll_ret, ll_hyphenhandle, ll_pos[], ll_cut[]
//             string ls_hyphword, ls_hyphens, ls_rep[]
//             ll_hyphenhandle = of_Hyphen_create('F:\Data\Dicts\hyph_nl_NL.dic')
//             ll_ret = of_Hyphen_hyphenate_ext(ll_hyphenhandle, 'omaatje', ls_hyphword, 0, 0, 0, 0, &
//                 ls_hyphens, ls_rep[], ll_pos[], ll_cut[])
//
//             NON-STANDARD PATTERN DEFINED IN 'F:\Data\Dicts\hyph_nl_NL.dic'
//             ISO8859-1
//             a1atje./a=t,1,3
//
//             OUTPUT:
//             ls_hyphword 'oma=tje' (standard hyphenation would be 'omaa=tje')
//             ls_hyphens '0010000'
//             ls_rep[1] ''
//             ls_rep[2] ''
//             ls_rep[3] 'a=t'
//             ls_rep[4] ''
//             ls_rep[5] ''
//             ls_rep[6] ''
//             ls_rep[7] ''
//             ll_pos[1] 0
//             ll_pos[2] 0
//             ll_pos[3] 1
//             ll_pos[4] 0
//             ll_pos[5] 0
//             ll_pos[6] 0
//             ll_pos[7] 0
//             ll_cut[1] 0
//             ll_cut[2] 0
//             ll_cut[3] 3
//             ll_cut[4] 0
//             ll_cut[5] 0
//             ll_cut[6] 0
//             ll_cut[7] 0
//             ll_ret 0
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-02-17  Davros       Initial coding.
// 2018-06-10  Davros       Encode input and output strings.
// -----------------------------------------------------------------------------

long ll_ret, ll_wordlen, ll_pos[], ll_cut[], ll_ndx
string ls_hyphword, ls_hyphens, ls_rep[], ls_word, ls_val, ls_dic_encoding
str_hyphen_ext lstr_hyphen_ext

as_hyphword = ls_hyphword
astr_hyphen_ext = lstr_hyphen_ext
ll_wordlen = Len(as_word)

// Check maximum word length.
if ll_wordlen > il_hyph_maxwordlen then
	of_Show_message(IFC_TXT_WORDMAXSIZEREACHED, as_word, string(il_hyph_maxwordlen), Information!)
	return 1
end if

// Allocate memory for output values.
ls_hyphword = Space(ll_wordlen * 2)
ls_hyphens = Space(ll_wordlen + 5)
for ll_ndx = 1 to ll_wordlen
	ls_rep[ll_ndx] = Space(ll_wordlen)
	ll_pos[ll_ndx] = 0
	ll_cut[ll_ndx] = 0
next

ls_dic_encoding = of_Hyphen_get_dic_encoding(al_hyphenhandle)
ls_word = of_PBHunspell_encode_dll_input(as_word, ls_dic_encoding)
ll_ret = Hyphen_hyphenate_ext_H(al_hyphenhandle, ls_word, ll_wordlen, ls_hyphword, al_lhmin, al_rhmin, al_clhmin, al_crhmin, &
           ls_hyphens, ls_rep[], ll_pos[], ll_cut[])

choose case ll_ret
case HYPH_HANDLEOUTOFRANGE
	of_Show_message(IFC_TXT_HANDLEOUTOFRANGE, string(ll_ret), Information!)
case HYPH_HANDLEINVALID
	of_Show_message(IFC_TXT_HANDLEINVALID, string(ll_ret), Information!)
case 1
	of_Show_message(IFC_TXT_HYPHENATIONERROR, string(ll_ret), Information!)
case 0
	ls_val = of_PBHunspell_encode_dll_output(ls_hyphword, ls_dic_encoding)
	as_hyphword = ls_val
	ls_val = of_PBHunspell_encode_dll_output(ls_hyphens, ls_dic_encoding)
	astr_hyphen_ext.hyphens = ls_val
	for ll_ndx = 1 to UpperBound(ls_rep[])
		ls_val = Trim(ls_rep[ll_ndx])
		ls_val = of_PBHunspell_encode_dll_output(ls_val, ls_dic_encoding)
		astr_hyphen_ext.rep[ll_ndx] = ls_val
	next
	for ll_ndx = 1 to UpperBound(ll_pos[])
		astr_hyphen_ext.pos[ll_ndx] = ll_pos[ll_ndx]
	next
	for ll_ndx = 1 to UpperBound(ll_cut[])
		astr_hyphen_ext.cut[ll_ndx] = ll_cut[ll_ndx]
	next
end choose

return ll_ret
end function

public function long of_pbhunspell_get_version (ref str_pbhunspell_version astr_pbhunspell_version[]);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_PBHunspell_get_version()
//
// PURPOSE:    Get .dll version info of PBHunspell, Hunspell, Hyphen (LibHnj) and MyThes.
//
// ARGUMENTS:  [ref str_pbhunspell_version array] astr_pbhunspell_version[]. Version info.
//
// RETURN:     Long. SUCCESS or FAILURE.
//
// EXAMPLE:    str_pbhunspell_version lstr_pbhunspell_version[]
//             of_PBHunspell_get_version(lstr_pbhunspell_version[])
//
//             OUTPUT:
//             lstr_pbhunspell_version[1].libname 'PBHunspell'
//             lstr_pbhunspell_version[1].major '1'
//             lstr_pbhunspell_version[1].minor '0'
//             lstr_pbhunspell_version[1].revision '0'
//             lstr_pbhunspell_version[1].date '2018-02-28'
//             lstr_pbhunspell_version[2].libname 'Hunspell'
//             lstr_pbhunspell_version[2].major '1'
//             lstr_pbhunspell_version[2].minor '6'
//             lstr_pbhunspell_version[2].revision '2'
//             lstr_pbhunspell_version[2].date '2018-01-01'
//             lstr_pbhunspell_version[3].libname 'Hyphen'
//             lstr_pbhunspell_version[3].major ''
//             lstr_pbhunspell_version[3].minor ''
//             lstr_pbhunspell_version[3].revision ''
//             lstr_pbhunspell_version[3].date '2017-11-27'
//             lstr_pbhunspell_version[4].libname 'MyThes'
//             lstr_pbhunspell_version[4].major ''
//             lstr_pbhunspell_version[4].minor ''
//             lstr_pbhunspell_version[4].revision ''
//             lstr_pbhunspell_version[4].date '2017-05-27'
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-02-28  Davros       Initial coding.
// -----------------------------------------------------------------------------

string ls_version[], ls_libname[], ls_curlib
string ls_separator, ls_target[], ls_empty[]
long ll_ret, ll_n, ll_ndx, ll_version_parts
str_pbhunspell_version lstr_pbhunspell_version[]

ll_ret = SUCCESS
astr_pbhunspell_version[] = lstr_pbhunspell_version[]
ls_separator = '.'
ll_version_parts = 4
ls_libname[] = {PBH_LIB_PBHH, PBH_LIB_HUNH, PBH_LIB_HYPH, PBH_LIB_MYTH}
for ll_ndx = 1 to UpperBound(ls_libname[])
	ls_version[ll_ndx] = Space(PBH_VERSION_LEN)
next

PBHunspell_get_version_H(ls_version[1], ls_version[2], ls_version[3], ls_version[4])
// Library version string in .dll has format '[major].[minor].[revision].YYYY-MM-DD'.
// Example output:
// ls_version[1] '1.0.0.2018-02-28'
// ls_version[2] '1.6.2.2018-01-01'
// ls_version[3] '...2017-11-27'
// ls_version[4] '...2017-05-27'

for ll_ndx = 1 to UpperBound(ls_version[])
	ls_target[] = ls_empty[]
	ll_n = inv_pbh_service.of_Parse_string_to_array(ls_version[ll_ndx], ls_target[], ls_separator)
	if ll_n <> ll_version_parts then
		of_Show_message(IFC_TXT_LIBVERSIONFORMATINVALID, ls_libname[ll_ndx], Information!)
		return FAILURE
	end if
	lstr_pbhunspell_version[ll_ndx].libname = ls_libname[ll_ndx]
	lstr_pbhunspell_version[ll_ndx].major = Trim(ls_target[1])
	lstr_pbhunspell_version[ll_ndx].minor = Trim(ls_target[2])
	lstr_pbhunspell_version[ll_ndx].revision = Trim(ls_target[3])
	lstr_pbhunspell_version[ll_ndx].date = Date(Trim(ls_target[4]))
next

astr_pbhunspell_version[] = lstr_pbhunspell_version[]

return ll_ret
end function

public function long of_pbhunspell_unspellcheck_rtf_file (string as_finpath, string as_foutpath, long al_markaction, string as_markcolorrgb);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_PBHunspell_unspellcheck_rtf_file()
//
// PURPOSE:    Unhighlight misspelled words of input file.
//
// ARGUMENTS:  [string] as_finpath. path\filename of richtext input file, e.g.
//             'F:\Data\Temp\docmarkin.rtf'.
//             [string] as_foutpath. path\filename of richtext output file, e.g.
//             'F:\Data\Temp\docmarkout.rtf'. If equal to as_finpath the input file will be overwritten.
//             [long] al_markaction. Mark action to perform. Valid values are:
//             - PBHH_MARKBACKGROUNDCOLOR (Unhighlight words that have the specified background color).
//             - PBHH_MARKFOREGROUNDCOLOR (Unhighlight words that have the specified foreground color).
//             [string] as_markcolorrgb. Mark color in rtf color table. Format is "\redN\greenN\blueN",
//             e.g. "\red255\green0\blue1" for color red or "\red255\green255\blue1" for color yellow.
//             This color is reserved for spellchecking and should not be used anywhere else in the document.
// 
// RETURN:     [long]. One of the following values:
//             - 0 (Document was processed successfully).
//             - PBH_FILEEXTENSIONINVALID.
//             - PBHH_FILECANNOTOPEN.
//             - PBHH_RTFFORMATINVALID.
//             - PBHH_RTFNOCOLORTABLE.
//             - PBHH_MARKACTIONUNSUPPORTED.
//
// EXAMPLE:    See of_PBHunspell_spellcheck_rtf_file().
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-03-25  Davros       Initial coding.
// -----------------------------------------------------------------------------

long ll_ret
string ls_finpath, ls_foutpath

ls_finpath = as_finpath
ls_foutpath = as_foutpath

// Check file extension of as_finpath and as_foutpath.
if Lower(Right(ls_finpath, Len(FILEEXTENSION_RTF))) <> FILEEXTENSION_RTF then
	of_Show_message(IFC_TXT_FILEEXTENSIONINVALID, ls_finpath, FILEEXTENSION_RTF, Information!)
	return PBH_FILEEXTENSIONINVALID
end if
if Lower(Right(ls_foutpath, Len(FILEEXTENSION_RTF))) <> FILEEXTENSION_RTF then
	of_Show_message(IFC_TXT_FILEEXTENSIONINVALID, ls_foutpath, FILEEXTENSION_RTF, Information!)
	return PBH_FILEEXTENSIONINVALID
end if

// Check if file as_finpath exists.
if not FileExists(ls_finpath) then
	of_Show_message(IFC_TXT_FILECANNOTOPEN, ls_finpath, Information!)
	return PBHH_FILECANNOTOPEN
end if

ll_ret = PBHunspell_unspellcheck_rtf_file_H(as_finpath, as_foutpath, al_markaction, as_markcolorrgb)

choose case ll_ret
case PBHH_FILECANNOTOPEN
	of_Show_message(IFC_TXT_FILECANNOTOPEN, string(ll_ret), Information!)
case PBHH_RTFFORMATINVALID
	of_Show_message(IFC_TXT_RTFFORMATINVALID, string(ll_ret), Information!)
case PBHH_RTFNOCOLORTABLE
	of_Show_message(IFC_TXT_RTFNOCOLORTABLE, string(ll_ret), Information!)
case PBHH_MARKACTIONUNSUPPORTED
	of_Show_message(IFC_TXT_MARKACTIONUNSUPPORTED, string(ll_ret), Information!)
end choose

return ll_ret
end function

public subroutine of_show_message (integer ai_text_id, string as_parm1, icon aicon_symbol);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_Show_message()
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
// 2017-12-29  Davros       Initial coding.
// -----------------------------------------------------------------------------

string ls_msg

ls_msg = inv_pbh_service.of_Replace_all(is_translations[ai_text_id], '%1', as_parm1)
MessageBox(is_translations[IFC_TXT_MSGBOX_TITLE], ls_msg, aicon_symbol)

end subroutine

public subroutine of_show_message (integer ai_text_id, string as_parm1, string as_parm2, icon aicon_symbol);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_Show_message()
//
// PURPOSE:    Show message to user.
//
// ARGUMENTS:  [integer] ai_text_id. Text identifier. Valid values are the
//             'IFC_TXT_...' constants declared in section 'Declare Instance Variables'.
//             [string] as_parm1. Parameter to substitute placeholder '%1' in message.
//             [string] as_parm2. Parameter to substitute placeholder '%2' in message.
//             [icon] aicon_symbol. Icon to show with the message.
//
// RETURN:     None.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2017-12-31  Davros       Initial coding.
// -----------------------------------------------------------------------------

string ls_msg

ls_msg = inv_pbh_service.of_Replace_all(is_translations[ai_text_id], '%1', as_parm1)
ls_msg = inv_pbh_service.of_Replace_all(ls_msg, '%2', as_parm2)
MessageBox(is_translations[IFC_TXT_MSGBOX_TITLE], ls_msg, aicon_symbol)

end subroutine

public function long of_pbhunspell_spellcheck_rtf_file (long al_hunhandle, string as_finpath, string as_foutpath, long al_markaction, string as_markcolorrgb);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_PBHunspell_spellcheck_rtf_file()
//
// PURPOSE:    Spellcheck rtf input file and highlight the misspelled words.
//
// ARGUMENTS:  [long] al_hunhandle. Handle of Hunspell object.
//             [string] as_finpath. path\filename of richtext input file, e.g.
//             'F:\Data\Temp\docmarkin.rtf'.
//             [string] as_foutpath. path\filename of richtext output file, e.g.
//             'F:\Data\Temp\docmarkout.rtf'. If equal to as_finpath the input file will be overwritten.
//             [long] al_markaction. Mark action to perform. Valid values are:
//             - PBHH_MARKBACKGROUNDCOLOR (Highlight misspelled words with the specified background color).
//             - PBHH_MARKFOREGROUNDCOLOR (Highlight misspelled words with the specified foreground color).
//             [string] as_markcolorrgb. Mark color in rtf color table. Format is "\redN\greenN\blueN",
//             e.g. "\red255\green0\blue1" for color red or "\red255\green255\blue1" for color yellow.
//             This color is reserved for spellchecking and should not be used anywhere else in the document.
//
// RETURN:     [long]. One of the following values:
//             - 0 (Document was processed successfully).
//             - PBH_FILEEXTENSIONINVALID.
//             - HUNH_HANDLEOUTOFRANGE.
//             - HUNH_HANDLEINVALID.
//             - PBHH_FILECANNOTOPEN.
//             - PBHH_RTFFORMATINVALID.
//             - PBHH_RTFNOCOLORTABLE.
//             - PBHH_RTFNOPLAINTEXT.
//             - PBHH_MARKACTIONUNSUPPORTED.
//
// EXAMPLE:    long ll_ret, ll_hunhandle
//             string ls_markcolorrgb, ls_finpath, ls_foutpath
//             ls_finpath = 'F:\Data\Temp\docmarkin.rtf'
//             ls_foutpath = ls_finpath
//             ls_markcolorrgb = "\red255\green255\blue1"
//             ll_hunhandle = of_Hunspell_create('F:\Data\Dicts\en_US.aff', 'F:\Data\Dicts\en_US.dic')
//             // Highlight misspelled words with yellow background color.
//             ll_ret = of_PBHunspell_spellcheck_rtf_file(ll_hunhandle, ls_finpath, &
//               ls_foutpath, PBHH_MARKBACKGROUNDCOLOR, ls_markcolorrgb)
//             ll_ret = of_PBHunspell_unspellcheck_rtf_file(ls_finpath, ls_foutpath, ls_markcolorrgb)
//
//             OUTPUT:
//             ll_ret 0
//
// NOTES:      Works with documents generated by built-in RichTextEdit control of PowerBuilder 12.X
//             (TX Text Control) and PowerBuilder 17.0 (TE Edit control).
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-03-25  Davros       Initial coding.
// -----------------------------------------------------------------------------

long ll_ret
string ls_finpath, ls_foutpath

ls_finpath = as_finpath
ls_foutpath = as_foutpath

// Check file extension of as_finpath and as_foutpath.
if Lower(Right(ls_finpath, Len(FILEEXTENSION_RTF))) <> FILEEXTENSION_RTF then
	of_Show_message(IFC_TXT_FILEEXTENSIONINVALID, ls_finpath, FILEEXTENSION_RTF, Information!)
	return PBH_FILEEXTENSIONINVALID
end if
if Lower(Right(ls_foutpath, Len(FILEEXTENSION_RTF))) <> FILEEXTENSION_RTF then
	of_Show_message(IFC_TXT_FILEEXTENSIONINVALID, ls_foutpath, FILEEXTENSION_RTF, Information!)
	return PBH_FILEEXTENSIONINVALID
end if

// Check if file as_finpath exists.
if not FileExists(ls_finpath) then
	of_Show_message(IFC_TXT_FILECANNOTOPEN, ls_finpath, Information!)
	return PBHH_FILECANNOTOPEN
end if

ll_ret = PBHunspell_spellcheck_rtf_file_H(al_hunhandle, as_finpath, as_foutpath, al_markaction, as_markcolorrgb)

choose case ll_ret
case HUNH_HANDLEOUTOFRANGE
	of_Show_message(IFC_TXT_HANDLEOUTOFRANGE, string(ll_ret), Information!)
case HUNH_HANDLEINVALID
	of_Show_message(IFC_TXT_HANDLEINVALID, string(ll_ret), Information!)
case PBHH_FILECANNOTOPEN
	of_Show_message(IFC_TXT_FILECANNOTOPEN, string(ll_ret), Information!)
case PBHH_RTFFORMATINVALID
	of_Show_message(IFC_TXT_RTFFORMATINVALID, string(ll_ret), Information!)
case PBHH_RTFNOCOLORTABLE
	of_Show_message(IFC_TXT_RTFNOCOLORTABLE, string(ll_ret), Information!)
case PBHH_RTFNOPLAINTEXT
	of_Show_message(IFC_TXT_RTFNOPLAINTEXT, string(ll_ret), Information!)
case PBHH_MARKACTIONUNSUPPORTED
	of_Show_message(IFC_TXT_MARKACTIONUNSUPPORTED, string(ll_ret), Information!)
end choose

return ll_ret
end function

public function string of_pbhunspell_encode_dll_input (ref string as_value, ref string as_dic_encoding);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_PBHunspell_encode_dll_input()
//
// PURPOSE:    Convert string with encoding UTF-16 Little Endian to 
//             specified encoding.
//
// ARGUMENTS:  [reference string] as_value. String to convert.
//             [reference string] as_dic_encoding. Applicable dictionary encoding.
//
// RETURN:     String. String with specified encoding.
//
// EXAMPLE:    as_dic_encoding DIC_ENCODING_UTF8:
//             - Converts German "Übergröße" to "ÃœbergrÃ¶ÃŸe"
//             - Converts Greek "αβαθείς" to "Î±Î²Î±Î¸ÎµÎ¯Ï‚"
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-06-08  Davros       Initial coding.
// -----------------------------------------------------------------------------

string ls_value
blob lblb_value

choose case as_dic_encoding
case DIC_ENCODING_UTF8
	lblb_value = Blob(as_value, EncodingUTF8!)
	ls_value = String(lblb_value, EncodingAnsi!)
case else
	ls_value = as_value
end choose

return ls_value

end function

public function string of_pbhunspell_encode_dll_output (ref string as_value, ref string as_dic_encoding);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_PBHunspell_encode_dll_output()
//
// PURPOSE:    Convert string with specified encoding to UTF-16 Little Endian
//             encoding.
//
// ARGUMENTS:  [reference string] as_value. String to convert.
//             [reference string] as_dic_encoding. Applicable dictionary encoding.
//
// RETURN:     String. String with UTF-16 Little Endian encoding.
//
// EXAMPLE:    as_dic_encoding DIC_ENCODING_UTF8:
//             - Converts "ÃœbergrÃ¶ÃŸe" to German "Übergröße"
//             - Converts "Î±Î²Î±Î¸ÎµÎ¯Ï‚" to Greek "αβαθείς"
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-06-08  Davros       Initial coding.
// -----------------------------------------------------------------------------

string ls_value
blob lblb_value

choose case as_dic_encoding
case DIC_ENCODING_UTF8
	lblb_value = Blob(as_value, EncodingAnsi!)
	ls_value = String(lblb_value, EncodingUTF8!)
case else
	ls_value = as_value
end choose

return ls_value

end function

on n_pbh_engine.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_pbh_engine.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.constructor()
//
// PURPOSE:    Construct service object and set interface language.
//
// ARGUMENTS:  None. 
//
// RETURN:     [long].
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2017-12-29  Davros       Initial coding.
// -----------------------------------------------------------------------------

inv_pbh_service = CREATE n_pbh_service

// Default interface language is English.
of_Set_interface_language(IFC_LNG_EN)
end event

event destructor;// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.destructor()
//
// PURPOSE:    Destruct service object and spelling objects.
//
// ARGUMENTS:  None. 
//
// RETURN:     [long].
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2017-12-29  Davros       Initial coding.
// -----------------------------------------------------------------------------

// Clean up.
if IsValid(inv_pbh_service) then DESTROY inv_pbh_service

of_MyThes_destroy_all()
of_Hyphen_destroy_all()
of_Hunspell_destroy_all()

end event

