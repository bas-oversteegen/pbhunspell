# pbhunspell (Hunspell for PowerBuilder)
PBHunspell is a wrapper to the C/C++ spelling libraries Hunspell (spellcheck), LibHnj aka Hyphen (hyphenation and justification) and MyThes (thesaurus). It consists of the files pbhunspell.dll and pbhunspell.pbl that run on Windows operating systems (x86 and x64), version 7 and higher.

* pbhunspell.dll is a Win32 dynamic link library with export functions that access spelling objects through integer handles instead of through object pointers. Additionally these functions provide some error feedback. Although intended to work with PowerBuilder, pbhunspell.dll can also be used by other programming languages that can't reference C++ class pointers. The export functions PBHunspell_spellcheck_rtf_file_H() and PBHunspell_unspellcheck_rtf_file_H() are specifically designed to integrate with the internal RichTextEdit controls of PowerBuilder 12.X (TX Text Control) and 17.0 (TE Edit Control), but may also be usable to spellcheck rtf documents of other RichTextEdit controls.
* pbhunspell.pbl is a PowerBuilder pibble that contains a spelling engine object, a RichTextEdit control with spellcheck capabilities and test windows.

## Limitations
### 1. Spellcheck rtf parser
* Spellcheck of input fields is always skipped.
* The available spellcheck highlighting options are foreground color and background color. Other styles like wave underlines are not supported.
* Spellcheck of colored text is skipped if it has the current highlighting style (foreground color or background color).
* In the rtf document, the spellcheck color can't be used for anything else but spelling checking.
* Specifically developed for built-in RichTextEdit control of PowerBuilder 12.X (TX Text Control) and 17.0 (TE Edit control).

### 2. Interface
* Currently supported interface languages are Dutch and English.

## Known issues
* Functions Hunspell_generate() and Hunspell_generate2() are technically implemented but always return an empty list. This issue has been reported to hunspell on github (https://github.com/hunspell/hunspell/issues/554).
* For right-to-left languages, the text is shown from left-to-right in spellcheck mode. This problem applies to PowerBuilder 12.X (TX Text Control) but not to 17.0 (TE Edit control).
* Suggestion and synonym lists are not shown for words selected in the header and footer of RichTextEdit controls. This problem applies to PowerBuilder 12.X (TX Text Control) but not to 17.0 (TE Edit control).

## Quick start
* Download '.\pbh\Release\pbhunspell.dll' and '.\pbl\pbhunspell.pbl' and put them in the directory of your PowerBuilder 12.X or 17.0 application.
* Add pbhunspell.pbl to the library list of the application's target.
* Full build the target.
* Download spelling dictionaries, for example from https://extensions.libreoffice.org/extensions (search for "dictionaries"). For each language you will need:
  - Hunspell: .aff and .dic file. UTF-8 dictionaries are available at https://github.com/titoBouzout/Dictionaries
  - Hyphen: .dic file (content differs from Hunspell .dic file)
  - MyThes: .dat and .idx file
* Have a look at the Clicked event of the buttons on w_pbh_test_engine and at the Open event of w_pbh_test_spellchecker.

## Release notes
Version PBHunspell release: 1.0.0
Version pbhunspell.dll: 1.0.0.0 (see properties of pbhunspell.dll in Windows file explorer)
Version pbhunspell.pbl: 1.0.0.0 (see properties of pbhunspell.pbl in PowerBuilder system tree)
* Initial version.
