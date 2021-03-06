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

// pbhunspell.cpp. Defines the functions for this .dll application.

#include "stdafx.h"
#include "pbhunspell.h"

#include "hunspell/hunspell.h"
#include "mythes/mythes.hxx"
#include "hyphen/hyphen.h"

// Character encoding
#include <locale>
#include <codecvt>
#define NOMINMAX
#include <windows.h>

// Pattern search
#include <regex>

#pragma region "Hunspell_..._H defines"
// Error feedback
#define HUNH_MAXSIZEREACHED -400
#define HUNH_HANDLEOUTOFRANGE -401
#define HUNH_HANDLEINVALID -402
#define HUNH_DICCANNOTOPEN -403
#define HUNH_AFFCANNOTOPEN -404

#define HYPH_MAXSIZEREACHED -500
#define HYPH_HANDLEOUTOFRANGE -501
#define HYPH_HANDLEINVALID -502
#define HYPH_DICCANNOTOPEN -503

#define MYTH_MAXSIZEREACHED -600
#define MYTH_HANDLEOUTOFRANGE -601
#define MYTH_HANDLEINVALID -602
#define MYTH_IDXCANNOTOPEN -603
#define MYTH_DATCANNOTOPEN -604

#define PBHH_FILECANNOTOPEN -700
#define PBHH_RTFFORMATINVALID -701
#define PBHH_RTFNOCOLORTABLE -702
#define PBHH_RTFNOPLAINTEXT -703
#define PBHH_MARKACTIONUNSUPPORTED -704

// Spellcheck mark actions
#define PBHH_MARK 1
#define PBHH_MARKBACKGROUNDCOLOR 10
#define PBHH_MARKFOREGROUNDCOLOR 11
#define PBHH_MARKWAVEUNDERLINE 12

// Boundaries
#define HUNH_MAXSIZE 250
#define HYPH_MAXSIZE 250
#define MYTH_MAXSIZE 250

// Version info
#define PBHH_VERSION "1.0.0.2018-07-01"
#define HUNH_VERSION "1.6.2.2018-01-01"
#define HYPH_VERSION "...2017-11-27"
#define MYTH_VERSION "...2017-05-27"

// RTF generators
#define PBHH_RTF_GEN_DEFAULT 0
#define PBHH_RTF_GEN_TXTEXT 1
#define PBHH_RTF_GEN_TEEDIT 2

// Vectors
std::vector<Hunhandle *> hunhandles;
std::vector<MyThes *> mythess;
std::vector<mentry *> mentries;
std::vector<HyphenDict *> hyphdicts;
#pragma endregion

#pragma region "PBHunspell_..._I functions"
/* 'PBHunspell_..._I' internal functions (not dll exported).
*/
std::wstring PBHunspell_ansi_to_unicode_I(const std::string &str)
{
	int size_needed = MultiByteToWideChar(CP_ACP, 0, &str[0], (int)str.size(), NULL, 0);
	std::wstring wstrTo(size_needed, 0);
	MultiByteToWideChar(CP_ACP, 0, &str[0], (int)str.size(), &wstrTo[0], size_needed);
	return wstrTo;
}

std::string PBHunspell_unicode_to_utf8_I(const std::wstring& wstr)
{
	using convert_typeX = std::codecvt_utf8<wchar_t>;
	std::wstring_convert<convert_typeX, wchar_t> converterX;

	return converterX.to_bytes(wstr);
}

void PBHunspell_rtrim_I(std::string &source) {
	source.erase(source.find_last_not_of(" \n\r\t") + 1);
}

void PBHunspell_replace_all_I(std::string &source, std::string &target, std::string &with) {
	size_t pos = 0;
	if (target.length() > 0) {
		while ((pos = source.find(target, pos)) != std::string::npos) {
			source.replace(pos, target.length(), with);
			pos += with.length();
		}
	}
}

bool PBHunspell_is_even_I(size_t n) {
	bool ret;
	ret = (n % 2 == 0);
	return ret;
}

int PBHunspell_file_to_string_I(const char* finpath, std::string &contents)
{
	int ret;
	std::ifstream fin(finpath, std::ios::in | std::ios::binary);
	if (fin) {
		fin.seekg(0, std::ios::end);
		contents.resize(fin.tellg());
		fin.seekg(0, std::ios::beg);
		fin.read(&contents[0], contents.size());
		fin.close();
		ret = 0;
	}
	else {
		ret = PBHH_FILECANNOTOPEN;
	}
	return ret;
}

bool PBHunspell_rtf_is_valid_I(std::string &contents) {
	bool ret = true;
	const char* rtfstart = "{\\rtf";
	const char rtfend = '}';
	std::size_t specl = strlen(rtfstart) + 1;
	if (contents.length() > specl) {
		if (contents.find(rtfstart) != 0) {
			ret = false;
		}
		else {
			PBHunspell_rtrim_I(contents);
			if (contents.back() != rtfend) {
				ret = false;
			}
		}
	}
	else {
		ret = false;
	}
	return ret;
}

bool PBHunspell_rtf_is_backslash_escape_I(std::string &source, std::size_t pos) {
	bool ret = false;
	char curchar, nextchar;
	std::size_t p, cnt = 0;
	p = pos;
	curchar = source.at(p);
	while (curchar == '\\') {
		cnt++;
		p = (p - 1);
		curchar = source.at(p);
	}
	if (cnt > 0 && !PBHunspell_is_even_I(cnt)) {
		nextchar = source.at(pos + 1);
		if (nextchar == '\\' || nextchar == '{' || nextchar == '}') {
			ret = true;
		}
	}
	return ret;
}

bool PBHunspell_rtf_is_backslash_literal_I(std::string &source, std::size_t pos) {
	bool ret = false;
	char curchar;
	std::size_t p, cnt = 0;
	p = pos;
	curchar = source.at(p);
	while (curchar == '\\') {
		cnt++;
		p = (p - 1);
		curchar = source.at(p);
	}
	if (cnt > 0 && PBHunspell_is_even_I(cnt)) {
		ret = true;
	}
	return ret;
}

std::size_t PBHunspell_rtf_find_unescaped_I(std::string &source, std::string &target, std::size_t startpos) {
	std::size_t pos = std::string::npos;
	bool lookfurther = true;
	if (target.length() > 0) {
		pos = source.find(target, startpos);
		while (pos != std::string::npos && lookfurther) {
			if (PBHunspell_rtf_is_backslash_literal_I(source, pos)) {
				pos = source.find(target, pos + target.length());
			}
			else {
				lookfurther = false;
			}
		}
	}
	return pos;
}

