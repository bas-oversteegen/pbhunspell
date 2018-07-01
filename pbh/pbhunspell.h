/* ***** BEGIN LICENSE BLOCK *****
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

// DLL export.
#define PBH_DLLEXPORT extern "C" __declspec(dllexport)

#pragma region "Hunspell_..._H exported functions"
PBH_DLLEXPORT int Hunspell_create_H(const char* affpath, const char* dpath);
PBH_DLLEXPORT int Hunspell_create_key_H(const char* affpath, const char* dpath, const char* key);
PBH_DLLEXPORT void Hunspell_destroy_H(int hHunspell);
PBH_DLLEXPORT void Hunspell_destroy_all_H();
PBH_DLLEXPORT int Hunspell_add_dic_H(int hHunspell, const char* dpath);
PBH_DLLEXPORT int Hunspell_spell_H(int hHunspell, const char* word);
PBH_DLLEXPORT char* Hunspell_get_dic_encoding_H(int hHunspell);
PBH_DLLEXPORT int Hunspell_suggest_H(int hHunspell, char** slst, const char* word, int maxlist, int maxitemlen);
PBH_DLLEXPORT int Hunspell_analyze_H(int hHunspell, char** slst, const char* word, int maxlist, int maxitemlen);
PBH_DLLEXPORT int Hunspell_stem_H(int hHunspell, char** slst, const char* word, int maxlist, int maxitemlen);
PBH_DLLEXPORT int Hunspell_stem2_H(int hHunspell, char** slst, char** desc, int n, int maxlist, int maxitemlen);
PBH_DLLEXPORT int Hunspell_generate_H(int hHunspell, char** slst, const char* word, const char* word2, int maxlist, int maxitemlen);
PBH_DLLEXPORT int Hunspell_generate2_H(int hHunspell, char** slst, const char* word, char** desc, int n, int maxlist, int maxitemlen);
PBH_DLLEXPORT int Hunspell_add_H(int hHunspell, const char* word);
PBH_DLLEXPORT int Hunspell_add_with_affix_H(int hHunspell, const char* word, const char* example);
PBH_DLLEXPORT int Hunspell_remove_H(int hHunspell, const char* word);
#pragma endregion

#pragma region "MyThes_..._H exported functions"
PBH_DLLEXPORT int MyThes_create_H(const char* idxpath, const char* datpath);
PBH_DLLEXPORT void MyThes_destroy_H(int hMyThes);
PBH_DLLEXPORT void MyThes_destroy_all_H();
PBH_DLLEXPORT char* MyThes_get_th_encoding_H(int hMyThes);
PBH_DLLEXPORT int MyThes_lookup_H(int hMyThes, const char* word, int &nummeanings);
PBH_DLLEXPORT int MyThes_lookup_read_H(int hmentry, int pos, char* defn, char** synonyms, int maxlist, int maxitemlen);
PBH_DLLEXPORT void MyThes_lookup_free_H(int hMyThes, int hmentry, int nummeanings);
#pragma endregion

#pragma region "Hyphen_..._H exported functions"
PBH_DLLEXPORT int Hyphen_create_H(const char* dicpath);
PBH_DLLEXPORT void Hyphen_destroy_H(int hHyphen);
PBH_DLLEXPORT void Hyphen_destroy_all_H();
PBH_DLLEXPORT char* Hyphen_get_dic_encoding_H(int hHyphen);
PBH_DLLEXPORT int Hyphen_hyphenate_H(int hHyphen, const char* word, int wordsize, char* hyphword, int lhmin, int rhmin, int clhmin, int crhmin);
PBH_DLLEXPORT int Hyphen_hyphenate_ext_H(int hHyphen, const char* word, int wordsize, char* hyphword, int lhmin, int rhmin, int clhmin, int crhmin,
			char* hyphens, char** rep, int* pos, int* cut);
#pragma endregion

#pragma region "PBHunspell_..._H exported functions"
PBH_DLLEXPORT void PBHunspell_get_version_H(char* pbhh_version, char* hunh_version, char* hyph_version, char* myth_version);
PBH_DLLEXPORT int PBHunspell_spellcheck_rtf_file_H(int hHunspell, const char* finpath, const char* foutpath, int markaction, const char* markcolorrgb);
PBH_DLLEXPORT int PBHunspell_unspellcheck_rtf_file_H(const char* finpath, const char* foutpath, int markaction, const char* markcolorrgb);
#pragma endregion
