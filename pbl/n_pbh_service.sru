$PBExportHeader$n_pbh_service.sru
forward
global type n_pbh_service from nonvisualobject
end type
end forward

global type n_pbh_service from nonvisualobject
end type
global n_pbh_service n_pbh_service

type prototypes
Function uint GetTempFileName (string lpPathName, string lpPrefixString, uint uUnique, ref string lpTempFileName) Library "kernel32.dll"  Alias for "GetTempFileNameW"
end prototypes

forward prototypes
public function string of_replace_all (string as_source, string as_target, string as_with)
public function long of_parse_string_to_array (string as_source, ref string as_target[], string as_separator)
public function string of_create_unique_temp_file (string as_dir, string as_prefix, string as_ext)
public function boolean of_is_even (long al_num)
end prototypes

public function string of_replace_all (string as_source, string as_target, string as_with);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_Replace_all()
//
// PURPOSE:    In string as_source, replace all occurrences of as_target with as_with.
//
// ARGUMENTS:  [string] as_source. The string to change.
//             [string] as_target. The string that will be replaced within as_source.
//             [string] as_with. The string used as a replacement for as_target.
//
// RETURN:     [string]. The replaced string.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2017-12-28  Davros       Initial coding.
// -----------------------------------------------------------------------------

int ll_start, ll_len 
string ls_result

ls_result = as_source

ll_len = Len(as_target)
ll_start = 1
ll_start = Pos(ls_result, as_target, ll_start) 
do while ll_start > 0 
    ls_result = Replace(ls_result, ll_start, ll_len, as_with)
    ll_start = Pos(ls_result, as_target, ll_start + Len( as_with))
loop

return ls_result
end function

public function long of_parse_string_to_array (string as_source, ref string as_target[], string as_separator);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_engine.of_Parse_string_to_array()
//
// PURPOSE:    Parse string to array.
//
// ARGUMENTS:  [string] as_source. The string to parse.
//             [ref string array] as_target[]. Array containing the parsed string.
//             [string] as_separator. Parsing separator.
//
// RETURN:     [long]. The number of elements in as_target[].
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-02-24  Davros       Initial coding.
// -----------------------------------------------------------------------------

string ls_source, ls_element, ls_target[]
long ll_n, ll_pos

as_target[] = ls_target[]

ls_source = as_source
ll_n = 0
ll_pos = Pos(ls_source, as_separator)
do while ll_pos > 0
	ll_n++
	ls_element = Left(ls_source, ll_pos - 1)
	ls_target[ll_n] = ls_element
	ls_source = Mid(ls_source, ll_pos + Len(as_separator), Len(ls_source))
	ll_pos = Pos(ls_source, as_separator)
loop
ll_n++
ls_target[ll_n] = ls_source

as_target[] = ls_target[]

return ll_n

end function

public function string of_create_unique_temp_file (string as_dir, string as_prefix, string as_ext);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_service.of_Create_unique_temp_file()
//
// PURPOSE:    Create unique temporary file.
//
// ARGUMENTS: [string] as_dir. Directory to create the file in.
//            [string] as_prefix. File name prefix, e.g. 'PJX'. Optional.
//            If longer than 3 characters only the first 3 characters are taken.
//            [string] as_ext. File name extension, e.g. '.rtf'. If not specified
//            the extension '.tmp' will be used.
//
// RETURN:     [string]. Unique file name (path including), or empty string on error.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-03-29  Davros       Initial coding.
// -----------------------------------------------------------------------------

string ls_prefix, ls_tmpfile, ls_file, ls_tmpext
uint lui_ret, lui_unique

lui_unique = 0
ls_tmpfile = Space(260)
ls_tmpext = ".tmp"
ls_file = ""

lui_ret = GetTempFileName(as_dir, as_prefix, lui_unique, ls_tmpfile)
if ((lui_ret <> 0) and (Lower(Right(ls_tmpfile, Len(ls_tmpext))) = ls_tmpext)) then
	// Created filename always has extension .tmp.
	if as_ext <> ls_tmpext then
		// Rename extension.
		ls_file = Left(ls_tmpfile, Len(ls_tmpfile) - Len(ls_tmpext)) + as_ext
		if FileMove(ls_tmpfile, ls_file) <> SUCCESS then
			// Error.
			ls_file = ""
		end if
	end if
end if

return ls_file

end function

public function boolean of_is_even (long al_num);// -----------------------------------------------------------------------------
// SCRIPT:     n_pbh_service.of_Is_even()
//
// PURPOSE:    Report if the supplied number is even.
//
// ARGUMENTS:  [long] al_num. The number to check.
//
// RETURN:     [boolean]. True if number is even, false if not.
//
// DATE        PROG/ID      DESCRIPTION OF CHANGE / REASON
// ----------  --------     ----------------------------------------------------
// 2018-06-16  Davros       Initial coding.
// -----------------------------------------------------------------------------

boolean lb_ret

if Mod(al_num, 2) = 0 then
	lb_ret = true
else
	lb_ret = false
end if

return lb_ret

end function

on n_pbh_service.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_pbh_service.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