bool PBHunspell_rtf_is_ansichar(std::string &contents, std::size_t startpos, std::size_t &endpos, std::string &multibytechr, std::string &rtfchr, char &ansichr) {
	// TX Text Control (PB 12.X): Latin "¼" is represented as "\'bc" (¼).
	// TE Edit Control (PB 17.0): Latin "¼" is represented as "\u188 \'bc" (¼¼).
	// TE Edit Control (PB 17.0): Chinese "人" is represented as "\u20154 \'3f" (人?).
	// TE Edit Control (PB 17.0): Arab "ت" is represented as "\u1575 \'ca" (تÊ).
	bool ret = false;
	std::string charmark, s, ansistr;
	std::wstring unicodestr;
	std::smatch regm1, regm2;
	std::regex patansichar("\\\\\\\'([a-f]|[0-9]){2}"); // e.g. "\'b8"
	s = contents.substr(startpos, 4);
	ansichr = NULL;
	multibytechr = "";
	rtfchr = "";
	endpos = startpos;
	if (std::regex_search(s, regm1, patansichar)) {
		ret = true;
		charmark = regm1[0].str();
		endpos = startpos + charmark.length() - 1;
		charmark = charmark.substr(charmark.length() - 2);
		ansichr = (char)(int)strtol(charmark.c_str(), NULL, 16);
		ansistr = ansichr;
		unicodestr = PBHunspell_ansi_to_unicode_I(ansistr);
		multibytechr = PBHunspell_unicode_to_utf8_I(unicodestr);
		rtfchr = regm1[0].str();
	}
	return ret;
}

bool PBHunspell_rtf_is_unicodechar(std::string &contents, std::size_t startpos, std::size_t &endpos, std::string &multibytechr, std::string &rtfchr,
			char &ansichr, wchar_t &unicodechr) {
	// TE Edit Control (PB 17.0): Latin "¼" is represented as "\u188 \'bc" (¼¼).
	// TX Text Control (PB 12.X): Chinese "人" is represented as "\u20154 ?" (人?).
	// TE Edit Control (PB 17.0): Chinese "人" is represented as "\u20154 \'3f" (人?).
	// TE Edit Control (PB 17.0): Arab "ت" is represented as "\u1575 \'ca" (تÊ).
	bool ret = false;
	size_t pos, endpos2;
	char ansichr2;
	std::string charmark, s, multibytechr2, multibytechr3, rtfchr2, rtfchr3;
	wchar_t unicodechr2 = NULL;
	std::wstring unicodestr;
	std::smatch regm1, regm2;
	std::regex patunicodechar("\\\\u[0-9]+ |\\\\u-[0-9]+ "); // e.g. "\u1808 " or "\u-30629 "
	std::regex patdigitn("[0-9]+");
	s = contents.substr(startpos, 9);
	unicodechr = NULL;
	ansichr = NULL;
	multibytechr = "";
	rtfchr = "";
	endpos = startpos;
	if (std::regex_search(s, regm1, patunicodechar)) {
		charmark = regm1[0].str();
		if (std::regex_search(charmark, regm2, patdigitn)) {
			charmark = regm2[0].str();
			unicodechr2 = (wchar_t)atoi(charmark.c_str());
			unicodestr.push_back(unicodechr2);
			multibytechr2 = PBHunspell_unicode_to_utf8_I(unicodestr);
			rtfchr2 = regm1[0].str();
			pos = startpos + rtfchr2.length();
			if (contents.at(pos) == '?') {
				// TX Text Control (PB 12.X): Chinese "人" is represented as "\u20154 ?" (人?).
				ret = true;
				endpos = pos;
				ansichr = NULL;
				unicodechr = unicodechr2;
				multibytechr = multibytechr2;
				rtfchr = rtfchr2 + '?';
			}
			else {
				if (contents.substr(pos, 2) == "\r\n") {
					rtfchr2 += "\r\n";
					pos += 2;
				}
				else if (contents.at(pos) == '\n') {
					rtfchr2 += '\n';
					pos += 1;
				}
				if (PBHunspell_rtf_is_ansichar(contents, pos, endpos2, multibytechr3, rtfchr3, ansichr2)) {
					if (ansichr2 == '?') {
						// TE Edit Control (PB 17.0): Chinese "人" is represented as "\u20154 \'3f" (人?).
						ret = true;
						endpos = endpos2;
						ansichr = NULL;
						unicodechr = unicodechr2;
						multibytechr = multibytechr2;
						rtfchr = rtfchr2 + rtfchr3;
					}
					else if (multibytechr3 == multibytechr2) {
						// TE Edit Control (PB 17.0): Latin "¼" is represented as "\u188 \'bc" (¼¼).
						ret = true;
						endpos = endpos2;
						ansichr = ansichr2;
						unicodechr = unicodechr2;
						multibytechr = multibytechr2;
						rtfchr = rtfchr2 + rtfchr3;
					}
					else {
						// TE Edit Control (PB 17.0): Arab "ت" is represented as "\u1575 \'ca" (تÊ).
						ret = true;
						endpos = endpos2;
						ansichr = NULL;
						unicodechr = unicodechr2;
						multibytechr = multibytechr2;
						rtfchr = rtfchr2 + rtfchr3;
					}
				}
			}
		}
	}
	return ret;
}

int PBHunspell_rtf_get_group_pos_I(std::string &contents, std::string &markgroup, std::size_t searchfrompos, bool matchfrompos, std::size_t &startpos, std::size_t &endpos) {
	int groupclose, ret = 0;
	char prevchar, curchar;
	std::size_t startp, endp;
	if (matchfrompos) {
		if (contents.substr(searchfrompos, markgroup.length()) == markgroup) {
			startp = searchfrompos;
		}
		else {
			startp = std::string::npos;
		}
	}
	else {
		startp = contents.find(markgroup, searchfrompos);
	}
	endp = startp;
	if (startp != std::string::npos) {
		groupclose = 1;
		endp += markgroup.length() - 1;
		prevchar = ' ';
		while (groupclose > 0 && endp < contents.length()) {
			endp++;
			curchar = contents.at(endp);
			if (curchar == '{' && prevchar != '\\') {
				groupclose++;
			}
			else if (curchar == '}' && prevchar != '\\') {
				groupclose--;
			}
			prevchar = curchar;
		}
		if (groupclose > 0) {
			endp = startp;
			ret = PBHH_RTFFORMATINVALID;
		}
	}
	startpos = startp;
	endpos = endp;
	return ret;
}

bool PBHunspell_search_colorindex_pattern_I(std::string &src, std::regex &pat, std::regex &patdigit, std::vector<int> &excludecolorindexes) {
	bool found = false;
	int checkindex = 0;
	std::smatch regm1, regm2;
	std::string s;
	if (std::regex_search(src, regm1, pat)) {
		found = true;
		s = regm1[0].str();
		if (std::regex_search(s, regm2, patdigit)) {
			checkindex = stoi(regm2[0].str());
			for (size_t i = 0; i < excludecolorindexes.size(); ++i) {
				if (checkindex == excludecolorindexes[i]) {
					found = false;
					break;
				}
			}
		}
	}
	return found;
}

int PBHunspell_rtf_get_generator_I(std::string &contents) {
	std::string rtfgen;
	std::size_t pos;
	rtfgen = "{\\*\\generator TX_RTF32";
	pos = contents.find(rtfgen);
	if (pos != std::string::npos) {
		return PBHH_RTF_GEN_TXTEXT ;
	}
	rtfgen = "{\\*\\revtbl{Unknown";
	pos = contents.find(rtfgen);
	if (pos != std::string::npos) {
		return PBHH_RTF_GEN_TEEDIT;
	}
	return PBHH_RTF_GEN_DEFAULT;
}

int PBHunspell_rtf_get_color_index_I(std::string &contents, std::size_t &curpos, int &colorindex, int &lastcolorindex, const char* colorrgb,
			std::string &defaultcolorrgb, std::vector<int> &defaultcolorindexes) {
	// TX Text Control (PB 12.X) example color table: "{\colortbl;\red0\green0\blue0;\red255\green255\blue255;\red255\green255\blue1;}".
	// TE Edit Control (PB 17.0) example color table: "{\colortbl\red0\green0\blue0 ;\red255\green255\blue255 ;\red0\green0\blue0 ;\red255\green255\blue1 ;}".
	int ret = 0, colorindex2 = 0;
	std::string curcolorrgb, postfix;
	colorindex = -1;
	lastcolorindex = 0;
	curpos = 0;
	bool hasspace = false;
	const char* ctable = "{\\colortbl";
	char curchar;
	std::size_t found = contents.find(ctable);
	if (found != std::string::npos) {
		curpos = found + strlen(ctable);
		while (curpos < contents.length()) {
			curchar = contents.at(curpos);
			if (curchar == ';') {
				hasspace = (contents.at(curpos - 1) == ' ');
				colorindex++;
				PBHunspell_rtrim_I(curcolorrgb);
				if (curcolorrgb == colorrgb) {
					colorindex2 = colorindex;
				}
				if (curcolorrgb == defaultcolorrgb) {
					defaultcolorindexes.push_back(colorindex);
				}
				curcolorrgb = "";
			}
			else if (curchar == '}') {
				break;
			}
			else {
				curcolorrgb += curchar;
			}
			curpos++;
		}
		lastcolorindex = colorindex;
		if (colorindex2 == 0) {
			postfix = (hasspace) ? " ;" : ";";
			contents.insert(curpos, colorrgb + postfix);
			lastcolorindex++;
			colorindex = lastcolorindex;
			if (colorrgb == defaultcolorrgb) {
				defaultcolorindexes.push_back(colorindex);
			}
			curpos += strlen(colorrgb) + postfix.length();
		}
		else {
			colorindex = colorindex2;
		}
		curpos++;
	}
	else {
		ret = PBHH_RTFNOCOLORTABLE;
	}
	return ret;
}

int PBHunspell_rtf_get_next_word_I(std::string &contents, std::size_t &curpos, std::string &curcontrolseq, std::string &word, std::string &wordrtf,
		bool &endofword, std::vector<std::string> &skipgroups, std::regex &patcontrolseq, std::string &worddelimiters, std::vector<const char*> &wordbreaks) {
	int ret = 0;
	std::size_t controlseqlen, marklen, startpos, endpos;
	word = "";
	wordrtf = "";
	curcontrolseq = "";
	endofword = false;
	char curchar, ansichar;
	wchar_t unicodechar;
	std::string schar, multibytechar, rtfchar;
	bool endofcontrolseq = false;
	bool exitloop = false;
	bool bslashescape, bslashliteral;
	while (curpos < contents.length()) {
		curchar = contents.at(curpos);
		if (curchar == '}') {
			if (curpos == (contents.length() - 1)) {
				endofword = true;
				exitloop = true;
			}
			if (!exitloop) {
				if (wordrtf.length() > 0) {
					exitloop = true;
				}
				else {
					curcontrolseq = "";
					endofcontrolseq = false;
				}
			}
		}
		else if (curchar == '{') {
			if (wordrtf.length() > 0) {
				exitloop = true;
			}
			else {
				curcontrolseq = "";
				endofcontrolseq = false;
				for (size_t i = 0; i < skipgroups.size(); ++i) {
					ret = PBHunspell_rtf_get_group_pos_I(contents, skipgroups[i], curpos, true, startpos, endpos);
					if (ret == 0) {
						if (endpos != std::string::npos) {
							curpos = endpos;
							break;
						}
					}
					else {
						return ret;
					}
				}
			}
		}
		else if (curchar == '\\') {
			bslashescape = PBHunspell_rtf_is_backslash_escape_I(contents, curpos);
			bslashliteral = PBHunspell_rtf_is_backslash_literal_I(contents, curpos);
			if (wordrtf.length() > 0) {
				if (bslashescape || bslashliteral || wordrtf.back() == '\'') {
					endofword = true;
				}
				exitloop = true;
			}
			else {
				if (bslashescape) {
					endofcontrolseq = true;
				}
				if (!bslashescape && !bslashliteral) {
					if (PBHunspell_rtf_is_ansichar(contents, curpos, endpos, multibytechar, rtfchar, ansichar)) {
						if (worddelimiters.find(ansichar) != std::string::npos) {
							endofword = true;
							exitloop = true;
						}
						else {
							wordrtf += rtfchar;
							word += multibytechar;
							exitloop = true;
						}
						curcontrolseq += rtfchar;
						curpos = endpos + 1;
					}
					else if (PBHunspell_rtf_is_unicodechar(contents, curpos, endpos, multibytechar, rtfchar, ansichar, unicodechar)) {
						if (ansichar != NULL && worddelimiters.find(ansichar) != std::string::npos) {
							endofword = true;
							exitloop = true;
						}
						else {
							wordrtf += rtfchar;
							word += multibytechar;
							exitloop = true;
						}
						curcontrolseq += rtfchar;
						curpos = endpos + 1;
					}
					else {
						curcontrolseq += curchar;
						endofcontrolseq = false;
					}
				}
			}
		}
		else if (curchar == ' ' || curchar == '\r' || curchar == '\n' || curchar == '\t') {
			if (wordrtf.length() > 0) {
				endofword = true;
				exitloop = true;
			}
			else if (curcontrolseq.length() > 0) {
				if (curchar == ' ') {
					if (endofcontrolseq) {
						endofword = true;
						exitloop = true;
					}
					if (!exitloop) {
						endofcontrolseq = true;
					}
				}
				else {
					curcontrolseq += curchar;
				}
			}
			else if (wordrtf.length() == 0) {
				endofword = true;
				exitloop = true;
				curpos++;
			}
		}
		else if (curchar == '?') {
			if (wordrtf.length() > 0) {
				endofword = true;
				exitloop = true;
			}
			else if (wordrtf.length() == 0) {
				endofword = true;
				exitloop = true;
				curpos++;
			}
		}
		else if (curchar == '\'') {
			if (wordrtf.length() > 0) {
				endofword = true;
				exitloop = true;
			}
			else if (!endofcontrolseq && curcontrolseq.length() > 0 && curcontrolseq.back() == '\\') {
				curcontrolseq += curchar;
			}
			else if (wordrtf.length() == 0) {
				endofword = true;
				exitloop = true;
				curpos++;
			}
		}
		else if (std::regex_search(schar = curchar, patcontrolseq)) {
			if (curcontrolseq == "" || endofcontrolseq) {
				if (worddelimiters.find(curchar) == std::string::npos) {
					wordrtf += curchar;
				}
				else if (wordrtf.length() > 0) {
					endofword = true;
					exitloop = true;
				}

			}
			else if (curcontrolseq.length() > 0) {
				curcontrolseq += curchar;
			}
		}
		else if (worddelimiters.find(curchar) != std::string::npos) {
			if (wordrtf.length() > 0 || (wordrtf.length() == 0 && endofcontrolseq)) {
				endofword = true;
				exitloop = true;
			}
		}
		else {
			wordrtf += curchar;
		}
		for (size_t i = 0; i < wordbreaks.size(); ++i) {
			if (!endofword) {
				marklen = strlen(wordbreaks[i]);
				controlseqlen = curcontrolseq.length();
				if (controlseqlen >= marklen) {
					if (endofcontrolseq && curcontrolseq.substr(controlseqlen - marklen, marklen) == wordbreaks[i]) {
						endofword = true;
						exitloop = true;
					}
					if (!endofword && controlseqlen > marklen) {
						if (curcontrolseq.substr(controlseqlen - marklen - 1, marklen) == wordbreaks[i]) {
							if (!std::regex_search(schar = curchar, patcontrolseq)) {
								endofword = true;
								exitloop = true;
							}
						}
					}
				}
			}
		}
		if (exitloop) {
			break;
		}
		curpos++;
	}
	if (word.length() == 0) {
		word = wordrtf;
	}
	return ret;
}
#pragma endregion

#pragma region "Hunspell_..._H functions"
/* 'Hunspell_..._H' variants of 'Hunspell_...' functions that use integer handles
* instead of pointers and provide some feedback for better portability.
*/
int Hunspell_create_H(const char* affpath, const char* dpath) {
	std::fstream file;
	int ret;
	if (hunhandles.size() >= HUNH_MAXSIZE) {
		ret = HUNH_MAXSIZEREACHED;
	}
	else {
		file.open(affpath, std::ios::in);
		if (!file.is_open()) {
			ret = HUNH_AFFCANNOTOPEN;
		}
		else {
			file.close();
			file.open(dpath, std::ios::in);
			if (!file.is_open()) {
				ret = HUNH_DICCANNOTOPEN;
			}
			else {
				file.close();
				hunhandles.push_back(Hunspell_create(affpath, dpath));
				ret = hunhandles.size() - 1;
			}
		}
	}
	return ret;
}

int Hunspell_create_key_H(const char* affpath, const char* dpath, const char* key) {
	std::fstream file;
	int ret;
	if (hunhandles.size() >= HUNH_MAXSIZE) {
		ret = HUNH_MAXSIZEREACHED;
	}
	else {
		file.open(affpath, std::ios::in);
		if (!file.is_open()) {
			ret = HUNH_AFFCANNOTOPEN;
		}
		else {
			file.close();
			file.open(dpath, std::ios::in);
			if (!file.is_open()) {
				ret = HUNH_DICCANNOTOPEN;
			}
			else {
				file.close();
				hunhandles.push_back(Hunspell_create_key(affpath, dpath, key));
				ret = hunhandles.size() - 1;
			}
		}
	}
	return ret;
}

void Hunspell_destroy_H(int hHunspell) {
	if (hHunspell + 1 <= hunhandles.size()) {
		if (hunhandles[hHunspell]) {
			Hunspell_destroy(hunhandles[hHunspell]);
			hunhandles[hHunspell] = nullptr;
		}
	}
}

void Hunspell_destroy_all_H() {
	for (std::vector<Hunhandle *>::iterator it = hunhandles.begin(); it != hunhandles.end(); ++it) {
		if (*it) {
			Hunspell_destroy(*it);
			*it = nullptr;
		}
	}
	while (!hunhandles.empty())
	{
		hunhandles.pop_back();
	}
}

int Hunspell_add_dic_H(int hHunspell, const char* dpath) {
	std::fstream file;
	int ret;
	if (hHunspell + 1 <= hunhandles.size()) {
		if (hunhandles[hHunspell]) {
			file.open(dpath, std::ios::in);
			if (!file.is_open()) {
				ret = HUNH_DICCANNOTOPEN;
			}
			else {
				file.close();
				ret = Hunspell_add_dic(hunhandles[hHunspell], dpath);
			}
		}
		else {
			ret = HUNH_HANDLEINVALID;
		}
	}
	else {
		ret = HUNH_HANDLEOUTOFRANGE;
	}
	return ret;
}

int Hunspell_spell_H(int hHunspell, const char* word) {
	int ret;
	if (hHunspell + 1 <= hunhandles.size()) {
		if (hunhandles[hHunspell]) {
			ret = Hunspell_spell(hunhandles[hHunspell], word);
		}
		else {
			ret = HUNH_HANDLEINVALID;
		}
	}
	else {
		ret = HUNH_HANDLEOUTOFRANGE;
	}
	return ret;
}

char* Hunspell_get_dic_encoding_H(int hHunspell) {
	char* ret;
	if (hHunspell + 1 <= hunhandles.size()) {
		if (hunhandles[hHunspell]) {
			ret = Hunspell_get_dic_encoding(hunhandles[hHunspell]);
		}
		else {
			ret = (char *)"";
		}
	}
	else {
		ret = (char *)"";
	}
	return ret;
}

int Hunspell_suggest_H(int hHunspell, char** slst, const char* word, int maxlist, int maxitemlen) {
	int ret, ret2;
	if (hHunspell + 1 <= hunhandles.size()) {
		if (hunhandles[hHunspell]) {
			size_t wordlen;
			char** slst2 = NULL;
			ret2 = Hunspell_suggest(hunhandles[hHunspell], &slst2, word);
			ret = min(ret2, maxlist);
			for (size_t i = 0; i < ret; ++i) {
				wordlen = strlen(slst2[i]);
				if (wordlen > maxitemlen){
					strncpy(slst[i], slst2[i], maxitemlen);
					strcat(slst[i], (char *)"");
				}
				else {
					strcpy(slst[i], slst2[i]);
				}
			}
			Hunspell_free_list(hunhandles[hHunspell], &slst2, ret2);
		}
		else {
			ret = HUNH_HANDLEINVALID;
		}
	}
	else {
		ret = HUNH_HANDLEOUTOFRANGE;
	}
	return ret;
}

int Hunspell_analyze_H(int hHunspell, char** slst, const char* word, int maxlist, int maxitemlen) {
	int ret, ret2;
	if (hHunspell + 1 <= hunhandles.size()) {
		if (hunhandles[hHunspell]) {
			size_t wordlen;
			char** slst2 = NULL;
			ret2 = Hunspell_analyze(hunhandles[hHunspell], &slst2, word);
			ret = min(ret2, maxlist);
			for (size_t i = 0; i < ret; ++i) {
				wordlen = strlen(slst2[i]);
				if (wordlen > maxitemlen) {
					strncpy(slst[i], slst2[i], maxitemlen);
					strcat(slst[i], (char *)"");
				}
				else {
					strcpy(slst[i], slst2[i]);
				}
			}
			Hunspell_free_list(hunhandles[hHunspell], &slst2, ret2);
		}
		else {
			ret = HUNH_HANDLEINVALID;
		}
	}
	else {
		ret = HUNH_HANDLEOUTOFRANGE;
	}
	return ret;
}

int Hunspell_stem_H(int hHunspell, char** slst, const char* word, int maxlist, int maxitemlen) {
	int ret, ret2;
	if (hHunspell + 1 <= hunhandles.size()) {
		if (hunhandles[hHunspell]) {
			size_t wordlen;
			char** slst2 = NULL;
			ret2 = Hunspell_stem(hunhandles[hHunspell], &slst2, word);
			ret = min(ret2, maxlist);
			for (size_t i = 0; i < ret; ++i) {
				wordlen = strlen(slst2[i]);
				if (wordlen > maxitemlen) {
					strncpy(slst[i], slst2[i], maxitemlen);
					strcat(slst[i], (char *)"");
				}
				else {
					strcpy(slst[i], slst2[i]);
				}
			}
			Hunspell_free_list(hunhandles[hHunspell], &slst2, ret2);
		}
		else {
			ret = HUNH_HANDLEINVALID;
		}
	}
	else {
		ret = HUNH_HANDLEOUTOFRANGE;
	}
	return ret;
}

int Hunspell_stem2_H(int hHunspell, char** slst, char** desc, int n, int maxlist, int maxitemlen) {
	int ret, ret2;
	if (hHunspell + 1 <= hunhandles.size()) {
		if (hunhandles[hHunspell]) {
			size_t wordlen;
			char** slst2 = NULL;
			ret2 = Hunspell_stem2(hunhandles[hHunspell], &slst2, desc, n);
			ret = min(ret2, maxlist);
			for (size_t i = 0; i < ret; ++i) {
				wordlen = strlen(slst2[i]);
				if (wordlen > maxitemlen) {
					strncpy(slst[i], slst2[i], maxitemlen);
					strcat(slst[i], (char *)"");
				}
				else {
					strcpy(slst[i], slst2[i]);
				}
			}
			Hunspell_free_list(hunhandles[hHunspell], &slst2, ret2);
		}
		else {
			ret = HUNH_HANDLEINVALID;
		}
	}
	else {
		ret = HUNH_HANDLEOUTOFRANGE;
	}
	return ret;
}

int Hunspell_generate_H(int hHunspell, char** slst, const char* word, const char* word2, int maxlist, int maxitemlen) {
	int ret, ret2;
	if (hHunspell + 1 <= hunhandles.size()) {
		if (hunhandles[hHunspell]) {
			size_t wordlen;
			char** slst2 = NULL;
			ret2 = Hunspell_generate(hunhandles[hHunspell], &slst2, word, word2);
			ret = min(ret2, maxlist);
			for (size_t i = 0; i < ret; ++i) {
				wordlen = strlen(slst2[i]);
				if (wordlen > maxitemlen) {
					strncpy(slst[i], slst2[i], maxitemlen);
					strcat(slst[i], (char *)"");
				}
				else {
					strcpy(slst[i], slst2[i]);
				}
			}
			Hunspell_free_list(hunhandles[hHunspell], &slst2, ret2);
		}
		else {
			ret = HUNH_HANDLEINVALID;
		}
	}
	else {
		ret = HUNH_HANDLEOUTOFRANGE;
	}
	return ret;
}

int Hunspell_generate2_H(int hHunspell, char** slst, const char* word, char** desc, int n, int maxlist, int maxitemlen) {
	int ret, ret2;
	if (hHunspell + 1 <= hunhandles.size()) {
		if (hunhandles[hHunspell]) {
			size_t wordlen;
			char** slst2 = NULL;
			ret2 = Hunspell_generate2(hunhandles[hHunspell], &slst2, word, desc, n);
			ret = min(ret2, maxlist);
			for (size_t i = 0; i < ret; ++i) {
				wordlen = strlen(slst2[i]);
				if (wordlen > maxitemlen) {
					strncpy(slst[i], slst2[i], maxitemlen);
					strcat(slst[i], (char *)"");
				}
				else {
					strcpy(slst[i], slst2[i]);
				}
			}
			Hunspell_free_list(hunhandles[hHunspell], &slst2, ret2);
		}
		else {
			ret = HUNH_HANDLEINVALID;
		}
	}
	else {
		ret = HUNH_HANDLEOUTOFRANGE;
	}
	return ret;
}

int Hunspell_add_H(int hHunspell, const char* word) {
	int ret;
	if (hHunspell + 1 <= hunhandles.size()) {
		if (hunhandles[hHunspell]) {
			ret = Hunspell_add(hunhandles[hHunspell], word);
		}
		else {
			ret = HUNH_HANDLEINVALID;
		}
	}
	else {
		ret = HUNH_HANDLEOUTOFRANGE;
	}
	return ret;
}

int Hunspell_add_with_affix_H(int hHunspell, const char* word, const char* example) {
	int ret;
	if (hHunspell + 1 <= hunhandles.size()) {
		if (hunhandles[hHunspell]) {
			ret = Hunspell_add_with_affix(hunhandles[hHunspell], word, example);
		}
		else {
			ret = HUNH_HANDLEINVALID;
		}
	}
	else {
		ret = HUNH_HANDLEOUTOFRANGE;
	}
	return ret;
}

int Hunspell_remove_H(int hHunspell, const char* word) {
	int ret;
	if (hHunspell + 1 <= hunhandles.size()) {
		if (hunhandles[hHunspell]) {
			ret = Hunspell_remove(hunhandles[hHunspell], word);
		}
		else {
			ret = HUNH_HANDLEINVALID;
		}
	}
	else {
		ret = HUNH_HANDLEOUTOFRANGE;
	}
	return ret;
}
#pragma endregion

#pragma region "MyThes_..._H functions"
/* 'MyThes_..._H' variants of 'MyThes_...' functions that use integer handles
* instead of pointers and provide some feedback for better portability.
*/
int MyThes_create_H(const char* idxpath, const char* datpath) {
	std::fstream file;
	int ret;
	if (mythess.size() >= MYTH_MAXSIZE) {
		ret = MYTH_MAXSIZEREACHED;
	}
	else {
		file.open(idxpath, std::ios::in);
		if (!file.is_open()) {
			ret = MYTH_IDXCANNOTOPEN;
		}
		else {
			file.close();
			file.open(datpath, std::ios::in);
			if (!file.is_open()) {
				ret = MYTH_DATCANNOTOPEN;
			}
			else {
				file.close();
				mythess.push_back(new MyThes(idxpath, datpath));
				ret = mythess.size() - 1;
			}
		}
	}
	return ret;
}

void MyThes_destroy_H(int hMyThes) {
	if (hMyThes + 1 <= mythess.size()) {
		if (mythess[hMyThes]) {
			delete mythess[hMyThes];
			mythess[hMyThes] = nullptr;
		}
	}
}

void MyThes_destroy_all_H() {
	for (std::vector<MyThes *>::iterator it = mythess.begin(); it != mythess.end(); ++it) {
		if (*it) {
			delete *it;
			*it = nullptr;
		}
	}
	while (!mythess.empty())
	{
		mythess.pop_back();
	}
}

char* MyThes_get_th_encoding_H(int hMyThes) {
	char* ret;
	if (hMyThes + 1 <= mythess.size()) {
		if (mythess[hMyThes]) {
			ret = (mythess[hMyThes])->get_th_encoding();
		}
		else {
			ret = (char *)"";
		}
	}
	else {
		ret = (char *)"";
	}
	return ret;
}

int MyThes_lookup_H(int hMyThes, const char* word, int &nummeanings) {
	int ret;
	if (hMyThes + 1 <= mythess.size()) {
		if (mythess[hMyThes]) {
			mentry* mlst2 = NULL;
			int len = strlen(word);
			nummeanings = (mythess[hMyThes])->Lookup(word, len, &mlst2);
			mentries.push_back(mlst2);
			ret = mentries.size() - 1;
		}
		else {
			ret = MYTH_HANDLEINVALID;
		}
	}
	else {
		ret = MYTH_HANDLEOUTOFRANGE;
	}
	return ret;
}

int MyThes_lookup_read_H(int hmentry, int pos, char* defn, char** synonyms, int maxlist, int maxitemlen) {
	int ret;
	if (hmentry + 1 <= mentries.size()) {
		if (mentries[hmentry]) {
			size_t wordlen;
			wordlen = strlen((mentries[hmentry])[pos].defn);
			if (wordlen > maxitemlen) {
				strncpy(defn, (mentries[hmentry])[pos].defn, maxitemlen);
				strcat(defn, (char *)"");
			}
			else {
				strcpy(defn, (mentries[hmentry])[pos].defn);
			}
			ret = min((mentries[hmentry])[pos].count, maxlist);
			for (size_t i = 0; i < ret; ++i) {
				wordlen = strlen((mentries[hmentry])[pos].psyns[i]);
				if (wordlen > maxitemlen) {
					strncpy(synonyms[i], (mentries[hmentry])[pos].psyns[i], maxitemlen);
					strcat(synonyms[i], (char *)"");
				}
				else {
					strcpy(synonyms[i], (mentries[hmentry])[pos].psyns[i]);
				}
			}
		}
		else {
			ret = MYTH_HANDLEINVALID;
		}
	}
	else {
		ret = MYTH_HANDLEOUTOFRANGE;
	}
	return ret;
}

void MyThes_lookup_free_H(int hMyThes, int hmentry, int nummeanings) {
	if (hMyThes + 1 <= mythess.size() && hmentry + 1 <= mentries.size()) {
		if (mythess[hMyThes] && mentries[hmentry]) {
			(mythess[hMyThes])->CleanUpAfterLookup(&mentries[hmentry], nummeanings);
			for (int i = mentries.size(); i > 0; --i) {
				if (!mentries[i - 1]) {
					mentries.pop_back();
				}
			}
		}
	}
}
#pragma endregion

#pragma region "Hyphen_..._H functions"
/* 'Hyphen_..._H' variants of 'Hyphen_...' functions that use integer handles
* instead of pointers and provide some feedback for better portability.
*/
int Hyphen_create_H(const char* dicpath) {
	std::fstream file;
	int ret;
	if (hyphdicts.size() >= HYPH_MAXSIZE) {
		ret = HYPH_MAXSIZEREACHED;
	}
	else {
		file.open(dicpath, std::ios::in);
		if (!file.is_open()) {
			ret = HYPH_DICCANNOTOPEN;
		}
		else {
			file.close();
			hyphdicts.push_back(hnj_hyphen_load(dicpath));
			ret = hyphdicts.size() - 1;
		}
	}
	return ret;
}

void Hyphen_destroy_H(int hHyphen) {
	if (hHyphen + 1 <= hyphdicts.size()) {
		if (hyphdicts[hHyphen]) {
			hnj_hyphen_free(hyphdicts[hHyphen]);
			hyphdicts[hHyphen] = nullptr;
		}
	}
}

void Hyphen_destroy_all_H() {
	for (std::vector<HyphenDict *>::iterator it = hyphdicts.begin(); it != hyphdicts.end(); ++it) {
		if (*it) {
			hnj_hyphen_free(*it);
			*it = nullptr;
		}
	}
	while (!hyphdicts.empty())
	{
		hyphdicts.pop_back();
	}
}

char* Hyphen_get_dic_encoding_H(int hHyphen) {
	char* ret;
	if (hHyphen + 1 <= hyphdicts.size()) {
		if (hyphdicts[hHyphen]) {
			ret = (hyphdicts[hHyphen])->cset;
		}
		else {
			ret = (char *)"";
		}
	}
	else {
		ret = (char *)"";
	}
	return ret;
}

int Hyphen_hyphenate_H(int hHyphen,	const char* word, int wordsize, char* hyphword, int lhmin, int rhmin, int clhmin, int crhmin) {
	int ret;
	if (hHyphen + 1 <= hyphdicts.size()) {
		if (hyphdicts[hHyphen]) {
			int wordsize2 = (wordsize > MAX_CHARS) ? MAX_CHARS : wordsize;
			char* hyphens2 = (char *)malloc(wordsize2 + 5);
			char ** rep2 = NULL;
			int * pos2 = NULL;
			int * cut2 = NULL;
			ret = hnj_hyphen_hyphenate3(hyphdicts[hHyphen], word, wordsize2, hyphens2, hyphword,
				&rep2, &pos2, &cut2, lhmin, rhmin, clhmin, crhmin);
			if (hyphens2) free(hyphens2);
			if (rep2) {
				for (size_t i = 0; i < wordsize2; ++i) {
					if (rep2[i]) free(rep2[i]);
				}
				free(rep2);
				free(pos2);
				free(cut2);
			}
		}
		else {
			ret = HYPH_HANDLEINVALID;
		}
	}
	else {
		ret = HYPH_HANDLEOUTOFRANGE;
	}
	return ret;
}

int Hyphen_hyphenate_ext_H(int hHyphen, const char* word, int wordsize, char* hyphword, int lhmin, int rhmin, int clhmin, int crhmin,
			char* hyphens, char** rep, int* pos, int* cut) {
	int ret;
	if (hHyphen + 1 <= hyphdicts.size()) {
		if (hyphdicts[hHyphen]) {
			int wordsize2 = (wordsize > MAX_CHARS) ? MAX_CHARS : wordsize;
			char* hyphens2 = (char *)malloc(wordsize2 + 5);
			char ** rep2 = NULL;
			int * pos2 = NULL;
			int * cut2 = NULL;
			ret = hnj_hyphen_hyphenate3(hyphdicts[hHyphen], word, wordsize2, hyphens2, hyphword,
				&rep2, &pos2, &cut2, lhmin, rhmin, clhmin, crhmin);
			if (hyphens2) {
				strcpy(hyphens, hyphens2);
				free(hyphens2);
			}
			if (rep2) {
				for (size_t i = 0; i < wordsize2; ++i) {
					if (rep2[i]) {
						strcpy(rep[i], rep2[i]);
						pos[i] = pos2[i];
						cut[i] = cut2[i];
						free(rep2[i]);
					}
				}
				free(rep2);
				free(pos2);
				free(cut2);
			}
		}
		else {
			ret = HYPH_HANDLEINVALID;
		}
	}
	else {
		ret = HYPH_HANDLEOUTOFRANGE;
	}
	return ret;
}
#pragma endregion

#pragma region "PBHunspell_..._H functions"
/* 'PBHunspell_..._H' specific functions.
*/
void PBHunspell_get_version_H(char* pbhh_version, char* hunh_version, char* hyph_version, char* myth_version) {
	strcpy(pbhh_version, PBHH_VERSION);
	strcpy(hunh_version, HUNH_VERSION);
	strcpy(hyph_version, HYPH_VERSION);
	strcpy(myth_version, MYTH_VERSION);
}

int PBHunspell_spellcheck_rtf_file_H(int hHunspell, const char* finpath, const char* foutpath, int markaction, const char* markcolorrgb) {
	int ret;
	std::fstream file;
	std::string contents, word, wordrtf, curcontrolseq, curparseseq;
	std::size_t prevpos, curpos, fullwordstartpos, lastwordendpos, addlen;
	int colorindex, lastcolorindex, rtfgen;
	const char* colorrgbblack = "\\red0\\green0\\blue0";
	const char* colorrgbwhite = "\\red255\\green255\\blue255";
	const char* tagonstart = "\\pbhxs";
	const char* tagonend = "\\pbhxe ";
	const char* tagoffstart = "\\pbhys";
	const char* tagoffend = "\\pbhye ";
	const char* markbg = "\\chcbpat";
	const char* markfg = "\\cf";
	std::string markplain = "\\plain";
	std::string markon, markoff, markedword, fullword, defaultcolorrgb;
	std::vector<int> defaultcolorindexes;
	const char* cword;
	bool endofword, endoffile, checkword, wordcolored, fullwordcolored;
	std::regex patcontrolseq("[a-z]|[0-9]|-");
	std::regex patdigit("[0-9]");
	std::regex patmark;
	std::regex patmarkbg("\\\\chcbpat[0-9]+");
	std::regex patmarkfg("\\\\cf[0-9]+");
	std::vector<std::string> skipgroups = {"{\\*\\", "{\\txfielddef", "{\\field"};
	std::vector<const char*> wordbreaks = {"\\par", "\\tab"};
	std::string worddelimiters = "\\\",.:;!?()[]|/< >= +-*~@#$%^&";
	worddelimiters += "\x91\x92\x93\x94\x96\x97\xa1\xbf\xa6\x8b\x9b\xab\xbb\x60\xb4\x82\x84"; // ‘’“”–—¡¿¦‹›«»`´‚„
	if (hHunspell + 1 <= hunhandles.size()) {
		if (hunhandles[hHunspell]) {
			ret = PBHunspell_file_to_string_I(finpath, contents);
			if (ret == 0) {
				if (PBHunspell_rtf_is_valid_I(contents)) {
					switch (markaction) {
					case PBHH_MARKBACKGROUNDCOLOR:
						defaultcolorrgb = colorrgbwhite;
						markon = markbg;
						markoff = markbg;
						patmark = patmarkbg;
						break;
					case PBHH_MARKFOREGROUNDCOLOR:
						defaultcolorrgb = colorrgbblack;
						markon = markfg;
						markoff = markfg;
						patmark = patmarkfg;
						break;
					default:
						ret = PBHH_MARKACTIONUNSUPPORTED;
						break;
					}
					if (ret != PBHH_MARKACTIONUNSUPPORTED) {
						ret = PBHunspell_rtf_get_color_index_I(contents, curpos, colorindex, lastcolorindex, markcolorrgb, defaultcolorrgb, defaultcolorindexes);
						if (ret == 0) {
							curpos = PBHunspell_rtf_find_unescaped_I(contents, markplain, curpos);
							if (curpos != std::string::npos) {
								markon += std::to_string(colorindex);
								markon = tagonstart + markon + tagonend;
								rtfgen = PBHunspell_rtf_get_generator_I(contents);
								if (rtfgen == PBHH_RTF_GEN_TEEDIT && defaultcolorindexes.size() > 0) {
									markoff += std::to_string(defaultcolorindexes[0]);
								}
								else {
									markoff += std::to_string(lastcolorindex + 1);
								}
								markoff = tagoffstart + markoff + tagoffend;
								endoffile = false;
								markedword = "";
								fullword = "";
								prevpos = curpos;
								wordcolored = false;
								fullwordcolored = false;
								fullwordstartpos = std::string::npos;
								lastwordendpos = std::string::npos;
								ret = PBHunspell_rtf_get_next_word_I(contents, curpos, curcontrolseq, word, wordrtf, endofword, skipgroups, patcontrolseq,
									worddelimiters, wordbreaks);
								while (wordrtf.length() > 0 || endofword) {
									if (curpos >= contents.length() - 1) {
										endoffile = true;
										endofword = true;
									}
									if (wordrtf.length() > 0) {
										lastwordendpos = curpos;
										if (markedword == "") {
											fullwordstartpos = prevpos;
											if (curcontrolseq.find(markplain) != std::string::npos) {
												fullwordcolored = PBHunspell_search_colorindex_pattern_I(curcontrolseq, patmark, patdigit, defaultcolorindexes);
											}
											else {
												fullwordcolored = wordcolored;
											}
										}
										curparseseq = contents.substr(prevpos, lastwordendpos - prevpos - wordrtf.length());
										markedword += curparseseq + markon + wordrtf;
										markedword += markoff;
										fullword += word;
									}
									if (curcontrolseq.find(markplain) != std::string::npos) {
										wordcolored = PBHunspell_search_colorindex_pattern_I(curcontrolseq, patmark, patdigit, defaultcolorindexes);
										if (wordcolored) {
											fullwordcolored = true;
										}
									}
									if (endofword && fullword.length() > 0) {
										checkword = !fullwordcolored;
										checkword = (checkword && fullword.find('_') == std::string::npos);
										checkword = (checkword && !std::regex_search(fullword, patdigit));
										if (checkword) {
											cword = fullword.c_str();
											if (Hunspell_spell_H(hHunspell, cword) == 0) {
												contents.replace(fullwordstartpos, lastwordendpos - fullwordstartpos, markedword);
												addlen = curpos - lastwordendpos;
												curpos = fullwordstartpos + markedword.length() + addlen;
											}
										}
										fullword = "";
										markedword = "";
									}
									if (endoffile) {
										break;
									}
									else {
										prevpos = curpos;
										ret = PBHunspell_rtf_get_next_word_I(contents, curpos, curcontrolseq, word, wordrtf, endofword, skipgroups, patcontrolseq,
											worddelimiters, wordbreaks);
									}
								}
							}
							else {
								ret = PBHH_RTFNOPLAINTEXT;
							}
						}
					}
					if (ret >= 0) {
						file.open(foutpath, std::ios::out | std::ios::binary | std::ios::trunc);
						if (!file.is_open()) {
							ret = PBHH_FILECANNOTOPEN;
						}
						else {
							file << contents;
							file.close();
						}
					}
				}
				else {
					ret = PBHH_RTFFORMATINVALID;
				}
			}
		}
		else {
			ret = HUNH_HANDLEINVALID;
		}
	}
	else {
		ret = HUNH_HANDLEOUTOFRANGE;
	}
	return ret;
}

int PBHunspell_unspellcheck_rtf_file_H(const char* finpath, const char* foutpath, int markaction, const char* markcolorrgb) {
	int ret;
	std::fstream file;
	std::string contents;
	std::size_t curpos, startpos;
	int colorindex, lastcolorindex, rtfgen;
	const char* colorrgbblack = "\\red0\\green0\\blue0";
	const char* colorrgbwhite = "\\red255\\green255\\blue255";
	char curchar;
	bool found;
	std::string schar, defaultcolorrgb;
	std::vector<int> defaultcolorindexes;
	std::vector<std::string> marks;
	std::string mark, markrepl;
	std::string markbg1 = "\\chcbpat";
	std::string markbg2 = "\\cb";
	std::string markfg = "\\cf";
	std::regex patcontrolseq("[a-z]|[0-9]|-");
	ret = PBHunspell_file_to_string_I(finpath, contents);
	if (ret == 0) {
		if (PBHunspell_rtf_is_valid_I(contents)) {
			switch (markaction) {
			case PBHH_MARKBACKGROUNDCOLOR:
				defaultcolorrgb = colorrgbwhite;
				marks.push_back(markbg1);
				marks.push_back(markbg2);
				break;
			case PBHH_MARKFOREGROUNDCOLOR:
				defaultcolorrgb = colorrgbblack;
				marks.push_back(markfg);
				break;
			default:
				ret = PBHH_MARKACTIONUNSUPPORTED;
				break;
			}
			if (ret != PBHH_MARKACTIONUNSUPPORTED) {
				ret = PBHunspell_rtf_get_color_index_I(contents, curpos, colorindex, lastcolorindex, markcolorrgb, defaultcolorrgb, defaultcolorindexes);
				if (ret == 0) {
					startpos = curpos;
					rtfgen = PBHunspell_rtf_get_generator_I(contents);
					for (size_t i = 0; i < marks.size(); ++i) {
						mark = marks[i] + std::to_string(colorindex);
						if (rtfgen == PBHH_RTF_GEN_TEEDIT && defaultcolorindexes.size() > 0) {
							markrepl = marks[i] + std::to_string(defaultcolorindexes[0]);
						}
						else {
							markrepl = marks[i] + '0';
						}
						curpos = PBHunspell_rtf_find_unescaped_I(contents, mark, startpos);
						while (curpos != std::string::npos) {
							found = true;
							curchar = contents.at(curpos + mark.length());
							if (std::regex_search(schar = curchar, patcontrolseq)) {
								found = false;
							}
							if (found) {
								contents.replace(curpos, mark.length(), markrepl);
								curpos += markrepl.length();
							}
							else {
								curpos += mark.length();
							}
							curpos = PBHunspell_rtf_find_unescaped_I(contents, mark, curpos);
						}
					}
				}
			}
			if (ret >= 0) {
				file.open(foutpath, std::ios::out | std::ios::binary | std::ios::trunc);
				if (!file.is_open()) {
					ret = PBHH_FILECANNOTOPEN;
				}
				else {
					file << contents;
					file.close();
				}
			}
		}
		else {
			ret = PBHH_RTFFORMATINVALID;
		}
	}
	return ret;
}
#pragma endregion
