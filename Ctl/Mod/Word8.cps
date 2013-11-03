﻿MODULE CtlWord8;
(**
    project    = "BlackBox"
    organization    = "www.oberon.ch"
    contributors    = "Oberon microsystems"
    version    = "System/Rsrc/About"
    copyright    = "System/Rsrc/About"
    license    = "Docu/BB-License"
    changes    = ""
    issues    = ""

**)

    (* Microsoft Word 8.0 Object Library, help: E:\MsOffice\Office\VBAWRD8.HLP, id: 0 *)
    (* guid: {00020905-0000-0000-C000-000000000046}, lcid: 1033, syskind: win32, version: 8.0 *)

    IMPORT CtlT, CtlC, CtlOffice, CtlVBIDE;

    CONST
        (* WdMailSystem *)
            wdNoMailSystem* = 0;
            wdMAPI* = 1;
            wdPowerTalk* = 2;
            wdMAPIandPowerTalk* = 3;
        (* WdTemplateType *)
            wdNormalTemplate* = 0;
            wdGlobalTemplate* = 1;
            wdAttachedTemplate* = 2;
        (* WdContinue *)
            wdContinueDisabled* = 0;
            wdResetList* = 1;
            wdContinueList* = 2;
        (* WdIMEMode, hidden *)
            wdIMEModeNoControl* = 0;
            wdIMEModeOn* = 1;
            wdIMEModeOff* = 2;
            wdIMEModeHiragana* = 4;
            wdIMEModeKatakana* = 5;
            wdIMEModeKatakanaHalf* = 6;
            wdIMEModeAlphaFull* = 7;
            wdIMEModeAlpha* = 8;
            wdIMEModeHangulFull* = 9;
            wdIMEModeHangul* = 10;
        (* WdBaselineAlignment, hidden *)
            wdBaselineAlignTop* = 0;
            wdBaselineAlignCenter* = 1;
            wdBaselineAlignBaseline* = 2;
            wdBaselineAlignFarEast50* = 3;
            wdBaselineAlignAuto* = 4;
        (* WdIndexFilter, hidden *)
            wdIndexFilterNone* = 0;
            wdIndexFilterAiueo* = 1;
            wdIndexFilterAkasatana* = 2;
            wdIndexFilterChosung* = 3;
            wdIndexFilterLow* = 4;
            wdIndexFilterMedium* = 5;
            wdIndexFilterFull* = 6;
        (* WdIndexSortBy, hidden *)
            wdIndexSortByStroke* = 0;
            wdIndexSortBySyllable* = 1;
        (* WdJustificationMode, hidden *)
            wdJustificationModeExpand* = 0;
            wdJustificationModeCompress* = 1;
            wdJustificationModeCompressKana* = 2;
        (* WdFarEastLineBreakLevel, hidden *)
            wdFarEastLineBreakLevelNormal* = 0;
            wdFarEastLineBreakLevelStrict* = 1;
            wdFarEastLineBreakLevelCustom* = 2;
        (* WdMultipleWordConversionsMode, hidden *)
            wdHangulToHanja* = 0;
            wdHanjaToHangul* = 1;
        (* WdColorIndex *)
            wdAuto* = 0;
            wdBlack* = 1;
            wdBlue* = 2;
            wdTurquoise* = 3;
            wdBrightGreen* = 4;
            wdPink* = 5;
            wdRed* = 6;
            wdYellow* = 7;
            wdWhite* = 8;
            wdDarkBlue* = 9;
            wdTeal* = 10;
            wdGreen* = 11;
            wdViolet* = 12;
            wdDarkRed* = 13;
            wdDarkYellow* = 14;
            wdGray50* = 15;
            wdGray25* = 16;
            wdByAuthor* = -1;
            wdNoHighlight* = 0;
        (* WdTextureIndex *)
            wdTextureNone* = 0;
            wdTexture2Pt5Percent* = 25;
            wdTexture5Percent* = 50;
            wdTexture7Pt5Percent* = 75;
            wdTexture10Percent* = 100;
            wdTexture12Pt5Percent* = 125;
            wdTexture15Percent* = 150;
            wdTexture17Pt5Percent* = 175;
            wdTexture20Percent* = 200;
            wdTexture22Pt5Percent* = 225;
            wdTexture25Percent* = 250;
            wdTexture27Pt5Percent* = 275;
            wdTexture30Percent* = 300;
            wdTexture32Pt5Percent* = 325;
            wdTexture35Percent* = 350;
            wdTexture37Pt5Percent* = 375;
            wdTexture40Percent* = 400;
            wdTexture42Pt5Percent* = 425;
            wdTexture45Percent* = 450;
            wdTexture47Pt5Percent* = 475;
            wdTexture50Percent* = 500;
            wdTexture52Pt5Percent* = 525;
            wdTexture55Percent* = 550;
            wdTexture57Pt5Percent* = 575;
            wdTexture60Percent* = 600;
            wdTexture62Pt5Percent* = 625;
            wdTexture65Percent* = 650;
            wdTexture67Pt5Percent* = 675;
            wdTexture70Percent* = 700;
            wdTexture72Pt5Percent* = 725;
            wdTexture75Percent* = 750;
            wdTexture77Pt5Percent* = 775;
            wdTexture80Percent* = 800;
            wdTexture82Pt5Percent* = 825;
            wdTexture85Percent* = 850;
            wdTexture87Pt5Percent* = 875;
            wdTexture90Percent* = 900;
            wdTexture92Pt5Percent* = 925;
            wdTexture95Percent* = 950;
            wdTexture97Pt5Percent* = 975;
            wdTextureSolid* = 1000;
            wdTextureDarkHorizontal* = -1;
            wdTextureDarkVertical* = -2;
            wdTextureDarkDiagonalDown* = -3;
            wdTextureDarkDiagonalUp* = -4;
            wdTextureDarkCross* = -5;
            wdTextureDarkDiagonalCross* = -6;
            wdTextureHorizontal* = -7;
            wdTextureVertical* = -8;
            wdTextureDiagonalDown* = -9;
            wdTextureDiagonalUp* = -10;
            wdTextureCross* = -11;
            wdTextureDiagonalCross* = -12;
        (* WdUnderline *)
            wdUnderlineNone* = 0;
            wdUnderlineSingle* = 1;
            wdUnderlineWords* = 2;
            wdUnderlineDouble* = 3;
            wdUnderlineDotted* = 4;
            wdUnderlineThick* = 6;
            wdUnderlineDash* = 7;
            wdUnderlineDotDash* = 9;
            wdUnderlineDotDotDash* = 10;
            wdUnderlineWavy* = 11;
        (* WdEmphasisMark, hidden *)
            wdEmphasisMarkNone* = 0;
            wdEmphasisMarkOverSolidCircle* = 1;
            wdEmphasisMarkOverComma* = 2;
            wdEmphasisMarkOverWhiteCircle* = 3;
            wdEmphasisMarkUnderSolidCircle* = 4;
        (* WdInternationalIndex *)
            wdListSeparator* = 17;
            wdDecimalSeparator* = 18;
            wdThousandsSeparator* = 19;
            wdCurrencyCode* = 20;
            wd24HourClock* = 21;
            wdInternationalAM* = 22;
            wdInternationalPM* = 23;
            wdTimeSeparator* = 24;
            wdDateSeparator* = 25;
            wdProductLanguageID* = 26;
        (* WdAutoMacros *)
            wdAutoExec* = 0;
            wdAutoNew* = 1;
            wdAutoOpen* = 2;
            wdAutoClose* = 3;
            wdAutoExit* = 4;
        (* WdCaptionPosition *)
            wdCaptionPositionAbove* = 0;
            wdCaptionPositionBelow* = 1;
        (* WdCountry *)
            wdUS* = 1;
            wdCanada* = 2;
            wdLatinAmerica* = 3;
            wdNetherlands* = 31;
            wdFrance* = 33;
            wdSpain* = 34;
            wdItaly* = 39;
            wdUK* = 44;
            wdDenmark* = 45;
            wdSweden* = 46;
            wdNorway* = 47;
            wdGermany* = 49;
            wdPeru* = 51;
            wdMexico* = 52;
            wdArgentina* = 54;
            wdBrazil* = 55;
            wdChile* = 56;
            wdVenezuela* = 58;
            wdJapan* = 81;
            wdTaiwan* = 886;
            wdChina* = 86;
            wdKorea* = 82;
            wdFinland* = 358;
            wdIceland* = 354;
        (* WdHeadingSeparator *)
            wdHeadingSeparatorNone* = 0;
            wdHeadingSeparatorBlankLine* = 1;
            wdHeadingSeparatorLetter* = 2;
            wdHeadingSeparatorLetterLow* = 3;
            wdHeadingSeparatorLetterFull* = 4;
        (* WdSeparatorType *)
            wdSeparatorHyphen* = 0;
            wdSeparatorPeriod* = 1;
            wdSeparatorColon* = 2;
            wdSeparatorEmDash* = 3;
            wdSeparatorEnDash* = 4;
        (* WdPageNumberAlignment *)
            wdAlignPageNumberLeft* = 0;
            wdAlignPageNumberCenter* = 1;
            wdAlignPageNumberRight* = 2;
            wdAlignPageNumberInside* = 3;
            wdAlignPageNumberOutside* = 4;
        (* WdBorderType *)
            wdBorderTop* = -1;
            wdBorderLeft* = -2;
            wdBorderBottom* = -3;
            wdBorderRight* = -4;
            wdBorderHorizontal* = -5;
            wdBorderVertical* = -6;
        (* WdBorderTypeHID, hidden *)
            wdBorderDiagonalDown* = -7;
            wdBorderDiagonalUp* = -8;
        (* WdFramePosition *)
            wdFrameTop* = -999999;
            wdFrameLeft* = -999998;
            wdFrameBottom* = -999997;
            wdFrameRight* = -999996;
            wdFrameCenter* = -999995;
            wdFrameInside* = -999994;
            wdFrameOutside* = -999993;
        (* WdAnimation *)
            wdAnimationNone* = 0;
            wdAnimationLasVegasLights* = 1;
            wdAnimationBlinkingBackground* = 2;
            wdAnimationSparkleText* = 3;
            wdAnimationMarchingBlackAnts* = 4;
            wdAnimationMarchingRedAnts* = 5;
            wdAnimationShimmer* = 6;
        (* WdCharacterCase *)
            wdNextCase* = -1;
            wdLowerCase* = 0;
            wdUpperCase* = 1;
            wdTitleWord* = 2;
            wdTitleSentence* = 4;
            wdToggleCase* = 5;
        (* WdCharacterCaseHID, hidden *)
            wdHalfWidth* = 6;
            wdFullWidth* = 7;
            wdKatakana* = 8;
            wdHiragana* = 9;
        (* WdSummaryMode *)
            wdSummaryModeHighlight* = 0;
            wdSummaryModeHideAllButSummary* = 1;
            wdSummaryModeInsert* = 2;
            wdSummaryModeCreateNew* = 3;
        (* WdSummaryLength *)
            wd10Sentences* = -2;
            wd20Sentences* = -3;
            wd100Words* = -4;
            wd500Words* = -5;
            wd10Percent* = -6;
            wd25Percent* = -7;
            wd50Percent* = -8;
            wd75Percent* = -9;
        (* WdStyleType *)
            wdStyleTypeParagraph* = 1;
            wdStyleTypeCharacter* = 2;
        (* WdUnits *)
            wdCharacter* = 1;
            wdWord* = 2;
            wdSentence* = 3;
            wdParagraph* = 4;
            wdLine* = 5;
            wdStory* = 6;
            wdScreen* = 7;
            wdSection* = 8;
            wdColumn* = 9;
            wdRow* = 10;
            wdWindow* = 11;
            wdCell* = 12;
            wdCharacterFormatting* = 13;
            wdParagraphFormatting* = 14;
            wdTable* = 15;
            wdItem* = 16;
        (* WdGoToItem *)
            wdGoToBookmark* = -1;
            wdGoToSection* = 0;
            wdGoToPage* = 1;
            wdGoToTable* = 2;
            wdGoToLine* = 3;
            wdGoToFootnote* = 4;
            wdGoToEndnote* = 5;
            wdGoToComment* = 6;
            wdGoToField* = 7;
            wdGoToGraphic* = 8;
            wdGoToObject* = 9;
            wdGoToEquation* = 10;
            wdGoToHeading* = 11;
            wdGoToPercent* = 12;
            wdGoToSpellingError* = 13;
            wdGoToGrammaticalError* = 14;
            wdGoToProofreadingError* = 15;
        (* WdGoToDirection *)
            wdGoToFirst* = 1;
            wdGoToLast* = -1;
            wdGoToNext* = 2;
            wdGoToRelative* = 2;
            wdGoToPrevious* = 3;
            wdGoToAbsolute* = 1;
        (* WdCollapseDirection *)
            wdCollapseStart* = 1;
            wdCollapseEnd* = 0;
        (* WdRowHeightRule *)
            wdRowHeightAuto* = 0;
            wdRowHeightAtLeast* = 1;
            wdRowHeightExactly* = 2;
        (* WdFrameSizeRule *)
            wdFrameAuto* = 0;
            wdFrameAtLeast* = 1;
            wdFrameExact* = 2;
        (* WdInsertCells *)
            wdInsertCellsShiftRight* = 0;
            wdInsertCellsShiftDown* = 1;
            wdInsertCellsEntireRow* = 2;
            wdInsertCellsEntireColumn* = 3;
        (* WdDeleteCells *)
            wdDeleteCellsShiftLeft* = 0;
            wdDeleteCellsShiftUp* = 1;
            wdDeleteCellsEntireRow* = 2;
            wdDeleteCellsEntireColumn* = 3;
        (* WdListApplyTo *)
            wdListApplyToWholeList* = 0;
            wdListApplyToThisPointForward* = 1;
            wdListApplyToSelection* = 2;
        (* WdAlertLevel *)
            wdAlertsNone* = 0;
            wdAlertsMessageBox* = -2;
            wdAlertsAll* = -1;
        (* WdCursorType *)
            wdCursorWait* = 0;
            wdCursorIBeam* = 1;
            wdCursorNormal* = 2;
            wdCursorNorthwestArrow* = 3;
        (* WdEnableCancelKey *)
            wdCancelDisabled* = 0;
            wdCancelInterrupt* = 1;
        (* WdRulerStyle *)
            wdAdjustNone* = 0;
            wdAdjustProportional* = 1;
            wdAdjustFirstColumn* = 2;
            wdAdjustSameWidth* = 3;
        (* WdParagraphAlignment *)
            wdAlignParagraphLeft* = 0;
            wdAlignParagraphCenter* = 1;
            wdAlignParagraphRight* = 2;
            wdAlignParagraphJustify* = 3;
        (* WdParagraphAlignmentHID, hidden *)
            wdAlignParagraphDistribute* = 4;
        (* WdListLevelAlignment *)
            wdListLevelAlignLeft* = 0;
            wdListLevelAlignCenter* = 1;
            wdListLevelAlignRight* = 2;
        (* WdRowAlignment *)
            wdAlignRowLeft* = 0;
            wdAlignRowCenter* = 1;
            wdAlignRowRight* = 2;
        (* WdTabAlignment *)
            wdAlignTabLeft* = 0;
            wdAlignTabCenter* = 1;
            wdAlignTabRight* = 2;
            wdAlignTabDecimal* = 3;
            wdAlignTabBar* = 4;
            wdAlignTabList* = 6;
        (* WdVerticalAlignment *)
            wdAlignVerticalTop* = 0;
            wdAlignVerticalCenter* = 1;
            wdAlignVerticalJustify* = 2;
            wdAlignVerticalBottom* = 3;
        (* WdCellVerticalAlignment *)
            wdCellAlignVerticalTop* = 0;
            wdCellAlignVerticalCenter* = 1;
            wdCellAlignVerticalBottom* = 3;
        (* WdTrailingCharacter *)
            wdTrailingTab* = 0;
            wdTrailingSpace* = 1;
            wdTrailingNone* = 2;
        (* WdListGalleryType *)
            wdBulletGallery* = 1;
            wdNumberGallery* = 2;
            wdOutlineNumberGallery* = 3;
        (* WdListNumberStyle *)
            wdListNumberStyleArabic* = 0;
            wdListNumberStyleUppercaseRoman* = 1;
            wdListNumberStyleLowercaseRoman* = 2;
            wdListNumberStyleUppercaseLetter* = 3;
            wdListNumberStyleLowercaseLetter* = 4;
            wdListNumberStyleOrdinal* = 5;
            wdListNumberStyleCardinalText* = 6;
            wdListNumberStyleOrdinalText* = 7;
            wdListNumberStyleArabicLZ* = 22;
            wdListNumberStyleBullet* = 23;
            wdListNumberStyleLegal* = 253;
            wdListNumberStyleLegalLZ* = 254;
            wdListNumberStyleNone* = 255;
        (* WdListNumberStyleHID, hidden *)
            wdListNumberStyleKanji* = 10;
            wdListNumberStyleKanjiDigit* = 11;
            wdListNumberStyleAiueoHalfWidth* = 12;
            wdListNumberStyleIrohaHalfWidth* = 13;
            wdListNumberStyleArabicFullWidth* = 14;
            wdListNumberStyleKanjiTraditional* = 16;
            wdListNumberStyleKanjiTraditional2* = 17;
            wdListNumberStyleNumberInCircle* = 18;
            wdListNumberStyleAiueo* = 20;
            wdListNumberStyleIroha* = 21;
            wdListNumberStyleGanada* = 24;
            wdListNumberStyleChosung* = 25;
            wdListNumberStyleGBNum1* = 26;
            wdListNumberStyleGBNum2* = 27;
            wdListNumberStyleGBNum3* = 28;
            wdListNumberStyleGBNum4* = 29;
            wdListNumberStyleZodiac1* = 30;
            wdListNumberStyleZodiac2* = 31;
            wdListNumberStyleZodiac3* = 32;
            wdListNumberStyleTradChinNum1* = 33;
            wdListNumberStyleTradChinNum2* = 34;
            wdListNumberStyleTradChinNum3* = 35;
            wdListNumberStyleTradChinNum4* = 36;
            wdListNumberStyleSimpChinNum1* = 37;
            wdListNumberStyleSimpChinNum2* = 38;
            wdListNumberStyleSimpChinNum3* = 39;
            wdListNumberStyleSimpChinNum4* = 40;
            wdListNumberStyleHanjaRead* = 41;
            wdListNumberStyleHanjaReadDigit* = 42;
            wdListNumberStyleHangul* = 43;
            wdListNumberStyleHanja* = 44;
        (* WdNoteNumberStyle *)
            wdNoteNumberStyleArabic* = 0;
            wdNoteNumberStyleUppercaseRoman* = 1;
            wdNoteNumberStyleLowercaseRoman* = 2;
            wdNoteNumberStyleUppercaseLetter* = 3;
            wdNoteNumberStyleLowercaseLetter* = 4;
            wdNoteNumberStyleSymbol* = 9;
        (* WdNoteNumberStyleHID, hidden *)
            wdNoteNumberStyleArabicFullWidth* = 14;
            wdNoteNumberStyleKanji* = 10;
            wdNoteNumberStyleKanjiDigit* = 11;
            wdNoteNumberStyleKanjiTraditional* = 16;
            wdNoteNumberStyleNumberInCircle* = 18;
            wdNoteNumberStyleHanjaRead* = 41;
            wdNoteNumberStyleHanjaReadDigit* = 42;
            wdNoteNumberStyleTradChinNum1* = 33;
            wdNoteNumberStyleTradChinNum2* = 34;
            wdNoteNumberStyleSimpChinNum1* = 37;
            wdNoteNumberStyleSimpChinNum2* = 38;
        (* WdCaptionNumberStyle *)
            wdCaptionNumberStyleArabic* = 0;
            wdCaptionNumberStyleUppercaseRoman* = 1;
            wdCaptionNumberStyleLowercaseRoman* = 2;
            wdCaptionNumberStyleUppercaseLetter* = 3;
            wdCaptionNumberStyleLowercaseLetter* = 4;
        (* WdCaptionNumberStyleHID, hidden *)
            wdCaptionNumberStyleArabicFullWidth* = 14;
            wdCaptionNumberStyleKanji* = 10;
            wdCaptionNumberStyleKanjiDigit* = 11;
            wdCaptionNumberStyleKanjiTraditional* = 16;
            wdCaptionNumberStyleNumberInCircle* = 18;
            wdCaptionNumberStyleGanada* = 24;
            wdCaptionNumberStyleChosung* = 25;
            wdCaptionNumberStyleZodiac1* = 30;
            wdCaptionNumberStyleZodiac2* = 31;
            wdCaptionNumberStyleHanjaRead* = 41;
            wdCaptionNumberStyleHanjaReadDigit* = 42;
            wdCaptionNumberStyleTradChinNum2* = 34;
            wdCaptionNumberStyleTradChinNum3* = 35;
            wdCaptionNumberStyleSimpChinNum2* = 38;
            wdCaptionNumberStyleSimpChinNum3* = 39;
        (* WdPageNumberStyle *)
            wdPageNumberStyleArabic* = 0;
            wdPageNumberStyleUppercaseRoman* = 1;
            wdPageNumberStyleLowercaseRoman* = 2;
            wdPageNumberStyleUppercaseLetter* = 3;
            wdPageNumberStyleLowercaseLetter* = 4;
        (* WdPageNumberStyleHID, hidden *)
            wdPageNumberStyleArabicFullWidth* = 14;
            wdPageNumberStyleKanji* = 10;
            wdPageNumberStyleKanjiDigit* = 11;
            wdPageNumberStyleKanjiTraditional* = 16;
            wdPageNumberStyleNumberInCircle* = 18;
            wdPageNumberStyleHanjaRead* = 41;
            wdPageNumberStyleHanjaReadDigit* = 42;
            wdPageNumberStyleTradChinNum1* = 33;
            wdPageNumberStyleTradChinNum2* = 34;
            wdPageNumberStyleSimpChinNum1* = 37;
            wdPageNumberStyleSimpChinNum2* = 38;
        (* WdStatistic *)
            wdStatisticWords* = 0;
            wdStatisticLines* = 1;
            wdStatisticPages* = 2;
            wdStatisticCharacters* = 3;
            wdStatisticParagraphs* = 4;
            wdStatisticCharactersWithSpaces* = 5;
        (* WdStatisticHID, hidden *)
            wdStatisticFarEastCharacters* = 6;
        (* WdBuiltInProperty *)
            wdPropertyTitle* = 1;
            wdPropertySubject* = 2;
            wdPropertyAuthor* = 3;
            wdPropertyKeywords* = 4;
            wdPropertyComments* = 5;
            wdPropertyTemplate* = 6;
            wdPropertyLastAuthor* = 7;
            wdPropertyRevision* = 8;
            wdPropertyAppName* = 9;
            wdPropertyTimeLastPrinted* = 10;
            wdPropertyTimeCreated* = 11;
            wdPropertyTimeLastSaved* = 12;
            wdPropertyVBATotalEdit* = 13;
            wdPropertyPages* = 14;
            wdPropertyWords* = 15;
            wdPropertyCharacters* = 16;
            wdPropertySecurity* = 17;
            wdPropertyCategory* = 18;
            wdPropertyFormat* = 19;
            wdPropertyManager* = 20;
            wdPropertyCompany* = 21;
            wdPropertyBytes* = 22;
            wdPropertyLines* = 23;
            wdPropertyParas* = 24;
            wdPropertySlides* = 25;
            wdPropertyNotes* = 26;
            wdPropertyHiddenSlides* = 27;
            wdPropertyMMClips* = 28;
            wdPropertyHyperlinkBase* = 29;
            wdPropertyCharsWSpaces* = 30;
        (* WdLineSpacing *)
            wdLineSpaceSingle* = 0;
            wdLineSpace1pt5* = 1;
            wdLineSpaceDouble* = 2;
            wdLineSpaceAtLeast* = 3;
            wdLineSpaceExactly* = 4;
            wdLineSpaceMultiple* = 5;
        (* WdNumberType *)
            wdNumberParagraph* = 1;
            wdNumberListNum* = 2;
            wdNumberAllNumbers* = 3;
        (* WdListType *)
            wdListNoNumbering* = 0;
            wdListListNumOnly* = 1;
            wdListBullet* = 2;
            wdListSimpleNumbering* = 3;
            wdListOutlineNumbering* = 4;
            wdListMixedNumbering* = 5;
        (* WdStoryType *)
            wdMainTextStory* = 1;
            wdFootnotesStory* = 2;
            wdEndnotesStory* = 3;
            wdCommentsStory* = 4;
            wdTextFrameStory* = 5;
            wdEvenPagesHeaderStory* = 6;
            wdPrimaryHeaderStory* = 7;
            wdEvenPagesFooterStory* = 8;
            wdPrimaryFooterStory* = 9;
            wdFirstPageHeaderStory* = 10;
            wdFirstPageFooterStory* = 11;
        (* WdSaveFormat *)
            wdFormatDocument* = 0;
            wdFormatTemplate* = 1;
            wdFormatText* = 2;
            wdFormatTextLineBreaks* = 3;
            wdFormatDOSText* = 4;
            wdFormatDOSTextLineBreaks* = 5;
            wdFormatRTF* = 6;
            wdFormatUnicodeText* = 7;
        (* WdOpenFormat *)
            wdOpenFormatAuto* = 0;
            wdOpenFormatDocument* = 1;
            wdOpenFormatTemplate* = 2;
            wdOpenFormatRTF* = 3;
            wdOpenFormatText* = 4;
            wdOpenFormatUnicodeText* = 5;
        (* WdHeaderFooterIndex *)
            wdHeaderFooterPrimary* = 1;
            wdHeaderFooterFirstPage* = 2;
            wdHeaderFooterEvenPages* = 3;
        (* WdTocFormat *)
            wdTOCTemplate* = 0;
            wdTOCClassic* = 1;
            wdTOCDistinctive* = 2;
            wdTOCFancy* = 3;
            wdTOCModern* = 4;
            wdTOCFormal* = 5;
            wdTOCSimple* = 6;
        (* WdTofFormat *)
            wdTOFTemplate* = 0;
            wdTOFClassic* = 1;
            wdTOFDistinctive* = 2;
            wdTOFCentered* = 3;
            wdTOFFormal* = 4;
            wdTOFSimple* = 5;
        (* WdToaFormat *)
            wdTOATemplate* = 0;
            wdTOAClassic* = 1;
            wdTOADistinctive* = 2;
            wdTOAFormal* = 3;
            wdTOASimple* = 4;
        (* WdLineStyle *)
            wdLineStyleNone* = 0;
            wdLineStyleSingle* = 1;
            wdLineStyleDot* = 2;
            wdLineStyleDashSmallGap* = 3;
            wdLineStyleDashLargeGap* = 4;
            wdLineStyleDashDot* = 5;
            wdLineStyleDashDotDot* = 6;
            wdLineStyleDouble* = 7;
            wdLineStyleTriple* = 8;
            wdLineStyleThinThickSmallGap* = 9;
            wdLineStyleThickThinSmallGap* = 10;
            wdLineStyleThinThickThinSmallGap* = 11;
            wdLineStyleThinThickMedGap* = 12;
            wdLineStyleThickThinMedGap* = 13;
            wdLineStyleThinThickThinMedGap* = 14;
            wdLineStyleThinThickLargeGap* = 15;
            wdLineStyleThickThinLargeGap* = 16;
            wdLineStyleThinThickThinLargeGap* = 17;
            wdLineStyleSingleWavy* = 18;
            wdLineStyleDoubleWavy* = 19;
            wdLineStyleDashDotStroked* = 20;
            wdLineStyleEmboss3D* = 21;
            wdLineStyleEngrave3D* = 22;
        (* WdLineWidth *)
            wdLineWidth025pt* = 2;
            wdLineWidth050pt* = 4;
            wdLineWidth075pt* = 6;
            wdLineWidth100pt* = 8;
            wdLineWidth150pt* = 12;
            wdLineWidth225pt* = 18;
            wdLineWidth300pt* = 24;
            wdLineWidth450pt* = 36;
            wdLineWidth600pt* = 48;
        (* WdBreakType *)
            wdSectionBreakNextPage* = 2;
            wdSectionBreakContinuous* = 3;
            wdSectionBreakEvenPage* = 4;
            wdSectionBreakOddPage* = 5;
            wdLineBreak* = 6;
            wdPageBreak* = 7;
            wdColumnBreak* = 8;
        (* WdTabLeader *)
            wdTabLeaderSpaces* = 0;
            wdTabLeaderDots* = 1;
            wdTabLeaderDashes* = 2;
            wdTabLeaderLines* = 3;
        (* WdTabLeaderHID, hidden *)
            wdTabLeaderHeavy* = 4;
            wdTabLeaderMiddleDot* = 5;
        (* WdMeasurementUnits *)
            wdInches* = 0;
            wdCentimeters* = 1;
            wdPoints* = 3;
            wdPicas* = 4;
        (* WdMeasurementUnitsHID, hidden *)
            wdMillimeters* = 2;
        (* WdDropPosition *)
            wdDropNone* = 0;
            wdDropNormal* = 1;
            wdDropMargin* = 2;
        (* WdNumberingRule *)
            wdRestartContinuous* = 0;
            wdRestartSection* = 1;
            wdRestartPage* = 2;
        (* WdFootnoteLocation *)
            wdBottomOfPage* = 0;
            wdBeneathText* = 1;
        (* WdEndnoteLocation *)
            wdEndOfSection* = 0;
            wdEndOfDocument* = 1;
        (* WdSortSeparator *)
            wdSortSeparateByTabs* = 0;
            wdSortSeparateByCommas* = 1;
            wdSortSeparateByDefaultTableSeparator* = 2;
        (* WdTableFieldSeparator *)
            wdSeparateByParagraphs* = 0;
            wdSeparateByTabs* = 1;
            wdSeparateByCommas* = 2;
            wdSeparateByDefaultListSeparator* = 3;
        (* WdSortFieldType *)
            wdSortFieldAlphanumeric* = 0;
            wdSortFieldNumeric* = 1;
            wdSortFieldDate* = 2;
        (* WdSortFieldTypeHID, hidden *)
            wdSortFieldSyllable* = 3;
            wdSortFieldJapanJIS* = 4;
            wdSortFieldStroke* = 5;
            wdSortFieldKoreaKS* = 6;
        (* WdSortOrder *)
            wdSortOrderAscending* = 0;
            wdSortOrderDescending* = 1;
        (* WdTableFormat *)
            wdTableFormatNone* = 0;
            wdTableFormatSimple1* = 1;
            wdTableFormatSimple2* = 2;
            wdTableFormatSimple3* = 3;
            wdTableFormatClassic1* = 4;
            wdTableFormatClassic2* = 5;
            wdTableFormatClassic3* = 6;
            wdTableFormatClassic4* = 7;
            wdTableFormatColorful1* = 8;
            wdTableFormatColorful2* = 9;
            wdTableFormatColorful3* = 10;
            wdTableFormatColumns1* = 11;
            wdTableFormatColumns2* = 12;
            wdTableFormatColumns3* = 13;
            wdTableFormatColumns4* = 14;
            wdTableFormatColumns5* = 15;
            wdTableFormatGrid1* = 16;
            wdTableFormatGrid2* = 17;
            wdTableFormatGrid3* = 18;
            wdTableFormatGrid4* = 19;
            wdTableFormatGrid5* = 20;
            wdTableFormatGrid6* = 21;
            wdTableFormatGrid7* = 22;
            wdTableFormatGrid8* = 23;
            wdTableFormatList1* = 24;
            wdTableFormatList2* = 25;
            wdTableFormatList3* = 26;
            wdTableFormatList4* = 27;
            wdTableFormatList5* = 28;
            wdTableFormatList6* = 29;
            wdTableFormatList7* = 30;
            wdTableFormatList8* = 31;
            wdTableFormat3DEffects1* = 32;
            wdTableFormat3DEffects2* = 33;
            wdTableFormat3DEffects3* = 34;
            wdTableFormatContemporary* = 35;
            wdTableFormatElegant* = 36;
            wdTableFormatProfessional* = 37;
            wdTableFormatSubtle1* = 38;
            wdTableFormatSubtle2* = 39;
        (* WdTableFormatApply *)
            wdTableFormatApplyBorders* = 1;
            wdTableFormatApplyShading* = 2;
            wdTableFormatApplyFont* = 4;
            wdTableFormatApplyColor* = 8;
            wdTableFormatApplyAutoFit* = 16;
            wdTableFormatApplyHeadingRows* = 32;
            wdTableFormatApplyLastRow* = 64;
            wdTableFormatApplyFirstColumn* = 128;
            wdTableFormatApplyLastColumn* = 256;
        (* WdLanguageID *)
            wdLanguageNone* = 0;
            wdNoProofing* = 1024;
            wdDanish* = 1030;
            wdGerman* = 1031;
            wdSwissGerman* = 2055;
            wdEnglishAUS* = 3081;
            wdEnglishUK* = 2057;
            wdEnglishUS* = 1033;
            wdEnglishCanadian* = 4105;
            wdEnglishNewZealand* = 5129;
            wdEnglishSouthAfrica* = 7177;
            wdSpanish* = 1034;
            wdFrench* = 1036;
            wdFrenchCanadian* = 3084;
            wdItalian* = 1040;
            wdDutch* = 1043;
            wdNorwegianBokmol* = 1044;
            wdNorwegianNynorsk* = 2068;
            wdBrazilianPortuguese* = 1046;
            wdPortuguese* = 2070;
            wdFinnish* = 1035;
            wdSwedish* = 1053;
            wdCatalan* = 1027;
            wdGreek* = 1032;
            wdTurkish* = 1055;
            wdRussian* = 1049;
            wdCzech* = 1029;
            wdHungarian* = 1038;
            wdPolish* = 1045;
            wdSlovenian* = 1060;
            wdBasque* = 1069;
            wdMalaysian* = 1086;
            wdJapanese* = 1041;
            wdKorean* = 1042;
            wdSimplifiedChinese* = 2052;
            wdTraditionalChinese* = 1028;
            wdSwissFrench* = 4108;
            wdSesotho* = 1072;
            wdTsonga* = 1073;
            wdTswana* = 1074;
            wdVenda* = 1075;
            wdXhosa* = 1076;
            wdZulu* = 1077;
            wdAfrikaans* = 1078;
            wdArabic* = 1025;
            wdHebrew* = 1037;
            wdSlovak* = 1051;
            wdFarsi* = 1065;
            wdRomanian* = 1048;
            wdCroatian* = 1050;
            wdUkrainian* = 1058;
            wdByelorussian* = 1059;
            wdEstonian* = 1061;
            wdLatvian* = 1062;
            wdMacedonian* = 1071;
            wdSerbianLatin* = 2074;
            wdSerbianCyrillic* = 3098;
            wdIcelandic* = 1039;
            wdBelgianFrench* = 2060;
            wdBelgianDutch* = 2067;
            wdBulgarian* = 1026;
            wdMexicanSpanish* = 2058;
            wdSpanishModernSort* = 3082;
            wdSwissItalian* = 2064;
        (* WdFieldType *)
            wdFieldEmpty* = -1;
            wdFieldRef* = 3;
            wdFieldIndexEntry* = 4;
            wdFieldFootnoteRef* = 5;
            wdFieldSet* = 6;
            wdFieldIf* = 7;
            wdFieldIndex* = 8;
            wdFieldTOCEntry* = 9;
            wdFieldStyleRef* = 10;
            wdFieldRefDoc* = 11;
            wdFieldSequence* = 12;
            wdFieldTOC* = 13;
            wdFieldInfo* = 14;
            wdFieldTitle* = 15;
            wdFieldSubject* = 16;
            wdFieldAuthor* = 17;
            wdFieldKeyWord* = 18;
            wdFieldComments* = 19;
            wdFieldLastSavedBy* = 20;
            wdFieldCreateDate* = 21;
            wdFieldSaveDate* = 22;
            wdFieldPrintDate* = 23;
            wdFieldRevisionNum* = 24;
            wdFieldEditTime* = 25;
            wdFieldNumPages* = 26;
            wdFieldNumWords* = 27;
            wdFieldNumChars* = 28;
            wdFieldFileName* = 29;
            wdFieldTemplate* = 30;
            wdFieldDate* = 31;
            wdFieldTime* = 32;
            wdFieldPage* = 33;
            wdFieldExpression* = 34;
            wdFieldQuote* = 35;
            wdFieldInclude* = 36;
            wdFieldPageRef* = 37;
            wdFieldAsk* = 38;
            wdFieldFillIn* = 39;
            wdFieldData* = 40;
            wdFieldNext* = 41;
            wdFieldNextIf* = 42;
            wdFieldSkipIf* = 43;
            wdFieldMergeRec* = 44;
            wdFieldDDE* = 45;
            wdFieldDDEAuto* = 46;
            wdFieldGlossary* = 47;
            wdFieldPrint* = 48;
            wdFieldFormula* = 49;
            wdFieldGoToButton* = 50;
            wdFieldMacroButton* = 51;
            wdFieldAutoNumOutline* = 52;
            wdFieldAutoNumLegal* = 53;
            wdFieldAutoNum* = 54;
            wdFieldImport* = 55;
            wdFieldLink* = 56;
            wdFieldSymbol* = 57;
            wdFieldEmbed* = 58;
            wdFieldMergeField* = 59;
            wdFieldUserName* = 60;
            wdFieldUserInitials* = 61;
            wdFieldUserAddress* = 62;
            wdFieldBarCode* = 63;
            wdFieldDocVariable* = 64;
            wdFieldSection* = 65;
            wdFieldSectionPages* = 66;
            wdFieldIncludePicture* = 67;
            wdFieldIncludeText* = 68;
            wdFieldFileSize* = 69;
            wdFieldFormTextInput* = 70;
            wdFieldFormCheckBox* = 71;
            wdFieldNoteRef* = 72;
            wdFieldTOA* = 73;
            wdFieldTOAEntry* = 74;
            wdFieldMergeSeq* = 75;
            wdFieldPrivate* = 77;
            wdFieldDatabase* = 78;
            wdFieldAutoText* = 79;
            wdFieldCompare* = 80;
            wdFieldAddin* = 81;
            wdFieldSubscriber* = 82;
            wdFieldFormDropDown* = 83;
            wdFieldAdvance* = 84;
            wdFieldDocProperty* = 85;
            wdFieldOCX* = 87;
            wdFieldHyperlink* = 88;
            wdFieldAutoTextList* = 89;
            wdFieldListNum* = 90;
            wdFieldHTMLActiveX* = 91;
        (* WdBuiltinStyle *)
            wdStyleNormal* = -1;
            wdStyleEnvelopeAddress* = -37;
            wdStyleEnvelopeReturn* = -38;
            wdStyleBodyText* = -67;
            wdStyleHeading1* = -2;
            wdStyleHeading2* = -3;
            wdStyleHeading3* = -4;
            wdStyleHeading4* = -5;
            wdStyleHeading5* = -6;
            wdStyleHeading6* = -7;
            wdStyleHeading7* = -8;
            wdStyleHeading8* = -9;
            wdStyleHeading9* = -10;
            wdStyleIndex1* = -11;
            wdStyleIndex2* = -12;
            wdStyleIndex3* = -13;
            wdStyleIndex4* = -14;
            wdStyleIndex5* = -15;
            wdStyleIndex6* = -16;
            wdStyleIndex7* = -17;
            wdStyleIndex8* = -18;
            wdStyleIndex9* = -19;
            wdStyleTOC1* = -20;
            wdStyleTOC2* = -21;
            wdStyleTOC3* = -22;
            wdStyleTOC4* = -23;
            wdStyleTOC5* = -24;
            wdStyleTOC6* = -25;
            wdStyleTOC7* = -26;
            wdStyleTOC8* = -27;
            wdStyleTOC9* = -28;
            wdStyleNormalIndent* = -29;
            wdStyleFootnoteText* = -30;
            wdStyleCommentText* = -31;
            wdStyleHeader* = -32;
            wdStyleFooter* = -33;
            wdStyleIndexHeading* = -34;
            wdStyleCaption* = -35;
            wdStyleTableOfFigures* = -36;
            wdStyleFootnoteReference* = -39;
            wdStyleCommentReference* = -40;
            wdStyleLineNumber* = -41;
            wdStylePageNumber* = -42;
            wdStyleEndnoteReference* = -43;
            wdStyleEndnoteText* = -44;
            wdStyleTableOfAuthorities* = -45;
            wdStyleMacroText* = -46;
            wdStyleTOAHeading* = -47;
            wdStyleList* = -48;
            wdStyleListBullet* = -49;
            wdStyleListNumber* = -50;
            wdStyleList2* = -51;
            wdStyleList3* = -52;
            wdStyleList4* = -53;
            wdStyleList5* = -54;
            wdStyleListBullet2* = -55;
            wdStyleListBullet3* = -56;
            wdStyleListBullet4* = -57;
            wdStyleListBullet5* = -58;
            wdStyleListNumber2* = -59;
            wdStyleListNumber3* = -60;
            wdStyleListNumber4* = -61;
            wdStyleListNumber5* = -62;
            wdStyleTitle* = -63;
            wdStyleClosing* = -64;
            wdStyleSignature* = -65;
            wdStyleDefaultParagraphFont* = -66;
            wdStyleBodyTextIndent* = -68;
            wdStyleListContinue* = -69;
            wdStyleListContinue2* = -70;
            wdStyleListContinue3* = -71;
            wdStyleListContinue4* = -72;
            wdStyleListContinue5* = -73;
            wdStyleMessageHeader* = -74;
            wdStyleSubtitle* = -75;
            wdStyleSalutation* = -76;
            wdStyleDate* = -77;
            wdStyleBodyTextFirstIndent* = -78;
            wdStyleBodyTextFirstIndent2* = -79;
            wdStyleNoteHeading* = -80;
            wdStyleBodyText2* = -81;
            wdStyleBodyText3* = -82;
            wdStyleBodyTextIndent2* = -83;
            wdStyleBodyTextIndent3* = -84;
            wdStyleBlockQuotation* = -85;
            wdStyleHyperlink* = -86;
            wdStyleHyperlinkFollowed* = -87;
            wdStyleStrong* = -88;
            wdStyleEmphasis* = -89;
            wdStyleNavPane* = -90;
            wdStylePlainText* = -91;
        (* WdWordDialogTab *)
            wdDialogToolsOptionsTabView* = 204;
            wdDialogToolsOptionsTabGeneral* = 203;
            wdDialogToolsOptionsTabEdit* = 224;
            wdDialogToolsOptionsTabPrint* = 208;
            wdDialogToolsOptionsTabSave* = 209;
            wdDialogToolsOptionsTabProofread* = 211;
            wdDialogToolsOptionsTabTrackChanges* = 386;
            wdDialogToolsOptionsTabUserInfo* = 213;
            wdDialogToolsOptionsTabCompatibility* = 525;
            wdDialogToolsOptionsTabFileLocations* = 225;
            wdDialogFilePageSetupTabMargins* = 150000;
            wdDialogFilePageSetupTabPaperSize* = 150001;
            wdDialogFilePageSetupTabPaperSource* = 150002;
            wdDialogFilePageSetupTabLayout* = 150003;
            wdDialogInsertSymbolTabSymbols* = 200000;
            wdDialogInsertSymbolTabSpecialCharacters* = 200001;
            wdDialogNoteOptionsTabAllFootnotes* = 300000;
            wdDialogNoteOptionsTabAllEndnotes* = 300001;
            wdDialogInsertIndexAndTablesTabIndex* = 400000;
            wdDialogInsertIndexAndTablesTabTableOfContents* = 400001;
            wdDialogInsertIndexAndTablesTabTableOfFigures* = 400002;
            wdDialogInsertIndexAndTablesTabTableOfAuthorities* = 400003;
            wdDialogOrganizerTabStyles* = 500000;
            wdDialogOrganizerTabAutoText* = 500001;
            wdDialogOrganizerTabCommandBars* = 500002;
            wdDialogOrganizerTabMacros* = 500003;
            wdDialogFormatFontTabFont* = 600000;
            wdDialogFormatFontTabCharacterSpacing* = 600001;
            wdDialogFormatFontTabAnimation* = 600002;
            wdDialogFormatBordersAndShadingTabBorders* = 700000;
            wdDialogFormatBordersAndShadingTabPageBorder* = 700001;
            wdDialogFormatBordersAndShadingTabShading* = 700002;
            wdDialogToolsEnvelopesAndLabelsTabEnvelopes* = 800000;
            wdDialogToolsEnvelopesAndLabelsTabLabels* = 800001;
            wdDialogFormatParagraphTabIndentsAndSpacing* = 1000000;
            wdDialogFormatParagraphTabTextFlow* = 1000001;
            wdDialogFormatDrawingObjectTabColorsAndLines* = 1200000;
            wdDialogFormatDrawingObjectTabSize* = 1200001;
            wdDialogFormatDrawingObjectTabPosition* = 1200002;
            wdDialogFormatDrawingObjectTabWrapping* = 1200003;
            wdDialogFormatDrawingObjectTabPicture* = 1200004;
            wdDialogFormatDrawingObjectTabTextbox* = 1200005;
            wdDialogToolsAutoCorrectExceptionsTabFirstLetter* = 1400000;
            wdDialogToolsAutoCorrectExceptionsTabInitialCaps* = 1400001;
            wdDialogFormatBulletsAndNumberingTabBulleted* = 1500000;
            wdDialogFormatBulletsAndNumberingTabNumbered* = 1500001;
            wdDialogFormatBulletsAndNumberingTabOutlineNumbered* = 1500002;
            wdDialogLetterWizardTabLetterFormat* = 1600000;
            wdDialogLetterWizardTabRecipientInfo* = 1600001;
            wdDialogLetterWizardTabOtherElements* = 1600002;
            wdDialogLetterWizardTabSenderInfo* = 1600003;
            wdDialogToolsAutoManagerTabAutoCorrect* = 1700000;
            wdDialogToolsAutoManagerTabAutoFormatAsYouType* = 1700001;
            wdDialogToolsAutoManagerTabAutoText* = 1700002;
            wdDialogToolsAutoManagerTabAutoFormat* = 1700003;
        (* WdWordDialogTabHID, hidden *)
            wdDialogToolsOptionsTabTypography* = 739;
            wdDialogToolsOptionsTabFuzzy* = 790;
            wdDialogToolsOptionsTabHangulHanjaConversion* = 786;
            wdDialogFilePageSetupTabCharsLines* = 150004;
            wdDialogFormatParagraphTabTeisai* = 1000002;
            wdDialogToolsAutoCorrectExceptionsTabHangulAndAlphabet* = 1400002;
        (* WdWordDialog *)
            wdDialogHelpAbout* = 9;
            wdDialogHelpWordPerfectHelp* = 10;
            wdDialogHelpWordPerfectHelpOptions* = 511;
            wdDialogFormatChangeCase* = 322;
            wdDialogToolsWordCount* = 228;
            wdDialogDocumentStatistics* = 78;
            wdDialogFileNew* = 79;
            wdDialogFileOpen* = 80;
            wdDialogMailMergeOpenDataSource* = 81;
            wdDialogMailMergeOpenHeaderSource* = 82;
            wdDialogMailMergeUseAddressBook* = 779;
            wdDialogFileSaveAs* = 84;
            wdDialogFileSummaryInfo* = 86;
            wdDialogToolsTemplates* = 87;
            wdDialogOrganizer* = 222;
            wdDialogFilePrint* = 88;
            wdDialogMailMerge* = 676;
            wdDialogMailMergeCheck* = 677;
            wdDialogMailMergeQueryOptions* = 681;
            wdDialogMailMergeFindRecord* = 569;
            wdDialogMailMergeInsertIf* = 4049;
            wdDialogMailMergeInsertNextIf* = 4053;
            wdDialogMailMergeInsertSkipIf* = 4055;
            wdDialogMailMergeInsertFillIn* = 4048;
            wdDialogMailMergeInsertAsk* = 4047;
            wdDialogMailMergeInsertSet* = 4054;
            wdDialogMailMergeHelper* = 680;
            wdDialogLetterWizard* = 821;
            wdDialogFilePrintSetup* = 97;
            wdDialogFileFind* = 99;
            wdDialogMailMergeCreateDataSource* = 642;
            wdDialogMailMergeCreateHeaderSource* = 643;
            wdDialogEditPasteSpecial* = 111;
            wdDialogEditFind* = 112;
            wdDialogEditReplace* = 117;
            wdDialogEditGoToOld* = 811;
            wdDialogEditGoTo* = 896;
            wdDialogCreateAutoText* = 872;
            wdDialogEditAutoText* = 985;
            wdDialogEditLinks* = 124;
            wdDialogEditObject* = 125;
            wdDialogConvertObject* = 392;
            wdDialogTableToText* = 128;
            wdDialogTextToTable* = 127;
            wdDialogTableInsertTable* = 129;
            wdDialogTableInsertCells* = 130;
            wdDialogTableInsertRow* = 131;
            wdDialogTableDeleteCells* = 133;
            wdDialogTableSplitCells* = 137;
            wdDialogTableFormula* = 348;
            wdDialogTableAutoFormat* = 563;
            wdDialogTableFormatCell* = 612;
            wdDialogViewZoom* = 577;
            wdDialogNewToolbar* = 586;
            wdDialogInsertBreak* = 159;
            wdDialogInsertFootnote* = 370;
            wdDialogInsertSymbol* = 162;
            wdDialogInsertPicture* = 163;
            wdDialogInsertFile* = 164;
            wdDialogInsertDateTime* = 165;
            wdDialogInsertField* = 166;
            wdDialogInsertDatabase* = 341;
            wdDialogInsertMergeField* = 167;
            wdDialogInsertBookmark* = 168;
            wdDialogMarkIndexEntry* = 169;
            wdDialogMarkCitation* = 463;
            wdDialogEditTOACategory* = 625;
            wdDialogInsertIndexAndTables* = 473;
            wdDialogInsertIndex* = 170;
            wdDialogInsertTableOfContents* = 171;
            wdDialogMarkTableOfContentsEntry* = 442;
            wdDialogInsertTableOfFigures* = 472;
            wdDialogInsertTableOfAuthorities* = 471;
            wdDialogInsertObject* = 172;
            wdDialogFormatCallout* = 610;
            wdDialogDrawSnapToGrid* = 633;
            wdDialogDrawAlign* = 634;
            wdDialogToolsEnvelopesAndLabels* = 607;
            wdDialogToolsCreateEnvelope* = 173;
            wdDialogToolsCreateLabels* = 489;
            wdDialogToolsProtectDocument* = 503;
            wdDialogToolsProtectSection* = 578;
            wdDialogToolsUnprotectDocument* = 521;
            wdDialogFormatFont* = 174;
            wdDialogFormatParagraph* = 175;
            wdDialogFormatSectionLayout* = 176;
            wdDialogFormatColumns* = 177;
            wdDialogFileDocumentLayout* = 178;
            wdDialogFileMacPageSetup* = 685;
            wdDialogFilePrintOneCopy* = 445;
            wdDialogFileMacPageSetupGX* = 444;
            wdDialogFileMacCustomPageSetupGX* = 737;
            wdDialogFilePageSetup* = 178;
            wdDialogFormatTabs* = 179;
            wdDialogFormatStyle* = 180;
            wdDialogFormatStyleGallery* = 505;
            wdDialogFormatDefineStyleFont* = 181;
            wdDialogFormatDefineStylePara* = 182;
            wdDialogFormatDefineStyleTabs* = 183;
            wdDialogFormatDefineStyleFrame* = 184;
            wdDialogFormatDefineStyleBorders* = 185;
            wdDialogFormatDefineStyleLang* = 186;
            wdDialogFormatPicture* = 187;
            wdDialogToolsLanguage* = 188;
            wdDialogFormatBordersAndShading* = 189;
            wdDialogFormatDrawingObject* = 960;
            wdDialogFormatFrame* = 190;
            wdDialogFormatDropCap* = 488;
            wdDialogFormatBulletsAndNumbering* = 824;
            wdDialogToolsHyphenation* = 195;
            wdDialogToolsBulletsNumbers* = 196;
            wdDialogToolsHighlightChanges* = 197;
            wdDialogToolsAcceptRejectChanges* = 506;
            wdDialogToolsMergeDocuments* = 435;
            wdDialogToolsCompareDocuments* = 198;
            wdDialogTableSort* = 199;
            wdDialogToolsCustomizeMenuBar* = 615;
            wdDialogToolsCustomize* = 152;
            wdDialogToolsCustomizeKeyboard* = 432;
            wdDialogToolsCustomizeMenus* = 433;
            wdDialogListCommands* = 723;
            wdDialogToolsOptions* = 974;
            wdDialogToolsOptionsGeneral* = 203;
            wdDialogToolsAdvancedSettings* = 206;
            wdDialogToolsOptionsCompatibility* = 525;
            wdDialogToolsOptionsPrint* = 208;
            wdDialogToolsOptionsSave* = 209;
            wdDialogToolsOptionsSpellingAndGrammar* = 211;
            wdDialogToolsSpellingAndGrammar* = 828;
            wdDialogToolsThesaurus* = 194;
            wdDialogToolsOptionsUserInfo* = 213;
            wdDialogToolsOptionsAutoFormat* = 959;
            wdDialogToolsOptionsTrackChanges* = 386;
            wdDialogToolsOptionsEdit* = 224;
            wdDialogToolsMacro* = 215;
            wdDialogInsertPageNumbers* = 294;
            wdDialogFormatPageNumber* = 298;
            wdDialogNoteOptions* = 373;
            wdDialogCopyFile* = 300;
            wdDialogFormatAddrFonts* = 103;
            wdDialogFormatRetAddrFonts* = 221;
            wdDialogToolsOptionsFileLocations* = 225;
            wdDialogToolsCreateDirectory* = 833;
            wdDialogUpdateTOC* = 331;
            wdDialogInsertFormField* = 483;
            wdDialogFormFieldOptions* = 353;
            wdDialogInsertCaption* = 357;
            wdDialogInsertAutoCaption* = 359;
            wdDialogInsertAddCaption* = 402;
            wdDialogInsertCaptionNumbering* = 358;
            wdDialogInsertCrossReference* = 367;
            wdDialogToolsManageFields* = 631;
            wdDialogToolsAutoManager* = 915;
            wdDialogToolsAutoCorrect* = 378;
            wdDialogToolsAutoCorrectExceptions* = 762;
            wdDialogConnect* = 420;
            wdDialogToolsOptionsView* = 204;
            wdDialogInsertSubdocument* = 583;
            wdDialogFileRoutingSlip* = 624;
            wdDialogFontSubstitution* = 581;
            wdDialogEditCreatePublisher* = 732;
            wdDialogEditSubscribeTo* = 733;
            wdDialogEditPublishOptions* = 735;
            wdDialogEditSubscribeOptions* = 736;
            wdDialogControlRun* = 235;
            wdDialogFileVersions* = 945;
            wdDialogToolsAutoSummarize* = 874;
            wdDialogFileSaveVersion* = 1007;
            wdDialogWindowActivate* = 220;
            wdDialogToolsMacroRecord* = 214;
            wdDialogToolsRevisions* = 197;
        (* WdWordDialogHID, hidden *)
            wdDialogToolsOptionsFuzzy* = 790;
            wdDialogToolsOptionsTypography* = 739;
            wdDialogToolsOptionsAutoFormatAsYouType* = 778;
        (* WdFieldKind *)
            wdFieldKindNone* = 0;
            wdFieldKindHot* = 1;
            wdFieldKindWarm* = 2;
            wdFieldKindCold* = 3;
        (* WdTextFormFieldType *)
            wdRegularText* = 0;
            wdNumberText* = 1;
            wdDateText* = 2;
            wdCurrentDateText* = 3;
            wdCurrentTimeText* = 4;
            wdCalculationText* = 5;
        (* WdChevronConvertRule *)
            wdNeverConvert* = 0;
            wdAlwaysConvert* = 1;
            wdAskToNotConvert* = 2;
            wdAskToConvert* = 3;
        (* WdMailMergeMainDocType *)
            wdNotAMergeDocument* = -1;
            wdFormLetters* = 0;
            wdMailingLabels* = 1;
            wdEnvelopes* = 2;
            wdCatalog* = 3;
        (* WdMailMergeState *)
            wdNormalDocument* = 0;
            wdMainDocumentOnly* = 1;
            wdMainAndDataSource* = 2;
            wdMainAndHeader* = 3;
            wdMainAndSourceAndHeader* = 4;
            wdDataSource* = 5;
        (* WdMailMergeDestination *)
            wdSendToNewDocument* = 0;
            wdSendToPrinter* = 1;
            wdSendToEmail* = 2;
            wdSendToFax* = 3;
        (* WdMailMergeActiveRecord *)
            wdNoActiveRecord* = -1;
            wdNextRecord* = -2;
            wdPreviousRecord* = -3;
            wdFirstRecord* = -4;
            wdLastRecord* = -5;
        (* WdMailMergeDefaultRecord *)
            wdDefaultFirstRecord* = 1;
            wdDefaultLastRecord* = -16;
        (* WdMailMergeDataSource *)
            wdNoMergeInfo* = -1;
            wdMergeInfoFromWord* = 0;
            wdMergeInfoFromAccessDDE* = 1;
            wdMergeInfoFromExcelDDE* = 2;
            wdMergeInfoFromMSQueryDDE* = 3;
            wdMergeInfoFromODBC* = 4;
        (* WdMailMergeComparison *)
            wdMergeIfEqual* = 0;
            wdMergeIfNotEqual* = 1;
            wdMergeIfLessThan* = 2;
            wdMergeIfGreaterThan* = 3;
            wdMergeIfLessThanOrEqual* = 4;
            wdMergeIfGreaterThanOrEqual* = 5;
            wdMergeIfIsBlank* = 6;
            wdMergeIfIsNotBlank* = 7;
        (* WdBookmarkSortBy *)
            wdSortByName* = 0;
            wdSortByLocation* = 1;
        (* WdWindowState *)
            wdWindowStateNormal* = 0;
            wdWindowStateMaximize* = 1;
            wdWindowStateMinimize* = 2;
        (* WdPictureLinkType *)
            wdLinkNone* = 0;
            wdLinkDataInDoc* = 1;
            wdLinkDataOnDisk* = 2;
        (* WdLinkType *)
            wdLinkTypeOLE* = 0;
            wdLinkTypePicture* = 1;
            wdLinkTypeText* = 2;
            wdLinkTypeReference* = 3;
            wdLinkTypeInclude* = 4;
            wdLinkTypeImport* = 5;
            wdLinkTypeDDE* = 6;
            wdLinkTypeDDEAuto* = 7;
        (* WdWindowType *)
            wdWindowDocument* = 0;
            wdWindowTemplate* = 1;
        (* WdViewType *)
            wdNormalView* = 1;
            wdOutlineView* = 2;
            wdPageView* = 3;
            wdPrintPreview* = 4;
            wdMasterView* = 5;
            wdOnlineView* = 6;
        (* WdSeekView *)
            wdSeekMainDocument* = 0;
            wdSeekPrimaryHeader* = 1;
            wdSeekFirstPageHeader* = 2;
            wdSeekEvenPagesHeader* = 3;
            wdSeekPrimaryFooter* = 4;
            wdSeekFirstPageFooter* = 5;
            wdSeekEvenPagesFooter* = 6;
            wdSeekFootnotes* = 7;
            wdSeekEndnotes* = 8;
            wdSeekCurrentPageHeader* = 9;
            wdSeekCurrentPageFooter* = 10;
        (* WdSpecialPane *)
            wdPaneNone* = 0;
            wdPanePrimaryHeader* = 1;
            wdPaneFirstPageHeader* = 2;
            wdPaneEvenPagesHeader* = 3;
            wdPanePrimaryFooter* = 4;
            wdPaneFirstPageFooter* = 5;
            wdPaneEvenPagesFooter* = 6;
            wdPaneFootnotes* = 7;
            wdPaneEndnotes* = 8;
            wdPaneFootnoteContinuationNotice* = 9;
            wdPaneFootnoteContinuationSeparator* = 10;
            wdPaneFootnoteSeparator* = 11;
            wdPaneEndnoteContinuationNotice* = 12;
            wdPaneEndnoteContinuationSeparator* = 13;
            wdPaneEndnoteSeparator* = 14;
            wdPaneComments* = 15;
            wdPaneCurrentPageHeader* = 16;
            wdPaneCurrentPageFooter* = 17;
        (* WdPageFit *)
            wdPageFitNone* = 0;
            wdPageFitFullPage* = 1;
            wdPageFitBestFit* = 2;
        (* WdBrowseTarget *)
            wdBrowsePage* = 1;
            wdBrowseSection* = 2;
            wdBrowseComment* = 3;
            wdBrowseFootnote* = 4;
            wdBrowseEndnote* = 5;
            wdBrowseField* = 6;
            wdBrowseTable* = 7;
            wdBrowseGraphic* = 8;
            wdBrowseHeading* = 9;
            wdBrowseEdit* = 10;
            wdBrowseFind* = 11;
            wdBrowseGoTo* = 12;
        (* WdPaperTray *)
            wdPrinterDefaultBin* = 0;
            wdPrinterUpperBin* = 1;
            wdPrinterOnlyBin* = 1;
            wdPrinterLowerBin* = 2;
            wdPrinterMiddleBin* = 3;
            wdPrinterManualFeed* = 4;
            wdPrinterEnvelopeFeed* = 5;
            wdPrinterManualEnvelopeFeed* = 6;
            wdPrinterAutomaticSheetFeed* = 7;
            wdPrinterTractorFeed* = 8;
            wdPrinterSmallFormatBin* = 9;
            wdPrinterLargeFormatBin* = 10;
            wdPrinterLargeCapacityBin* = 11;
            wdPrinterPaperCassette* = 14;
            wdPrinterFormSource* = 15;
        (* WdOrientation *)
            wdOrientPortrait* = 0;
            wdOrientLandscape* = 1;
        (* WdSelectionType *)
            wdNoSelection* = 0;
            wdSelectionIP* = 1;
            wdSelectionNormal* = 2;
            wdSelectionFrame* = 3;
            wdSelectionColumn* = 4;
            wdSelectionRow* = 5;
            wdSelectionBlock* = 6;
            wdSelectionInlineShape* = 7;
            wdSelectionShape* = 8;
        (* WdCaptionLabelID *)
            wdCaptionFigure* = -1;
            wdCaptionTable* = -2;
            wdCaptionEquation* = -3;
        (* WdReferenceType *)
            wdRefTypeNumberedItem* = 0;
            wdRefTypeHeading* = 1;
            wdRefTypeBookmark* = 2;
            wdRefTypeFootnote* = 3;
            wdRefTypeEndnote* = 4;
        (* WdReferenceKind *)
            wdContentText* = -1;
            wdNumberRelativeContext* = -2;
            wdNumberNoContext* = -3;
            wdNumberFullContext* = -4;
            wdEntireCaption* = 2;
            wdOnlyLabelAndNumber* = 3;
            wdOnlyCaptionText* = 4;
            wdFootnoteNumber* = 5;
            wdEndnoteNumber* = 6;
            wdPageNumber* = 7;
            wdPosition* = 15;
            wdFootnoteNumberFormatted* = 16;
            wdEndnoteNumberFormatted* = 17;
        (* WdIndexFormat *)
            wdIndexTemplate* = 0;
            wdIndexClassic* = 1;
            wdIndexFancy* = 2;
            wdIndexModern* = 3;
            wdIndexBulleted* = 4;
            wdIndexFormal* = 5;
            wdIndexSimple* = 6;
        (* WdIndexType *)
            wdIndexIndent* = 0;
            wdIndexRunin* = 1;
        (* WdRevisionsWrap *)
            wdWrapNever* = 0;
            wdWrapAlways* = 1;
            wdWrapAsk* = 2;
        (* WdRevisionType *)
            wdNoRevision* = 0;
            wdRevisionInsert* = 1;
            wdRevisionDelete* = 2;
            wdRevisionProperty* = 3;
            wdRevisionParagraphNumber* = 4;
            wdRevisionDisplayField* = 5;
            wdRevisionReconcile* = 6;
            wdRevisionConflict* = 7;
            wdRevisionStyle* = 8;
            wdRevisionReplace* = 9;
        (* WdRoutingSlipDelivery *)
            wdOneAfterAnother* = 0;
            wdAllAtOnce* = 1;
        (* WdRoutingSlipStatus *)
            wdNotYetRouted* = 0;
            wdRouteInProgress* = 1;
            wdRouteComplete* = 2;
        (* WdSectionStart *)
            wdSectionContinuous* = 0;
            wdSectionNewColumn* = 1;
            wdSectionNewPage* = 2;
            wdSectionEvenPage* = 3;
            wdSectionOddPage* = 4;
        (* WdSaveOptions *)
            wdDoNotSaveChanges* = 0;
            wdSaveChanges* = -1;
            wdPromptToSaveChanges* = -2;
        (* WdDocumentKind *)
            wdDocumentNotSpecified* = 0;
            wdDocumentLetter* = 1;
            wdDocumentEmail* = 2;
        (* WdDocumentType *)
            wdTypeDocument* = 0;
            wdTypeTemplate* = 1;
        (* WdOriginalFormat *)
            wdWordDocument* = 0;
            wdOriginalDocumentFormat* = 1;
            wdPromptUser* = 2;
        (* WdRelocate *)
            wdRelocateUp* = 0;
            wdRelocateDown* = 1;
        (* WdInsertedTextMark *)
            wdInsertedTextMarkNone* = 0;
            wdInsertedTextMarkBold* = 1;
            wdInsertedTextMarkItalic* = 2;
            wdInsertedTextMarkUnderline* = 3;
            wdInsertedTextMarkDoubleUnderline* = 4;
        (* WdRevisedLinesMark *)
            wdRevisedLinesMarkNone* = 0;
            wdRevisedLinesMarkLeftBorder* = 1;
            wdRevisedLinesMarkRightBorder* = 2;
            wdRevisedLinesMarkOutsideBorder* = 3;
        (* WdDeletedTextMark *)
            wdDeletedTextMarkHidden* = 0;
            wdDeletedTextMarkStrikeThrough* = 1;
            wdDeletedTextMarkCaret* = 2;
            wdDeletedTextMarkPound* = 3;
        (* WdRevisedPropertiesMark *)
            wdRevisedPropertiesMarkNone* = 0;
            wdRevisedPropertiesMarkBold* = 1;
            wdRevisedPropertiesMarkItalic* = 2;
            wdRevisedPropertiesMarkUnderline* = 3;
            wdRevisedPropertiesMarkDoubleUnderline* = 4;
        (* WdFieldShading *)
            wdFieldShadingNever* = 0;
            wdFieldShadingAlways* = 1;
            wdFieldShadingWhenSelected* = 2;
        (* WdDefaultFilePath *)
            wdDocumentsPath* = 0;
            wdPicturesPath* = 1;
            wdUserTemplatesPath* = 2;
            wdWorkgroupTemplatesPath* = 3;
            wdUserOptionsPath* = 4;
            wdAutoRecoverPath* = 5;
            wdToolsPath* = 6;
            wdTutorialPath* = 7;
            wdStartupPath* = 8;
            wdProgramPath* = 9;
            wdGraphicsFiltersPath* = 10;
            wdTextConvertersPath* = 11;
            wdProofingToolsPath* = 12;
            wdTempFilePath* = 13;
            wdCurrentFolderPath* = 14;
            wdStyleGalleryPath* = 15;
            wdBorderArtPath* = 19;
        (* WdCompatibility *)
            wdNoTabHangIndent* = 1;
            wdNoSpaceRaiseLower* = 2;
            wdPrintColBlack* = 3;
            wdWrapTrailSpaces* = 4;
            wdNoColumnBalance* = 5;
            wdConvMailMergeEsc* = 6;
            wdSuppressSpBfAfterPgBrk* = 7;
            wdSuppressTopSpacing* = 8;
            wdOrigWordTableRules* = 9;
            wdTransparentMetafiles* = 10;
            wdShowBreaksInFrames* = 11;
            wdSwapBordersFacingPages* = 12;
            wdLeaveBackslashAlone* = 13;
            wdExpandShiftReturn* = 14;
            wdDontULTrailSpace* = 15;
            wdDontBalanceSingleByteDoubleByteWidth* = 16;
            wdSuppressTopSpacingMac5* = 17;
            wdSpacingInWholePoints* = 18;
            wdPrintBodyTextBeforeHeader* = 19;
            wdNoLeading* = 20;
            wdNoSpaceForUL* = 21;
            wdMWSmallCaps* = 22;
            wdNoExtraLineSpacing* = 23;
            wdTruncateFontHeight* = 24;
            wdSubFontBySize* = 25;
            wdUsePrinterMetrics* = 26;
            wdWW6BorderRules* = 27;
            wdExactOnTop* = 28;
            wdSuppressBottomSpacing* = 29;
            wdWPSpaceWidth* = 30;
            wdWPJustification* = 31;
            wdLineWrapLikeWord6* = 32;
        (* WdPaperSize *)
            wdPaper10x14* = 0;
            wdPaper11x17* = 1;
            wdPaperLetter* = 2;
            wdPaperLetterSmall* = 3;
            wdPaperLegal* = 4;
            wdPaperExecutive* = 5;
            wdPaperA3* = 6;
            wdPaperA4* = 7;
            wdPaperA4Small* = 8;
            wdPaperA5* = 9;
            wdPaperB4* = 10;
            wdPaperB5* = 11;
            wdPaperCSheet* = 12;
            wdPaperDSheet* = 13;
            wdPaperESheet* = 14;
            wdPaperFanfoldLegalGerman* = 15;
            wdPaperFanfoldStdGerman* = 16;
            wdPaperFanfoldUS* = 17;
            wdPaperFolio* = 18;
            wdPaperLedger* = 19;
            wdPaperNote* = 20;
            wdPaperQuarto* = 21;
            wdPaperStatement* = 22;
            wdPaperTabloid* = 23;
            wdPaperEnvelope9* = 24;
            wdPaperEnvelope10* = 25;
            wdPaperEnvelope11* = 26;
            wdPaperEnvelope12* = 27;
            wdPaperEnvelope14* = 28;
            wdPaperEnvelopeB4* = 29;
            wdPaperEnvelopeB5* = 30;
            wdPaperEnvelopeB6* = 31;
            wdPaperEnvelopeC3* = 32;
            wdPaperEnvelopeC4* = 33;
            wdPaperEnvelopeC5* = 34;
            wdPaperEnvelopeC6* = 35;
            wdPaperEnvelopeC65* = 36;
            wdPaperEnvelopeDL* = 37;
            wdPaperEnvelopeItaly* = 38;
            wdPaperEnvelopeMonarch* = 39;
            wdPaperEnvelopePersonal* = 40;
            wdPaperCustom* = 41;
        (* WdCustomLabelPageSize *)
            wdCustomLabelLetter* = 0;
            wdCustomLabelLetterLS* = 1;
            wdCustomLabelA4* = 2;
            wdCustomLabelA4LS* = 3;
            wdCustomLabelA5* = 4;
            wdCustomLabelA5LS* = 5;
            wdCustomLabelB5* = 6;
            wdCustomLabelMini* = 7;
            wdCustomLabelFanfold* = 8;
        (* WdProtectionType *)
            wdNoProtection* = -1;
            wdAllowOnlyRevisions* = 0;
            wdAllowOnlyComments* = 1;
            wdAllowOnlyFormFields* = 2;
        (* WdPartOfSpeech *)
            wdAdjective* = 0;
            wdNoun* = 1;
            wdAdverb* = 2;
            wdVerb* = 3;
        (* WdSubscriberFormats *)
            wdSubscriberBestFormat* = 0;
            wdSubscriberRTF* = 1;
            wdSubscriberText* = 2;
            wdSubscriberPict* = 4;
        (* WdEditionType *)
            wdPublisher* = 0;
            wdSubscriber* = 1;
        (* WdEditionOption *)
            wdCancelPublisher* = 0;
            wdSendPublisher* = 1;
            wdSelectPublisher* = 2;
            wdAutomaticUpdate* = 3;
            wdManualUpdate* = 4;
            wdChangeAttributes* = 5;
            wdUpdateSubscriber* = 6;
            wdOpenSource* = 7;
        (* WdRelativeHorizontalPosition *)
            wdRelativeHorizontalPositionMargin* = 0;
            wdRelativeHorizontalPositionPage* = 1;
            wdRelativeHorizontalPositionColumn* = 2;
        (* WdRelativeVerticalPosition *)
            wdRelativeVerticalPositionMargin* = 0;
            wdRelativeVerticalPositionPage* = 1;
            wdRelativeVerticalPositionParagraph* = 2;
        (* WdHelpType *)
            wdHelp* = 0;
            wdHelpAbout* = 1;
            wdHelpActiveWindow* = 2;
            wdHelpContents* = 3;
            wdHelpExamplesAndDemos* = 4;
            wdHelpIndex* = 5;
            wdHelpKeyboard* = 6;
            wdHelpPSSHelp* = 7;
            wdHelpQuickPreview* = 8;
            wdHelpSearch* = 9;
            wdHelpUsingHelp* = 10;
        (* WdHelpTypeHID, hidden *)
            wdHelpIchitaro* = 11;
            wdHelpPE2* = 12;
        (* WdKeyCategory *)
            wdKeyCategoryNil* = -1;
            wdKeyCategoryDisable* = 0;
            wdKeyCategoryCommand* = 1;
            wdKeyCategoryMacro* = 2;
            wdKeyCategoryFont* = 3;
            wdKeyCategoryAutoText* = 4;
            wdKeyCategoryStyle* = 5;
            wdKeyCategorySymbol* = 6;
            wdKeyCategoryPrefix* = 7;
        (* WdKey *)
            wdNoKey* = 255;
            wdKeyShift* = 256;
            wdKeyControl* = 512;
            wdKeyCommand* = 512;
            wdKeyAlt* = 1024;
            wdKeyOption* = 1024;
            wdKeyA* = 65;
            wdKeyB* = 66;
            wdKeyC* = 67;
            wdKeyD* = 68;
            wdKeyE* = 69;
            wdKeyF* = 70;
            wdKeyG* = 71;
            wdKeyH* = 72;
            wdKeyI* = 73;
            wdKeyJ* = 74;
            wdKeyK* = 75;
            wdKeyL* = 76;
            wdKeyM* = 77;
            wdKeyN* = 78;
            wdKeyO* = 79;
            wdKeyP* = 80;
            wdKeyQ* = 81;
            wdKeyR* = 82;
            wdKeyS* = 83;
            wdKeyT* = 84;
            wdKeyU* = 85;
            wdKeyV* = 86;
            wdKeyW* = 87;
            wdKeyX* = 88;
            wdKeyY* = 89;
            wdKeyZ* = 90;
            wdKey0* = 48;
            wdKey1* = 49;
            wdKey2* = 50;
            wdKey3* = 51;
            wdKey4* = 52;
            wdKey5* = 53;
            wdKey6* = 54;
            wdKey7* = 55;
            wdKey8* = 56;
            wdKey9* = 57;
            wdKeyBackspace* = 8;
            wdKeyTab* = 9;
            wdKeyNumeric5Special* = 12;
            wdKeyReturn* = 13;
            wdKeyPause* = 19;
            wdKeyEsc* = 27;
            wdKeySpacebar* = 32;
            wdKeyPageUp* = 33;
            wdKeyPageDown* = 34;
            wdKeyEnd* = 35;
            wdKeyHome* = 36;
            wdKeyInsert* = 45;
            wdKeyDelete* = 46;
            wdKeyNumeric0* = 96;
            wdKeyNumeric1* = 97;
            wdKeyNumeric2* = 98;
            wdKeyNumeric3* = 99;
            wdKeyNumeric4* = 100;
            wdKeyNumeric5* = 101;
            wdKeyNumeric6* = 102;
            wdKeyNumeric7* = 103;
            wdKeyNumeric8* = 104;
            wdKeyNumeric9* = 105;
            wdKeyNumericMultiply* = 106;
            wdKeyNumericAdd* = 107;
            wdKeyNumericSubtract* = 109;
            wdKeyNumericDecimal* = 110;
            wdKeyNumericDivide* = 111;
            wdKeyF1* = 112;
            wdKeyF2* = 113;
            wdKeyF3* = 114;
            wdKeyF4* = 115;
            wdKeyF5* = 116;
            wdKeyF6* = 117;
            wdKeyF7* = 118;
            wdKeyF8* = 119;
            wdKeyF9* = 120;
            wdKeyF10* = 121;
            wdKeyF11* = 122;
            wdKeyF12* = 123;
            wdKeyF13* = 124;
            wdKeyF14* = 125;
            wdKeyF15* = 126;
            wdKeyF16* = 127;
            wdKeyScrollLock* = 145;
            wdKeySemiColon* = 186;
            wdKeyEquals* = 187;
            wdKeyComma* = 188;
            wdKeyHyphen* = 189;
            wdKeyPeriod* = 190;
            wdKeySlash* = 191;
            wdKeyBackSingleQuote* = 192;
            wdKeyOpenSquareBrace* = 219;
            wdKeyBackSlash* = 220;
            wdKeyCloseSquareBrace* = 221;
            wdKeySingleQuote* = 222;
        (* WdOLEType *)
            wdOLELink* = 0;
            wdOLEEmbed* = 1;
            wdOLEControl* = 2;
        (* WdOLEVerb *)
            wdOLEVerbPrimary* = 0;
            wdOLEVerbShow* = -1;
            wdOLEVerbOpen* = -2;
            wdOLEVerbHide* = -3;
            wdOLEVerbUIActivate* = -4;
            wdOLEVerbInPlaceActivate* = -5;
            wdOLEVerbDiscardUndoState* = -6;
        (* WdOLEPlacement *)
            wdInLine* = 0;
            wdFloatOverText* = 1;
        (* WdEnvelopeOrientation *)
            wdLeftPortrait* = 0;
            wdCenterPortrait* = 1;
            wdRightPortrait* = 2;
            wdLeftLandscape* = 3;
            wdCenterLandscape* = 4;
            wdRightLandscape* = 5;
            wdLeftClockwise* = 6;
            wdCenterClockwise* = 7;
            wdRightClockwise* = 8;
        (* WdLetterStyle *)
            wdFullBlock* = 0;
            wdModifiedBlock* = 1;
            wdSemiBlock* = 2;
        (* WdLetterheadLocation *)
            wdLetterTop* = 0;
            wdLetterBottom* = 1;
            wdLetterLeft* = 2;
            wdLetterRight* = 3;
        (* WdSalutationType *)
            wdSalutationInformal* = 0;
            wdSalutationFormal* = 1;
            wdSalutationBusiness* = 2;
            wdSalutationOther* = 3;
        (* WdSalutationGender *)
            wdGenderFemale* = 0;
            wdGenderMale* = 1;
            wdGenderNeutral* = 2;
            wdGenderUnknown* = 3;
        (* WdMovementType *)
            wdMove* = 0;
            wdExtend* = 1;
        (* WdConstants *)
            wdUndefined* = 9999999;
            wdToggle* = 9999998;
            wdForward* = 1073741823;
            wdBackward* = -1073741823;
            wdAutoPosition* = 0;
            wdFirst* = 1;
            wdCreatorCode* = 1297307460;
        (* WdPasteDataType *)
            wdPasteOLEObject* = 0;
            wdPasteRTF* = 1;
            wdPasteText* = 2;
            wdPasteMetafilePicture* = 3;
            wdPasteBitmap* = 4;
            wdPasteDeviceIndependentBitmap* = 5;
            wdPasteHyperlink* = 7;
            wdPasteShape* = 8;
            wdPasteEnhancedMetafile* = 9;
        (* WdPrintOutItem *)
            wdPrintDocumentContent* = 0;
            wdPrintProperties* = 1;
            wdPrintComments* = 2;
            wdPrintStyles* = 3;
            wdPrintAutoTextEntries* = 4;
            wdPrintKeyAssignments* = 5;
            wdPrintEnvelope* = 6;
        (* WdPrintOutPages *)
            wdPrintAllPages* = 0;
            wdPrintOddPagesOnly* = 1;
            wdPrintEvenPagesOnly* = 2;
        (* WdPrintOutRange *)
            wdPrintAllDocument* = 0;
            wdPrintSelection* = 1;
            wdPrintCurrentPage* = 2;
            wdPrintFromTo* = 3;
            wdPrintRangeOfPages* = 4;
        (* WdDictionaryType *)
            wdSpelling* = 0;
            wdGrammar* = 1;
            wdThesaurus* = 2;
            wdHyphenation* = 3;
            wdSpellingComplete* = 4;
            wdSpellingCustom* = 5;
            wdSpellingLegal* = 6;
            wdSpellingMedical* = 7;
        (* WdDictionaryTypeHID, hidden *)
            wdHangulHanjaConversion* = 8;
            wdHangulHanjaConversionCustom* = 9;
        (* WdSpellingWordType *)
            wdSpellword* = 0;
            wdWildcard* = 1;
            wdAnagram* = 2;
        (* WdSpellingErrorType *)
            wdSpellingCorrect* = 0;
            wdSpellingNotInDictionary* = 1;
            wdSpellingCapitalization* = 2;
        (* WdProofreadingErrorType *)
            wdSpellingError* = 0;
            wdGrammaticalError* = 1;
        (* WdInlineShapeType *)
            wdInlineShapeEmbeddedOLEObject* = 1;
            wdInlineShapeLinkedOLEObject* = 2;
            wdInlineShapePicture* = 3;
            wdInlineShapeLinkedPicture* = 4;
            wdInlineShapeOLEControlObject* = 5;
        (* WdArrangeStyle *)
            wdTiled* = 0;
            wdIcons* = 1;
        (* WdSelectionFlags *)
            wdSelStartActive* = 1;
            wdSelAtEOL* = 2;
            wdSelOvertype* = 4;
            wdSelActive* = 8;
            wdSelReplace* = 16;
        (* WdAutoVersions *)
            wdAutoVersionOff* = 0;
            wdAutoVersionOnClose* = 1;
        (* WdOrganizerObject *)
            wdOrganizerObjectStyles* = 0;
            wdOrganizerObjectAutoText* = 1;
            wdOrganizerObjectCommandBars* = 2;
            wdOrganizerObjectProjectItems* = 3;
        (* WdFindMatch *)
            wdMatchParagraphMark* = 65551;
            wdMatchTabCharacter* = 9;
            wdMatchCommentMark* = 5;
            wdMatchAnyCharacter* = 65599;
            wdMatchAnyDigit* = 65567;
            wdMatchAnyLetter* = 65583;
            wdMatchCaretCharacter* = 11;
            wdMatchColumnBreak* = 14;
            wdMatchEmDash* = 8212;
            wdMatchEnDash* = 8211;
            wdMatchEndnoteMark* = 65555;
            wdMatchField* = 19;
            wdMatchFootnoteMark* = 65554;
            wdMatchGraphic* = 1;
            wdMatchManualLineBreak* = 65551;
            wdMatchManualPageBreak* = 65564;
            wdMatchNonbreakingHyphen* = 30;
            wdMatchNonbreakingSpace* = 160;
            wdMatchOptionalHyphen* = 31;
            wdMatchSectionBreak* = 65580;
            wdMatchWhiteSpace* = 65655;
        (* WdFindWrap *)
            wdFindStop* = 0;
            wdFindContinue* = 1;
            wdFindAsk* = 2;
        (* WdInformation *)
            wdActiveEndAdjustedPageNumber* = 1;
            wdActiveEndSectionNumber* = 2;
            wdActiveEndPageNumber* = 3;
            wdNumberOfPagesInDocument* = 4;
            wdHorizontalPositionRelativeToPage* = 5;
            wdVerticalPositionRelativeToPage* = 6;
            wdHorizontalPositionRelativeToTextBoundary* = 7;
            wdVerticalPositionRelativeToTextBoundary* = 8;
            wdFirstCharacterColumnNumber* = 9;
            wdFirstCharacterLineNumber* = 10;
            wdFrameIsSelected* = 11;
            wdWithInTable* = 12;
            wdStartOfRangeRowNumber* = 13;
            wdEndOfRangeRowNumber* = 14;
            wdMaximumNumberOfRows* = 15;
            wdStartOfRangeColumnNumber* = 16;
            wdEndOfRangeColumnNumber* = 17;
            wdMaximumNumberOfColumns* = 18;
            wdZoomPercentage* = 19;
            wdSelectionMode* = 20;
            wdCapsLock* = 21;
            wdNumLock* = 22;
            wdOverType* = 23;
            wdRevisionMarking* = 24;
            wdInFootnoteEndnotePane* = 25;
            wdInCommentPane* = 26;
            wdInHeaderFooter* = 28;
            wdAtEndOfRowMarker* = 31;
            wdReferenceOfType* = 32;
            wdHeaderFooterType* = 33;
            wdInMasterDocument* = 34;
            wdInFootnote* = 35;
            wdInEndnote* = 36;
            wdInWordMail* = 37;
            wdInClipboard* = 38;
        (* WdWrapType *)
            wdWrapSquare* = 0;
            wdWrapTight* = 1;
            wdWrapThrough* = 2;
            wdWrapNone* = 3;
            wdWrapTopBottom* = 4;
        (* WdWrapSideType *)
            wdWrapBoth* = 0;
            wdWrapLeft* = 1;
            wdWrapRight* = 2;
            wdWrapLargest* = 3;
        (* WdOutlineLevel *)
            wdOutlineLevel1* = 1;
            wdOutlineLevel2* = 2;
            wdOutlineLevel3* = 3;
            wdOutlineLevel4* = 4;
            wdOutlineLevel5* = 5;
            wdOutlineLevel6* = 6;
            wdOutlineLevel7* = 7;
            wdOutlineLevel8* = 8;
            wdOutlineLevel9* = 9;
            wdOutlineLevelBodyText* = 10;
        (* WdTextOrientation *)
            wdTextOrientationHorizontal* = 0;
            wdTextOrientationUpward* = 2;
            wdTextOrientationDownward* = 3;
        (* WdTextOrientationHID, hidden *)
            wdTextOrientationVerticalFarEast* = 1;
            wdTextOrientationHorizontalRotatedFarEast* = 4;
        (* WdPageBorderArt *)
            wdArtApples* = 1;
            wdArtMapleMuffins* = 2;
            wdArtCakeSlice* = 3;
            wdArtCandyCorn* = 4;
            wdArtIceCreamCones* = 5;
            wdArtChampagneBottle* = 6;
            wdArtPartyGlass* = 7;
            wdArtChristmasTree* = 8;
            wdArtTrees* = 9;
            wdArtPalmsColor* = 10;
            wdArtBalloons3Colors* = 11;
            wdArtBalloonsHotAir* = 12;
            wdArtPartyFavor* = 13;
            wdArtConfettiStreamers* = 14;
            wdArtHearts* = 15;
            wdArtHeartBalloon* = 16;
            wdArtStars3D* = 17;
            wdArtStarsShadowed* = 18;
            wdArtStars* = 19;
            wdArtSun* = 20;
            wdArtEarth2* = 21;
            wdArtEarth1* = 22;
            wdArtPeopleHats* = 23;
            wdArtSombrero* = 24;
            wdArtPencils* = 25;
            wdArtPackages* = 26;
            wdArtClocks* = 27;
            wdArtFirecrackers* = 28;
            wdArtRings* = 29;
            wdArtMapPins* = 30;
            wdArtConfetti* = 31;
            wdArtCreaturesButterfly* = 32;
            wdArtCreaturesLadyBug* = 33;
            wdArtCreaturesFish* = 34;
            wdArtBirdsFlight* = 35;
            wdArtScaredCat* = 36;
            wdArtBats* = 37;
            wdArtFlowersRoses* = 38;
            wdArtFlowersRedRose* = 39;
            wdArtPoinsettias* = 40;
            wdArtHolly* = 41;
            wdArtFlowersTiny* = 42;
            wdArtFlowersPansy* = 43;
            wdArtFlowersModern2* = 44;
            wdArtFlowersModern1* = 45;
            wdArtWhiteFlowers* = 46;
            wdArtVine* = 47;
            wdArtFlowersDaisies* = 48;
            wdArtFlowersBlockPrint* = 49;
            wdArtDecoArchColor* = 50;
            wdArtFans* = 51;
            wdArtFilm* = 52;
            wdArtLightning1* = 53;
            wdArtCompass* = 54;
            wdArtDoubleD* = 55;
            wdArtClassicalWave* = 56;
            wdArtShadowedSquares* = 57;
            wdArtTwistedLines1* = 58;
            wdArtWaveline* = 59;
            wdArtQuadrants* = 60;
            wdArtCheckedBarColor* = 61;
            wdArtSwirligig* = 62;
            wdArtPushPinNote1* = 63;
            wdArtPushPinNote2* = 64;
            wdArtPumpkin1* = 65;
            wdArtEggsBlack* = 66;
            wdArtCup* = 67;
            wdArtHeartGray* = 68;
            wdArtGingerbreadMan* = 69;
            wdArtBabyPacifier* = 70;
            wdArtBabyRattle* = 71;
            wdArtCabins* = 72;
            wdArtHouseFunky* = 73;
            wdArtStarsBlack* = 74;
            wdArtSnowflakes* = 75;
            wdArtSnowflakeFancy* = 76;
            wdArtSkyrocket* = 77;
            wdArtSeattle* = 78;
            wdArtMusicNotes* = 79;
            wdArtPalmsBlack* = 80;
            wdArtMapleLeaf* = 81;
            wdArtPaperClips* = 82;
            wdArtShorebirdTracks* = 83;
            wdArtPeople* = 84;
            wdArtPeopleWaving* = 85;
            wdArtEclipsingSquares2* = 86;
            wdArtHypnotic* = 87;
            wdArtDiamondsGray* = 88;
            wdArtDecoArch* = 89;
            wdArtDecoBlocks* = 90;
            wdArtCirclesLines* = 91;
            wdArtPapyrus* = 92;
            wdArtWoodwork* = 93;
            wdArtWeavingBraid* = 94;
            wdArtWeavingRibbon* = 95;
            wdArtWeavingAngles* = 96;
            wdArtArchedScallops* = 97;
            wdArtSafari* = 98;
            wdArtCelticKnotwork* = 99;
            wdArtCrazyMaze* = 100;
            wdArtEclipsingSquares1* = 101;
            wdArtBirds* = 102;
            wdArtFlowersTeacup* = 103;
            wdArtNorthwest* = 104;
            wdArtSouthwest* = 105;
            wdArtTribal6* = 106;
            wdArtTribal4* = 107;
            wdArtTribal3* = 108;
            wdArtTribal2* = 109;
            wdArtTribal5* = 110;
            wdArtXIllusions* = 111;
            wdArtZanyTriangles* = 112;
            wdArtPyramids* = 113;
            wdArtPyramidsAbove* = 114;
            wdArtConfettiGrays* = 115;
            wdArtConfettiOutline* = 116;
            wdArtConfettiWhite* = 117;
            wdArtMosaic* = 118;
            wdArtLightning2* = 119;
            wdArtHeebieJeebies* = 120;
            wdArtLightBulb* = 121;
            wdArtGradient* = 122;
            wdArtTriangleParty* = 123;
            wdArtTwistedLines2* = 124;
            wdArtMoons* = 125;
            wdArtOvals* = 126;
            wdArtDoubleDiamonds* = 127;
            wdArtChainLink* = 128;
            wdArtTriangles* = 129;
            wdArtTribal1* = 130;
            wdArtMarqueeToothed* = 131;
            wdArtSharksTeeth* = 132;
            wdArtSawtooth* = 133;
            wdArtSawtoothGray* = 134;
            wdArtPostageStamp* = 135;
            wdArtWeavingStrips* = 136;
            wdArtZigZag* = 137;
            wdArtCrossStitch* = 138;
            wdArtGems* = 139;
            wdArtCirclesRectangles* = 140;
            wdArtCornerTriangles* = 141;
            wdArtCreaturesInsects* = 142;
            wdArtZigZagStitch* = 143;
            wdArtCheckered* = 144;
            wdArtCheckedBarBlack* = 145;
            wdArtMarquee* = 146;
            wdArtBasicWhiteDots* = 147;
            wdArtBasicWideMidline* = 148;
            wdArtBasicWideOutline* = 149;
            wdArtBasicWideInline* = 150;
            wdArtBasicThinLines* = 151;
            wdArtBasicWhiteDashes* = 152;
            wdArtBasicWhiteSquares* = 153;
            wdArtBasicBlackSquares* = 154;
            wdArtBasicBlackDashes* = 155;
            wdArtBasicBlackDots* = 156;
            wdArtStarsTop* = 157;
            wdArtCertificateBanner* = 158;
            wdArtHandmade1* = 159;
            wdArtHandmade2* = 160;
            wdArtTornPaper* = 161;
            wdArtTornPaperBlack* = 162;
            wdArtCouponCutoutDashes* = 163;
            wdArtCouponCutoutDots* = 164;
        (* WdBorderDistanceFrom *)
            wdBorderDistanceFromText* = 0;
            wdBorderDistanceFromPageEdge* = 1;
        (* WdReplace *)
            wdReplaceNone* = 0;
            wdReplaceOne* = 1;
            wdReplaceAll* = 2;
        (* WdFontBias *)
            wdFontBiasDontCare* = 255;
            wdFontBiasDefault* = 0;
            wdFontBiasFareast* = 1;


    TYPE
        WdMailSystem* = INTEGER;
        WdTemplateType* = INTEGER;
        WdContinue* = INTEGER;
        WdIMEMode* = INTEGER;
        WdBaselineAlignment* = INTEGER;
        WdIndexFilter* = INTEGER;
        WdIndexSortBy* = INTEGER;
        WdJustificationMode* = INTEGER;
        WdFarEastLineBreakLevel* = INTEGER;
        WdMultipleWordConversionsMode* = INTEGER;
        WdColorIndex* = INTEGER;
        WdTextureIndex* = INTEGER;
        WdUnderline* = INTEGER;
        WdEmphasisMark* = INTEGER;
        WdInternationalIndex* = INTEGER;
        WdAutoMacros* = INTEGER;
        WdCaptionPosition* = INTEGER;
        WdCountry* = INTEGER;
        WdHeadingSeparator* = INTEGER;
        WdSeparatorType* = INTEGER;
        WdPageNumberAlignment* = INTEGER;
        WdBorderType* = INTEGER;
        WdBorderTypeHID* = INTEGER;
        WdFramePosition* = INTEGER;
        WdAnimation* = INTEGER;
        WdCharacterCase* = INTEGER;
        WdCharacterCaseHID* = INTEGER;
        WdSummaryMode* = INTEGER;
        WdSummaryLength* = INTEGER;
        WdStyleType* = INTEGER;
        WdUnits* = INTEGER;
        WdGoToItem* = INTEGER;
        WdGoToDirection* = INTEGER;
        WdCollapseDirection* = INTEGER;
        WdRowHeightRule* = INTEGER;
        WdFrameSizeRule* = INTEGER;
        WdInsertCells* = INTEGER;
        WdDeleteCells* = INTEGER;
        WdListApplyTo* = INTEGER;
        WdAlertLevel* = INTEGER;
        WdCursorType* = INTEGER;
        WdEnableCancelKey* = INTEGER;
        WdRulerStyle* = INTEGER;
        WdParagraphAlignment* = INTEGER;
        WdParagraphAlignmentHID* = INTEGER;
        WdListLevelAlignment* = INTEGER;
        WdRowAlignment* = INTEGER;
        WdTabAlignment* = INTEGER;
        WdVerticalAlignment* = INTEGER;
        WdCellVerticalAlignment* = INTEGER;
        WdTrailingCharacter* = INTEGER;
        WdListGalleryType* = INTEGER;
        WdListNumberStyle* = INTEGER;
        WdListNumberStyleHID* = INTEGER;
        WdNoteNumberStyle* = INTEGER;
        WdNoteNumberStyleHID* = INTEGER;
        WdCaptionNumberStyle* = INTEGER;
        WdCaptionNumberStyleHID* = INTEGER;
        WdPageNumberStyle* = INTEGER;
        WdPageNumberStyleHID* = INTEGER;
        WdStatistic* = INTEGER;
        WdStatisticHID* = INTEGER;
        WdBuiltInProperty* = INTEGER;
        WdLineSpacing* = INTEGER;
        WdNumberType* = INTEGER;
        WdListType* = INTEGER;
        WdStoryType* = INTEGER;
        WdSaveFormat* = INTEGER;
        WdOpenFormat* = INTEGER;
        WdHeaderFooterIndex* = INTEGER;
        WdTocFormat* = INTEGER;
        WdTofFormat* = INTEGER;
        WdToaFormat* = INTEGER;
        WdLineStyle* = INTEGER;
        WdLineWidth* = INTEGER;
        WdBreakType* = INTEGER;
        WdTabLeader* = INTEGER;
        WdTabLeaderHID* = INTEGER;
        WdMeasurementUnits* = INTEGER;
        WdMeasurementUnitsHID* = INTEGER;
        WdDropPosition* = INTEGER;
        WdNumberingRule* = INTEGER;
        WdFootnoteLocation* = INTEGER;
        WdEndnoteLocation* = INTEGER;
        WdSortSeparator* = INTEGER;
        WdTableFieldSeparator* = INTEGER;
        WdSortFieldType* = INTEGER;
        WdSortFieldTypeHID* = INTEGER;
        WdSortOrder* = INTEGER;
        WdTableFormat* = INTEGER;
        WdTableFormatApply* = INTEGER;
        WdLanguageID* = INTEGER;
        WdFieldType* = INTEGER;
        WdBuiltinStyle* = INTEGER;
        WdWordDialogTab* = INTEGER;
        WdWordDialogTabHID* = INTEGER;
        WdWordDialog* = INTEGER;
        WdWordDialogHID* = INTEGER;
        WdFieldKind* = INTEGER;
        WdTextFormFieldType* = INTEGER;
        WdChevronConvertRule* = INTEGER;
        WdMailMergeMainDocType* = INTEGER;
        WdMailMergeState* = INTEGER;
        WdMailMergeDestination* = INTEGER;
        WdMailMergeActiveRecord* = INTEGER;
        WdMailMergeDefaultRecord* = INTEGER;
        WdMailMergeDataSource* = INTEGER;
        WdMailMergeComparison* = INTEGER;
        WdBookmarkSortBy* = INTEGER;
        WdWindowState* = INTEGER;
        WdPictureLinkType* = INTEGER;
        WdLinkType* = INTEGER;
        WdWindowType* = INTEGER;
        WdViewType* = INTEGER;
        WdSeekView* = INTEGER;
        WdSpecialPane* = INTEGER;
        WdPageFit* = INTEGER;
        WdBrowseTarget* = INTEGER;
        WdPaperTray* = INTEGER;
        WdOrientation* = INTEGER;
        WdSelectionType* = INTEGER;
        WdCaptionLabelID* = INTEGER;
        WdReferenceType* = INTEGER;
        WdReferenceKind* = INTEGER;
        WdIndexFormat* = INTEGER;
        WdIndexType* = INTEGER;
        WdRevisionsWrap* = INTEGER;
        WdRevisionType* = INTEGER;
        WdRoutingSlipDelivery* = INTEGER;
        WdRoutingSlipStatus* = INTEGER;
        WdSectionStart* = INTEGER;
        WdSaveOptions* = INTEGER;
        WdDocumentKind* = INTEGER;
        WdDocumentType* = INTEGER;
        WdOriginalFormat* = INTEGER;
        WdRelocate* = INTEGER;
        WdInsertedTextMark* = INTEGER;
        WdRevisedLinesMark* = INTEGER;
        WdDeletedTextMark* = INTEGER;
        WdRevisedPropertiesMark* = INTEGER;
        WdFieldShading* = INTEGER;
        WdDefaultFilePath* = INTEGER;
        WdCompatibility* = INTEGER;
        WdPaperSize* = INTEGER;
        WdCustomLabelPageSize* = INTEGER;
        WdProtectionType* = INTEGER;
        WdPartOfSpeech* = INTEGER;
        WdSubscriberFormats* = INTEGER;
        WdEditionType* = INTEGER;
        WdEditionOption* = INTEGER;
        WdRelativeHorizontalPosition* = INTEGER;
        WdRelativeVerticalPosition* = INTEGER;
        WdHelpType* = INTEGER;
        WdHelpTypeHID* = INTEGER;
        WdKeyCategory* = INTEGER;
        WdKey* = INTEGER;
        WdOLEType* = INTEGER;
        WdOLEVerb* = INTEGER;
        WdOLEPlacement* = INTEGER;
        WdEnvelopeOrientation* = INTEGER;
        WdLetterStyle* = INTEGER;
        WdLetterheadLocation* = INTEGER;
        WdSalutationType* = INTEGER;
        WdSalutationGender* = INTEGER;
        WdMovementType* = INTEGER;
        WdConstants* = INTEGER;
        WdPasteDataType* = INTEGER;
        WdPrintOutItem* = INTEGER;
        WdPrintOutPages* = INTEGER;
        WdPrintOutRange* = INTEGER;
        WdDictionaryType* = INTEGER;
        WdDictionaryTypeHID* = INTEGER;
        WdSpellingWordType* = INTEGER;
        WdSpellingErrorType* = INTEGER;
        WdProofreadingErrorType* = INTEGER;
        WdInlineShapeType* = INTEGER;
        WdArrangeStyle* = INTEGER;
        WdSelectionFlags* = INTEGER;
        WdAutoVersions* = INTEGER;
        WdOrganizerObject* = INTEGER;
        WdFindMatch* = INTEGER;
        WdFindWrap* = INTEGER;
        WdInformation* = INTEGER;
        WdWrapType* = INTEGER;
        WdWrapSideType* = INTEGER;
        WdOutlineLevel* = INTEGER;
        WdTextOrientation* = INTEGER;
        WdTextOrientationHID* = INTEGER;
        WdPageBorderArt* = INTEGER;
        WdBorderDistanceFrom* = INTEGER;
        WdReplace* = INTEGER;
        WdFontBias* = INTEGER;
        _Application* = POINTER TO RECORD (CtlT.Object) END;
        _Global* = POINTER TO RECORD (CtlT.Object) END;
        FontNames* = POINTER TO RECORD (CtlT.Object) END;
        Languages* = POINTER TO RECORD (CtlT.Object) END;
        Language* = POINTER TO RECORD (CtlT.Object) END;
        Documents* = POINTER TO RECORD (CtlT.Object) END;
        _Document* = POINTER TO RECORD (CtlT.Object) END;
        Template* = POINTER TO RECORD (CtlT.Object) END;
        Templates* = POINTER TO RECORD (CtlT.Object) END;
        RoutingSlip* = POINTER TO RECORD (CtlT.Object) END;
        Bookmark* = POINTER TO RECORD (CtlT.Object) END;
        Bookmarks* = POINTER TO RECORD (CtlT.Object) END;
        Variable* = POINTER TO RECORD (CtlT.Object) END;
        Variables* = POINTER TO RECORD (CtlT.Object) END;
        RecentFile* = POINTER TO RECORD (CtlT.Object) END;
        RecentFiles* = POINTER TO RECORD (CtlT.Object) END;
        Window* = POINTER TO RECORD (CtlT.Object) END;
        Windows* = POINTER TO RECORD (CtlT.Object) END;
        Pane* = POINTER TO RECORD (CtlT.Object) END;
        Panes* = POINTER TO RECORD (CtlT.Object) END;
        Range* = POINTER TO RECORD (CtlT.Object) END;
        ListFormat* = POINTER TO RECORD (CtlT.Object) END;
        Find* = POINTER TO RECORD (CtlT.Object) END;
        Replacement* = POINTER TO RECORD (CtlT.Object) END;
        Characters* = POINTER TO RECORD (CtlT.Object) END;
        Words* = POINTER TO RECORD (CtlT.Object) END;
        Sentences* = POINTER TO RECORD (CtlT.Object) END;
        Sections* = POINTER TO RECORD (CtlT.Object) END;
        Section* = POINTER TO RECORD (CtlT.Object) END;
        Paragraphs* = POINTER TO RECORD (CtlT.Object) END;
        Paragraph* = POINTER TO RECORD (CtlT.Object) END;
        DropCap* = POINTER TO RECORD (CtlT.Object) END;
        TabStops* = POINTER TO RECORD (CtlT.Object) END;
        TabStop* = POINTER TO RECORD (CtlT.Object) END;
        _ParagraphFormat* = POINTER TO RECORD (CtlT.Object) END;
        _Font* = POINTER TO RECORD (CtlT.Object) END;
        Table* = POINTER TO RECORD (CtlT.Object) END;
        Row* = POINTER TO RECORD (CtlT.Object) END;
        Column* = POINTER TO RECORD (CtlT.Object) END;
        Cell* = POINTER TO RECORD (CtlT.Object) END;
        Tables* = POINTER TO RECORD (CtlT.Object) END;
        Rows* = POINTER TO RECORD (CtlT.Object) END;
        Columns* = POINTER TO RECORD (CtlT.Object) END;
        Cells* = POINTER TO RECORD (CtlT.Object) END;
        AutoCorrect* = POINTER TO RECORD (CtlT.Object) END;
        AutoCorrectEntries* = POINTER TO RECORD (CtlT.Object) END;
        AutoCorrectEntry* = POINTER TO RECORD (CtlT.Object) END;
        FirstLetterExceptions* = POINTER TO RECORD (CtlT.Object) END;
        FirstLetterException* = POINTER TO RECORD (CtlT.Object) END;
        TwoInitialCapsExceptions* = POINTER TO RECORD (CtlT.Object) END;
        TwoInitialCapsException* = POINTER TO RECORD (CtlT.Object) END;
        Footnotes* = POINTER TO RECORD (CtlT.Object) END;
        Endnotes* = POINTER TO RECORD (CtlT.Object) END;
        Comments* = POINTER TO RECORD (CtlT.Object) END;
        Footnote* = POINTER TO RECORD (CtlT.Object) END;
        Endnote* = POINTER TO RECORD (CtlT.Object) END;
        Comment* = POINTER TO RECORD (CtlT.Object) END;
        Borders* = POINTER TO RECORD (CtlT.Object) END;
        Border* = POINTER TO RECORD (CtlT.Object) END;
        Shading* = POINTER TO RECORD (CtlT.Object) END;
        TextRetrievalMode* = POINTER TO RECORD (CtlT.Object) END;
        AutoTextEntries* = POINTER TO RECORD (CtlT.Object) END;
        AutoTextEntry* = POINTER TO RECORD (CtlT.Object) END;
        System* = POINTER TO RECORD (CtlT.Object) END;
        OLEFormat* = POINTER TO RECORD (CtlT.Object) END;
        LinkFormat* = POINTER TO RECORD (CtlT.Object) END;
        _OLEControl* = POINTER TO RECORD (CtlT.Object) END;
        Fields* = POINTER TO RECORD (CtlT.Object) END;
        Field* = POINTER TO RECORD (CtlT.Object) END;
        Browser* = POINTER TO RECORD (CtlT.Object) END;
        Styles* = POINTER TO RECORD (CtlT.Object) END;
        Style* = POINTER TO RECORD (CtlT.Object) END;
        Frames* = POINTER TO RECORD (CtlT.Object) END;
        Frame* = POINTER TO RECORD (CtlT.Object) END;
        FormFields* = POINTER TO RECORD (CtlT.Object) END;
        FormField* = POINTER TO RECORD (CtlT.Object) END;
        TextInput* = POINTER TO RECORD (CtlT.Object) END;
        CheckBox* = POINTER TO RECORD (CtlT.Object) END;
        DropDown* = POINTER TO RECORD (CtlT.Object) END;
        ListEntries* = POINTER TO RECORD (CtlT.Object) END;
        ListEntry* = POINTER TO RECORD (CtlT.Object) END;
        TablesOfFigures* = POINTER TO RECORD (CtlT.Object) END;
        TableOfFigures* = POINTER TO RECORD (CtlT.Object) END;
        MailMerge* = POINTER TO RECORD (CtlT.Object) END;
        MailMergeFields* = POINTER TO RECORD (CtlT.Object) END;
        MailMergeField* = POINTER TO RECORD (CtlT.Object) END;
        MailMergeDataSource* = POINTER TO RECORD (CtlT.Object) END;
        MailMergeFieldNames* = POINTER TO RECORD (CtlT.Object) END;
        MailMergeFieldName* = POINTER TO RECORD (CtlT.Object) END;
        MailMergeDataFields* = POINTER TO RECORD (CtlT.Object) END;
        MailMergeDataField* = POINTER TO RECORD (CtlT.Object) END;
        Envelope* = POINTER TO RECORD (CtlT.Object) END;
        MailingLabel* = POINTER TO RECORD (CtlT.Object) END;
        CustomLabels* = POINTER TO RECORD (CtlT.Object) END;
        CustomLabel* = POINTER TO RECORD (CtlT.Object) END;
        TablesOfContents* = POINTER TO RECORD (CtlT.Object) END;
        TableOfContents* = POINTER TO RECORD (CtlT.Object) END;
        TablesOfAuthorities* = POINTER TO RECORD (CtlT.Object) END;
        TableOfAuthorities* = POINTER TO RECORD (CtlT.Object) END;
        Dialogs* = POINTER TO RECORD (CtlT.Object) END;
        Dialog* = POINTER TO RECORD (CtlT.Object) END;
        PageSetup* = POINTER TO RECORD (CtlT.Object) END;
        LineNumbering* = POINTER TO RECORD (CtlT.Object) END;
        TextColumns* = POINTER TO RECORD (CtlT.Object) END;
        TextColumn* = POINTER TO RECORD (CtlT.Object) END;
        Selection* = POINTER TO RECORD (CtlT.Object) END;
        TablesOfAuthoritiesCategories* = POINTER TO RECORD (CtlT.Object) END;
        TableOfAuthoritiesCategory* = POINTER TO RECORD (CtlT.Object) END;
        CaptionLabels* = POINTER TO RECORD (CtlT.Object) END;
        CaptionLabel* = POINTER TO RECORD (CtlT.Object) END;
        AutoCaptions* = POINTER TO RECORD (CtlT.Object) END;
        AutoCaption* = POINTER TO RECORD (CtlT.Object) END;
        Indexes* = POINTER TO RECORD (CtlT.Object) END;
        Index* = POINTER TO RECORD (CtlT.Object) END;
        AddIn* = POINTER TO RECORD (CtlT.Object) END;
        AddIns* = POINTER TO RECORD (CtlT.Object) END;
        Revisions* = POINTER TO RECORD (CtlT.Object) END;
        Revision* = POINTER TO RECORD (CtlT.Object) END;
        Task* = POINTER TO RECORD (CtlT.Object) END;
        Tasks* = POINTER TO RECORD (CtlT.Object) END;
        HeadersFooters* = POINTER TO RECORD (CtlT.Object) END;
        HeaderFooter* = POINTER TO RECORD (CtlT.Object) END;
        PageNumbers* = POINTER TO RECORD (CtlT.Object) END;
        PageNumber* = POINTER TO RECORD (CtlT.Object) END;
        Subdocuments* = POINTER TO RECORD (CtlT.Object) END;
        Subdocument* = POINTER TO RECORD (CtlT.Object) END;
        HeadingStyles* = POINTER TO RECORD (CtlT.Object) END;
        HeadingStyle* = POINTER TO RECORD (CtlT.Object) END;
        StoryRanges* = POINTER TO RECORD (CtlT.Object) END;
        ListLevel* = POINTER TO RECORD (CtlT.Object) END;
        ListLevels* = POINTER TO RECORD (CtlT.Object) END;
        ListTemplate* = POINTER TO RECORD (CtlT.Object) END;
        ListTemplates* = POINTER TO RECORD (CtlT.Object) END;
        ListParagraphs* = POINTER TO RECORD (CtlT.Object) END;
        List* = POINTER TO RECORD (CtlT.Object) END;
        Lists* = POINTER TO RECORD (CtlT.Object) END;
        ListGallery* = POINTER TO RECORD (CtlT.Object) END;
        ListGalleries* = POINTER TO RECORD (CtlT.Object) END;
        KeyBindings* = POINTER TO RECORD (CtlT.Object) END;
        KeysBoundTo* = POINTER TO RECORD (CtlT.Object) END;
        KeyBinding* = POINTER TO RECORD (CtlT.Object) END;
        FileConverter* = POINTER TO RECORD (CtlT.Object) END;
        FileConverters* = POINTER TO RECORD (CtlT.Object) END;
        SynonymInfo* = POINTER TO RECORD (CtlT.Object) END;
        Hyperlinks* = POINTER TO RECORD (CtlT.Object) END;
        Hyperlink* = POINTER TO RECORD (CtlT.Object) END;
        Shapes* = POINTER TO RECORD (CtlT.Object) END;
        ShapeRange* = POINTER TO RECORD (CtlT.Object) END;
        GroupShapes* = POINTER TO RECORD (CtlT.Object) END;
        Shape* = POINTER TO RECORD (CtlT.Object) END;
        TextFrame* = POINTER TO RECORD (CtlT.Object) END;
        _LetterContent* = POINTER TO RECORD (CtlT.Object) END;
        View* = POINTER TO RECORD (CtlT.Object) END;
        Zoom* = POINTER TO RECORD (CtlT.Object) END;
        Zooms* = POINTER TO RECORD (CtlT.Object) END;
        InlineShape* = POINTER TO RECORD (CtlT.Object) END;
        InlineShapes* = POINTER TO RECORD (CtlT.Object) END;
        SpellingSuggestions* = POINTER TO RECORD (CtlT.Object) END;
        SpellingSuggestion* = POINTER TO RECORD (CtlT.Object) END;
        Dictionaries* = POINTER TO RECORD (CtlT.Object) END;
        HangulHanjaConversionDictionaries* = POINTER TO RECORD (CtlT.Object) END;
        Dictionary* = POINTER TO RECORD (CtlT.Object) END;
        ReadabilityStatistics* = POINTER TO RECORD (CtlT.Object) END;
        ReadabilityStatistic* = POINTER TO RECORD (CtlT.Object) END;
        Versions* = POINTER TO RECORD (CtlT.Object) END;
        Version* = POINTER TO RECORD (CtlT.Object) END;
        Options* = POINTER TO RECORD (CtlT.Object) END;
        MailMessage* = POINTER TO RECORD (CtlT.Object) END;
        ProofreadingErrors* = POINTER TO RECORD (CtlT.Object) END;
        Mailer* = POINTER TO RECORD (CtlT.Object) END;
        WrapFormat* = POINTER TO RECORD (CtlT.Object) END;
        HangulAndAlphabetExceptions* = POINTER TO RECORD (CtlT.Object) END;
        HangulAndAlphabetException* = POINTER TO RECORD (CtlT.Object) END;
        Adjustments* = POINTER TO RECORD (CtlT.Object) END;
        CalloutFormat* = POINTER TO RECORD (CtlT.Object) END;
        ColorFormat* = POINTER TO RECORD (CtlT.Object) END;
        ConnectorFormat* = POINTER TO RECORD (CtlT.Object) END;
        FillFormat* = POINTER TO RECORD (CtlT.Object) END;
        FreeformBuilder* = POINTER TO RECORD (CtlT.Object) END;
        LineFormat* = POINTER TO RECORD (CtlT.Object) END;
        PictureFormat* = POINTER TO RECORD (CtlT.Object) END;
        ShadowFormat* = POINTER TO RECORD (CtlT.Object) END;
        ShapeNode* = POINTER TO RECORD (CtlT.Object) END;
        ShapeNodes* = POINTER TO RECORD (CtlT.Object) END;
        TextEffectFormat* = POINTER TO RECORD (CtlT.Object) END;
        ThreeDFormat* = POINTER TO RECORD (CtlT.Object) END;
        ApplicationEvents* = POINTER TO ABSTRACT RECORD (CtlT.OutObject) END;
        Global* = _Global;
        Application* = _Application;
        DocumentEvents* = POINTER TO ABSTRACT RECORD (CtlT.OutObject) END;
        Document* = _Document;
        Font* = _Font;
        ParagraphFormat* = _ParagraphFormat;
        OCXEvents* = POINTER TO ABSTRACT RECORD (CtlT.OutObject) END;
        OLEControl* = _OLEControl;
        LetterContent* = _LetterContent;


    PROCEDURE This_Application* (v: CtlT.Any): _Application;
        VAR new: _Application;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020970-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END This_Application;

    PROCEDURE Is_Application* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020970-0000-0000-C000-000000000046}")
    END Is_Application;

    PROCEDURE This_Global* (v: CtlT.Any): _Global;
        VAR new: _Global;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209B9-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END This_Global;

    PROCEDURE Is_Global* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209B9-0000-0000-C000-000000000046}")
    END Is_Global;

    PROCEDURE ThisFontNames* (v: CtlT.Any): FontNames;
        VAR new: FontNames;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002096F-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisFontNames;

    PROCEDURE IsFontNames* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002096F-0000-0000-C000-000000000046}")
    END IsFontNames;

    PROCEDURE ThisLanguages* (v: CtlT.Any): Languages;
        VAR new: Languages;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002096E-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisLanguages;

    PROCEDURE IsLanguages* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002096E-0000-0000-C000-000000000046}")
    END IsLanguages;

    PROCEDURE ThisLanguage* (v: CtlT.Any): Language;
        VAR new: Language;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002096D-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisLanguage;

    PROCEDURE IsLanguage* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002096D-0000-0000-C000-000000000046}")
    END IsLanguage;

    PROCEDURE ThisDocuments* (v: CtlT.Any): Documents;
        VAR new: Documents;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002096C-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisDocuments;

    PROCEDURE IsDocuments* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002096C-0000-0000-C000-000000000046}")
    END IsDocuments;

    PROCEDURE This_Document* (v: CtlT.Any): _Document;
        VAR new: _Document;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002096B-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END This_Document;

    PROCEDURE Is_Document* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002096B-0000-0000-C000-000000000046}")
    END Is_Document;

    PROCEDURE ThisTemplate* (v: CtlT.Any): Template;
        VAR new: Template;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002096A-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisTemplate;

    PROCEDURE IsTemplate* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002096A-0000-0000-C000-000000000046}")
    END IsTemplate;

    PROCEDURE ThisTemplates* (v: CtlT.Any): Templates;
        VAR new: Templates;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209A2-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisTemplates;

    PROCEDURE IsTemplates* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209A2-0000-0000-C000-000000000046}")
    END IsTemplates;

    PROCEDURE ThisRoutingSlip* (v: CtlT.Any): RoutingSlip;
        VAR new: RoutingSlip;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020969-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisRoutingSlip;

    PROCEDURE IsRoutingSlip* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020969-0000-0000-C000-000000000046}")
    END IsRoutingSlip;

    PROCEDURE ThisBookmark* (v: CtlT.Any): Bookmark;
        VAR new: Bookmark;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020968-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisBookmark;

    PROCEDURE IsBookmark* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020968-0000-0000-C000-000000000046}")
    END IsBookmark;

    PROCEDURE ThisBookmarks* (v: CtlT.Any): Bookmarks;
        VAR new: Bookmarks;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020967-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisBookmarks;

    PROCEDURE IsBookmarks* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020967-0000-0000-C000-000000000046}")
    END IsBookmarks;

    PROCEDURE ThisVariable* (v: CtlT.Any): Variable;
        VAR new: Variable;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020966-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisVariable;

    PROCEDURE IsVariable* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020966-0000-0000-C000-000000000046}")
    END IsVariable;

    PROCEDURE ThisVariables* (v: CtlT.Any): Variables;
        VAR new: Variables;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020965-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisVariables;

    PROCEDURE IsVariables* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020965-0000-0000-C000-000000000046}")
    END IsVariables;

    PROCEDURE ThisRecentFile* (v: CtlT.Any): RecentFile;
        VAR new: RecentFile;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020964-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisRecentFile;

    PROCEDURE IsRecentFile* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020964-0000-0000-C000-000000000046}")
    END IsRecentFile;

    PROCEDURE ThisRecentFiles* (v: CtlT.Any): RecentFiles;
        VAR new: RecentFiles;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020963-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisRecentFiles;

    PROCEDURE IsRecentFiles* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020963-0000-0000-C000-000000000046}")
    END IsRecentFiles;

    PROCEDURE ThisWindow* (v: CtlT.Any): Window;
        VAR new: Window;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020962-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisWindow;

    PROCEDURE IsWindow* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020962-0000-0000-C000-000000000046}")
    END IsWindow;

    PROCEDURE ThisWindows* (v: CtlT.Any): Windows;
        VAR new: Windows;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020961-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisWindows;

    PROCEDURE IsWindows* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020961-0000-0000-C000-000000000046}")
    END IsWindows;

    PROCEDURE ThisPane* (v: CtlT.Any): Pane;
        VAR new: Pane;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020960-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisPane;

    PROCEDURE IsPane* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020960-0000-0000-C000-000000000046}")
    END IsPane;

    PROCEDURE ThisPanes* (v: CtlT.Any): Panes;
        VAR new: Panes;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002095F-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisPanes;

    PROCEDURE IsPanes* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002095F-0000-0000-C000-000000000046}")
    END IsPanes;

    PROCEDURE ThisRange* (v: CtlT.Any): Range;
        VAR new: Range;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002095E-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisRange;

    PROCEDURE IsRange* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002095E-0000-0000-C000-000000000046}")
    END IsRange;

    PROCEDURE ThisListFormat* (v: CtlT.Any): ListFormat;
        VAR new: ListFormat;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209C0-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisListFormat;

    PROCEDURE IsListFormat* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209C0-0000-0000-C000-000000000046}")
    END IsListFormat;

    PROCEDURE ThisFind* (v: CtlT.Any): Find;
        VAR new: Find;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209B0-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisFind;

    PROCEDURE IsFind* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209B0-0000-0000-C000-000000000046}")
    END IsFind;

    PROCEDURE ThisReplacement* (v: CtlT.Any): Replacement;
        VAR new: Replacement;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209B1-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisReplacement;

    PROCEDURE IsReplacement* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209B1-0000-0000-C000-000000000046}")
    END IsReplacement;

    PROCEDURE ThisCharacters* (v: CtlT.Any): Characters;
        VAR new: Characters;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002095D-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisCharacters;

    PROCEDURE IsCharacters* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002095D-0000-0000-C000-000000000046}")
    END IsCharacters;

    PROCEDURE ThisWords* (v: CtlT.Any): Words;
        VAR new: Words;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002095C-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisWords;

    PROCEDURE IsWords* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002095C-0000-0000-C000-000000000046}")
    END IsWords;

    PROCEDURE ThisSentences* (v: CtlT.Any): Sentences;
        VAR new: Sentences;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002095B-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisSentences;

    PROCEDURE IsSentences* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002095B-0000-0000-C000-000000000046}")
    END IsSentences;

    PROCEDURE ThisSections* (v: CtlT.Any): Sections;
        VAR new: Sections;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002095A-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisSections;

    PROCEDURE IsSections* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002095A-0000-0000-C000-000000000046}")
    END IsSections;

    PROCEDURE ThisSection* (v: CtlT.Any): Section;
        VAR new: Section;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020959-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisSection;

    PROCEDURE IsSection* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020959-0000-0000-C000-000000000046}")
    END IsSection;

    PROCEDURE ThisParagraphs* (v: CtlT.Any): Paragraphs;
        VAR new: Paragraphs;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020958-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisParagraphs;

    PROCEDURE IsParagraphs* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020958-0000-0000-C000-000000000046}")
    END IsParagraphs;

    PROCEDURE ThisParagraph* (v: CtlT.Any): Paragraph;
        VAR new: Paragraph;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020957-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisParagraph;

    PROCEDURE IsParagraph* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020957-0000-0000-C000-000000000046}")
    END IsParagraph;

    PROCEDURE ThisDropCap* (v: CtlT.Any): DropCap;
        VAR new: DropCap;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020956-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisDropCap;

    PROCEDURE IsDropCap* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020956-0000-0000-C000-000000000046}")
    END IsDropCap;

    PROCEDURE ThisTabStops* (v: CtlT.Any): TabStops;
        VAR new: TabStops;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020955-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisTabStops;

    PROCEDURE IsTabStops* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020955-0000-0000-C000-000000000046}")
    END IsTabStops;

    PROCEDURE ThisTabStop* (v: CtlT.Any): TabStop;
        VAR new: TabStop;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020954-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisTabStop;

    PROCEDURE IsTabStop* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020954-0000-0000-C000-000000000046}")
    END IsTabStop;

    PROCEDURE This_ParagraphFormat* (v: CtlT.Any): _ParagraphFormat;
        VAR new: _ParagraphFormat;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020953-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END This_ParagraphFormat;

    PROCEDURE Is_ParagraphFormat* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020953-0000-0000-C000-000000000046}")
    END Is_ParagraphFormat;

    PROCEDURE This_Font* (v: CtlT.Any): _Font;
        VAR new: _Font;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020952-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END This_Font;

    PROCEDURE Is_Font* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020952-0000-0000-C000-000000000046}")
    END Is_Font;

    PROCEDURE ThisTable* (v: CtlT.Any): Table;
        VAR new: Table;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020951-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisTable;

    PROCEDURE IsTable* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020951-0000-0000-C000-000000000046}")
    END IsTable;

    PROCEDURE ThisRow* (v: CtlT.Any): Row;
        VAR new: Row;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020950-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisRow;

    PROCEDURE IsRow* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020950-0000-0000-C000-000000000046}")
    END IsRow;

    PROCEDURE ThisColumn* (v: CtlT.Any): Column;
        VAR new: Column;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002094F-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisColumn;

    PROCEDURE IsColumn* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002094F-0000-0000-C000-000000000046}")
    END IsColumn;

    PROCEDURE ThisCell* (v: CtlT.Any): Cell;
        VAR new: Cell;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002094E-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisCell;

    PROCEDURE IsCell* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002094E-0000-0000-C000-000000000046}")
    END IsCell;

    PROCEDURE ThisTables* (v: CtlT.Any): Tables;
        VAR new: Tables;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002094D-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisTables;

    PROCEDURE IsTables* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002094D-0000-0000-C000-000000000046}")
    END IsTables;

    PROCEDURE ThisRows* (v: CtlT.Any): Rows;
        VAR new: Rows;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002094C-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisRows;

    PROCEDURE IsRows* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002094C-0000-0000-C000-000000000046}")
    END IsRows;

    PROCEDURE ThisColumns* (v: CtlT.Any): Columns;
        VAR new: Columns;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002094B-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisColumns;

    PROCEDURE IsColumns* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002094B-0000-0000-C000-000000000046}")
    END IsColumns;

    PROCEDURE ThisCells* (v: CtlT.Any): Cells;
        VAR new: Cells;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002094A-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisCells;

    PROCEDURE IsCells* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002094A-0000-0000-C000-000000000046}")
    END IsCells;

    PROCEDURE ThisAutoCorrect* (v: CtlT.Any): AutoCorrect;
        VAR new: AutoCorrect;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020949-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisAutoCorrect;

    PROCEDURE IsAutoCorrect* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020949-0000-0000-C000-000000000046}")
    END IsAutoCorrect;

    PROCEDURE ThisAutoCorrectEntries* (v: CtlT.Any): AutoCorrectEntries;
        VAR new: AutoCorrectEntries;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020948-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisAutoCorrectEntries;

    PROCEDURE IsAutoCorrectEntries* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020948-0000-0000-C000-000000000046}")
    END IsAutoCorrectEntries;

    PROCEDURE ThisAutoCorrectEntry* (v: CtlT.Any): AutoCorrectEntry;
        VAR new: AutoCorrectEntry;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020947-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisAutoCorrectEntry;

    PROCEDURE IsAutoCorrectEntry* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020947-0000-0000-C000-000000000046}")
    END IsAutoCorrectEntry;

    PROCEDURE ThisFirstLetterExceptions* (v: CtlT.Any): FirstLetterExceptions;
        VAR new: FirstLetterExceptions;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020946-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisFirstLetterExceptions;

    PROCEDURE IsFirstLetterExceptions* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020946-0000-0000-C000-000000000046}")
    END IsFirstLetterExceptions;

    PROCEDURE ThisFirstLetterException* (v: CtlT.Any): FirstLetterException;
        VAR new: FirstLetterException;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020945-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisFirstLetterException;

    PROCEDURE IsFirstLetterException* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020945-0000-0000-C000-000000000046}")
    END IsFirstLetterException;

    PROCEDURE ThisTwoInitialCapsExceptions* (v: CtlT.Any): TwoInitialCapsExceptions;
        VAR new: TwoInitialCapsExceptions;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020944-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisTwoInitialCapsExceptions;

    PROCEDURE IsTwoInitialCapsExceptions* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020944-0000-0000-C000-000000000046}")
    END IsTwoInitialCapsExceptions;

    PROCEDURE ThisTwoInitialCapsException* (v: CtlT.Any): TwoInitialCapsException;
        VAR new: TwoInitialCapsException;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020943-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisTwoInitialCapsException;

    PROCEDURE IsTwoInitialCapsException* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020943-0000-0000-C000-000000000046}")
    END IsTwoInitialCapsException;

    PROCEDURE ThisFootnotes* (v: CtlT.Any): Footnotes;
        VAR new: Footnotes;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020942-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisFootnotes;

    PROCEDURE IsFootnotes* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020942-0000-0000-C000-000000000046}")
    END IsFootnotes;

    PROCEDURE ThisEndnotes* (v: CtlT.Any): Endnotes;
        VAR new: Endnotes;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020941-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisEndnotes;

    PROCEDURE IsEndnotes* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020941-0000-0000-C000-000000000046}")
    END IsEndnotes;

    PROCEDURE ThisComments* (v: CtlT.Any): Comments;
        VAR new: Comments;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020940-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisComments;

    PROCEDURE IsComments* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020940-0000-0000-C000-000000000046}")
    END IsComments;

    PROCEDURE ThisFootnote* (v: CtlT.Any): Footnote;
        VAR new: Footnote;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002093F-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisFootnote;

    PROCEDURE IsFootnote* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002093F-0000-0000-C000-000000000046}")
    END IsFootnote;

    PROCEDURE ThisEndnote* (v: CtlT.Any): Endnote;
        VAR new: Endnote;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002093E-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisEndnote;

    PROCEDURE IsEndnote* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002093E-0000-0000-C000-000000000046}")
    END IsEndnote;

    PROCEDURE ThisComment* (v: CtlT.Any): Comment;
        VAR new: Comment;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002093D-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisComment;

    PROCEDURE IsComment* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002093D-0000-0000-C000-000000000046}")
    END IsComment;

    PROCEDURE ThisBorders* (v: CtlT.Any): Borders;
        VAR new: Borders;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002093C-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisBorders;

    PROCEDURE IsBorders* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002093C-0000-0000-C000-000000000046}")
    END IsBorders;

    PROCEDURE ThisBorder* (v: CtlT.Any): Border;
        VAR new: Border;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002093B-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisBorder;

    PROCEDURE IsBorder* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002093B-0000-0000-C000-000000000046}")
    END IsBorder;

    PROCEDURE ThisShading* (v: CtlT.Any): Shading;
        VAR new: Shading;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002093A-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisShading;

    PROCEDURE IsShading* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002093A-0000-0000-C000-000000000046}")
    END IsShading;

    PROCEDURE ThisTextRetrievalMode* (v: CtlT.Any): TextRetrievalMode;
        VAR new: TextRetrievalMode;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020939-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisTextRetrievalMode;

    PROCEDURE IsTextRetrievalMode* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020939-0000-0000-C000-000000000046}")
    END IsTextRetrievalMode;

    PROCEDURE ThisAutoTextEntries* (v: CtlT.Any): AutoTextEntries;
        VAR new: AutoTextEntries;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020937-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisAutoTextEntries;

    PROCEDURE IsAutoTextEntries* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020937-0000-0000-C000-000000000046}")
    END IsAutoTextEntries;

    PROCEDURE ThisAutoTextEntry* (v: CtlT.Any): AutoTextEntry;
        VAR new: AutoTextEntry;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020936-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisAutoTextEntry;

    PROCEDURE IsAutoTextEntry* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020936-0000-0000-C000-000000000046}")
    END IsAutoTextEntry;

    PROCEDURE ThisSystem* (v: CtlT.Any): System;
        VAR new: System;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020935-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisSystem;

    PROCEDURE IsSystem* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020935-0000-0000-C000-000000000046}")
    END IsSystem;

    PROCEDURE ThisOLEFormat* (v: CtlT.Any): OLEFormat;
        VAR new: OLEFormat;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020933-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisOLEFormat;

    PROCEDURE IsOLEFormat* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020933-0000-0000-C000-000000000046}")
    END IsOLEFormat;

    PROCEDURE ThisLinkFormat* (v: CtlT.Any): LinkFormat;
        VAR new: LinkFormat;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020931-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisLinkFormat;

    PROCEDURE IsLinkFormat* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020931-0000-0000-C000-000000000046}")
    END IsLinkFormat;

    PROCEDURE This_OLEControl* (v: CtlT.Any): _OLEControl;
        VAR new: _OLEControl;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209A4-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END This_OLEControl;

    PROCEDURE Is_OLEControl* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209A4-0000-0000-C000-000000000046}")
    END Is_OLEControl;

    PROCEDURE ThisFields* (v: CtlT.Any): Fields;
        VAR new: Fields;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020930-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisFields;

    PROCEDURE IsFields* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020930-0000-0000-C000-000000000046}")
    END IsFields;

    PROCEDURE ThisField* (v: CtlT.Any): Field;
        VAR new: Field;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002092F-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisField;

    PROCEDURE IsField* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002092F-0000-0000-C000-000000000046}")
    END IsField;

    PROCEDURE ThisBrowser* (v: CtlT.Any): Browser;
        VAR new: Browser;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002092E-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisBrowser;

    PROCEDURE IsBrowser* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002092E-0000-0000-C000-000000000046}")
    END IsBrowser;

    PROCEDURE ThisStyles* (v: CtlT.Any): Styles;
        VAR new: Styles;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002092D-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisStyles;

    PROCEDURE IsStyles* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002092D-0000-0000-C000-000000000046}")
    END IsStyles;

    PROCEDURE ThisStyle* (v: CtlT.Any): Style;
        VAR new: Style;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002092C-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisStyle;

    PROCEDURE IsStyle* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002092C-0000-0000-C000-000000000046}")
    END IsStyle;

    PROCEDURE ThisFrames* (v: CtlT.Any): Frames;
        VAR new: Frames;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002092B-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisFrames;

    PROCEDURE IsFrames* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002092B-0000-0000-C000-000000000046}")
    END IsFrames;

    PROCEDURE ThisFrame* (v: CtlT.Any): Frame;
        VAR new: Frame;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002092A-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisFrame;

    PROCEDURE IsFrame* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002092A-0000-0000-C000-000000000046}")
    END IsFrame;

    PROCEDURE ThisFormFields* (v: CtlT.Any): FormFields;
        VAR new: FormFields;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020929-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisFormFields;

    PROCEDURE IsFormFields* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020929-0000-0000-C000-000000000046}")
    END IsFormFields;

    PROCEDURE ThisFormField* (v: CtlT.Any): FormField;
        VAR new: FormField;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020928-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisFormField;

    PROCEDURE IsFormField* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020928-0000-0000-C000-000000000046}")
    END IsFormField;

    PROCEDURE ThisTextInput* (v: CtlT.Any): TextInput;
        VAR new: TextInput;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020927-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisTextInput;

    PROCEDURE IsTextInput* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020927-0000-0000-C000-000000000046}")
    END IsTextInput;

    PROCEDURE ThisCheckBox* (v: CtlT.Any): CheckBox;
        VAR new: CheckBox;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020926-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisCheckBox;

    PROCEDURE IsCheckBox* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020926-0000-0000-C000-000000000046}")
    END IsCheckBox;

    PROCEDURE ThisDropDown* (v: CtlT.Any): DropDown;
        VAR new: DropDown;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020925-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisDropDown;

    PROCEDURE IsDropDown* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020925-0000-0000-C000-000000000046}")
    END IsDropDown;

    PROCEDURE ThisListEntries* (v: CtlT.Any): ListEntries;
        VAR new: ListEntries;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020924-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisListEntries;

    PROCEDURE IsListEntries* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020924-0000-0000-C000-000000000046}")
    END IsListEntries;

    PROCEDURE ThisListEntry* (v: CtlT.Any): ListEntry;
        VAR new: ListEntry;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020923-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisListEntry;

    PROCEDURE IsListEntry* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020923-0000-0000-C000-000000000046}")
    END IsListEntry;

    PROCEDURE ThisTablesOfFigures* (v: CtlT.Any): TablesOfFigures;
        VAR new: TablesOfFigures;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020922-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisTablesOfFigures;

    PROCEDURE IsTablesOfFigures* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020922-0000-0000-C000-000000000046}")
    END IsTablesOfFigures;

    PROCEDURE ThisTableOfFigures* (v: CtlT.Any): TableOfFigures;
        VAR new: TableOfFigures;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020921-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisTableOfFigures;

    PROCEDURE IsTableOfFigures* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020921-0000-0000-C000-000000000046}")
    END IsTableOfFigures;

    PROCEDURE ThisMailMerge* (v: CtlT.Any): MailMerge;
        VAR new: MailMerge;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020920-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisMailMerge;

    PROCEDURE IsMailMerge* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020920-0000-0000-C000-000000000046}")
    END IsMailMerge;

    PROCEDURE ThisMailMergeFields* (v: CtlT.Any): MailMergeFields;
        VAR new: MailMergeFields;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002091F-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisMailMergeFields;

    PROCEDURE IsMailMergeFields* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002091F-0000-0000-C000-000000000046}")
    END IsMailMergeFields;

    PROCEDURE ThisMailMergeField* (v: CtlT.Any): MailMergeField;
        VAR new: MailMergeField;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002091E-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisMailMergeField;

    PROCEDURE IsMailMergeField* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002091E-0000-0000-C000-000000000046}")
    END IsMailMergeField;

    PROCEDURE ThisMailMergeDataSource* (v: CtlT.Any): MailMergeDataSource;
        VAR new: MailMergeDataSource;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002091D-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisMailMergeDataSource;

    PROCEDURE IsMailMergeDataSource* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002091D-0000-0000-C000-000000000046}")
    END IsMailMergeDataSource;

    PROCEDURE ThisMailMergeFieldNames* (v: CtlT.Any): MailMergeFieldNames;
        VAR new: MailMergeFieldNames;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002091C-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisMailMergeFieldNames;

    PROCEDURE IsMailMergeFieldNames* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002091C-0000-0000-C000-000000000046}")
    END IsMailMergeFieldNames;

    PROCEDURE ThisMailMergeFieldName* (v: CtlT.Any): MailMergeFieldName;
        VAR new: MailMergeFieldName;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002091B-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisMailMergeFieldName;

    PROCEDURE IsMailMergeFieldName* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002091B-0000-0000-C000-000000000046}")
    END IsMailMergeFieldName;

    PROCEDURE ThisMailMergeDataFields* (v: CtlT.Any): MailMergeDataFields;
        VAR new: MailMergeDataFields;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002091A-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisMailMergeDataFields;

    PROCEDURE IsMailMergeDataFields* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002091A-0000-0000-C000-000000000046}")
    END IsMailMergeDataFields;

    PROCEDURE ThisMailMergeDataField* (v: CtlT.Any): MailMergeDataField;
        VAR new: MailMergeDataField;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020919-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisMailMergeDataField;

    PROCEDURE IsMailMergeDataField* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020919-0000-0000-C000-000000000046}")
    END IsMailMergeDataField;

    PROCEDURE ThisEnvelope* (v: CtlT.Any): Envelope;
        VAR new: Envelope;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020918-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisEnvelope;

    PROCEDURE IsEnvelope* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020918-0000-0000-C000-000000000046}")
    END IsEnvelope;

    PROCEDURE ThisMailingLabel* (v: CtlT.Any): MailingLabel;
        VAR new: MailingLabel;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020917-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisMailingLabel;

    PROCEDURE IsMailingLabel* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020917-0000-0000-C000-000000000046}")
    END IsMailingLabel;

    PROCEDURE ThisCustomLabels* (v: CtlT.Any): CustomLabels;
        VAR new: CustomLabels;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020916-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisCustomLabels;

    PROCEDURE IsCustomLabels* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020916-0000-0000-C000-000000000046}")
    END IsCustomLabels;

    PROCEDURE ThisCustomLabel* (v: CtlT.Any): CustomLabel;
        VAR new: CustomLabel;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020915-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisCustomLabel;

    PROCEDURE IsCustomLabel* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020915-0000-0000-C000-000000000046}")
    END IsCustomLabel;

    PROCEDURE ThisTablesOfContents* (v: CtlT.Any): TablesOfContents;
        VAR new: TablesOfContents;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020914-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisTablesOfContents;

    PROCEDURE IsTablesOfContents* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020914-0000-0000-C000-000000000046}")
    END IsTablesOfContents;

    PROCEDURE ThisTableOfContents* (v: CtlT.Any): TableOfContents;
        VAR new: TableOfContents;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020913-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisTableOfContents;

    PROCEDURE IsTableOfContents* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020913-0000-0000-C000-000000000046}")
    END IsTableOfContents;

    PROCEDURE ThisTablesOfAuthorities* (v: CtlT.Any): TablesOfAuthorities;
        VAR new: TablesOfAuthorities;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020912-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisTablesOfAuthorities;

    PROCEDURE IsTablesOfAuthorities* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020912-0000-0000-C000-000000000046}")
    END IsTablesOfAuthorities;

    PROCEDURE ThisTableOfAuthorities* (v: CtlT.Any): TableOfAuthorities;
        VAR new: TableOfAuthorities;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020911-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisTableOfAuthorities;

    PROCEDURE IsTableOfAuthorities* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020911-0000-0000-C000-000000000046}")
    END IsTableOfAuthorities;

    PROCEDURE ThisDialogs* (v: CtlT.Any): Dialogs;
        VAR new: Dialogs;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020910-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisDialogs;

    PROCEDURE IsDialogs* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020910-0000-0000-C000-000000000046}")
    END IsDialogs;

    PROCEDURE ThisDialog* (v: CtlT.Any): Dialog;
        VAR new: Dialog;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209B8-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisDialog;

    PROCEDURE IsDialog* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209B8-0000-0000-C000-000000000046}")
    END IsDialog;

    PROCEDURE ThisPageSetup* (v: CtlT.Any): PageSetup;
        VAR new: PageSetup;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020971-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisPageSetup;

    PROCEDURE IsPageSetup* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020971-0000-0000-C000-000000000046}")
    END IsPageSetup;

    PROCEDURE ThisLineNumbering* (v: CtlT.Any): LineNumbering;
        VAR new: LineNumbering;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020972-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisLineNumbering;

    PROCEDURE IsLineNumbering* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020972-0000-0000-C000-000000000046}")
    END IsLineNumbering;

    PROCEDURE ThisTextColumns* (v: CtlT.Any): TextColumns;
        VAR new: TextColumns;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020973-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisTextColumns;

    PROCEDURE IsTextColumns* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020973-0000-0000-C000-000000000046}")
    END IsTextColumns;

    PROCEDURE ThisTextColumn* (v: CtlT.Any): TextColumn;
        VAR new: TextColumn;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020974-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisTextColumn;

    PROCEDURE IsTextColumn* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020974-0000-0000-C000-000000000046}")
    END IsTextColumn;

    PROCEDURE ThisSelection* (v: CtlT.Any): Selection;
        VAR new: Selection;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020975-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisSelection;

    PROCEDURE IsSelection* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020975-0000-0000-C000-000000000046}")
    END IsSelection;

    PROCEDURE ThisTablesOfAuthoritiesCategories* (v: CtlT.Any): TablesOfAuthoritiesCategories;
        VAR new: TablesOfAuthoritiesCategories;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020976-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisTablesOfAuthoritiesCategories;

    PROCEDURE IsTablesOfAuthoritiesCategories* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020976-0000-0000-C000-000000000046}")
    END IsTablesOfAuthoritiesCategories;

    PROCEDURE ThisTableOfAuthoritiesCategory* (v: CtlT.Any): TableOfAuthoritiesCategory;
        VAR new: TableOfAuthoritiesCategory;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020977-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisTableOfAuthoritiesCategory;

    PROCEDURE IsTableOfAuthoritiesCategory* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020977-0000-0000-C000-000000000046}")
    END IsTableOfAuthoritiesCategory;

    PROCEDURE ThisCaptionLabels* (v: CtlT.Any): CaptionLabels;
        VAR new: CaptionLabels;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020978-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisCaptionLabels;

    PROCEDURE IsCaptionLabels* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020978-0000-0000-C000-000000000046}")
    END IsCaptionLabels;

    PROCEDURE ThisCaptionLabel* (v: CtlT.Any): CaptionLabel;
        VAR new: CaptionLabel;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020979-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisCaptionLabel;

    PROCEDURE IsCaptionLabel* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020979-0000-0000-C000-000000000046}")
    END IsCaptionLabel;

    PROCEDURE ThisAutoCaptions* (v: CtlT.Any): AutoCaptions;
        VAR new: AutoCaptions;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002097A-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisAutoCaptions;

    PROCEDURE IsAutoCaptions* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002097A-0000-0000-C000-000000000046}")
    END IsAutoCaptions;

    PROCEDURE ThisAutoCaption* (v: CtlT.Any): AutoCaption;
        VAR new: AutoCaption;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002097B-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisAutoCaption;

    PROCEDURE IsAutoCaption* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002097B-0000-0000-C000-000000000046}")
    END IsAutoCaption;

    PROCEDURE ThisIndexes* (v: CtlT.Any): Indexes;
        VAR new: Indexes;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002097C-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisIndexes;

    PROCEDURE IsIndexes* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002097C-0000-0000-C000-000000000046}")
    END IsIndexes;

    PROCEDURE ThisIndex* (v: CtlT.Any): Index;
        VAR new: Index;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002097D-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisIndex;

    PROCEDURE IsIndex* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002097D-0000-0000-C000-000000000046}")
    END IsIndex;

    PROCEDURE ThisAddIn* (v: CtlT.Any): AddIn;
        VAR new: AddIn;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002097E-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisAddIn;

    PROCEDURE IsAddIn* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002097E-0000-0000-C000-000000000046}")
    END IsAddIn;

    PROCEDURE ThisAddIns* (v: CtlT.Any): AddIns;
        VAR new: AddIns;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002097F-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisAddIns;

    PROCEDURE IsAddIns* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002097F-0000-0000-C000-000000000046}")
    END IsAddIns;

    PROCEDURE ThisRevisions* (v: CtlT.Any): Revisions;
        VAR new: Revisions;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020980-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisRevisions;

    PROCEDURE IsRevisions* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020980-0000-0000-C000-000000000046}")
    END IsRevisions;

    PROCEDURE ThisRevision* (v: CtlT.Any): Revision;
        VAR new: Revision;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020981-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisRevision;

    PROCEDURE IsRevision* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020981-0000-0000-C000-000000000046}")
    END IsRevision;

    PROCEDURE ThisTask* (v: CtlT.Any): Task;
        VAR new: Task;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020982-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisTask;

    PROCEDURE IsTask* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020982-0000-0000-C000-000000000046}")
    END IsTask;

    PROCEDURE ThisTasks* (v: CtlT.Any): Tasks;
        VAR new: Tasks;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020983-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisTasks;

    PROCEDURE IsTasks* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020983-0000-0000-C000-000000000046}")
    END IsTasks;

    PROCEDURE ThisHeadersFooters* (v: CtlT.Any): HeadersFooters;
        VAR new: HeadersFooters;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020984-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisHeadersFooters;

    PROCEDURE IsHeadersFooters* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020984-0000-0000-C000-000000000046}")
    END IsHeadersFooters;

    PROCEDURE ThisHeaderFooter* (v: CtlT.Any): HeaderFooter;
        VAR new: HeaderFooter;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020985-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisHeaderFooter;

    PROCEDURE IsHeaderFooter* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020985-0000-0000-C000-000000000046}")
    END IsHeaderFooter;

    PROCEDURE ThisPageNumbers* (v: CtlT.Any): PageNumbers;
        VAR new: PageNumbers;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020986-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisPageNumbers;

    PROCEDURE IsPageNumbers* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020986-0000-0000-C000-000000000046}")
    END IsPageNumbers;

    PROCEDURE ThisPageNumber* (v: CtlT.Any): PageNumber;
        VAR new: PageNumber;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020987-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisPageNumber;

    PROCEDURE IsPageNumber* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020987-0000-0000-C000-000000000046}")
    END IsPageNumber;

    PROCEDURE ThisSubdocuments* (v: CtlT.Any): Subdocuments;
        VAR new: Subdocuments;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020988-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisSubdocuments;

    PROCEDURE IsSubdocuments* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020988-0000-0000-C000-000000000046}")
    END IsSubdocuments;

    PROCEDURE ThisSubdocument* (v: CtlT.Any): Subdocument;
        VAR new: Subdocument;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020989-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisSubdocument;

    PROCEDURE IsSubdocument* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020989-0000-0000-C000-000000000046}")
    END IsSubdocument;

    PROCEDURE ThisHeadingStyles* (v: CtlT.Any): HeadingStyles;
        VAR new: HeadingStyles;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002098A-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisHeadingStyles;

    PROCEDURE IsHeadingStyles* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002098A-0000-0000-C000-000000000046}")
    END IsHeadingStyles;

    PROCEDURE ThisHeadingStyle* (v: CtlT.Any): HeadingStyle;
        VAR new: HeadingStyle;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002098B-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisHeadingStyle;

    PROCEDURE IsHeadingStyle* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002098B-0000-0000-C000-000000000046}")
    END IsHeadingStyle;

    PROCEDURE ThisStoryRanges* (v: CtlT.Any): StoryRanges;
        VAR new: StoryRanges;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002098C-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisStoryRanges;

    PROCEDURE IsStoryRanges* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002098C-0000-0000-C000-000000000046}")
    END IsStoryRanges;

    PROCEDURE ThisListLevel* (v: CtlT.Any): ListLevel;
        VAR new: ListLevel;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002098D-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisListLevel;

    PROCEDURE IsListLevel* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002098D-0000-0000-C000-000000000046}")
    END IsListLevel;

    PROCEDURE ThisListLevels* (v: CtlT.Any): ListLevels;
        VAR new: ListLevels;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002098E-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisListLevels;

    PROCEDURE IsListLevels* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002098E-0000-0000-C000-000000000046}")
    END IsListLevels;

    PROCEDURE ThisListTemplate* (v: CtlT.Any): ListTemplate;
        VAR new: ListTemplate;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002098F-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisListTemplate;

    PROCEDURE IsListTemplate* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002098F-0000-0000-C000-000000000046}")
    END IsListTemplate;

    PROCEDURE ThisListTemplates* (v: CtlT.Any): ListTemplates;
        VAR new: ListTemplates;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020990-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisListTemplates;

    PROCEDURE IsListTemplates* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020990-0000-0000-C000-000000000046}")
    END IsListTemplates;

    PROCEDURE ThisListParagraphs* (v: CtlT.Any): ListParagraphs;
        VAR new: ListParagraphs;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020991-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisListParagraphs;

    PROCEDURE IsListParagraphs* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020991-0000-0000-C000-000000000046}")
    END IsListParagraphs;

    PROCEDURE ThisList* (v: CtlT.Any): List;
        VAR new: List;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020992-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisList;

    PROCEDURE IsList* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020992-0000-0000-C000-000000000046}")
    END IsList;

    PROCEDURE ThisLists* (v: CtlT.Any): Lists;
        VAR new: Lists;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020993-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisLists;

    PROCEDURE IsLists* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020993-0000-0000-C000-000000000046}")
    END IsLists;

    PROCEDURE ThisListGallery* (v: CtlT.Any): ListGallery;
        VAR new: ListGallery;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020994-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisListGallery;

    PROCEDURE IsListGallery* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020994-0000-0000-C000-000000000046}")
    END IsListGallery;

    PROCEDURE ThisListGalleries* (v: CtlT.Any): ListGalleries;
        VAR new: ListGalleries;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020995-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisListGalleries;

    PROCEDURE IsListGalleries* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020995-0000-0000-C000-000000000046}")
    END IsListGalleries;

    PROCEDURE ThisKeyBindings* (v: CtlT.Any): KeyBindings;
        VAR new: KeyBindings;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020996-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisKeyBindings;

    PROCEDURE IsKeyBindings* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020996-0000-0000-C000-000000000046}")
    END IsKeyBindings;

    PROCEDURE ThisKeysBoundTo* (v: CtlT.Any): KeysBoundTo;
        VAR new: KeysBoundTo;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020997-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisKeysBoundTo;

    PROCEDURE IsKeysBoundTo* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020997-0000-0000-C000-000000000046}")
    END IsKeysBoundTo;

    PROCEDURE ThisKeyBinding* (v: CtlT.Any): KeyBinding;
        VAR new: KeyBinding;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020998-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisKeyBinding;

    PROCEDURE IsKeyBinding* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020998-0000-0000-C000-000000000046}")
    END IsKeyBinding;

    PROCEDURE ThisFileConverter* (v: CtlT.Any): FileConverter;
        VAR new: FileConverter;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{00020999-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisFileConverter;

    PROCEDURE IsFileConverter* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{00020999-0000-0000-C000-000000000046}")
    END IsFileConverter;

    PROCEDURE ThisFileConverters* (v: CtlT.Any): FileConverters;
        VAR new: FileConverters;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002099A-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisFileConverters;

    PROCEDURE IsFileConverters* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002099A-0000-0000-C000-000000000046}")
    END IsFileConverters;

    PROCEDURE ThisSynonymInfo* (v: CtlT.Any): SynonymInfo;
        VAR new: SynonymInfo;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002099B-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisSynonymInfo;

    PROCEDURE IsSynonymInfo* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002099B-0000-0000-C000-000000000046}")
    END IsSynonymInfo;

    PROCEDURE ThisHyperlinks* (v: CtlT.Any): Hyperlinks;
        VAR new: Hyperlinks;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002099C-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisHyperlinks;

    PROCEDURE IsHyperlinks* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002099C-0000-0000-C000-000000000046}")
    END IsHyperlinks;

    PROCEDURE ThisHyperlink* (v: CtlT.Any): Hyperlink;
        VAR new: Hyperlink;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002099D-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisHyperlink;

    PROCEDURE IsHyperlink* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002099D-0000-0000-C000-000000000046}")
    END IsHyperlink;

    PROCEDURE ThisShapes* (v: CtlT.Any): Shapes;
        VAR new: Shapes;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{0002099F-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisShapes;

    PROCEDURE IsShapes* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{0002099F-0000-0000-C000-000000000046}")
    END IsShapes;

    PROCEDURE ThisShapeRange* (v: CtlT.Any): ShapeRange;
        VAR new: ShapeRange;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209B5-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisShapeRange;

    PROCEDURE IsShapeRange* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209B5-0000-0000-C000-000000000046}")
    END IsShapeRange;

    PROCEDURE ThisGroupShapes* (v: CtlT.Any): GroupShapes;
        VAR new: GroupShapes;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209B6-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisGroupShapes;

    PROCEDURE IsGroupShapes* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209B6-0000-0000-C000-000000000046}")
    END IsGroupShapes;

    PROCEDURE ThisShape* (v: CtlT.Any): Shape;
        VAR new: Shape;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209A0-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisShape;

    PROCEDURE IsShape* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209A0-0000-0000-C000-000000000046}")
    END IsShape;

    PROCEDURE ThisTextFrame* (v: CtlT.Any): TextFrame;
        VAR new: TextFrame;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209B2-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisTextFrame;

    PROCEDURE IsTextFrame* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209B2-0000-0000-C000-000000000046}")
    END IsTextFrame;

    PROCEDURE This_LetterContent* (v: CtlT.Any): _LetterContent;
        VAR new: _LetterContent;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209A1-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END This_LetterContent;

    PROCEDURE Is_LetterContent* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209A1-0000-0000-C000-000000000046}")
    END Is_LetterContent;

    PROCEDURE ThisView* (v: CtlT.Any): View;
        VAR new: View;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209A5-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisView;

    PROCEDURE IsView* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209A5-0000-0000-C000-000000000046}")
    END IsView;

    PROCEDURE ThisZoom* (v: CtlT.Any): Zoom;
        VAR new: Zoom;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209A6-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisZoom;

    PROCEDURE IsZoom* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209A6-0000-0000-C000-000000000046}")
    END IsZoom;

    PROCEDURE ThisZooms* (v: CtlT.Any): Zooms;
        VAR new: Zooms;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209A7-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisZooms;

    PROCEDURE IsZooms* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209A7-0000-0000-C000-000000000046}")
    END IsZooms;

    PROCEDURE ThisInlineShape* (v: CtlT.Any): InlineShape;
        VAR new: InlineShape;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209A8-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisInlineShape;

    PROCEDURE IsInlineShape* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209A8-0000-0000-C000-000000000046}")
    END IsInlineShape;

    PROCEDURE ThisInlineShapes* (v: CtlT.Any): InlineShapes;
        VAR new: InlineShapes;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209A9-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisInlineShapes;

    PROCEDURE IsInlineShapes* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209A9-0000-0000-C000-000000000046}")
    END IsInlineShapes;

    PROCEDURE ThisSpellingSuggestions* (v: CtlT.Any): SpellingSuggestions;
        VAR new: SpellingSuggestions;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209AA-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisSpellingSuggestions;

    PROCEDURE IsSpellingSuggestions* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209AA-0000-0000-C000-000000000046}")
    END IsSpellingSuggestions;

    PROCEDURE ThisSpellingSuggestion* (v: CtlT.Any): SpellingSuggestion;
        VAR new: SpellingSuggestion;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209AB-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisSpellingSuggestion;

    PROCEDURE IsSpellingSuggestion* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209AB-0000-0000-C000-000000000046}")
    END IsSpellingSuggestion;

    PROCEDURE ThisDictionaries* (v: CtlT.Any): Dictionaries;
        VAR new: Dictionaries;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209AC-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisDictionaries;

    PROCEDURE IsDictionaries* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209AC-0000-0000-C000-000000000046}")
    END IsDictionaries;

    PROCEDURE ThisHangulHanjaConversionDictionaries* (v: CtlT.Any): HangulHanjaConversionDictionaries;
        VAR new: HangulHanjaConversionDictionaries;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209E0-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisHangulHanjaConversionDictionaries;

    PROCEDURE IsHangulHanjaConversionDictionaries* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209E0-0000-0000-C000-000000000046}")
    END IsHangulHanjaConversionDictionaries;

    PROCEDURE ThisDictionary* (v: CtlT.Any): Dictionary;
        VAR new: Dictionary;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209AD-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisDictionary;

    PROCEDURE IsDictionary* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209AD-0000-0000-C000-000000000046}")
    END IsDictionary;

    PROCEDURE ThisReadabilityStatistics* (v: CtlT.Any): ReadabilityStatistics;
        VAR new: ReadabilityStatistics;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209AE-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisReadabilityStatistics;

    PROCEDURE IsReadabilityStatistics* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209AE-0000-0000-C000-000000000046}")
    END IsReadabilityStatistics;

    PROCEDURE ThisReadabilityStatistic* (v: CtlT.Any): ReadabilityStatistic;
        VAR new: ReadabilityStatistic;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209AF-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisReadabilityStatistic;

    PROCEDURE IsReadabilityStatistic* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209AF-0000-0000-C000-000000000046}")
    END IsReadabilityStatistic;

    PROCEDURE ThisVersions* (v: CtlT.Any): Versions;
        VAR new: Versions;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209B3-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisVersions;

    PROCEDURE IsVersions* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209B3-0000-0000-C000-000000000046}")
    END IsVersions;

    PROCEDURE ThisVersion* (v: CtlT.Any): Version;
        VAR new: Version;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209B4-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisVersion;

    PROCEDURE IsVersion* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209B4-0000-0000-C000-000000000046}")
    END IsVersion;

    PROCEDURE ThisOptions* (v: CtlT.Any): Options;
        VAR new: Options;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209B7-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisOptions;

    PROCEDURE IsOptions* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209B7-0000-0000-C000-000000000046}")
    END IsOptions;

    PROCEDURE ThisMailMessage* (v: CtlT.Any): MailMessage;
        VAR new: MailMessage;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209BA-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisMailMessage;

    PROCEDURE IsMailMessage* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209BA-0000-0000-C000-000000000046}")
    END IsMailMessage;

    PROCEDURE ThisProofreadingErrors* (v: CtlT.Any): ProofreadingErrors;
        VAR new: ProofreadingErrors;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209BB-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisProofreadingErrors;

    PROCEDURE IsProofreadingErrors* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209BB-0000-0000-C000-000000000046}")
    END IsProofreadingErrors;

    PROCEDURE ThisMailer* (v: CtlT.Any): Mailer;
        VAR new: Mailer;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209BD-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisMailer;

    PROCEDURE IsMailer* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209BD-0000-0000-C000-000000000046}")
    END IsMailer;

    PROCEDURE ThisWrapFormat* (v: CtlT.Any): WrapFormat;
        VAR new: WrapFormat;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209C3-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisWrapFormat;

    PROCEDURE IsWrapFormat* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209C3-0000-0000-C000-000000000046}")
    END IsWrapFormat;

    PROCEDURE ThisHangulAndAlphabetExceptions* (v: CtlT.Any): HangulAndAlphabetExceptions;
        VAR new: HangulAndAlphabetExceptions;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209D1-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisHangulAndAlphabetExceptions;

    PROCEDURE IsHangulAndAlphabetExceptions* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209D1-0000-0000-C000-000000000046}")
    END IsHangulAndAlphabetExceptions;

    PROCEDURE ThisHangulAndAlphabetException* (v: CtlT.Any): HangulAndAlphabetException;
        VAR new: HangulAndAlphabetException;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209D2-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisHangulAndAlphabetException;

    PROCEDURE IsHangulAndAlphabetException* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209D2-0000-0000-C000-000000000046}")
    END IsHangulAndAlphabetException;

    PROCEDURE ThisAdjustments* (v: CtlT.Any): Adjustments;
        VAR new: Adjustments;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209C4-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisAdjustments;

    PROCEDURE IsAdjustments* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209C4-0000-0000-C000-000000000046}")
    END IsAdjustments;

    PROCEDURE ThisCalloutFormat* (v: CtlT.Any): CalloutFormat;
        VAR new: CalloutFormat;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209C5-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisCalloutFormat;

    PROCEDURE IsCalloutFormat* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209C5-0000-0000-C000-000000000046}")
    END IsCalloutFormat;

    PROCEDURE ThisColorFormat* (v: CtlT.Any): ColorFormat;
        VAR new: ColorFormat;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209C6-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisColorFormat;

    PROCEDURE IsColorFormat* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209C6-0000-0000-C000-000000000046}")
    END IsColorFormat;

    PROCEDURE ThisConnectorFormat* (v: CtlT.Any): ConnectorFormat;
        VAR new: ConnectorFormat;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209C7-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisConnectorFormat;

    PROCEDURE IsConnectorFormat* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209C7-0000-0000-C000-000000000046}")
    END IsConnectorFormat;

    PROCEDURE ThisFillFormat* (v: CtlT.Any): FillFormat;
        VAR new: FillFormat;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209C8-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisFillFormat;

    PROCEDURE IsFillFormat* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209C8-0000-0000-C000-000000000046}")
    END IsFillFormat;

    PROCEDURE ThisFreeformBuilder* (v: CtlT.Any): FreeformBuilder;
        VAR new: FreeformBuilder;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209C9-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisFreeformBuilder;

    PROCEDURE IsFreeformBuilder* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209C9-0000-0000-C000-000000000046}")
    END IsFreeformBuilder;

    PROCEDURE ThisLineFormat* (v: CtlT.Any): LineFormat;
        VAR new: LineFormat;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209CA-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisLineFormat;

    PROCEDURE IsLineFormat* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209CA-0000-0000-C000-000000000046}")
    END IsLineFormat;

    PROCEDURE ThisPictureFormat* (v: CtlT.Any): PictureFormat;
        VAR new: PictureFormat;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209CB-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisPictureFormat;

    PROCEDURE IsPictureFormat* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209CB-0000-0000-C000-000000000046}")
    END IsPictureFormat;

    PROCEDURE ThisShadowFormat* (v: CtlT.Any): ShadowFormat;
        VAR new: ShadowFormat;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209CC-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisShadowFormat;

    PROCEDURE IsShadowFormat* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209CC-0000-0000-C000-000000000046}")
    END IsShadowFormat;

    PROCEDURE ThisShapeNode* (v: CtlT.Any): ShapeNode;
        VAR new: ShapeNode;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209CD-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisShapeNode;

    PROCEDURE IsShapeNode* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209CD-0000-0000-C000-000000000046}")
    END IsShapeNode;

    PROCEDURE ThisShapeNodes* (v: CtlT.Any): ShapeNodes;
        VAR new: ShapeNodes;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209CE-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisShapeNodes;

    PROCEDURE IsShapeNodes* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209CE-0000-0000-C000-000000000046}")
    END IsShapeNodes;

    PROCEDURE ThisTextEffectFormat* (v: CtlT.Any): TextEffectFormat;
        VAR new: TextEffectFormat;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209CF-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisTextEffectFormat;

    PROCEDURE IsTextEffectFormat* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209CF-0000-0000-C000-000000000046}")
    END IsTextEffectFormat;

    PROCEDURE ThisThreeDFormat* (v: CtlT.Any): ThreeDFormat;
        VAR new: ThreeDFormat;
    BEGIN
        IF v # NIL THEN
            NEW(new); CtlC.InitObj(new, v, "{000209D0-0000-0000-C000-000000000046}"); RETURN new
        ELSE RETURN NIL
        END
    END ThisThreeDFormat;

    PROCEDURE IsThreeDFormat* (v: CtlT.Any): BOOLEAN;
    BEGIN
        RETURN CtlC.IsObj(v, "{000209D0-0000-0000-C000-000000000046}")
    END IsThreeDFormat;



    (* ---------- _Application, hidden, dual, nonextensible ---------- *)

    PROCEDURE (this: _Application) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: _Application) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: _Application) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: _Application) Name* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 0)
    END Name;

    PROCEDURE (this: _Application) Documents* (): Documents, NEW;
    BEGIN
        RETURN ThisDocuments(CtlC.GetAny(this, 6))
    END Documents;

    PROCEDURE (this: _Application) Windows* (): Windows, NEW;
    BEGIN
        RETURN ThisWindows(CtlC.GetAny(this, 2))
    END Windows;

    PROCEDURE (this: _Application) ActiveDocument* (): Document, NEW;
    BEGIN
        RETURN This_Document(CtlC.GetAny(this, 3))
    END ActiveDocument;

    PROCEDURE (this: _Application) ActiveWindow* (): Window, NEW;
    BEGIN
        RETURN ThisWindow(CtlC.GetAny(this, 4))
    END ActiveWindow;

    PROCEDURE (this: _Application) Selection* (): Selection, NEW;
    BEGIN
        RETURN ThisSelection(CtlC.GetAny(this, 5))
    END Selection;

    PROCEDURE (this: _Application) WordBasic* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1)
    END WordBasic;

    PROCEDURE (this: _Application) RecentFiles* (): RecentFiles, NEW;
    BEGIN
        RETURN ThisRecentFiles(CtlC.GetAny(this, 7))
    END RecentFiles;

    PROCEDURE (this: _Application) NormalTemplate* (): Template, NEW;
    BEGIN
        RETURN ThisTemplate(CtlC.GetAny(this, 8))
    END NormalTemplate;

    PROCEDURE (this: _Application) System* (): System, NEW;
    BEGIN
        RETURN ThisSystem(CtlC.GetAny(this, 9))
    END System;

    PROCEDURE (this: _Application) AutoCorrect* (): AutoCorrect, NEW;
    BEGIN
        RETURN ThisAutoCorrect(CtlC.GetAny(this, 10))
    END AutoCorrect;

    PROCEDURE (this: _Application) FontNames* (): FontNames, NEW;
    BEGIN
        RETURN ThisFontNames(CtlC.GetAny(this, 11))
    END FontNames;

    PROCEDURE (this: _Application) LandscapeFontNames* (): FontNames, NEW;
    BEGIN
        RETURN ThisFontNames(CtlC.GetAny(this, 12))
    END LandscapeFontNames;

    PROCEDURE (this: _Application) PortraitFontNames* (): FontNames, NEW;
    BEGIN
        RETURN ThisFontNames(CtlC.GetAny(this, 13))
    END PortraitFontNames;

    PROCEDURE (this: _Application) Languages* (): Languages, NEW;
    BEGIN
        RETURN ThisLanguages(CtlC.GetAny(this, 14))
    END Languages;

    PROCEDURE (this: _Application) Assistant* (): CtlOffice.Assistant, NEW;
    BEGIN
        RETURN CtlOffice.ThisAssistant(CtlC.GetAny(this, 15))
    END Assistant;

    PROCEDURE (this: _Application) Browser* (): Browser, NEW;
    BEGIN
        RETURN ThisBrowser(CtlC.GetAny(this, 16))
    END Browser;

    PROCEDURE (this: _Application) FileConverters* (): FileConverters, NEW;
    BEGIN
        RETURN ThisFileConverters(CtlC.GetAny(this, 17))
    END FileConverters;

    PROCEDURE (this: _Application) MailingLabel* (): MailingLabel, NEW;
    BEGIN
        RETURN ThisMailingLabel(CtlC.GetAny(this, 18))
    END MailingLabel;

    PROCEDURE (this: _Application) Dialogs* (): Dialogs, NEW;
    BEGIN
        RETURN ThisDialogs(CtlC.GetAny(this, 19))
    END Dialogs;

    PROCEDURE (this: _Application) CaptionLabels* (): CaptionLabels, NEW;
    BEGIN
        RETURN ThisCaptionLabels(CtlC.GetAny(this, 20))
    END CaptionLabels;

    PROCEDURE (this: _Application) AutoCaptions* (): AutoCaptions, NEW;
    BEGIN
        RETURN ThisAutoCaptions(CtlC.GetAny(this, 21))
    END AutoCaptions;

    PROCEDURE (this: _Application) AddIns* (): AddIns, NEW;
    BEGIN
        RETURN ThisAddIns(CtlC.GetAny(this, 22))
    END AddIns;

    PROCEDURE (this: _Application) Visible* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 23)
    END Visible;

    PROCEDURE (this: _Application) PUTVisible* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 23, p1)
    END PUTVisible;

    PROCEDURE (this: _Application) Version* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 24)
    END Version;

    PROCEDURE (this: _Application) ScreenUpdating* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 26)
    END ScreenUpdating;

    PROCEDURE (this: _Application) PUTScreenUpdating* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 26, p1)
    END PUTScreenUpdating;

    PROCEDURE (this: _Application) PrintPreview* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 27)
    END PrintPreview;

    PROCEDURE (this: _Application) PUTPrintPreview* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 27, p1)
    END PUTPrintPreview;

    PROCEDURE (this: _Application) Tasks* (): Tasks, NEW;
    BEGIN
        RETURN ThisTasks(CtlC.GetAny(this, 28))
    END Tasks;

    PROCEDURE (this: _Application) DisplayStatusBar* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 29)
    END DisplayStatusBar;

    PROCEDURE (this: _Application) PUTDisplayStatusBar* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 29, p1)
    END PUTDisplayStatusBar;

    PROCEDURE (this: _Application) SpecialMode* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 30)
    END SpecialMode;

    PROCEDURE (this: _Application) UsableWidth* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 33)
    END UsableWidth;

    PROCEDURE (this: _Application) UsableHeight* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 34)
    END UsableHeight;

    PROCEDURE (this: _Application) MathCoprocessorAvailable* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 36)
    END MathCoprocessorAvailable;

    PROCEDURE (this: _Application) MouseAvailable* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 37)
    END MouseAvailable;

    PROCEDURE (this: _Application) International* (Index: WdInternationalIndex): CtlT.Any, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallGetMethod(this, 46, arg, ret);
        RETURN CtlC.VarAny(ret)
    END International;

    PROCEDURE (this: _Application) Build* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 47)
    END Build;

    PROCEDURE (this: _Application) CapsLock* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 48)
    END CapsLock;

    PROCEDURE (this: _Application) NumLock* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 49)
    END NumLock;

    PROCEDURE (this: _Application) UserName* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 52)
    END UserName;

    PROCEDURE (this: _Application) PUTUserName* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 52, p1)
    END PUTUserName;

    PROCEDURE (this: _Application) UserInitials* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 53)
    END UserInitials;

    PROCEDURE (this: _Application) PUTUserInitials* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 53, p1)
    END PUTUserInitials;

    PROCEDURE (this: _Application) UserAddress* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 54)
    END UserAddress;

    PROCEDURE (this: _Application) PUTUserAddress* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 54, p1)
    END PUTUserAddress;

    PROCEDURE (this: _Application) MacroContainer* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 55)
    END MacroContainer;

    PROCEDURE (this: _Application) DisplayRecentFiles* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 56)
    END DisplayRecentFiles;

    PROCEDURE (this: _Application) PUTDisplayRecentFiles* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 56, p1)
    END PUTDisplayRecentFiles;

    PROCEDURE (this: _Application) CommandBars* (): CtlOffice.CommandBars, NEW;
    BEGIN
        RETURN CtlOffice.ThisCommandBars(CtlC.GetAny(this, 57))
    END CommandBars;

    PROCEDURE (this: _Application) SynonymInfo* (Word: ARRAY OF CHAR; (* optional *) LanguageID: CtlT.Any): SynonymInfo, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.StrVar(Word, arg[1]);
        CtlC.AnyVar(LanguageID, arg[0]);
        CtlC.CallGetMethod(this, 59, arg, ret);
        RETURN ThisSynonymInfo(CtlC.VarAny(ret))
    END SynonymInfo;

    PROCEDURE (this: _Application) VBE* (): CtlVBIDE.VBE, NEW;
    BEGIN
        RETURN CtlVBIDE.ThisVBE(CtlC.GetAny(this, 61))
    END VBE;

    PROCEDURE (this: _Application) DefaultSaveFormat* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 64)
    END DefaultSaveFormat;

    PROCEDURE (this: _Application) PUTDefaultSaveFormat* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 64, p1)
    END PUTDefaultSaveFormat;

    PROCEDURE (this: _Application) ListGalleries* (): ListGalleries, NEW;
    BEGIN
        RETURN ThisListGalleries(CtlC.GetAny(this, 65))
    END ListGalleries;

    PROCEDURE (this: _Application) ActivePrinter* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 66)
    END ActivePrinter;

    PROCEDURE (this: _Application) PUTActivePrinter* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 66, p1)
    END PUTActivePrinter;

    PROCEDURE (this: _Application) Templates* (): Templates, NEW;
    BEGIN
        RETURN ThisTemplates(CtlC.GetAny(this, 67))
    END Templates;

    PROCEDURE (this: _Application) CustomizationContext* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 68)
    END CustomizationContext;

    PROCEDURE (this: _Application) PUTCustomizationContext* (p1: CtlT.Object), NEW;
    BEGIN
        CtlC.PutObj(this, 68, p1)
    END PUTCustomizationContext;

    PROCEDURE (this: _Application) KeyBindings* (): KeyBindings, NEW;
    BEGIN
        RETURN ThisKeyBindings(CtlC.GetAny(this, 69))
    END KeyBindings;

    PROCEDURE (this: _Application) KeysBoundTo* (KeyCategory: WdKeyCategory; Command: ARRAY OF CHAR; (* optional *) CommandParameter: CtlT.Any): KeysBoundTo, NEW;
        VAR arg: ARRAY 3 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(KeyCategory, arg[2]);
        CtlC.StrVar(Command, arg[1]);
        CtlC.AnyVar(CommandParameter, arg[0]);
        CtlC.CallGetMethod(this, 70, arg, ret);
        RETURN ThisKeysBoundTo(CtlC.VarAny(ret))
    END KeysBoundTo;

    PROCEDURE (this: _Application) FindKey* (KeyCode: INTEGER; (* optional *) KeyCode2: CtlT.Any): KeyBinding, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(KeyCode, arg[1]);
        CtlC.AnyVar(KeyCode2, arg[0]);
        CtlC.CallGetMethod(this, 71, arg, ret);
        RETURN ThisKeyBinding(CtlC.VarAny(ret))
    END FindKey;

    PROCEDURE (this: _Application) Caption* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 80)
    END Caption;

    PROCEDURE (this: _Application) PUTCaption* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 80, p1)
    END PUTCaption;

    PROCEDURE (this: _Application) Path* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 81)
    END Path;

    PROCEDURE (this: _Application) DisplayScrollBars* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 82)
    END DisplayScrollBars;

    PROCEDURE (this: _Application) PUTDisplayScrollBars* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 82, p1)
    END PUTDisplayScrollBars;

    PROCEDURE (this: _Application) StartupPath* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 83)
    END StartupPath;

    PROCEDURE (this: _Application) PUTStartupPath* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 83, p1)
    END PUTStartupPath;

    PROCEDURE (this: _Application) BackgroundSavingStatus* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 85)
    END BackgroundSavingStatus;

    PROCEDURE (this: _Application) BackgroundPrintingStatus* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 86)
    END BackgroundPrintingStatus;

    PROCEDURE (this: _Application) Left* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 87)
    END Left;

    PROCEDURE (this: _Application) PUTLeft* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 87, p1)
    END PUTLeft;

    PROCEDURE (this: _Application) Top* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 88)
    END Top;

    PROCEDURE (this: _Application) PUTTop* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 88, p1)
    END PUTTop;

    PROCEDURE (this: _Application) Width* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 89)
    END Width;

    PROCEDURE (this: _Application) PUTWidth* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 89, p1)
    END PUTWidth;

    PROCEDURE (this: _Application) Height* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 90)
    END Height;

    PROCEDURE (this: _Application) PUTHeight* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 90, p1)
    END PUTHeight;

    PROCEDURE (this: _Application) WindowState* (): WdWindowState, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 91)
    END WindowState;

    PROCEDURE (this: _Application) PUTWindowState* (p1: WdWindowState), NEW;
    BEGIN
        CtlC.PutInt(this, 91, p1)
    END PUTWindowState;

    PROCEDURE (this: _Application) DisplayAutoCompleteTips* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 92)
    END DisplayAutoCompleteTips;

    PROCEDURE (this: _Application) PUTDisplayAutoCompleteTips* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 92, p1)
    END PUTDisplayAutoCompleteTips;

    PROCEDURE (this: _Application) Options* (): Options, NEW;
    BEGIN
        RETURN ThisOptions(CtlC.GetAny(this, 93))
    END Options;

    PROCEDURE (this: _Application) DisplayAlerts* (): WdAlertLevel, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 94)
    END DisplayAlerts;

    PROCEDURE (this: _Application) PUTDisplayAlerts* (p1: WdAlertLevel), NEW;
    BEGIN
        CtlC.PutInt(this, 94, p1)
    END PUTDisplayAlerts;

    PROCEDURE (this: _Application) CustomDictionaries* (): Dictionaries, NEW;
    BEGIN
        RETURN ThisDictionaries(CtlC.GetAny(this, 95))
    END CustomDictionaries;

    PROCEDURE (this: _Application) PathSeparator* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 96)
    END PathSeparator;

    PROCEDURE (this: _Application) PUTStatusBar* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 97, p1)
    END PUTStatusBar;

    PROCEDURE (this: _Application) MAPIAvailable* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 98)
    END MAPIAvailable;

    PROCEDURE (this: _Application) DisplayScreenTips* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 99)
    END DisplayScreenTips;

    PROCEDURE (this: _Application) PUTDisplayScreenTips* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 99, p1)
    END PUTDisplayScreenTips;

    PROCEDURE (this: _Application) EnableCancelKey* (): WdEnableCancelKey, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 100)
    END EnableCancelKey;

    PROCEDURE (this: _Application) PUTEnableCancelKey* (p1: WdEnableCancelKey), NEW;
    BEGIN
        CtlC.PutInt(this, 100, p1)
    END PUTEnableCancelKey;

    PROCEDURE (this: _Application) UserControl* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 101)
    END UserControl;

    PROCEDURE (this: _Application) FileSearch* (): CtlOffice.FileSearch, NEW;
    BEGIN
        RETURN CtlOffice.ThisFileSearch(CtlC.GetAny(this, 103))
    END FileSearch;

    PROCEDURE (this: _Application) MailSystem* (): WdMailSystem, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 104)
    END MailSystem;

    PROCEDURE (this: _Application) DefaultTableSeparator* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 105)
    END DefaultTableSeparator;

    PROCEDURE (this: _Application) PUTDefaultTableSeparator* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 105, p1)
    END PUTDefaultTableSeparator;

    PROCEDURE (this: _Application) ShowVisualBasicEditor* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 106)
    END ShowVisualBasicEditor;

    PROCEDURE (this: _Application) PUTShowVisualBasicEditor* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 106, p1)
    END PUTShowVisualBasicEditor;

    PROCEDURE (this: _Application) BrowseExtraFileTypes* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 108)
    END BrowseExtraFileTypes;

    PROCEDURE (this: _Application) PUTBrowseExtraFileTypes* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 108, p1)
    END PUTBrowseExtraFileTypes;

    PROCEDURE (this: _Application) IsObjectValid* (Object: CtlT.Object): BOOLEAN, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.ObjVar(Object, arg[0]);
        CtlC.CallGetMethod(this, 109, arg, ret);
        RETURN CtlC.VarBool(ret)
    END IsObjectValid;

    PROCEDURE (this: _Application) HangulHanjaDictionaries* (): HangulHanjaConversionDictionaries, NEW;
    BEGIN
        RETURN ThisHangulHanjaConversionDictionaries(CtlC.GetAny(this, 110))
    END HangulHanjaDictionaries;

    PROCEDURE (this: _Application) MailMessage* (): MailMessage, NEW;
    BEGIN
        RETURN ThisMailMessage(CtlC.GetAny(this, 348))
    END MailMessage;

    PROCEDURE (this: _Application) FocusInMailHeader* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 386)
    END FocusInMailHeader;

    PROCEDURE (this: _Application) Quit* ((* optional *) SaveChanges: CtlT.Any; OriginalFormat: CtlT.Any; RouteDocument: CtlT.Any), NEW;
        VAR arg: ARRAY 3 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(SaveChanges, arg[2]);
        CtlC.AnyVar(OriginalFormat, arg[1]);
        CtlC.AnyVar(RouteDocument, arg[0]);
        CtlC.CallParMethod(this, 1105, arg, NIL);
    END Quit;

    PROCEDURE (this: _Application) ScreenRefresh* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 301, NIL);
    END ScreenRefresh;

    PROCEDURE (this: _Application) PrintOut* ((* optional *) Background: CtlT.Any; Append: CtlT.Any; Range: CtlT.Any; OutputFileName: CtlT.Any; From: CtlT.Any; To: CtlT.Any; Item: CtlT.Any; Copies: CtlT.Any; Pages: CtlT.Any; PageType: CtlT.Any; PrintToFile: CtlT.Any; Collate: CtlT.Any; FileName: CtlT.Any; ActivePrinterMacGX: CtlT.Any; ManualDuplexPrint: CtlT.Any), NEW;
        VAR arg: ARRAY 15 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Background, arg[14]);
        CtlC.AnyVar(Append, arg[13]);
        CtlC.AnyVar(Range, arg[12]);
        CtlC.AnyVar(OutputFileName, arg[11]);
        CtlC.AnyVar(From, arg[10]);
        CtlC.AnyVar(To, arg[9]);
        CtlC.AnyVar(Item, arg[8]);
        CtlC.AnyVar(Copies, arg[7]);
        CtlC.AnyVar(Pages, arg[6]);
        CtlC.AnyVar(PageType, arg[5]);
        CtlC.AnyVar(PrintToFile, arg[4]);
        CtlC.AnyVar(Collate, arg[3]);
        CtlC.AnyVar(FileName, arg[2]);
        CtlC.AnyVar(ActivePrinterMacGX, arg[1]);
        CtlC.AnyVar(ManualDuplexPrint, arg[0]);
        CtlC.CallParMethod(this, 302, arg, NIL);
    END PrintOut;

    PROCEDURE (this: _Application) LookupNameProperties* (Name: ARRAY OF CHAR), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.StrVar(Name, arg[0]);
        CtlC.CallParMethod(this, 303, arg, NIL);
    END LookupNameProperties;

    PROCEDURE (this: _Application) SubstituteFont* (UnavailableFont: ARRAY OF CHAR; SubstituteFont: ARRAY OF CHAR), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.StrVar(UnavailableFont, arg[1]);
        CtlC.StrVar(SubstituteFont, arg[0]);
        CtlC.CallParMethod(this, 304, arg, NIL);
    END SubstituteFont;

    PROCEDURE (this: _Application) Repeat* ((* optional *) Times: CtlT.Any): BOOLEAN, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Times, arg[0]);
        CtlC.CallParMethod(this, 305, arg, ret);
        RETURN CtlC.VarBool(ret)
    END Repeat;

    PROCEDURE (this: _Application) DDEExecute* (Channel: INTEGER; Command: ARRAY OF CHAR), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(Channel, arg[1]);
        CtlC.StrVar(Command, arg[0]);
        CtlC.CallParMethod(this, 310, arg, NIL);
    END DDEExecute;

    PROCEDURE (this: _Application) DDEInitiate* (App: ARRAY OF CHAR; Topic: ARRAY OF CHAR): INTEGER, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.StrVar(App, arg[1]);
        CtlC.StrVar(Topic, arg[0]);
        CtlC.CallParMethod(this, 311, arg, ret);
        RETURN CtlC.VarInt(ret)
    END DDEInitiate;

    PROCEDURE (this: _Application) DDEPoke* (Channel: INTEGER; Item: ARRAY OF CHAR; Data: ARRAY OF CHAR), NEW;
        VAR arg: ARRAY 3 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(Channel, arg[2]);
        CtlC.StrVar(Item, arg[1]);
        CtlC.StrVar(Data, arg[0]);
        CtlC.CallParMethod(this, 312, arg, NIL);
    END DDEPoke;

    PROCEDURE (this: _Application) DDERequest* (Channel: INTEGER; Item: ARRAY OF CHAR): CtlT.Strg, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Channel, arg[1]);
        CtlC.StrVar(Item, arg[0]);
        CtlC.CallParMethod(this, 313, arg, ret);
        RETURN CtlC.VarStr(ret)
    END DDERequest;

    PROCEDURE (this: _Application) DDETerminate* (Channel: INTEGER), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(Channel, arg[0]);
        CtlC.CallParMethod(this, 314, arg, NIL);
    END DDETerminate;

    PROCEDURE (this: _Application) DDETerminateAll* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 315, NIL);
    END DDETerminateAll;

    PROCEDURE (this: _Application) BuildKeyCode* (Arg1: WdKey; (* optional *) Arg2: CtlT.Any; Arg3: CtlT.Any; Arg4: CtlT.Any): INTEGER, NEW;
        VAR arg: ARRAY 4 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Arg1, arg[3]);
        CtlC.AnyVar(Arg2, arg[2]);
        CtlC.AnyVar(Arg3, arg[1]);
        CtlC.AnyVar(Arg4, arg[0]);
        CtlC.CallParMethod(this, 316, arg, ret);
        RETURN CtlC.VarInt(ret)
    END BuildKeyCode;

    PROCEDURE (this: _Application) KeyString* (KeyCode: INTEGER; (* optional *) KeyCode2: CtlT.Any): CtlT.Strg, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(KeyCode, arg[1]);
        CtlC.AnyVar(KeyCode2, arg[0]);
        CtlC.CallParMethod(this, 317, arg, ret);
        RETURN CtlC.VarStr(ret)
    END KeyString;

    PROCEDURE (this: _Application) OrganizerCopy* (Source: ARRAY OF CHAR; Destination: ARRAY OF CHAR; Name: ARRAY OF CHAR; Object: WdOrganizerObject), NEW;
        VAR arg: ARRAY 4 OF CtlT.Variant;
    BEGIN
        CtlC.StrVar(Source, arg[3]);
        CtlC.StrVar(Destination, arg[2]);
        CtlC.StrVar(Name, arg[1]);
        CtlC.IntVar(Object, arg[0]);
        CtlC.CallParMethod(this, 318, arg, NIL);
    END OrganizerCopy;

    PROCEDURE (this: _Application) OrganizerDelete* (Source: ARRAY OF CHAR; Name: ARRAY OF CHAR; Object: WdOrganizerObject), NEW;
        VAR arg: ARRAY 3 OF CtlT.Variant;
    BEGIN
        CtlC.StrVar(Source, arg[2]);
        CtlC.StrVar(Name, arg[1]);
        CtlC.IntVar(Object, arg[0]);
        CtlC.CallParMethod(this, 319, arg, NIL);
    END OrganizerDelete;

    PROCEDURE (this: _Application) OrganizerRename* (Source: ARRAY OF CHAR; Name: ARRAY OF CHAR; NewName: ARRAY OF CHAR; Object: WdOrganizerObject), NEW;
        VAR arg: ARRAY 4 OF CtlT.Variant;
    BEGIN
        CtlC.StrVar(Source, arg[3]);
        CtlC.StrVar(Name, arg[2]);
        CtlC.StrVar(NewName, arg[1]);
        CtlC.IntVar(Object, arg[0]);
        CtlC.CallParMethod(this, 320, arg, NIL);
    END OrganizerRename;

    PROCEDURE (this: _Application) AddAddress* (TagID: CtlT.Any; Value: CtlT.Any), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(TagID, arg[1]);
        CtlC.AnyVar(Value, arg[0]);
        CtlC.CallParMethod(this, 321, arg, NIL);
    END AddAddress;

    PROCEDURE (this: _Application) GetAddress* ((* optional *) Name: CtlT.Any; AddressProperties: CtlT.Any; UseAutoText: CtlT.Any; DisplaySelectDialog: CtlT.Any; SelectDialog: CtlT.Any; CheckNamesDialog: CtlT.Any; RecentAddressesChoice: CtlT.Any; UpdateRecentAddresses: CtlT.Any): CtlT.Strg, NEW;
        VAR arg: ARRAY 8 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Name, arg[7]);
        CtlC.AnyVar(AddressProperties, arg[6]);
        CtlC.AnyVar(UseAutoText, arg[5]);
        CtlC.AnyVar(DisplaySelectDialog, arg[4]);
        CtlC.AnyVar(SelectDialog, arg[3]);
        CtlC.AnyVar(CheckNamesDialog, arg[2]);
        CtlC.AnyVar(RecentAddressesChoice, arg[1]);
        CtlC.AnyVar(UpdateRecentAddresses, arg[0]);
        CtlC.CallParMethod(this, 322, arg, ret);
        RETURN CtlC.VarStr(ret)
    END GetAddress;

    PROCEDURE (this: _Application) CheckGrammar* (String: ARRAY OF CHAR): BOOLEAN, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.StrVar(String, arg[0]);
        CtlC.CallParMethod(this, 323, arg, ret);
        RETURN CtlC.VarBool(ret)
    END CheckGrammar;

    PROCEDURE (this: _Application) CheckSpelling* (Word: ARRAY OF CHAR; (* optional *) CustomDictionary: CtlT.Any; IgnoreUppercase: CtlT.Any; MainDictionary: CtlT.Any; CustomDictionary2: CtlT.Any; CustomDictionary3: CtlT.Any; CustomDictionary4: CtlT.Any; CustomDictionary5: CtlT.Any; CustomDictionary6: CtlT.Any; CustomDictionary7: CtlT.Any; CustomDictionary8: CtlT.Any; CustomDictionary9: CtlT.Any; CustomDictionary10: CtlT.Any): BOOLEAN, NEW;
        VAR arg: ARRAY 13 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.StrVar(Word, arg[12]);
        CtlC.AnyVar(CustomDictionary, arg[11]);
        CtlC.AnyVar(IgnoreUppercase, arg[10]);
        CtlC.AnyVar(MainDictionary, arg[9]);
        CtlC.AnyVar(CustomDictionary2, arg[8]);
        CtlC.AnyVar(CustomDictionary3, arg[7]);
        CtlC.AnyVar(CustomDictionary4, arg[6]);
        CtlC.AnyVar(CustomDictionary5, arg[5]);
        CtlC.AnyVar(CustomDictionary6, arg[4]);
        CtlC.AnyVar(CustomDictionary7, arg[3]);
        CtlC.AnyVar(CustomDictionary8, arg[2]);
        CtlC.AnyVar(CustomDictionary9, arg[1]);
        CtlC.AnyVar(CustomDictionary10, arg[0]);
        CtlC.CallParMethod(this, 324, arg, ret);
        RETURN CtlC.VarBool(ret)
    END CheckSpelling;

    PROCEDURE (this: _Application) ResetIgnoreAll* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 326, NIL);
    END ResetIgnoreAll;

    PROCEDURE (this: _Application) GetSpellingSuggestions* (Word: ARRAY OF CHAR; (* optional *) CustomDictionary: CtlT.Any; IgnoreUppercase: CtlT.Any; MainDictionary: CtlT.Any; SuggestionMode: CtlT.Any; CustomDictionary2: CtlT.Any; CustomDictionary3: CtlT.Any; CustomDictionary4: CtlT.Any; CustomDictionary5: CtlT.Any; CustomDictionary6: CtlT.Any; CustomDictionary7: CtlT.Any; CustomDictionary8: CtlT.Any; CustomDictionary9: CtlT.Any; CustomDictionary10: CtlT.Any): SpellingSuggestions, NEW;
        VAR arg: ARRAY 14 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.StrVar(Word, arg[13]);
        CtlC.AnyVar(CustomDictionary, arg[12]);
        CtlC.AnyVar(IgnoreUppercase, arg[11]);
        CtlC.AnyVar(MainDictionary, arg[10]);
        CtlC.AnyVar(SuggestionMode, arg[9]);
        CtlC.AnyVar(CustomDictionary2, arg[8]);
        CtlC.AnyVar(CustomDictionary3, arg[7]);
        CtlC.AnyVar(CustomDictionary4, arg[6]);
        CtlC.AnyVar(CustomDictionary5, arg[5]);
        CtlC.AnyVar(CustomDictionary6, arg[4]);
        CtlC.AnyVar(CustomDictionary7, arg[3]);
        CtlC.AnyVar(CustomDictionary8, arg[2]);
        CtlC.AnyVar(CustomDictionary9, arg[1]);
        CtlC.AnyVar(CustomDictionary10, arg[0]);
        CtlC.CallParMethod(this, 327, arg, ret);
        RETURN ThisSpellingSuggestions(CtlC.VarAny(ret))
    END GetSpellingSuggestions;

    PROCEDURE (this: _Application) GoBack* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 328, NIL);
    END GoBack;

    PROCEDURE (this: _Application) Help* (HelpType: CtlT.Any), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(HelpType, arg[0]);
        CtlC.CallParMethod(this, 329, arg, NIL);
    END Help;

    PROCEDURE (this: _Application) AutomaticChange* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 330, NIL);
    END AutomaticChange;

    PROCEDURE (this: _Application) ShowMe* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 331, NIL);
    END ShowMe;

    PROCEDURE (this: _Application) HelpTool* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 332, NIL);
    END HelpTool;

    PROCEDURE (this: _Application) NewWindow* (): Window, NEW;
        VAR ret: CtlT.Variant;
    BEGIN
        CtlC.CallMethod(this, 345, ret);
        RETURN ThisWindow(CtlC.VarAny(ret))
    END NewWindow;

    PROCEDURE (this: _Application) ListCommands* (ListAllCommands: BOOLEAN), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.BoolVar(ListAllCommands, arg[0]);
        CtlC.CallParMethod(this, 346, arg, NIL);
    END ListCommands;

    PROCEDURE (this: _Application) ShowClipboard* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 349, NIL);
    END ShowClipboard;

    PROCEDURE (this: _Application) OnTime* (When: CtlT.Any; Name: ARRAY OF CHAR; (* optional *) Tolerance: CtlT.Any), NEW;
        VAR arg: ARRAY 3 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(When, arg[2]);
        CtlC.StrVar(Name, arg[1]);
        CtlC.AnyVar(Tolerance, arg[0]);
        CtlC.CallParMethod(this, 350, arg, NIL);
    END OnTime;

    PROCEDURE (this: _Application) NextLetter* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 351, NIL);
    END NextLetter;

    PROCEDURE (this: _Application) MountVolume* (Zone: ARRAY OF CHAR; Server: ARRAY OF CHAR; Volume: ARRAY OF CHAR; (* optional *) User: CtlT.Any; UserPassword: CtlT.Any; VolumePassword: CtlT.Any): SHORTINT, NEW;
        VAR arg: ARRAY 6 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.StrVar(Zone, arg[5]);
        CtlC.StrVar(Server, arg[4]);
        CtlC.StrVar(Volume, arg[3]);
        CtlC.AnyVar(User, arg[2]);
        CtlC.AnyVar(UserPassword, arg[1]);
        CtlC.AnyVar(VolumePassword, arg[0]);
        CtlC.CallParMethod(this, 353, arg, ret);
        RETURN CtlC.VarSInt(ret)
    END MountVolume;

    PROCEDURE (this: _Application) CleanString* (String: ARRAY OF CHAR): CtlT.Strg, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.StrVar(String, arg[0]);
        CtlC.CallParMethod(this, 354, arg, ret);
        RETURN CtlC.VarStr(ret)
    END CleanString;

    PROCEDURE (this: _Application) SendFax* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 356, NIL);
    END SendFax;

    PROCEDURE (this: _Application) ChangeFileOpenDirectory* (Path: ARRAY OF CHAR), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.StrVar(Path, arg[0]);
        CtlC.CallParMethod(this, 357, arg, NIL);
    END ChangeFileOpenDirectory;

    PROCEDURE (this: _Application) Run* (MacroName: ARRAY OF CHAR), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.StrVar(MacroName, arg[0]);
        CtlC.CallParMethod(this, 358, arg, NIL);
    END Run;

    PROCEDURE (this: _Application) GoForward* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 359, NIL);
    END GoForward;

    PROCEDURE (this: _Application) Move* (Left: INTEGER; Top: INTEGER), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(Left, arg[1]);
        CtlC.IntVar(Top, arg[0]);
        CtlC.CallParMethod(this, 360, arg, NIL);
    END Move;

    PROCEDURE (this: _Application) Resize* (Width: INTEGER; Height: INTEGER), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(Width, arg[1]);
        CtlC.IntVar(Height, arg[0]);
        CtlC.CallParMethod(this, 361, arg, NIL);
    END Resize;

    PROCEDURE (this: _Application) InchesToPoints* (Inches: SHORTREAL): SHORTREAL, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.SRealVar(Inches, arg[0]);
        CtlC.CallParMethod(this, 370, arg, ret);
        RETURN CtlC.VarSReal(ret)
    END InchesToPoints;

    PROCEDURE (this: _Application) CentimetersToPoints* (Centimeters: SHORTREAL): SHORTREAL, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.SRealVar(Centimeters, arg[0]);
        CtlC.CallParMethod(this, 371, arg, ret);
        RETURN CtlC.VarSReal(ret)
    END CentimetersToPoints;

    PROCEDURE (this: _Application) MillimetersToPoints* (Millimeters: SHORTREAL): SHORTREAL, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.SRealVar(Millimeters, arg[0]);
        CtlC.CallParMethod(this, 372, arg, ret);
        RETURN CtlC.VarSReal(ret)
    END MillimetersToPoints;

    PROCEDURE (this: _Application) PicasToPoints* (Picas: SHORTREAL): SHORTREAL, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.SRealVar(Picas, arg[0]);
        CtlC.CallParMethod(this, 373, arg, ret);
        RETURN CtlC.VarSReal(ret)
    END PicasToPoints;

    PROCEDURE (this: _Application) LinesToPoints* (Lines: SHORTREAL): SHORTREAL, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.SRealVar(Lines, arg[0]);
        CtlC.CallParMethod(this, 374, arg, ret);
        RETURN CtlC.VarSReal(ret)
    END LinesToPoints;

    PROCEDURE (this: _Application) PointsToInches* (Points: SHORTREAL): SHORTREAL, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.SRealVar(Points, arg[0]);
        CtlC.CallParMethod(this, 380, arg, ret);
        RETURN CtlC.VarSReal(ret)
    END PointsToInches;

    PROCEDURE (this: _Application) PointsToCentimeters* (Points: SHORTREAL): SHORTREAL, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.SRealVar(Points, arg[0]);
        CtlC.CallParMethod(this, 381, arg, ret);
        RETURN CtlC.VarSReal(ret)
    END PointsToCentimeters;

    PROCEDURE (this: _Application) PointsToMillimeters* (Points: SHORTREAL): SHORTREAL, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.SRealVar(Points, arg[0]);
        CtlC.CallParMethod(this, 382, arg, ret);
        RETURN CtlC.VarSReal(ret)
    END PointsToMillimeters;

    PROCEDURE (this: _Application) PointsToPicas* (Points: SHORTREAL): SHORTREAL, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.SRealVar(Points, arg[0]);
        CtlC.CallParMethod(this, 383, arg, ret);
        RETURN CtlC.VarSReal(ret)
    END PointsToPicas;

    PROCEDURE (this: _Application) PointsToLines* (Points: SHORTREAL): SHORTREAL, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.SRealVar(Points, arg[0]);
        CtlC.CallParMethod(this, 384, arg, ret);
        RETURN CtlC.VarSReal(ret)
    END PointsToLines;

    PROCEDURE (this: _Application) Activate* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 385, NIL);
    END Activate;


    (* ---------- _Global, hidden, dual, nonextensible ---------- *)

    PROCEDURE (this: _Global) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: _Global) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: _Global) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: _Global) Name* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 0)
    END Name;

    PROCEDURE (this: _Global) Documents* (): Documents, NEW;
    BEGIN
        RETURN ThisDocuments(CtlC.GetAny(this, 1))
    END Documents;

    PROCEDURE (this: _Global) Windows* (): Windows, NEW;
    BEGIN
        RETURN ThisWindows(CtlC.GetAny(this, 2))
    END Windows;

    PROCEDURE (this: _Global) ActiveDocument* (): Document, NEW;
    BEGIN
        RETURN This_Document(CtlC.GetAny(this, 3))
    END ActiveDocument;

    PROCEDURE (this: _Global) ActiveWindow* (): Window, NEW;
    BEGIN
        RETURN ThisWindow(CtlC.GetAny(this, 4))
    END ActiveWindow;

    PROCEDURE (this: _Global) Selection* (): Selection, NEW;
    BEGIN
        RETURN ThisSelection(CtlC.GetAny(this, 5))
    END Selection;

    PROCEDURE (this: _Global) WordBasic* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 6)
    END WordBasic;

    PROCEDURE (this: _Global) PrintPreview* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 27)
    END PrintPreview;

    PROCEDURE (this: _Global) PUTPrintPreview* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 27, p1)
    END PUTPrintPreview;

    PROCEDURE (this: _Global) RecentFiles* (): RecentFiles, NEW;
    BEGIN
        RETURN ThisRecentFiles(CtlC.GetAny(this, 7))
    END RecentFiles;

    PROCEDURE (this: _Global) NormalTemplate* (): Template, NEW;
    BEGIN
        RETURN ThisTemplate(CtlC.GetAny(this, 8))
    END NormalTemplate;

    PROCEDURE (this: _Global) System* (): System, NEW;
    BEGIN
        RETURN ThisSystem(CtlC.GetAny(this, 9))
    END System;

    PROCEDURE (this: _Global) AutoCorrect* (): AutoCorrect, NEW;
    BEGIN
        RETURN ThisAutoCorrect(CtlC.GetAny(this, 10))
    END AutoCorrect;

    PROCEDURE (this: _Global) FontNames* (): FontNames, NEW;
    BEGIN
        RETURN ThisFontNames(CtlC.GetAny(this, 11))
    END FontNames;

    PROCEDURE (this: _Global) LandscapeFontNames* (): FontNames, NEW;
    BEGIN
        RETURN ThisFontNames(CtlC.GetAny(this, 12))
    END LandscapeFontNames;

    PROCEDURE (this: _Global) PortraitFontNames* (): FontNames, NEW;
    BEGIN
        RETURN ThisFontNames(CtlC.GetAny(this, 13))
    END PortraitFontNames;

    PROCEDURE (this: _Global) Languages* (): Languages, NEW;
    BEGIN
        RETURN ThisLanguages(CtlC.GetAny(this, 14))
    END Languages;

    PROCEDURE (this: _Global) Assistant* (): CtlOffice.Assistant, NEW;
    BEGIN
        RETURN CtlOffice.ThisAssistant(CtlC.GetAny(this, 15))
    END Assistant;

    PROCEDURE (this: _Global) FileConverters* (): FileConverters, NEW;
    BEGIN
        RETURN ThisFileConverters(CtlC.GetAny(this, 17))
    END FileConverters;

    PROCEDURE (this: _Global) Dialogs* (): Dialogs, NEW;
    BEGIN
        RETURN ThisDialogs(CtlC.GetAny(this, 19))
    END Dialogs;

    PROCEDURE (this: _Global) CaptionLabels* (): CaptionLabels, NEW;
    BEGIN
        RETURN ThisCaptionLabels(CtlC.GetAny(this, 20))
    END CaptionLabels;

    PROCEDURE (this: _Global) AutoCaptions* (): AutoCaptions, NEW;
    BEGIN
        RETURN ThisAutoCaptions(CtlC.GetAny(this, 21))
    END AutoCaptions;

    PROCEDURE (this: _Global) AddIns* (): AddIns, NEW;
    BEGIN
        RETURN ThisAddIns(CtlC.GetAny(this, 22))
    END AddIns;

    PROCEDURE (this: _Global) Tasks* (): Tasks, NEW;
    BEGIN
        RETURN ThisTasks(CtlC.GetAny(this, 28))
    END Tasks;

    PROCEDURE (this: _Global) MacroContainer* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 55)
    END MacroContainer;

    PROCEDURE (this: _Global) CommandBars* (): CtlOffice.CommandBars, NEW;
    BEGIN
        RETURN CtlOffice.ThisCommandBars(CtlC.GetAny(this, 57))
    END CommandBars;

    PROCEDURE (this: _Global) SynonymInfo* (Word: ARRAY OF CHAR; (* optional *) LanguageID: CtlT.Any): SynonymInfo, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.StrVar(Word, arg[1]);
        CtlC.AnyVar(LanguageID, arg[0]);
        CtlC.CallGetMethod(this, 59, arg, ret);
        RETURN ThisSynonymInfo(CtlC.VarAny(ret))
    END SynonymInfo;

    PROCEDURE (this: _Global) VBE* (): CtlVBIDE.VBE, NEW;
    BEGIN
        RETURN CtlVBIDE.ThisVBE(CtlC.GetAny(this, 61))
    END VBE;

    PROCEDURE (this: _Global) ListGalleries* (): ListGalleries, NEW;
    BEGIN
        RETURN ThisListGalleries(CtlC.GetAny(this, 65))
    END ListGalleries;

    PROCEDURE (this: _Global) ActivePrinter* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 66)
    END ActivePrinter;

    PROCEDURE (this: _Global) PUTActivePrinter* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 66, p1)
    END PUTActivePrinter;

    PROCEDURE (this: _Global) Templates* (): Templates, NEW;
    BEGIN
        RETURN ThisTemplates(CtlC.GetAny(this, 67))
    END Templates;

    PROCEDURE (this: _Global) CustomizationContext* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 68)
    END CustomizationContext;

    PROCEDURE (this: _Global) PUTCustomizationContext* (p1: CtlT.Object), NEW;
    BEGIN
        CtlC.PutObj(this, 68, p1)
    END PUTCustomizationContext;

    PROCEDURE (this: _Global) KeyBindings* (): KeyBindings, NEW;
    BEGIN
        RETURN ThisKeyBindings(CtlC.GetAny(this, 69))
    END KeyBindings;

    PROCEDURE (this: _Global) KeysBoundTo* (KeyCategory: WdKeyCategory; Command: ARRAY OF CHAR; (* optional *) CommandParameter: CtlT.Any): KeysBoundTo, NEW;
        VAR arg: ARRAY 3 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(KeyCategory, arg[2]);
        CtlC.StrVar(Command, arg[1]);
        CtlC.AnyVar(CommandParameter, arg[0]);
        CtlC.CallGetMethod(this, 70, arg, ret);
        RETURN ThisKeysBoundTo(CtlC.VarAny(ret))
    END KeysBoundTo;

    PROCEDURE (this: _Global) FindKey* (KeyCode: INTEGER; (* optional *) KeyCode2: CtlT.Any): KeyBinding, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(KeyCode, arg[1]);
        CtlC.AnyVar(KeyCode2, arg[0]);
        CtlC.CallGetMethod(this, 71, arg, ret);
        RETURN ThisKeyBinding(CtlC.VarAny(ret))
    END FindKey;

    PROCEDURE (this: _Global) Options* (): Options, NEW;
    BEGIN
        RETURN ThisOptions(CtlC.GetAny(this, 93))
    END Options;

    PROCEDURE (this: _Global) CustomDictionaries* (): Dictionaries, NEW;
    BEGIN
        RETURN ThisDictionaries(CtlC.GetAny(this, 95))
    END CustomDictionaries;

    PROCEDURE (this: _Global) PUTStatusBar* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 97, p1)
    END PUTStatusBar;

    PROCEDURE (this: _Global) ShowVisualBasicEditor* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 104)
    END ShowVisualBasicEditor;

    PROCEDURE (this: _Global) PUTShowVisualBasicEditor* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 104, p1)
    END PUTShowVisualBasicEditor;

    PROCEDURE (this: _Global) IsObjectValid* (Object: CtlT.Object): BOOLEAN, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.ObjVar(Object, arg[0]);
        CtlC.CallGetMethod(this, 109, arg, ret);
        RETURN CtlC.VarBool(ret)
    END IsObjectValid;

    PROCEDURE (this: _Global) HangulHanjaDictionaries* (): HangulHanjaConversionDictionaries, NEW;
    BEGIN
        RETURN ThisHangulHanjaConversionDictionaries(CtlC.GetAny(this, 110))
    END HangulHanjaDictionaries;

    PROCEDURE (this: _Global) Repeat* ((* optional *) Times: CtlT.Any): BOOLEAN, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Times, arg[0]);
        CtlC.CallParMethod(this, 305, arg, ret);
        RETURN CtlC.VarBool(ret)
    END Repeat;

    PROCEDURE (this: _Global) DDEExecute* (Channel: INTEGER; Command: ARRAY OF CHAR), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(Channel, arg[1]);
        CtlC.StrVar(Command, arg[0]);
        CtlC.CallParMethod(this, 310, arg, NIL);
    END DDEExecute;

    PROCEDURE (this: _Global) DDEInitiate* (App: ARRAY OF CHAR; Topic: ARRAY OF CHAR): INTEGER, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.StrVar(App, arg[1]);
        CtlC.StrVar(Topic, arg[0]);
        CtlC.CallParMethod(this, 311, arg, ret);
        RETURN CtlC.VarInt(ret)
    END DDEInitiate;

    PROCEDURE (this: _Global) DDEPoke* (Channel: INTEGER; Item: ARRAY OF CHAR; Data: ARRAY OF CHAR), NEW;
        VAR arg: ARRAY 3 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(Channel, arg[2]);
        CtlC.StrVar(Item, arg[1]);
        CtlC.StrVar(Data, arg[0]);
        CtlC.CallParMethod(this, 312, arg, NIL);
    END DDEPoke;

    PROCEDURE (this: _Global) DDERequest* (Channel: INTEGER; Item: ARRAY OF CHAR): CtlT.Strg, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Channel, arg[1]);
        CtlC.StrVar(Item, arg[0]);
        CtlC.CallParMethod(this, 313, arg, ret);
        RETURN CtlC.VarStr(ret)
    END DDERequest;

    PROCEDURE (this: _Global) DDETerminate* (Channel: INTEGER), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(Channel, arg[0]);
        CtlC.CallParMethod(this, 314, arg, NIL);
    END DDETerminate;

    PROCEDURE (this: _Global) DDETerminateAll* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 315, NIL);
    END DDETerminateAll;

    PROCEDURE (this: _Global) BuildKeyCode* (Arg1: WdKey; (* optional *) Arg2: CtlT.Any; Arg3: CtlT.Any; Arg4: CtlT.Any): INTEGER, NEW;
        VAR arg: ARRAY 4 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Arg1, arg[3]);
        CtlC.AnyVar(Arg2, arg[2]);
        CtlC.AnyVar(Arg3, arg[1]);
        CtlC.AnyVar(Arg4, arg[0]);
        CtlC.CallParMethod(this, 316, arg, ret);
        RETURN CtlC.VarInt(ret)
    END BuildKeyCode;

    PROCEDURE (this: _Global) KeyString* (KeyCode: INTEGER; (* optional *) KeyCode2: CtlT.Any): CtlT.Strg, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(KeyCode, arg[1]);
        CtlC.AnyVar(KeyCode2, arg[0]);
        CtlC.CallParMethod(this, 317, arg, ret);
        RETURN CtlC.VarStr(ret)
    END KeyString;

    PROCEDURE (this: _Global) CheckSpelling* (Word: ARRAY OF CHAR; (* optional *) CustomDictionary: CtlT.Any; IgnoreUppercase: CtlT.Any; MainDictionary: CtlT.Any; CustomDictionary2: CtlT.Any; CustomDictionary3: CtlT.Any; CustomDictionary4: CtlT.Any; CustomDictionary5: CtlT.Any; CustomDictionary6: CtlT.Any; CustomDictionary7: CtlT.Any; CustomDictionary8: CtlT.Any; CustomDictionary9: CtlT.Any; CustomDictionary10: CtlT.Any): BOOLEAN, NEW;
        VAR arg: ARRAY 13 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.StrVar(Word, arg[12]);
        CtlC.AnyVar(CustomDictionary, arg[11]);
        CtlC.AnyVar(IgnoreUppercase, arg[10]);
        CtlC.AnyVar(MainDictionary, arg[9]);
        CtlC.AnyVar(CustomDictionary2, arg[8]);
        CtlC.AnyVar(CustomDictionary3, arg[7]);
        CtlC.AnyVar(CustomDictionary4, arg[6]);
        CtlC.AnyVar(CustomDictionary5, arg[5]);
        CtlC.AnyVar(CustomDictionary6, arg[4]);
        CtlC.AnyVar(CustomDictionary7, arg[3]);
        CtlC.AnyVar(CustomDictionary8, arg[2]);
        CtlC.AnyVar(CustomDictionary9, arg[1]);
        CtlC.AnyVar(CustomDictionary10, arg[0]);
        CtlC.CallParMethod(this, 324, arg, ret);
        RETURN CtlC.VarBool(ret)
    END CheckSpelling;

    PROCEDURE (this: _Global) GetSpellingSuggestions* (Word: ARRAY OF CHAR; (* optional *) CustomDictionary: CtlT.Any; IgnoreUppercase: CtlT.Any; MainDictionary: CtlT.Any; SuggestionMode: CtlT.Any; CustomDictionary2: CtlT.Any; CustomDictionary3: CtlT.Any; CustomDictionary4: CtlT.Any; CustomDictionary5: CtlT.Any; CustomDictionary6: CtlT.Any; CustomDictionary7: CtlT.Any; CustomDictionary8: CtlT.Any; CustomDictionary9: CtlT.Any; CustomDictionary10: CtlT.Any): SpellingSuggestions, NEW;
        VAR arg: ARRAY 14 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.StrVar(Word, arg[13]);
        CtlC.AnyVar(CustomDictionary, arg[12]);
        CtlC.AnyVar(IgnoreUppercase, arg[11]);
        CtlC.AnyVar(MainDictionary, arg[10]);
        CtlC.AnyVar(SuggestionMode, arg[9]);
        CtlC.AnyVar(CustomDictionary2, arg[8]);
        CtlC.AnyVar(CustomDictionary3, arg[7]);
        CtlC.AnyVar(CustomDictionary4, arg[6]);
        CtlC.AnyVar(CustomDictionary5, arg[5]);
        CtlC.AnyVar(CustomDictionary6, arg[4]);
        CtlC.AnyVar(CustomDictionary7, arg[3]);
        CtlC.AnyVar(CustomDictionary8, arg[2]);
        CtlC.AnyVar(CustomDictionary9, arg[1]);
        CtlC.AnyVar(CustomDictionary10, arg[0]);
        CtlC.CallParMethod(this, 327, arg, ret);
        RETURN ThisSpellingSuggestions(CtlC.VarAny(ret))
    END GetSpellingSuggestions;

    PROCEDURE (this: _Global) Help* (HelpType: CtlT.Any), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(HelpType, arg[0]);
        CtlC.CallParMethod(this, 329, arg, NIL);
    END Help;

    PROCEDURE (this: _Global) NewWindow* (): Window, NEW;
        VAR ret: CtlT.Variant;
    BEGIN
        CtlC.CallMethod(this, 345, ret);
        RETURN ThisWindow(CtlC.VarAny(ret))
    END NewWindow;

    PROCEDURE (this: _Global) CleanString* (String: ARRAY OF CHAR): CtlT.Strg, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.StrVar(String, arg[0]);
        CtlC.CallParMethod(this, 354, arg, ret);
        RETURN CtlC.VarStr(ret)
    END CleanString;

    PROCEDURE (this: _Global) ChangeFileOpenDirectory* (Path: ARRAY OF CHAR), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.StrVar(Path, arg[0]);
        CtlC.CallParMethod(this, 355, arg, NIL);
    END ChangeFileOpenDirectory;

    PROCEDURE (this: _Global) InchesToPoints* (Inches: SHORTREAL): SHORTREAL, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.SRealVar(Inches, arg[0]);
        CtlC.CallParMethod(this, 370, arg, ret);
        RETURN CtlC.VarSReal(ret)
    END InchesToPoints;

    PROCEDURE (this: _Global) CentimetersToPoints* (Centimeters: SHORTREAL): SHORTREAL, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.SRealVar(Centimeters, arg[0]);
        CtlC.CallParMethod(this, 371, arg, ret);
        RETURN CtlC.VarSReal(ret)
    END CentimetersToPoints;

    PROCEDURE (this: _Global) MillimetersToPoints* (Millimeters: SHORTREAL): SHORTREAL, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.SRealVar(Millimeters, arg[0]);
        CtlC.CallParMethod(this, 372, arg, ret);
        RETURN CtlC.VarSReal(ret)
    END MillimetersToPoints;

    PROCEDURE (this: _Global) PicasToPoints* (Picas: SHORTREAL): SHORTREAL, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.SRealVar(Picas, arg[0]);
        CtlC.CallParMethod(this, 373, arg, ret);
        RETURN CtlC.VarSReal(ret)
    END PicasToPoints;

    PROCEDURE (this: _Global) LinesToPoints* (Lines: SHORTREAL): SHORTREAL, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.SRealVar(Lines, arg[0]);
        CtlC.CallParMethod(this, 374, arg, ret);
        RETURN CtlC.VarSReal(ret)
    END LinesToPoints;

    PROCEDURE (this: _Global) PointsToInches* (Points: SHORTREAL): SHORTREAL, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.SRealVar(Points, arg[0]);
        CtlC.CallParMethod(this, 380, arg, ret);
        RETURN CtlC.VarSReal(ret)
    END PointsToInches;

    PROCEDURE (this: _Global) PointsToCentimeters* (Points: SHORTREAL): SHORTREAL, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.SRealVar(Points, arg[0]);
        CtlC.CallParMethod(this, 381, arg, ret);
        RETURN CtlC.VarSReal(ret)
    END PointsToCentimeters;

    PROCEDURE (this: _Global) PointsToMillimeters* (Points: SHORTREAL): SHORTREAL, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.SRealVar(Points, arg[0]);
        CtlC.CallParMethod(this, 382, arg, ret);
        RETURN CtlC.VarSReal(ret)
    END PointsToMillimeters;

    PROCEDURE (this: _Global) PointsToPicas* (Points: SHORTREAL): SHORTREAL, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.SRealVar(Points, arg[0]);
        CtlC.CallParMethod(this, 383, arg, ret);
        RETURN CtlC.VarSReal(ret)
    END PointsToPicas;

    PROCEDURE (this: _Global) PointsToLines* (Points: SHORTREAL): SHORTREAL, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.SRealVar(Points, arg[0]);
        CtlC.CallParMethod(this, 384, arg, ret);
        RETURN CtlC.VarSReal(ret)
    END PointsToLines;


    (* ---------- FontNames, dual, nonextensible ---------- *)

    PROCEDURE (this: FontNames) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: FontNames) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Count;

    PROCEDURE (this: FontNames) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: FontNames) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: FontNames) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: FontNames) Item* (Index: INTEGER): CtlT.Strg, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN CtlC.VarStr(ret)
    END Item;


    (* ---------- Languages, dual, nonextensible ---------- *)

    PROCEDURE (this: Languages) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: Languages) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Count;

    PROCEDURE (this: Languages) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Languages) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Languages) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Languages) Item* (Index: CtlT.Any): Language, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisLanguage(CtlC.VarAny(ret))
    END Item;


    (* ---------- Language, dual, nonextensible ---------- *)

    PROCEDURE (this: Language) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Language) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Language) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Language) ID* (): WdLanguageID, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 10)
    END ID;

    PROCEDURE (this: Language) NameLocal* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 0)
    END NameLocal;

    PROCEDURE (this: Language) Name* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 12)
    END Name;

    PROCEDURE (this: Language) ActiveGrammarDictionary* (): Dictionary, NEW;
    BEGIN
        RETURN ThisDictionary(CtlC.GetAny(this, 13))
    END ActiveGrammarDictionary;

    PROCEDURE (this: Language) ActiveHyphenationDictionary* (): Dictionary, NEW;
    BEGIN
        RETURN ThisDictionary(CtlC.GetAny(this, 14))
    END ActiveHyphenationDictionary;

    PROCEDURE (this: Language) ActiveSpellingDictionary* (): Dictionary, NEW;
    BEGIN
        RETURN ThisDictionary(CtlC.GetAny(this, 15))
    END ActiveSpellingDictionary;

    PROCEDURE (this: Language) ActiveThesaurusDictionary* (): Dictionary, NEW;
    BEGIN
        RETURN ThisDictionary(CtlC.GetAny(this, 16))
    END ActiveThesaurusDictionary;

    PROCEDURE (this: Language) DefaultWritingStyle* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 17)
    END DefaultWritingStyle;

    PROCEDURE (this: Language) PUTDefaultWritingStyle* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 17, p1)
    END PUTDefaultWritingStyle;

    PROCEDURE (this: Language) WritingStyleList* (): CtlT.Any, NEW;
    BEGIN
        RETURN CtlC.GetAny(this, 18)
    END WritingStyleList;

    PROCEDURE (this: Language) SpellingDictionaryType* (): WdDictionaryType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 19)
    END SpellingDictionaryType;

    PROCEDURE (this: Language) PUTSpellingDictionaryType* (p1: WdDictionaryType), NEW;
    BEGIN
        CtlC.PutInt(this, 19, p1)
    END PUTSpellingDictionaryType;


    (* ---------- Documents, dual, nonextensible ---------- *)

    PROCEDURE (this: Documents) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: Documents) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Count;

    PROCEDURE (this: Documents) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Documents) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Documents) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Documents) Item* (Index: CtlT.Any): Document, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN This_Document(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: Documents) Close* ((* optional *) SaveChanges: CtlT.Any; OriginalFormat: CtlT.Any; RouteDocument: CtlT.Any), NEW;
        VAR arg: ARRAY 3 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(SaveChanges, arg[2]);
        CtlC.AnyVar(OriginalFormat, arg[1]);
        CtlC.AnyVar(RouteDocument, arg[0]);
        CtlC.CallParMethod(this, 1105, arg, NIL);
    END Close;

    PROCEDURE (this: Documents) Add* ((* optional *) Template: CtlT.Any; NewTemplate: CtlT.Any): Document, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Template, arg[1]);
        CtlC.AnyVar(NewTemplate, arg[0]);
        CtlC.CallParMethod(this, 11, arg, ret);
        RETURN This_Document(CtlC.VarAny(ret))
    END Add;

    PROCEDURE (this: Documents) Open* (FileName: CtlT.Any; (* optional *) ConfirmConversions: CtlT.Any; ReadOnly: CtlT.Any; AddToRecentFiles: CtlT.Any; PasswordDocument: CtlT.Any; PasswordTemplate: CtlT.Any; Revert: CtlT.Any; WritePasswordDocument: CtlT.Any; WritePasswordTemplate: CtlT.Any; Format: CtlT.Any): Document, NEW;
        VAR arg: ARRAY 10 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(FileName, arg[9]);
        CtlC.AnyVar(ConfirmConversions, arg[8]);
        CtlC.AnyVar(ReadOnly, arg[7]);
        CtlC.AnyVar(AddToRecentFiles, arg[6]);
        CtlC.AnyVar(PasswordDocument, arg[5]);
        CtlC.AnyVar(PasswordTemplate, arg[4]);
        CtlC.AnyVar(Revert, arg[3]);
        CtlC.AnyVar(WritePasswordDocument, arg[2]);
        CtlC.AnyVar(WritePasswordTemplate, arg[1]);
        CtlC.AnyVar(Format, arg[0]);
        CtlC.CallParMethod(this, 12, arg, ret);
        RETURN This_Document(CtlC.VarAny(ret))
    END Open;

    PROCEDURE (this: Documents) Save* ((* optional *) NoPrompt: CtlT.Any; OriginalFormat: CtlT.Any), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(NoPrompt, arg[1]);
        CtlC.AnyVar(OriginalFormat, arg[0]);
        CtlC.CallParMethod(this, 13, arg, NIL);
    END Save;


    (* ---------- _Document, hidden, dual ---------- *)

    PROCEDURE (this: _Document) Name* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 0)
    END Name;

    PROCEDURE (this: _Document) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1))
    END Application;

    PROCEDURE (this: _Document) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: _Document) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: _Document) BuiltInDocumentProperties* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1000)
    END BuiltInDocumentProperties;

    PROCEDURE (this: _Document) CustomDocumentProperties* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 2)
    END CustomDocumentProperties;

    PROCEDURE (this: _Document) Path* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 3)
    END Path;

    PROCEDURE (this: _Document) Bookmarks* (): Bookmarks, NEW;
    BEGIN
        RETURN ThisBookmarks(CtlC.GetAny(this, 4))
    END Bookmarks;

    PROCEDURE (this: _Document) Tables* (): Tables, NEW;
    BEGIN
        RETURN ThisTables(CtlC.GetAny(this, 6))
    END Tables;

    PROCEDURE (this: _Document) Footnotes* (): Footnotes, NEW;
    BEGIN
        RETURN ThisFootnotes(CtlC.GetAny(this, 7))
    END Footnotes;

    PROCEDURE (this: _Document) Endnotes* (): Endnotes, NEW;
    BEGIN
        RETURN ThisEndnotes(CtlC.GetAny(this, 8))
    END Endnotes;

    PROCEDURE (this: _Document) Comments* (): Comments, NEW;
    BEGIN
        RETURN ThisComments(CtlC.GetAny(this, 9))
    END Comments;

    PROCEDURE (this: _Document) Type* (): WdDocumentType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 10)
    END Type;

    PROCEDURE (this: _Document) AutoHyphenation* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 11)
    END AutoHyphenation;

    PROCEDURE (this: _Document) PUTAutoHyphenation* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 11, p1)
    END PUTAutoHyphenation;

    PROCEDURE (this: _Document) HyphenateCaps* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 12)
    END HyphenateCaps;

    PROCEDURE (this: _Document) PUTHyphenateCaps* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 12, p1)
    END PUTHyphenateCaps;

    PROCEDURE (this: _Document) HyphenationZone* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 13)
    END HyphenationZone;

    PROCEDURE (this: _Document) PUTHyphenationZone* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 13, p1)
    END PUTHyphenationZone;

    PROCEDURE (this: _Document) ConsecutiveHyphensLimit* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 14)
    END ConsecutiveHyphensLimit;

    PROCEDURE (this: _Document) PUTConsecutiveHyphensLimit* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 14, p1)
    END PUTConsecutiveHyphensLimit;

    PROCEDURE (this: _Document) Sections* (): Sections, NEW;
    BEGIN
        RETURN ThisSections(CtlC.GetAny(this, 15))
    END Sections;

    PROCEDURE (this: _Document) Paragraphs* (): Paragraphs, NEW;
    BEGIN
        RETURN ThisParagraphs(CtlC.GetAny(this, 16))
    END Paragraphs;

    PROCEDURE (this: _Document) Words* (): Words, NEW;
    BEGIN
        RETURN ThisWords(CtlC.GetAny(this, 17))
    END Words;

    PROCEDURE (this: _Document) Sentences* (): Sentences, NEW;
    BEGIN
        RETURN ThisSentences(CtlC.GetAny(this, 18))
    END Sentences;

    PROCEDURE (this: _Document) Characters* (): Characters, NEW;
    BEGIN
        RETURN ThisCharacters(CtlC.GetAny(this, 19))
    END Characters;

    PROCEDURE (this: _Document) Fields* (): Fields, NEW;
    BEGIN
        RETURN ThisFields(CtlC.GetAny(this, 20))
    END Fields;

    PROCEDURE (this: _Document) FormFields* (): FormFields, NEW;
    BEGIN
        RETURN ThisFormFields(CtlC.GetAny(this, 21))
    END FormFields;

    PROCEDURE (this: _Document) Styles* (): Styles, NEW;
    BEGIN
        RETURN ThisStyles(CtlC.GetAny(this, 22))
    END Styles;

    PROCEDURE (this: _Document) Frames* (): Frames, NEW;
    BEGIN
        RETURN ThisFrames(CtlC.GetAny(this, 23))
    END Frames;

    PROCEDURE (this: _Document) TablesOfFigures* (): TablesOfFigures, NEW;
    BEGIN
        RETURN ThisTablesOfFigures(CtlC.GetAny(this, 25))
    END TablesOfFigures;

    PROCEDURE (this: _Document) Variables* (): Variables, NEW;
    BEGIN
        RETURN ThisVariables(CtlC.GetAny(this, 26))
    END Variables;

    PROCEDURE (this: _Document) MailMerge* (): MailMerge, NEW;
    BEGIN
        RETURN ThisMailMerge(CtlC.GetAny(this, 27))
    END MailMerge;

    PROCEDURE (this: _Document) Envelope* (): Envelope, NEW;
    BEGIN
        RETURN ThisEnvelope(CtlC.GetAny(this, 28))
    END Envelope;

    PROCEDURE (this: _Document) FullName* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 29)
    END FullName;

    PROCEDURE (this: _Document) Revisions* (): Revisions, NEW;
    BEGIN
        RETURN ThisRevisions(CtlC.GetAny(this, 30))
    END Revisions;

    PROCEDURE (this: _Document) TablesOfContents* (): TablesOfContents, NEW;
    BEGIN
        RETURN ThisTablesOfContents(CtlC.GetAny(this, 31))
    END TablesOfContents;

    PROCEDURE (this: _Document) TablesOfAuthorities* (): TablesOfAuthorities, NEW;
    BEGIN
        RETURN ThisTablesOfAuthorities(CtlC.GetAny(this, 32))
    END TablesOfAuthorities;

    PROCEDURE (this: _Document) PageSetup* (): PageSetup, NEW;
    BEGIN
        RETURN ThisPageSetup(CtlC.GetAny(this, 1101))
    END PageSetup;

    PROCEDURE (this: _Document) PUTPageSetup* (p1: PageSetup), NEW;
    BEGIN
        CtlC.PutObj(this, 1101, p1)
    END PUTPageSetup;

    PROCEDURE (this: _Document) Windows* (): Windows, NEW;
    BEGIN
        RETURN ThisWindows(CtlC.GetAny(this, 34))
    END Windows;

    PROCEDURE (this: _Document) HasRoutingSlip* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 35)
    END HasRoutingSlip;

    PROCEDURE (this: _Document) PUTHasRoutingSlip* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 35, p1)
    END PUTHasRoutingSlip;

    PROCEDURE (this: _Document) RoutingSlip* (): RoutingSlip, NEW;
    BEGIN
        RETURN ThisRoutingSlip(CtlC.GetAny(this, 36))
    END RoutingSlip;

    PROCEDURE (this: _Document) Routed* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 37)
    END Routed;

    PROCEDURE (this: _Document) TablesOfAuthoritiesCategories* (): TablesOfAuthoritiesCategories, NEW;
    BEGIN
        RETURN ThisTablesOfAuthoritiesCategories(CtlC.GetAny(this, 38))
    END TablesOfAuthoritiesCategories;

    PROCEDURE (this: _Document) Indexes* (): Indexes, NEW;
    BEGIN
        RETURN ThisIndexes(CtlC.GetAny(this, 39))
    END Indexes;

    PROCEDURE (this: _Document) Saved* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 40)
    END Saved;

    PROCEDURE (this: _Document) PUTSaved* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 40, p1)
    END PUTSaved;

    PROCEDURE (this: _Document) Content* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 41))
    END Content;

    PROCEDURE (this: _Document) ActiveWindow* (): Window, NEW;
    BEGIN
        RETURN ThisWindow(CtlC.GetAny(this, 42))
    END ActiveWindow;

    PROCEDURE (this: _Document) Kind* (): WdDocumentKind, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 43)
    END Kind;

    PROCEDURE (this: _Document) PUTKind* (p1: WdDocumentKind), NEW;
    BEGIN
        CtlC.PutInt(this, 43, p1)
    END PUTKind;

    PROCEDURE (this: _Document) ReadOnly* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 44)
    END ReadOnly;

    PROCEDURE (this: _Document) Subdocuments* (): Subdocuments, NEW;
    BEGIN
        RETURN ThisSubdocuments(CtlC.GetAny(this, 45))
    END Subdocuments;

    PROCEDURE (this: _Document) IsMasterDocument* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 46)
    END IsMasterDocument;

    PROCEDURE (this: _Document) DefaultTabStop* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 48)
    END DefaultTabStop;

    PROCEDURE (this: _Document) PUTDefaultTabStop* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 48, p1)
    END PUTDefaultTabStop;

    PROCEDURE (this: _Document) EmbedTrueTypeFonts* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 50)
    END EmbedTrueTypeFonts;

    PROCEDURE (this: _Document) PUTEmbedTrueTypeFonts* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 50, p1)
    END PUTEmbedTrueTypeFonts;

    PROCEDURE (this: _Document) SaveFormsData* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 51)
    END SaveFormsData;

    PROCEDURE (this: _Document) PUTSaveFormsData* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 51, p1)
    END PUTSaveFormsData;

    PROCEDURE (this: _Document) ReadOnlyRecommended* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 52)
    END ReadOnlyRecommended;

    PROCEDURE (this: _Document) PUTReadOnlyRecommended* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 52, p1)
    END PUTReadOnlyRecommended;

    PROCEDURE (this: _Document) SaveSubsetFonts* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 53)
    END SaveSubsetFonts;

    PROCEDURE (this: _Document) PUTSaveSubsetFonts* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 53, p1)
    END PUTSaveSubsetFonts;

    PROCEDURE (this: _Document) Compatibility* (Type: WdCompatibility): BOOLEAN, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Type, arg[0]);
        CtlC.CallGetMethod(this, 55, arg, ret);
        RETURN CtlC.VarBool(ret)
    END Compatibility;

    PROCEDURE (this: _Document) PUTCompatibility* (Type: WdCompatibility; p2: BOOLEAN), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(Type, arg[1]);
        CtlC.BoolVar(p2, arg[0]);
        CtlC.CallPutMethod(this, 55, arg, NIL);
    END PUTCompatibility;

    PROCEDURE (this: _Document) StoryRanges* (): StoryRanges, NEW;
    BEGIN
        RETURN ThisStoryRanges(CtlC.GetAny(this, 56))
    END StoryRanges;

    PROCEDURE (this: _Document) CommandBars* (): CtlOffice.CommandBars, NEW;
    BEGIN
        RETURN CtlOffice.ThisCommandBars(CtlC.GetAny(this, 57))
    END CommandBars;

    PROCEDURE (this: _Document) IsSubdocument* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 58)
    END IsSubdocument;

    PROCEDURE (this: _Document) SaveFormat* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 59)
    END SaveFormat;

    PROCEDURE (this: _Document) ProtectionType* (): WdProtectionType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 60)
    END ProtectionType;

    PROCEDURE (this: _Document) Hyperlinks* (): Hyperlinks, NEW;
    BEGIN
        RETURN ThisHyperlinks(CtlC.GetAny(this, 61))
    END Hyperlinks;

    PROCEDURE (this: _Document) Shapes* (): Shapes, NEW;
    BEGIN
        RETURN ThisShapes(CtlC.GetAny(this, 62))
    END Shapes;

    PROCEDURE (this: _Document) ListTemplates* (): ListTemplates, NEW;
    BEGIN
        RETURN ThisListTemplates(CtlC.GetAny(this, 63))
    END ListTemplates;

    PROCEDURE (this: _Document) Lists* (): Lists, NEW;
    BEGIN
        RETURN ThisLists(CtlC.GetAny(this, 64))
    END Lists;

    PROCEDURE (this: _Document) UpdateStylesOnOpen* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 66)
    END UpdateStylesOnOpen;

    PROCEDURE (this: _Document) PUTUpdateStylesOnOpen* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 66, p1)
    END PUTUpdateStylesOnOpen;

    PROCEDURE (this: _Document) AttachedTemplate* (): CtlT.Any, NEW;
    BEGIN
        RETURN CtlC.GetAny(this, 67)
    END AttachedTemplate;

    PROCEDURE (this: _Document) PUTAttachedTemplate* (p1: CtlT.Any), NEW;
    BEGIN
        CtlC.PutAny(this, 67, p1)
    END PUTAttachedTemplate;

    PROCEDURE (this: _Document) InlineShapes* (): InlineShapes, NEW;
    BEGIN
        RETURN ThisInlineShapes(CtlC.GetAny(this, 68))
    END InlineShapes;

    PROCEDURE (this: _Document) Background* (): Shape, NEW;
    BEGIN
        RETURN ThisShape(CtlC.GetAny(this, 69))
    END Background;

    PROCEDURE (this: _Document) PUTBackground* (p1: Shape), NEW;
    BEGIN
        CtlC.PutObj(this, 69, p1)
    END PUTBackground;

    PROCEDURE (this: _Document) GrammarChecked* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 70)
    END GrammarChecked;

    PROCEDURE (this: _Document) PUTGrammarChecked* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 70, p1)
    END PUTGrammarChecked;

    PROCEDURE (this: _Document) SpellingChecked* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 71)
    END SpellingChecked;

    PROCEDURE (this: _Document) PUTSpellingChecked* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 71, p1)
    END PUTSpellingChecked;

    PROCEDURE (this: _Document) ShowGrammaticalErrors* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 72)
    END ShowGrammaticalErrors;

    PROCEDURE (this: _Document) PUTShowGrammaticalErrors* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 72, p1)
    END PUTShowGrammaticalErrors;

    PROCEDURE (this: _Document) ShowSpellingErrors* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 73)
    END ShowSpellingErrors;

    PROCEDURE (this: _Document) PUTShowSpellingErrors* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 73, p1)
    END PUTShowSpellingErrors;

    PROCEDURE (this: _Document) Versions* (): Versions, NEW;
    BEGIN
        RETURN ThisVersions(CtlC.GetAny(this, 75))
    END Versions;

    PROCEDURE (this: _Document) ShowSummary* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 76)
    END ShowSummary;

    PROCEDURE (this: _Document) PUTShowSummary* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 76, p1)
    END PUTShowSummary;

    PROCEDURE (this: _Document) SummaryViewMode* (): WdSummaryMode, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 77)
    END SummaryViewMode;

    PROCEDURE (this: _Document) PUTSummaryViewMode* (p1: WdSummaryMode), NEW;
    BEGIN
        CtlC.PutInt(this, 77, p1)
    END PUTSummaryViewMode;

    PROCEDURE (this: _Document) SummaryLength* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 78)
    END SummaryLength;

    PROCEDURE (this: _Document) PUTSummaryLength* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 78, p1)
    END PUTSummaryLength;

    PROCEDURE (this: _Document) PrintFractionalWidths* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 79)
    END PrintFractionalWidths;

    PROCEDURE (this: _Document) PUTPrintFractionalWidths* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 79, p1)
    END PUTPrintFractionalWidths;

    PROCEDURE (this: _Document) PrintPostScriptOverText* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 80)
    END PrintPostScriptOverText;

    PROCEDURE (this: _Document) PUTPrintPostScriptOverText* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 80, p1)
    END PUTPrintPostScriptOverText;

    PROCEDURE (this: _Document) Container* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 82)
    END Container;

    PROCEDURE (this: _Document) PrintFormsData* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 83)
    END PrintFormsData;

    PROCEDURE (this: _Document) PUTPrintFormsData* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 83, p1)
    END PUTPrintFormsData;

    PROCEDURE (this: _Document) ListParagraphs* (): ListParagraphs, NEW;
    BEGIN
        RETURN ThisListParagraphs(CtlC.GetAny(this, 84))
    END ListParagraphs;

    PROCEDURE (this: _Document) PUTPassword* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 85, p1)
    END PUTPassword;

    PROCEDURE (this: _Document) PUTWritePassword* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 86, p1)
    END PUTWritePassword;

    PROCEDURE (this: _Document) HasPassword* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 87)
    END HasPassword;

    PROCEDURE (this: _Document) WriteReserved* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 88)
    END WriteReserved;

    PROCEDURE (this: _Document) ActiveWritingStyle* (LanguageID: CtlT.Any): CtlT.Strg, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(LanguageID, arg[0]);
        CtlC.CallGetMethod(this, 90, arg, ret);
        RETURN CtlC.VarStr(ret)
    END ActiveWritingStyle;

    PROCEDURE (this: _Document) PUTActiveWritingStyle* (LanguageID: CtlT.Any; p2: ARRAY OF CHAR), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(LanguageID, arg[1]);
        CtlC.StrVar(p2, arg[0]);
        CtlC.CallPutMethod(this, 90, arg, NIL);
    END PUTActiveWritingStyle;

    PROCEDURE (this: _Document) UserControl* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 92)
    END UserControl;

    PROCEDURE (this: _Document) PUTUserControl* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 92, p1)
    END PUTUserControl;

    PROCEDURE (this: _Document) HasMailer* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 93)
    END HasMailer;

    PROCEDURE (this: _Document) PUTHasMailer* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 93, p1)
    END PUTHasMailer;

    PROCEDURE (this: _Document) Mailer* (): Mailer, NEW;
    BEGIN
        RETURN ThisMailer(CtlC.GetAny(this, 94))
    END Mailer;

    PROCEDURE (this: _Document) ReadabilityStatistics* (): ReadabilityStatistics, NEW;
    BEGIN
        RETURN ThisReadabilityStatistics(CtlC.GetAny(this, 96))
    END ReadabilityStatistics;

    PROCEDURE (this: _Document) GrammaticalErrors* (): ProofreadingErrors, NEW;
    BEGIN
        RETURN ThisProofreadingErrors(CtlC.GetAny(this, 97))
    END GrammaticalErrors;

    PROCEDURE (this: _Document) SpellingErrors* (): ProofreadingErrors, NEW;
    BEGIN
        RETURN ThisProofreadingErrors(CtlC.GetAny(this, 98))
    END SpellingErrors;

    PROCEDURE (this: _Document) VBProject* (): CtlVBIDE.VBProject, NEW;
    BEGIN
        RETURN CtlVBIDE.This_VBProject(CtlC.GetAny(this, 99))
    END VBProject;

    PROCEDURE (this: _Document) FormsDesign* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 100)
    END FormsDesign;

    PROCEDURE (this: _Document) _CodeName* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, -2147418112)
    END _CodeName;

    PROCEDURE (this: _Document) PUT_CodeName* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, -2147418112, p1)
    END PUT_CodeName;

    PROCEDURE (this: _Document) CodeName* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 262)
    END CodeName;

    PROCEDURE (this: _Document) SnapToGrid* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 300)
    END SnapToGrid;

    PROCEDURE (this: _Document) PUTSnapToGrid* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 300, p1)
    END PUTSnapToGrid;

    PROCEDURE (this: _Document) SnapToShapes* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 301)
    END SnapToShapes;

    PROCEDURE (this: _Document) PUTSnapToShapes* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 301, p1)
    END PUTSnapToShapes;

    PROCEDURE (this: _Document) GridDistanceHorizontal* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 302)
    END GridDistanceHorizontal;

    PROCEDURE (this: _Document) PUTGridDistanceHorizontal* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 302, p1)
    END PUTGridDistanceHorizontal;

    PROCEDURE (this: _Document) GridDistanceVertical* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 303)
    END GridDistanceVertical;

    PROCEDURE (this: _Document) PUTGridDistanceVertical* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 303, p1)
    END PUTGridDistanceVertical;

    PROCEDURE (this: _Document) GridOriginHorizontal* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 304)
    END GridOriginHorizontal;

    PROCEDURE (this: _Document) PUTGridOriginHorizontal* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 304, p1)
    END PUTGridOriginHorizontal;

    PROCEDURE (this: _Document) GridOriginVertical* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 305)
    END GridOriginVertical;

    PROCEDURE (this: _Document) PUTGridOriginVertical* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 305, p1)
    END PUTGridOriginVertical;

    PROCEDURE (this: _Document) GridSpaceBetweenHorizontalLines* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 306)
    END GridSpaceBetweenHorizontalLines;

    PROCEDURE (this: _Document) PUTGridSpaceBetweenHorizontalLines* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 306, p1)
    END PUTGridSpaceBetweenHorizontalLines;

    PROCEDURE (this: _Document) GridSpaceBetweenVerticalLines* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 307)
    END GridSpaceBetweenVerticalLines;

    PROCEDURE (this: _Document) PUTGridSpaceBetweenVerticalLines* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 307, p1)
    END PUTGridSpaceBetweenVerticalLines;

    PROCEDURE (this: _Document) GridOriginFromMargin* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 308)
    END GridOriginFromMargin;

    PROCEDURE (this: _Document) PUTGridOriginFromMargin* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 308, p1)
    END PUTGridOriginFromMargin;

    PROCEDURE (this: _Document) KerningByAlgorithm* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 309)
    END KerningByAlgorithm;

    PROCEDURE (this: _Document) PUTKerningByAlgorithm* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 309, p1)
    END PUTKerningByAlgorithm;

    PROCEDURE (this: _Document) JustificationMode* (): WdJustificationMode, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 310)
    END JustificationMode;

    PROCEDURE (this: _Document) PUTJustificationMode* (p1: WdJustificationMode), NEW;
    BEGIN
        CtlC.PutInt(this, 310, p1)
    END PUTJustificationMode;

    PROCEDURE (this: _Document) FarEastLineBreakLevel* (): WdFarEastLineBreakLevel, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 311)
    END FarEastLineBreakLevel;

    PROCEDURE (this: _Document) PUTFarEastLineBreakLevel* (p1: WdFarEastLineBreakLevel), NEW;
    BEGIN
        CtlC.PutInt(this, 311, p1)
    END PUTFarEastLineBreakLevel;

    PROCEDURE (this: _Document) NoLineBreakBefore* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 312)
    END NoLineBreakBefore;

    PROCEDURE (this: _Document) PUTNoLineBreakBefore* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 312, p1)
    END PUTNoLineBreakBefore;

    PROCEDURE (this: _Document) NoLineBreakAfter* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 313)
    END NoLineBreakAfter;

    PROCEDURE (this: _Document) PUTNoLineBreakAfter* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 313, p1)
    END PUTNoLineBreakAfter;

    PROCEDURE (this: _Document) TrackRevisions* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 314)
    END TrackRevisions;

    PROCEDURE (this: _Document) PUTTrackRevisions* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 314, p1)
    END PUTTrackRevisions;

    PROCEDURE (this: _Document) PrintRevisions* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 315)
    END PrintRevisions;

    PROCEDURE (this: _Document) PUTPrintRevisions* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 315, p1)
    END PUTPrintRevisions;

    PROCEDURE (this: _Document) ShowRevisions* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 316)
    END ShowRevisions;

    PROCEDURE (this: _Document) PUTShowRevisions* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 316, p1)
    END PUTShowRevisions;

    PROCEDURE (this: _Document) Close* ((* optional *) SaveChanges: CtlT.Any; OriginalFormat: CtlT.Any; RouteDocument: CtlT.Any), NEW;
        VAR arg: ARRAY 3 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(SaveChanges, arg[2]);
        CtlC.AnyVar(OriginalFormat, arg[1]);
        CtlC.AnyVar(RouteDocument, arg[0]);
        CtlC.CallParMethod(this, 1105, arg, NIL);
    END Close;

    PROCEDURE (this: _Document) SaveAs* ((* optional *) FileName: CtlT.Any; FileFormat: CtlT.Any; LockComments: CtlT.Any; Password: CtlT.Any; AddToRecentFiles: CtlT.Any; WritePassword: CtlT.Any; ReadOnlyRecommended: CtlT.Any; EmbedTrueTypeFonts: CtlT.Any; SaveNativePictureFormat: CtlT.Any; SaveFormsData: CtlT.Any; SaveAsAOCELetter: CtlT.Any), NEW;
        VAR arg: ARRAY 11 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(FileName, arg[10]);
        CtlC.AnyVar(FileFormat, arg[9]);
        CtlC.AnyVar(LockComments, arg[8]);
        CtlC.AnyVar(Password, arg[7]);
        CtlC.AnyVar(AddToRecentFiles, arg[6]);
        CtlC.AnyVar(WritePassword, arg[5]);
        CtlC.AnyVar(ReadOnlyRecommended, arg[4]);
        CtlC.AnyVar(EmbedTrueTypeFonts, arg[3]);
        CtlC.AnyVar(SaveNativePictureFormat, arg[2]);
        CtlC.AnyVar(SaveFormsData, arg[1]);
        CtlC.AnyVar(SaveAsAOCELetter, arg[0]);
        CtlC.CallParMethod(this, 102, arg, NIL);
    END SaveAs;

    PROCEDURE (this: _Document) Repaginate* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 103, NIL);
    END Repaginate;

    PROCEDURE (this: _Document) FitToPages* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 104, NIL);
    END FitToPages;

    PROCEDURE (this: _Document) ManualHyphenation* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 105, NIL);
    END ManualHyphenation;

    PROCEDURE (this: _Document) Select* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 65535, NIL);
    END Select;

    PROCEDURE (this: _Document) DataForm* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 106, NIL);
    END DataForm;

    PROCEDURE (this: _Document) Route* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 107, NIL);
    END Route;

    PROCEDURE (this: _Document) Save* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 108, NIL);
    END Save;

    PROCEDURE (this: _Document) PrintOut* ((* optional *) Background: CtlT.Any; Append: CtlT.Any; Range: CtlT.Any; OutputFileName: CtlT.Any; From: CtlT.Any; To: CtlT.Any; Item: CtlT.Any; Copies: CtlT.Any; Pages: CtlT.Any; PageType: CtlT.Any; PrintToFile: CtlT.Any; Collate: CtlT.Any; ActivePrinterMacGX: CtlT.Any; ManualDuplexPrint: CtlT.Any), NEW;
        VAR arg: ARRAY 14 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Background, arg[13]);
        CtlC.AnyVar(Append, arg[12]);
        CtlC.AnyVar(Range, arg[11]);
        CtlC.AnyVar(OutputFileName, arg[10]);
        CtlC.AnyVar(From, arg[9]);
        CtlC.AnyVar(To, arg[8]);
        CtlC.AnyVar(Item, arg[7]);
        CtlC.AnyVar(Copies, arg[6]);
        CtlC.AnyVar(Pages, arg[5]);
        CtlC.AnyVar(PageType, arg[4]);
        CtlC.AnyVar(PrintToFile, arg[3]);
        CtlC.AnyVar(Collate, arg[2]);
        CtlC.AnyVar(ActivePrinterMacGX, arg[1]);
        CtlC.AnyVar(ManualDuplexPrint, arg[0]);
        CtlC.CallParMethod(this, 109, arg, NIL);
    END PrintOut;

    PROCEDURE (this: _Document) SendMail* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 110, NIL);
    END SendMail;

    PROCEDURE (this: _Document) Range* ((* optional *) Start: CtlT.Any; End: CtlT.Any): Range, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Start, arg[1]);
        CtlC.AnyVar(End, arg[0]);
        CtlC.CallParMethod(this, 2000, arg, ret);
        RETURN ThisRange(CtlC.VarAny(ret))
    END Range;

    PROCEDURE (this: _Document) RunAutoMacro* (Which: WdAutoMacros), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(Which, arg[0]);
        CtlC.CallParMethod(this, 112, arg, NIL);
    END RunAutoMacro;

    PROCEDURE (this: _Document) Activate* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 113, NIL);
    END Activate;

    PROCEDURE (this: _Document) PrintPreview* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 114, NIL);
    END PrintPreview;

    PROCEDURE (this: _Document) GoTo* ((* optional *) What: CtlT.Any; Which: CtlT.Any; Count: CtlT.Any; Name: CtlT.Any): Range, NEW;
        VAR arg: ARRAY 4 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(What, arg[3]);
        CtlC.AnyVar(Which, arg[2]);
        CtlC.AnyVar(Count, arg[1]);
        CtlC.AnyVar(Name, arg[0]);
        CtlC.CallParMethod(this, 115, arg, ret);
        RETURN ThisRange(CtlC.VarAny(ret))
    END GoTo;

    PROCEDURE (this: _Document) Undo* ((* optional *) Times: CtlT.Any): BOOLEAN, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Times, arg[0]);
        CtlC.CallParMethod(this, 116, arg, ret);
        RETURN CtlC.VarBool(ret)
    END Undo;

    PROCEDURE (this: _Document) Redo* ((* optional *) Times: CtlT.Any): BOOLEAN, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Times, arg[0]);
        CtlC.CallParMethod(this, 117, arg, ret);
        RETURN CtlC.VarBool(ret)
    END Redo;

    PROCEDURE (this: _Document) ComputeStatistics* (Statistic: WdStatistic; (* optional *) IncludeFootnotesAndEndnotes: CtlT.Any): INTEGER, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Statistic, arg[1]);
        CtlC.AnyVar(IncludeFootnotesAndEndnotes, arg[0]);
        CtlC.CallParMethod(this, 118, arg, ret);
        RETURN CtlC.VarInt(ret)
    END ComputeStatistics;

    PROCEDURE (this: _Document) MakeCompatibilityDefault* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 119, NIL);
    END MakeCompatibilityDefault;

    PROCEDURE (this: _Document) Protect* (Type: WdProtectionType; (* optional *) NoReset: CtlT.Any; Password: CtlT.Any), NEW;
        VAR arg: ARRAY 3 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(Type, arg[2]);
        CtlC.AnyVar(NoReset, arg[1]);
        CtlC.AnyVar(Password, arg[0]);
        CtlC.CallParMethod(this, 120, arg, NIL);
    END Protect;

    PROCEDURE (this: _Document) Unprotect* ((* optional *) Password: CtlT.Any), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Password, arg[0]);
        CtlC.CallParMethod(this, 121, arg, NIL);
    END Unprotect;

    PROCEDURE (this: _Document) EditionOptions* (Type: WdEditionType; Option: WdEditionOption; Name: ARRAY OF CHAR; (* optional *) Format: CtlT.Any), NEW;
        VAR arg: ARRAY 4 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(Type, arg[3]);
        CtlC.IntVar(Option, arg[2]);
        CtlC.StrVar(Name, arg[1]);
        CtlC.AnyVar(Format, arg[0]);
        CtlC.CallParMethod(this, 122, arg, NIL);
    END EditionOptions;

    PROCEDURE (this: _Document) RunLetterWizard* ((* optional *) LetterContent: CtlT.Any; WizardMode: CtlT.Any), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(LetterContent, arg[1]);
        CtlC.AnyVar(WizardMode, arg[0]);
        CtlC.CallParMethod(this, 123, arg, NIL);
    END RunLetterWizard;

    PROCEDURE (this: _Document) GetLetterContent* (): LetterContent, NEW;
        VAR ret: CtlT.Variant;
    BEGIN
        CtlC.CallMethod(this, 124, ret);
        RETURN This_LetterContent(CtlC.VarAny(ret))
    END GetLetterContent;

    PROCEDURE (this: _Document) SetLetterContent* (LetterContent: CtlT.Any), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(LetterContent, arg[0]);
        CtlC.CallParMethod(this, 125, arg, NIL);
    END SetLetterContent;

    PROCEDURE (this: _Document) CopyStylesFromTemplate* (Template: ARRAY OF CHAR), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.StrVar(Template, arg[0]);
        CtlC.CallParMethod(this, 126, arg, NIL);
    END CopyStylesFromTemplate;

    PROCEDURE (this: _Document) UpdateStyles* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 127, NIL);
    END UpdateStyles;

    PROCEDURE (this: _Document) CheckGrammar* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 131, NIL);
    END CheckGrammar;

    PROCEDURE (this: _Document) CheckSpelling* ((* optional *) CustomDictionary: CtlT.Any; IgnoreUppercase: CtlT.Any; AlwaysSuggest: CtlT.Any; CustomDictionary2: CtlT.Any; CustomDictionary3: CtlT.Any; CustomDictionary4: CtlT.Any; CustomDictionary5: CtlT.Any; CustomDictionary6: CtlT.Any; CustomDictionary7: CtlT.Any; CustomDictionary8: CtlT.Any; CustomDictionary9: CtlT.Any; CustomDictionary10: CtlT.Any), NEW;
        VAR arg: ARRAY 12 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(CustomDictionary, arg[11]);
        CtlC.AnyVar(IgnoreUppercase, arg[10]);
        CtlC.AnyVar(AlwaysSuggest, arg[9]);
        CtlC.AnyVar(CustomDictionary2, arg[8]);
        CtlC.AnyVar(CustomDictionary3, arg[7]);
        CtlC.AnyVar(CustomDictionary4, arg[6]);
        CtlC.AnyVar(CustomDictionary5, arg[5]);
        CtlC.AnyVar(CustomDictionary6, arg[4]);
        CtlC.AnyVar(CustomDictionary7, arg[3]);
        CtlC.AnyVar(CustomDictionary8, arg[2]);
        CtlC.AnyVar(CustomDictionary9, arg[1]);
        CtlC.AnyVar(CustomDictionary10, arg[0]);
        CtlC.CallParMethod(this, 132, arg, NIL);
    END CheckSpelling;

    PROCEDURE (this: _Document) FollowHyperlink* ((* optional *) Address: CtlT.Any; SubAddress: CtlT.Any; NewWindow: CtlT.Any; AddHistory: CtlT.Any; ExtraInfo: CtlT.Any; Method: CtlT.Any; HeaderInfo: CtlT.Any), NEW;
        VAR arg: ARRAY 7 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Address, arg[6]);
        CtlC.AnyVar(SubAddress, arg[5]);
        CtlC.AnyVar(NewWindow, arg[4]);
        CtlC.AnyVar(AddHistory, arg[3]);
        CtlC.AnyVar(ExtraInfo, arg[2]);
        CtlC.AnyVar(Method, arg[1]);
        CtlC.AnyVar(HeaderInfo, arg[0]);
        CtlC.CallParMethod(this, 135, arg, NIL);
    END FollowHyperlink;

    PROCEDURE (this: _Document) AddToFavorites* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 136, NIL);
    END AddToFavorites;

    PROCEDURE (this: _Document) Reload* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 137, NIL);
    END Reload;

    PROCEDURE (this: _Document) AutoSummarize* ((* optional *) Length: CtlT.Any; Mode: CtlT.Any; UpdateProperties: CtlT.Any): Range, NEW;
        VAR arg: ARRAY 3 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Length, arg[2]);
        CtlC.AnyVar(Mode, arg[1]);
        CtlC.AnyVar(UpdateProperties, arg[0]);
        CtlC.CallParMethod(this, 138, arg, ret);
        RETURN ThisRange(CtlC.VarAny(ret))
    END AutoSummarize;

    PROCEDURE (this: _Document) RemoveNumbers* ((* optional *) NumberType: CtlT.Any), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(NumberType, arg[0]);
        CtlC.CallParMethod(this, 140, arg, NIL);
    END RemoveNumbers;

    PROCEDURE (this: _Document) ConvertNumbersToText* ((* optional *) NumberType: CtlT.Any), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(NumberType, arg[0]);
        CtlC.CallParMethod(this, 141, arg, NIL);
    END ConvertNumbersToText;

    PROCEDURE (this: _Document) CountNumberedItems* ((* optional *) NumberType: CtlT.Any; Level: CtlT.Any): INTEGER, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(NumberType, arg[1]);
        CtlC.AnyVar(Level, arg[0]);
        CtlC.CallParMethod(this, 142, arg, ret);
        RETURN CtlC.VarInt(ret)
    END CountNumberedItems;

    PROCEDURE (this: _Document) Post* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 143, NIL);
    END Post;

    PROCEDURE (this: _Document) ToggleFormsDesign* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 144, NIL);
    END ToggleFormsDesign;

    PROCEDURE (this: _Document) Compare* (Name: ARRAY OF CHAR), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.StrVar(Name, arg[0]);
        CtlC.CallParMethod(this, 145, arg, NIL);
    END Compare;

    PROCEDURE (this: _Document) UpdateSummaryProperties* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 146, NIL);
    END UpdateSummaryProperties;

    PROCEDURE (this: _Document) GetCrossReferenceItems* (ReferenceType: CtlT.Any): CtlT.Any, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(ReferenceType, arg[0]);
        CtlC.CallParMethod(this, 147, arg, ret);
        RETURN CtlC.VarAny(ret)
    END GetCrossReferenceItems;

    PROCEDURE (this: _Document) AutoFormat* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 148, NIL);
    END AutoFormat;

    PROCEDURE (this: _Document) ViewCode* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 149, NIL);
    END ViewCode;

    PROCEDURE (this: _Document) ViewPropertyBrowser* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 150, NIL);
    END ViewPropertyBrowser;

    PROCEDURE (this: _Document) ForwardMailer* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 250, NIL);
    END ForwardMailer;

    PROCEDURE (this: _Document) Reply* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 251, NIL);
    END Reply;

    PROCEDURE (this: _Document) ReplyAll* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 252, NIL);
    END ReplyAll;

    PROCEDURE (this: _Document) SendMailer* ((* optional *) FileFormat: CtlT.Any; Priority: CtlT.Any), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(FileFormat, arg[1]);
        CtlC.AnyVar(Priority, arg[0]);
        CtlC.CallParMethod(this, 253, arg, NIL);
    END SendMailer;

    PROCEDURE (this: _Document) UndoClear* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 254, NIL);
    END UndoClear;

    PROCEDURE (this: _Document) PresentIt* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 255, NIL);
    END PresentIt;

    PROCEDURE (this: _Document) SendFax* (Address: ARRAY OF CHAR; (* optional *) Subject: CtlT.Any), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.StrVar(Address, arg[1]);
        CtlC.AnyVar(Subject, arg[0]);
        CtlC.CallParMethod(this, 256, arg, NIL);
    END SendFax;

    PROCEDURE (this: _Document) Merge* (FileName: ARRAY OF CHAR), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.StrVar(FileName, arg[0]);
        CtlC.CallParMethod(this, 257, arg, NIL);
    END Merge;

    PROCEDURE (this: _Document) ClosePrintPreview* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 258, NIL);
    END ClosePrintPreview;

    PROCEDURE (this: _Document) CheckConsistency* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 259, NIL);
    END CheckConsistency;

    PROCEDURE (this: _Document) CreateLetterContent* (DateFormat: ARRAY OF CHAR; IncludeHeaderFooter: BOOLEAN; PageDesign: ARRAY OF CHAR; LetterStyle: WdLetterStyle; Letterhead: BOOLEAN; LetterheadLocation: WdLetterheadLocation; LetterheadSize: SHORTREAL; RecipientName: ARRAY OF CHAR; RecipientAddress: ARRAY OF CHAR; Salutation: ARRAY OF CHAR; SalutationType: WdSalutationType; RecipientReference: ARRAY OF CHAR; MailingInstructions: ARRAY OF CHAR; AttentionLine: ARRAY OF CHAR; Subject: ARRAY OF CHAR; CCList: ARRAY OF CHAR; ReturnAddress: ARRAY OF CHAR; SenderName: ARRAY OF CHAR; Closing: ARRAY OF CHAR; SenderCompany: ARRAY OF CHAR; SenderJobTitle: ARRAY OF CHAR; SenderInitials: ARRAY OF CHAR; EnclosureNumber: INTEGER; (* optional *) InfoBlock: CtlT.Any; RecipientCode: CtlT.Any; RecipientGender: CtlT.Any; ReturnAddressShortForm: CtlT.Any; SenderCity: CtlT.Any; SenderCode: CtlT.Any; SenderGender: CtlT.Any; SenderReference: CtlT.Any): LetterContent, NEW;
        VAR arg: ARRAY 31 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.StrVar(DateFormat, arg[30]);
        CtlC.BoolVar(IncludeHeaderFooter, arg[29]);
        CtlC.StrVar(PageDesign, arg[28]);
        CtlC.IntVar(LetterStyle, arg[27]);
        CtlC.BoolVar(Letterhead, arg[26]);
        CtlC.IntVar(LetterheadLocation, arg[25]);
        CtlC.SRealVar(LetterheadSize, arg[24]);
        CtlC.StrVar(RecipientName, arg[23]);
        CtlC.StrVar(RecipientAddress, arg[22]);
        CtlC.StrVar(Salutation, arg[21]);
        CtlC.IntVar(SalutationType, arg[20]);
        CtlC.StrVar(RecipientReference, arg[19]);
        CtlC.StrVar(MailingInstructions, arg[18]);
        CtlC.StrVar(AttentionLine, arg[17]);
        CtlC.StrVar(Subject, arg[16]);
        CtlC.StrVar(CCList, arg[15]);
        CtlC.StrVar(ReturnAddress, arg[14]);
        CtlC.StrVar(SenderName, arg[13]);
        CtlC.StrVar(Closing, arg[12]);
        CtlC.StrVar(SenderCompany, arg[11]);
        CtlC.StrVar(SenderJobTitle, arg[10]);
        CtlC.StrVar(SenderInitials, arg[9]);
        CtlC.IntVar(EnclosureNumber, arg[8]);
        CtlC.AnyVar(InfoBlock, arg[7]);
        CtlC.AnyVar(RecipientCode, arg[6]);
        CtlC.AnyVar(RecipientGender, arg[5]);
        CtlC.AnyVar(ReturnAddressShortForm, arg[4]);
        CtlC.AnyVar(SenderCity, arg[3]);
        CtlC.AnyVar(SenderCode, arg[2]);
        CtlC.AnyVar(SenderGender, arg[1]);
        CtlC.AnyVar(SenderReference, arg[0]);
        CtlC.CallParMethod(this, 260, arg, ret);
        RETURN This_LetterContent(CtlC.VarAny(ret))
    END CreateLetterContent;

    PROCEDURE (this: _Document) AcceptAllRevisions* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 317, NIL);
    END AcceptAllRevisions;

    PROCEDURE (this: _Document) RejectAllRevisions* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 318, NIL);
    END RejectAllRevisions;


    (* ---------- Template, dual, nonextensible ---------- *)

    PROCEDURE (this: Template) Name* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 0)
    END Name;

    PROCEDURE (this: Template) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Template) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Template) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Template) Path* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 1)
    END Path;

    PROCEDURE (this: Template) AutoTextEntries* (): AutoTextEntries, NEW;
    BEGIN
        RETURN ThisAutoTextEntries(CtlC.GetAny(this, 2))
    END AutoTextEntries;

    PROCEDURE (this: Template) LanguageID* (): WdLanguageID, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 4)
    END LanguageID;

    PROCEDURE (this: Template) PUTLanguageID* (p1: WdLanguageID), NEW;
    BEGIN
        CtlC.PutInt(this, 4, p1)
    END PUTLanguageID;

    PROCEDURE (this: Template) Saved* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 5)
    END Saved;

    PROCEDURE (this: Template) PUTSaved* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 5, p1)
    END PUTSaved;

    PROCEDURE (this: Template) Type* (): WdTemplateType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 6)
    END Type;

    PROCEDURE (this: Template) FullName* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 7)
    END FullName;

    PROCEDURE (this: Template) BuiltInDocumentProperties* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 8)
    END BuiltInDocumentProperties;

    PROCEDURE (this: Template) CustomDocumentProperties* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 9)
    END CustomDocumentProperties;

    PROCEDURE (this: Template) ListTemplates* (): ListTemplates, NEW;
    BEGIN
        RETURN ThisListTemplates(CtlC.GetAny(this, 10))
    END ListTemplates;

    PROCEDURE (this: Template) LanguageIDFarEast* (): WdLanguageID, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 11)
    END LanguageIDFarEast;

    PROCEDURE (this: Template) PUTLanguageIDFarEast* (p1: WdLanguageID), NEW;
    BEGIN
        CtlC.PutInt(this, 11, p1)
    END PUTLanguageIDFarEast;

    PROCEDURE (this: Template) VBProject* (): CtlVBIDE.VBProject, NEW;
    BEGIN
        RETURN CtlVBIDE.This_VBProject(CtlC.GetAny(this, 99))
    END VBProject;

    PROCEDURE (this: Template) KerningByAlgorithm* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 12)
    END KerningByAlgorithm;

    PROCEDURE (this: Template) PUTKerningByAlgorithm* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 12, p1)
    END PUTKerningByAlgorithm;

    PROCEDURE (this: Template) JustificationMode* (): WdJustificationMode, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 13)
    END JustificationMode;

    PROCEDURE (this: Template) PUTJustificationMode* (p1: WdJustificationMode), NEW;
    BEGIN
        CtlC.PutInt(this, 13, p1)
    END PUTJustificationMode;

    PROCEDURE (this: Template) FarEastLineBreakLevel* (): WdFarEastLineBreakLevel, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 14)
    END FarEastLineBreakLevel;

    PROCEDURE (this: Template) PUTFarEastLineBreakLevel* (p1: WdFarEastLineBreakLevel), NEW;
    BEGIN
        CtlC.PutInt(this, 14, p1)
    END PUTFarEastLineBreakLevel;

    PROCEDURE (this: Template) NoLineBreakBefore* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 15)
    END NoLineBreakBefore;

    PROCEDURE (this: Template) PUTNoLineBreakBefore* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 15, p1)
    END PUTNoLineBreakBefore;

    PROCEDURE (this: Template) NoLineBreakAfter* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 16)
    END NoLineBreakAfter;

    PROCEDURE (this: Template) PUTNoLineBreakAfter* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 16, p1)
    END PUTNoLineBreakAfter;

    PROCEDURE (this: Template) OpenAsDocument* (): Document, NEW;
        VAR ret: CtlT.Variant;
    BEGIN
        CtlC.CallMethod(this, 100, ret);
        RETURN This_Document(CtlC.VarAny(ret))
    END OpenAsDocument;

    PROCEDURE (this: Template) Save* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 101, NIL);
    END Save;


    (* ---------- Templates, dual, nonextensible ---------- *)

    PROCEDURE (this: Templates) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Templates) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Templates) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Templates) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Count;

    PROCEDURE (this: Templates) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: Templates) Item* (Index: CtlT.Any): Template, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisTemplate(CtlC.VarAny(ret))
    END Item;


    (* ---------- RoutingSlip, dual, nonextensible ---------- *)

    PROCEDURE (this: RoutingSlip) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: RoutingSlip) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: RoutingSlip) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: RoutingSlip) Subject* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 1)
    END Subject;

    PROCEDURE (this: RoutingSlip) PUTSubject* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 1, p1)
    END PUTSubject;

    PROCEDURE (this: RoutingSlip) Message* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 2)
    END Message;

    PROCEDURE (this: RoutingSlip) PUTMessage* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 2, p1)
    END PUTMessage;

    PROCEDURE (this: RoutingSlip) Delivery* (): WdRoutingSlipDelivery, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 3)
    END Delivery;

    PROCEDURE (this: RoutingSlip) PUTDelivery* (p1: WdRoutingSlipDelivery), NEW;
    BEGIN
        CtlC.PutInt(this, 3, p1)
    END PUTDelivery;

    PROCEDURE (this: RoutingSlip) TrackStatus* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 4)
    END TrackStatus;

    PROCEDURE (this: RoutingSlip) PUTTrackStatus* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 4, p1)
    END PUTTrackStatus;

    PROCEDURE (this: RoutingSlip) Protect* (): WdProtectionType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 5)
    END Protect;

    PROCEDURE (this: RoutingSlip) PUTProtect* (p1: WdProtectionType), NEW;
    BEGIN
        CtlC.PutInt(this, 5, p1)
    END PUTProtect;

    PROCEDURE (this: RoutingSlip) ReturnWhenDone* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 6)
    END ReturnWhenDone;

    PROCEDURE (this: RoutingSlip) PUTReturnWhenDone* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 6, p1)
    END PUTReturnWhenDone;

    PROCEDURE (this: RoutingSlip) Status* (): WdRoutingSlipStatus, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 7)
    END Status;

    PROCEDURE (this: RoutingSlip) Recipients* ((* optional *) Index: CtlT.Any): CtlT.Any, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Index, arg[0]);
        CtlC.CallGetMethod(this, 9, arg, ret);
        RETURN CtlC.VarAny(ret)
    END Recipients;

    PROCEDURE (this: RoutingSlip) Reset* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 101, NIL);
    END Reset;

    PROCEDURE (this: RoutingSlip) AddRecipient* (Recipient: ARRAY OF CHAR), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.StrVar(Recipient, arg[0]);
        CtlC.CallParMethod(this, 102, arg, NIL);
    END AddRecipient;


    (* ---------- Bookmark, dual, nonextensible ---------- *)

    PROCEDURE (this: Bookmark) Name* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 0)
    END Name;

    PROCEDURE (this: Bookmark) Range* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 1))
    END Range;

    PROCEDURE (this: Bookmark) Empty* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 2)
    END Empty;

    PROCEDURE (this: Bookmark) Start* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 3)
    END Start;

    PROCEDURE (this: Bookmark) PUTStart* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 3, p1)
    END PUTStart;

    PROCEDURE (this: Bookmark) End* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 4)
    END End;

    PROCEDURE (this: Bookmark) PUTEnd* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 4, p1)
    END PUTEnd;

    PROCEDURE (this: Bookmark) Column* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 5)
    END Column;

    PROCEDURE (this: Bookmark) StoryType* (): WdStoryType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 6)
    END StoryType;

    PROCEDURE (this: Bookmark) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Bookmark) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Bookmark) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Bookmark) Select* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 65535, NIL);
    END Select;

    PROCEDURE (this: Bookmark) Delete* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 11, NIL);
    END Delete;

    PROCEDURE (this: Bookmark) Copy* (Name: ARRAY OF CHAR): Bookmark, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.StrVar(Name, arg[0]);
        CtlC.CallParMethod(this, 12, arg, ret);
        RETURN ThisBookmark(CtlC.VarAny(ret))
    END Copy;


    (* ---------- Bookmarks, dual, nonextensible ---------- *)

    PROCEDURE (this: Bookmarks) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: Bookmarks) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Count;

    PROCEDURE (this: Bookmarks) DefaultSorting* (): WdBookmarkSortBy, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 3)
    END DefaultSorting;

    PROCEDURE (this: Bookmarks) PUTDefaultSorting* (p1: WdBookmarkSortBy), NEW;
    BEGIN
        CtlC.PutInt(this, 3, p1)
    END PUTDefaultSorting;

    PROCEDURE (this: Bookmarks) ShowHidden* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 4)
    END ShowHidden;

    PROCEDURE (this: Bookmarks) PUTShowHidden* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 4, p1)
    END PUTShowHidden;

    PROCEDURE (this: Bookmarks) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Bookmarks) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Bookmarks) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Bookmarks) Item* (Index: CtlT.Any): Bookmark, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisBookmark(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: Bookmarks) Add* (Name: ARRAY OF CHAR; (* optional *) Range: CtlT.Any): Bookmark, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.StrVar(Name, arg[1]);
        CtlC.AnyVar(Range, arg[0]);
        CtlC.CallParMethod(this, 5, arg, ret);
        RETURN ThisBookmark(CtlC.VarAny(ret))
    END Add;

    PROCEDURE (this: Bookmarks) Exists* (Name: ARRAY OF CHAR): BOOLEAN, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.StrVar(Name, arg[0]);
        CtlC.CallParMethod(this, 6, arg, ret);
        RETURN CtlC.VarBool(ret)
    END Exists;


    (* ---------- Variable, dual, nonextensible ---------- *)

    PROCEDURE (this: Variable) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Variable) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Variable) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Variable) Name* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 1)
    END Name;

    PROCEDURE (this: Variable) Value* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 0)
    END Value;

    PROCEDURE (this: Variable) PUTValue* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 0, p1)
    END PUTValue;

    PROCEDURE (this: Variable) Index* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Index;

    PROCEDURE (this: Variable) Delete* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 11, NIL);
    END Delete;


    (* ---------- Variables, dual, nonextensible ---------- *)

    PROCEDURE (this: Variables) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: Variables) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Count;

    PROCEDURE (this: Variables) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Variables) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Variables) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Variables) Item* (Index: CtlT.Any): Variable, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisVariable(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: Variables) Add* (Name: ARRAY OF CHAR; (* optional *) Value: CtlT.Any): Variable, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.StrVar(Name, arg[1]);
        CtlC.AnyVar(Value, arg[0]);
        CtlC.CallParMethod(this, 7, arg, ret);
        RETURN ThisVariable(CtlC.VarAny(ret))
    END Add;


    (* ---------- RecentFile, dual, nonextensible ---------- *)

    PROCEDURE (this: RecentFile) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: RecentFile) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: RecentFile) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: RecentFile) Name* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 0)
    END Name;

    PROCEDURE (this: RecentFile) Index* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Index;

    PROCEDURE (this: RecentFile) ReadOnly* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 2)
    END ReadOnly;

    PROCEDURE (this: RecentFile) PUTReadOnly* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 2, p1)
    END PUTReadOnly;

    PROCEDURE (this: RecentFile) Path* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 3)
    END Path;

    PROCEDURE (this: RecentFile) Open* (): Document, NEW;
        VAR ret: CtlT.Variant;
    BEGIN
        CtlC.CallMethod(this, 4, ret);
        RETURN This_Document(CtlC.VarAny(ret))
    END Open;

    PROCEDURE (this: RecentFile) Delete* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 5, NIL);
    END Delete;


    (* ---------- RecentFiles, dual, nonextensible ---------- *)

    PROCEDURE (this: RecentFiles) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: RecentFiles) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: RecentFiles) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: RecentFiles) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: RecentFiles) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Count;

    PROCEDURE (this: RecentFiles) Maximum* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Maximum;

    PROCEDURE (this: RecentFiles) PUTMaximum* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 2, p1)
    END PUTMaximum;

    PROCEDURE (this: RecentFiles) Item* (Index: INTEGER): RecentFile, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisRecentFile(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: RecentFiles) Add* (Document: CtlT.Any; (* optional *) ReadOnly: CtlT.Any): RecentFile, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Document, arg[1]);
        CtlC.AnyVar(ReadOnly, arg[0]);
        CtlC.CallParMethod(this, 3, arg, ret);
        RETURN ThisRecentFile(CtlC.VarAny(ret))
    END Add;


    (* ---------- Window, dual, nonextensible ---------- *)

    PROCEDURE (this: Window) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Window) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Window) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Window) ActivePane* (): Pane, NEW;
    BEGIN
        RETURN ThisPane(CtlC.GetAny(this, 1))
    END ActivePane;

    PROCEDURE (this: Window) Document* (): Document, NEW;
    BEGIN
        RETURN This_Document(CtlC.GetAny(this, 2))
    END Document;

    PROCEDURE (this: Window) Panes* (): Panes, NEW;
    BEGIN
        RETURN ThisPanes(CtlC.GetAny(this, 3))
    END Panes;

    PROCEDURE (this: Window) Selection* (): Selection, NEW;
    BEGIN
        RETURN ThisSelection(CtlC.GetAny(this, 4))
    END Selection;

    PROCEDURE (this: Window) Left* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 5)
    END Left;

    PROCEDURE (this: Window) PUTLeft* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 5, p1)
    END PUTLeft;

    PROCEDURE (this: Window) Top* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 6)
    END Top;

    PROCEDURE (this: Window) PUTTop* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 6, p1)
    END PUTTop;

    PROCEDURE (this: Window) Width* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 7)
    END Width;

    PROCEDURE (this: Window) PUTWidth* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 7, p1)
    END PUTWidth;

    PROCEDURE (this: Window) Height* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 8)
    END Height;

    PROCEDURE (this: Window) PUTHeight* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 8, p1)
    END PUTHeight;

    PROCEDURE (this: Window) Split* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 9)
    END Split;

    PROCEDURE (this: Window) PUTSplit* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 9, p1)
    END PUTSplit;

    PROCEDURE (this: Window) SplitVertical* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 10)
    END SplitVertical;

    PROCEDURE (this: Window) PUTSplitVertical* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 10, p1)
    END PUTSplitVertical;

    PROCEDURE (this: Window) Caption* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 0)
    END Caption;

    PROCEDURE (this: Window) PUTCaption* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 0, p1)
    END PUTCaption;

    PROCEDURE (this: Window) WindowState* (): WdWindowState, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 11)
    END WindowState;

    PROCEDURE (this: Window) PUTWindowState* (p1: WdWindowState), NEW;
    BEGIN
        CtlC.PutInt(this, 11, p1)
    END PUTWindowState;

    PROCEDURE (this: Window) DisplayRulers* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 12)
    END DisplayRulers;

    PROCEDURE (this: Window) PUTDisplayRulers* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 12, p1)
    END PUTDisplayRulers;

    PROCEDURE (this: Window) DisplayVerticalRuler* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 13)
    END DisplayVerticalRuler;

    PROCEDURE (this: Window) PUTDisplayVerticalRuler* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 13, p1)
    END PUTDisplayVerticalRuler;

    PROCEDURE (this: Window) View* (): View, NEW;
    BEGIN
        RETURN ThisView(CtlC.GetAny(this, 14))
    END View;

    PROCEDURE (this: Window) Type* (): WdWindowType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 15)
    END Type;

    PROCEDURE (this: Window) Next* (): Window, NEW;
    BEGIN
        RETURN ThisWindow(CtlC.GetAny(this, 16))
    END Next;

    PROCEDURE (this: Window) Previous* (): Window, NEW;
    BEGIN
        RETURN ThisWindow(CtlC.GetAny(this, 17))
    END Previous;

    PROCEDURE (this: Window) WindowNumber* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 18)
    END WindowNumber;

    PROCEDURE (this: Window) DisplayVerticalScrollBar* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 19)
    END DisplayVerticalScrollBar;

    PROCEDURE (this: Window) PUTDisplayVerticalScrollBar* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 19, p1)
    END PUTDisplayVerticalScrollBar;

    PROCEDURE (this: Window) DisplayHorizontalScrollBar* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 20)
    END DisplayHorizontalScrollBar;

    PROCEDURE (this: Window) PUTDisplayHorizontalScrollBar* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 20, p1)
    END PUTDisplayHorizontalScrollBar;

    PROCEDURE (this: Window) StyleAreaWidth* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 21)
    END StyleAreaWidth;

    PROCEDURE (this: Window) PUTStyleAreaWidth* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 21, p1)
    END PUTStyleAreaWidth;

    PROCEDURE (this: Window) DisplayScreenTips* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 22)
    END DisplayScreenTips;

    PROCEDURE (this: Window) PUTDisplayScreenTips* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 22, p1)
    END PUTDisplayScreenTips;

    PROCEDURE (this: Window) HorizontalPercentScrolled* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 23)
    END HorizontalPercentScrolled;

    PROCEDURE (this: Window) PUTHorizontalPercentScrolled* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 23, p1)
    END PUTHorizontalPercentScrolled;

    PROCEDURE (this: Window) VerticalPercentScrolled* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 24)
    END VerticalPercentScrolled;

    PROCEDURE (this: Window) PUTVerticalPercentScrolled* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 24, p1)
    END PUTVerticalPercentScrolled;

    PROCEDURE (this: Window) DocumentMap* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 25)
    END DocumentMap;

    PROCEDURE (this: Window) PUTDocumentMap* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 25, p1)
    END PUTDocumentMap;

    PROCEDURE (this: Window) Active* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 26)
    END Active;

    PROCEDURE (this: Window) DocumentMapPercentWidth* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 27)
    END DocumentMapPercentWidth;

    PROCEDURE (this: Window) PUTDocumentMapPercentWidth* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 27, p1)
    END PUTDocumentMapPercentWidth;

    PROCEDURE (this: Window) Index* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 28)
    END Index;

    PROCEDURE (this: Window) IMEMode* (): WdIMEMode, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 30)
    END IMEMode;

    PROCEDURE (this: Window) PUTIMEMode* (p1: WdIMEMode), NEW;
    BEGIN
        CtlC.PutInt(this, 30, p1)
    END PUTIMEMode;

    PROCEDURE (this: Window) Activate* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 100, NIL);
    END Activate;

    PROCEDURE (this: Window) Close* ((* optional *) SaveChanges: CtlT.Any; RouteDocument: CtlT.Any), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(SaveChanges, arg[1]);
        CtlC.AnyVar(RouteDocument, arg[0]);
        CtlC.CallParMethod(this, 102, arg, NIL);
    END Close;

    PROCEDURE (this: Window) LargeScroll* ((* optional *) Down: CtlT.Any; Up: CtlT.Any; ToRight: CtlT.Any; ToLeft: CtlT.Any), NEW;
        VAR arg: ARRAY 4 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Down, arg[3]);
        CtlC.AnyVar(Up, arg[2]);
        CtlC.AnyVar(ToRight, arg[1]);
        CtlC.AnyVar(ToLeft, arg[0]);
        CtlC.CallParMethod(this, 103, arg, NIL);
    END LargeScroll;

    PROCEDURE (this: Window) SmallScroll* ((* optional *) Down: CtlT.Any; Up: CtlT.Any; ToRight: CtlT.Any; ToLeft: CtlT.Any), NEW;
        VAR arg: ARRAY 4 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Down, arg[3]);
        CtlC.AnyVar(Up, arg[2]);
        CtlC.AnyVar(ToRight, arg[1]);
        CtlC.AnyVar(ToLeft, arg[0]);
        CtlC.CallParMethod(this, 104, arg, NIL);
    END SmallScroll;

    PROCEDURE (this: Window) NewWindow* (): Window, NEW;
        VAR ret: CtlT.Variant;
    BEGIN
        CtlC.CallMethod(this, 105, ret);
        RETURN ThisWindow(CtlC.VarAny(ret))
    END NewWindow;

    PROCEDURE (this: Window) PrintOut* ((* optional *) Background: CtlT.Any; Append: CtlT.Any; Range: CtlT.Any; OutputFileName: CtlT.Any; From: CtlT.Any; To: CtlT.Any; Item: CtlT.Any; Copies: CtlT.Any; Pages: CtlT.Any; PageType: CtlT.Any; PrintToFile: CtlT.Any; Collate: CtlT.Any; ActivePrinterMacGX: CtlT.Any; ManualDuplexPrint: CtlT.Any), NEW;
        VAR arg: ARRAY 14 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Background, arg[13]);
        CtlC.AnyVar(Append, arg[12]);
        CtlC.AnyVar(Range, arg[11]);
        CtlC.AnyVar(OutputFileName, arg[10]);
        CtlC.AnyVar(From, arg[9]);
        CtlC.AnyVar(To, arg[8]);
        CtlC.AnyVar(Item, arg[7]);
        CtlC.AnyVar(Copies, arg[6]);
        CtlC.AnyVar(Pages, arg[5]);
        CtlC.AnyVar(PageType, arg[4]);
        CtlC.AnyVar(PrintToFile, arg[3]);
        CtlC.AnyVar(Collate, arg[2]);
        CtlC.AnyVar(ActivePrinterMacGX, arg[1]);
        CtlC.AnyVar(ManualDuplexPrint, arg[0]);
        CtlC.CallParMethod(this, 107, arg, NIL);
    END PrintOut;

    PROCEDURE (this: Window) PageScroll* ((* optional *) Down: CtlT.Any; Up: CtlT.Any), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Down, arg[1]);
        CtlC.AnyVar(Up, arg[0]);
        CtlC.CallParMethod(this, 108, arg, NIL);
    END PageScroll;


    (* ---------- Windows, dual, nonextensible ---------- *)

    PROCEDURE (this: Windows) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: Windows) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Count;

    PROCEDURE (this: Windows) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Windows) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Windows) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Windows) Item* (Index: CtlT.Any): Window, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisWindow(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: Windows) Add* ((* optional *) window: CtlT.Any): Window, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(window, arg[0]);
        CtlC.CallParMethod(this, 10, arg, ret);
        RETURN ThisWindow(CtlC.VarAny(ret))
    END Add;

    PROCEDURE (this: Windows) Arrange* ((* optional *) ArrangeStyle: CtlT.Any), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(ArrangeStyle, arg[0]);
        CtlC.CallParMethod(this, 11, arg, NIL);
    END Arrange;


    (* ---------- Pane, dual, nonextensible ---------- *)

    PROCEDURE (this: Pane) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Pane) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Pane) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Pane) Document* (): Document, NEW;
    BEGIN
        RETURN This_Document(CtlC.GetAny(this, 1))
    END Document;

    PROCEDURE (this: Pane) Selection* (): Selection, NEW;
    BEGIN
        RETURN ThisSelection(CtlC.GetAny(this, 3))
    END Selection;

    PROCEDURE (this: Pane) DisplayRulers* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 4)
    END DisplayRulers;

    PROCEDURE (this: Pane) PUTDisplayRulers* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 4, p1)
    END PUTDisplayRulers;

    PROCEDURE (this: Pane) DisplayVerticalRuler* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 5)
    END DisplayVerticalRuler;

    PROCEDURE (this: Pane) PUTDisplayVerticalRuler* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 5, p1)
    END PUTDisplayVerticalRuler;

    PROCEDURE (this: Pane) Zooms* (): Zooms, NEW;
    BEGIN
        RETURN ThisZooms(CtlC.GetAny(this, 7))
    END Zooms;

    PROCEDURE (this: Pane) Index* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 9)
    END Index;

    PROCEDURE (this: Pane) View* (): View, NEW;
    BEGIN
        RETURN ThisView(CtlC.GetAny(this, 10))
    END View;

    PROCEDURE (this: Pane) Next* (): Pane, NEW;
    BEGIN
        RETURN ThisPane(CtlC.GetAny(this, 11))
    END Next;

    PROCEDURE (this: Pane) Previous* (): Pane, NEW;
    BEGIN
        RETURN ThisPane(CtlC.GetAny(this, 12))
    END Previous;

    PROCEDURE (this: Pane) HorizontalPercentScrolled* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 13)
    END HorizontalPercentScrolled;

    PROCEDURE (this: Pane) PUTHorizontalPercentScrolled* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 13, p1)
    END PUTHorizontalPercentScrolled;

    PROCEDURE (this: Pane) VerticalPercentScrolled* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 14)
    END VerticalPercentScrolled;

    PROCEDURE (this: Pane) PUTVerticalPercentScrolled* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 14, p1)
    END PUTVerticalPercentScrolled;

    PROCEDURE (this: Pane) MinimumFontSize* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 15)
    END MinimumFontSize;

    PROCEDURE (this: Pane) PUTMinimumFontSize* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 15, p1)
    END PUTMinimumFontSize;

    PROCEDURE (this: Pane) BrowseToWindow* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 16)
    END BrowseToWindow;

    PROCEDURE (this: Pane) PUTBrowseToWindow* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 16, p1)
    END PUTBrowseToWindow;

    PROCEDURE (this: Pane) BrowseWidth* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 17)
    END BrowseWidth;

    PROCEDURE (this: Pane) Activate* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 100, NIL);
    END Activate;

    PROCEDURE (this: Pane) Close* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 101, NIL);
    END Close;

    PROCEDURE (this: Pane) LargeScroll* ((* optional *) Down: CtlT.Any; Up: CtlT.Any; ToRight: CtlT.Any; ToLeft: CtlT.Any), NEW;
        VAR arg: ARRAY 4 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Down, arg[3]);
        CtlC.AnyVar(Up, arg[2]);
        CtlC.AnyVar(ToRight, arg[1]);
        CtlC.AnyVar(ToLeft, arg[0]);
        CtlC.CallParMethod(this, 102, arg, NIL);
    END LargeScroll;

    PROCEDURE (this: Pane) SmallScroll* ((* optional *) Down: CtlT.Any; Up: CtlT.Any; ToRight: CtlT.Any; ToLeft: CtlT.Any), NEW;
        VAR arg: ARRAY 4 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Down, arg[3]);
        CtlC.AnyVar(Up, arg[2]);
        CtlC.AnyVar(ToRight, arg[1]);
        CtlC.AnyVar(ToLeft, arg[0]);
        CtlC.CallParMethod(this, 103, arg, NIL);
    END SmallScroll;

    PROCEDURE (this: Pane) AutoScroll* (Velocity: INTEGER), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(Velocity, arg[0]);
        CtlC.CallParMethod(this, 104, arg, NIL);
    END AutoScroll;

    PROCEDURE (this: Pane) PageScroll* ((* optional *) Down: CtlT.Any; Up: CtlT.Any), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Down, arg[1]);
        CtlC.AnyVar(Up, arg[0]);
        CtlC.CallParMethod(this, 105, arg, NIL);
    END PageScroll;


    (* ---------- Panes, dual, nonextensible ---------- *)

    PROCEDURE (this: Panes) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: Panes) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Count;

    PROCEDURE (this: Panes) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Panes) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Panes) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Panes) Item* (Index: INTEGER): Pane, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisPane(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: Panes) Add* ((* optional *) SplitVertical: CtlT.Any): Pane, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(SplitVertical, arg[0]);
        CtlC.CallParMethod(this, 3, arg, ret);
        RETURN ThisPane(CtlC.VarAny(ret))
    END Add;


    (* ---------- Range, dual, nonextensible ---------- *)

    PROCEDURE (this: Range) Text* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 0)
    END Text;

    PROCEDURE (this: Range) PUTText* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 0, p1)
    END PUTText;

    PROCEDURE (this: Range) FormattedText* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 2))
    END FormattedText;

    PROCEDURE (this: Range) PUTFormattedText* (p1: Range), NEW;
    BEGIN
        CtlC.PutObj(this, 2, p1)
    END PUTFormattedText;

    PROCEDURE (this: Range) Start* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 3)
    END Start;

    PROCEDURE (this: Range) PUTStart* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 3, p1)
    END PUTStart;

    PROCEDURE (this: Range) End* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 4)
    END End;

    PROCEDURE (this: Range) PUTEnd* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 4, p1)
    END PUTEnd;

    PROCEDURE (this: Range) Font* (): Font, NEW;
    BEGIN
        RETURN This_Font(CtlC.GetAny(this, 5))
    END Font;

    PROCEDURE (this: Range) PUTFont* (p1: Font), NEW;
    BEGIN
        CtlC.PutObj(this, 5, p1)
    END PUTFont;

    PROCEDURE (this: Range) Duplicate* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 6))
    END Duplicate;

    PROCEDURE (this: Range) StoryType* (): WdStoryType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 7)
    END StoryType;

    PROCEDURE (this: Range) Tables* (): Tables, NEW;
    BEGIN
        RETURN ThisTables(CtlC.GetAny(this, 50))
    END Tables;

    PROCEDURE (this: Range) Words* (): Words, NEW;
    BEGIN
        RETURN ThisWords(CtlC.GetAny(this, 51))
    END Words;

    PROCEDURE (this: Range) Sentences* (): Sentences, NEW;
    BEGIN
        RETURN ThisSentences(CtlC.GetAny(this, 52))
    END Sentences;

    PROCEDURE (this: Range) Characters* (): Characters, NEW;
    BEGIN
        RETURN ThisCharacters(CtlC.GetAny(this, 53))
    END Characters;

    PROCEDURE (this: Range) Footnotes* (): Footnotes, NEW;
    BEGIN
        RETURN ThisFootnotes(CtlC.GetAny(this, 54))
    END Footnotes;

    PROCEDURE (this: Range) Endnotes* (): Endnotes, NEW;
    BEGIN
        RETURN ThisEndnotes(CtlC.GetAny(this, 55))
    END Endnotes;

    PROCEDURE (this: Range) Comments* (): Comments, NEW;
    BEGIN
        RETURN ThisComments(CtlC.GetAny(this, 56))
    END Comments;

    PROCEDURE (this: Range) Cells* (): Cells, NEW;
    BEGIN
        RETURN ThisCells(CtlC.GetAny(this, 57))
    END Cells;

    PROCEDURE (this: Range) Sections* (): Sections, NEW;
    BEGIN
        RETURN ThisSections(CtlC.GetAny(this, 58))
    END Sections;

    PROCEDURE (this: Range) Paragraphs* (): Paragraphs, NEW;
    BEGIN
        RETURN ThisParagraphs(CtlC.GetAny(this, 59))
    END Paragraphs;

    PROCEDURE (this: Range) Borders* (): Borders, NEW;
    BEGIN
        RETURN ThisBorders(CtlC.GetAny(this, 1100))
    END Borders;

    PROCEDURE (this: Range) PUTBorders* (p1: Borders), NEW;
    BEGIN
        CtlC.PutObj(this, 1100, p1)
    END PUTBorders;

    PROCEDURE (this: Range) Shading* (): Shading, NEW;
    BEGIN
        RETURN ThisShading(CtlC.GetAny(this, 61))
    END Shading;

    PROCEDURE (this: Range) TextRetrievalMode* (): TextRetrievalMode, NEW;
    BEGIN
        RETURN ThisTextRetrievalMode(CtlC.GetAny(this, 62))
    END TextRetrievalMode;

    PROCEDURE (this: Range) PUTTextRetrievalMode* (p1: TextRetrievalMode), NEW;
    BEGIN
        CtlC.PutObj(this, 62, p1)
    END PUTTextRetrievalMode;

    PROCEDURE (this: Range) Fields* (): Fields, NEW;
    BEGIN
        RETURN ThisFields(CtlC.GetAny(this, 64))
    END Fields;

    PROCEDURE (this: Range) FormFields* (): FormFields, NEW;
    BEGIN
        RETURN ThisFormFields(CtlC.GetAny(this, 65))
    END FormFields;

    PROCEDURE (this: Range) Frames* (): Frames, NEW;
    BEGIN
        RETURN ThisFrames(CtlC.GetAny(this, 66))
    END Frames;

    PROCEDURE (this: Range) ParagraphFormat* (): ParagraphFormat, NEW;
    BEGIN
        RETURN This_ParagraphFormat(CtlC.GetAny(this, 1102))
    END ParagraphFormat;

    PROCEDURE (this: Range) PUTParagraphFormat* (p1: ParagraphFormat), NEW;
    BEGIN
        CtlC.PutObj(this, 1102, p1)
    END PUTParagraphFormat;

    PROCEDURE (this: Range) ListFormat* (): ListFormat, NEW;
    BEGIN
        RETURN ThisListFormat(CtlC.GetAny(this, 68))
    END ListFormat;

    PROCEDURE (this: Range) Bookmarks* (): Bookmarks, NEW;
    BEGIN
        RETURN ThisBookmarks(CtlC.GetAny(this, 75))
    END Bookmarks;

    PROCEDURE (this: Range) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Range) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Range) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Range) Bold* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 130)
    END Bold;

    PROCEDURE (this: Range) PUTBold* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 130, p1)
    END PUTBold;

    PROCEDURE (this: Range) Italic* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 131)
    END Italic;

    PROCEDURE (this: Range) PUTItalic* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 131, p1)
    END PUTItalic;

    PROCEDURE (this: Range) Underline* (): WdUnderline, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 139)
    END Underline;

    PROCEDURE (this: Range) PUTUnderline* (p1: WdUnderline), NEW;
    BEGIN
        CtlC.PutInt(this, 139, p1)
    END PUTUnderline;

    PROCEDURE (this: Range) EmphasisMark* (): WdEmphasisMark, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 140)
    END EmphasisMark;

    PROCEDURE (this: Range) PUTEmphasisMark* (p1: WdEmphasisMark), NEW;
    BEGIN
        CtlC.PutInt(this, 140, p1)
    END PUTEmphasisMark;

    PROCEDURE (this: Range) DisableCharacterSpaceGrid* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 141)
    END DisableCharacterSpaceGrid;

    PROCEDURE (this: Range) PUTDisableCharacterSpaceGrid* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 141, p1)
    END PUTDisableCharacterSpaceGrid;

    PROCEDURE (this: Range) Revisions* (): Revisions, NEW;
    BEGIN
        RETURN ThisRevisions(CtlC.GetAny(this, 150))
    END Revisions;

    PROCEDURE (this: Range) Style* (): CtlT.Any, NEW;
    BEGIN
        RETURN CtlC.GetAny(this, 151)
    END Style;

    PROCEDURE (this: Range) PUTStyle* (p1: CtlT.Any), NEW;
    BEGIN
        CtlC.PutAny(this, 151, p1)
    END PUTStyle;

    PROCEDURE (this: Range) StoryLength* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 152)
    END StoryLength;

    PROCEDURE (this: Range) LanguageID* (): WdLanguageID, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 153)
    END LanguageID;

    PROCEDURE (this: Range) PUTLanguageID* (p1: WdLanguageID), NEW;
    BEGIN
        CtlC.PutInt(this, 153, p1)
    END PUTLanguageID;

    PROCEDURE (this: Range) SynonymInfo* (): SynonymInfo, NEW;
    BEGIN
        RETURN ThisSynonymInfo(CtlC.GetAny(this, 155))
    END SynonymInfo;

    PROCEDURE (this: Range) Hyperlinks* (): Hyperlinks, NEW;
    BEGIN
        RETURN ThisHyperlinks(CtlC.GetAny(this, 156))
    END Hyperlinks;

    PROCEDURE (this: Range) ListParagraphs* (): ListParagraphs, NEW;
    BEGIN
        RETURN ThisListParagraphs(CtlC.GetAny(this, 157))
    END ListParagraphs;

    PROCEDURE (this: Range) Subdocuments* (): Subdocuments, NEW;
    BEGIN
        RETURN ThisSubdocuments(CtlC.GetAny(this, 159))
    END Subdocuments;

    PROCEDURE (this: Range) GrammarChecked* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 260)
    END GrammarChecked;

    PROCEDURE (this: Range) PUTGrammarChecked* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 260, p1)
    END PUTGrammarChecked;

    PROCEDURE (this: Range) SpellingChecked* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 261)
    END SpellingChecked;

    PROCEDURE (this: Range) PUTSpellingChecked* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 261, p1)
    END PUTSpellingChecked;

    PROCEDURE (this: Range) HighlightColorIndex* (): WdColorIndex, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 301)
    END HighlightColorIndex;

    PROCEDURE (this: Range) PUTHighlightColorIndex* (p1: WdColorIndex), NEW;
    BEGIN
        CtlC.PutInt(this, 301, p1)
    END PUTHighlightColorIndex;

    PROCEDURE (this: Range) Columns* (): Columns, NEW;
    BEGIN
        RETURN ThisColumns(CtlC.GetAny(this, 302))
    END Columns;

    PROCEDURE (this: Range) Rows* (): Rows, NEW;
    BEGIN
        RETURN ThisRows(CtlC.GetAny(this, 303))
    END Rows;

    PROCEDURE (this: Range) CanEdit* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 304)
    END CanEdit;

    PROCEDURE (this: Range) CanPaste* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 305)
    END CanPaste;

    PROCEDURE (this: Range) IsEndOfRowMark* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 307)
    END IsEndOfRowMark;

    PROCEDURE (this: Range) BookmarkID* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 308)
    END BookmarkID;

    PROCEDURE (this: Range) PreviousBookmarkID* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 309)
    END PreviousBookmarkID;

    PROCEDURE (this: Range) Find* (): Find, NEW;
    BEGIN
        RETURN ThisFind(CtlC.GetAny(this, 262))
    END Find;

    PROCEDURE (this: Range) PageSetup* (): PageSetup, NEW;
    BEGIN
        RETURN ThisPageSetup(CtlC.GetAny(this, 1101))
    END PageSetup;

    PROCEDURE (this: Range) PUTPageSetup* (p1: PageSetup), NEW;
    BEGIN
        CtlC.PutObj(this, 1101, p1)
    END PUTPageSetup;

    PROCEDURE (this: Range) ShapeRange* (): ShapeRange, NEW;
    BEGIN
        RETURN ThisShapeRange(CtlC.GetAny(this, 311))
    END ShapeRange;

    PROCEDURE (this: Range) Case* (): WdCharacterCase, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 312)
    END Case;

    PROCEDURE (this: Range) PUTCase* (p1: WdCharacterCase), NEW;
    BEGIN
        CtlC.PutInt(this, 312, p1)
    END PUTCase;

    PROCEDURE (this: Range) Information* (Type: WdInformation): CtlT.Any, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Type, arg[0]);
        CtlC.CallGetMethod(this, 313, arg, ret);
        RETURN CtlC.VarAny(ret)
    END Information;

    PROCEDURE (this: Range) ReadabilityStatistics* (): ReadabilityStatistics, NEW;
    BEGIN
        RETURN ThisReadabilityStatistics(CtlC.GetAny(this, 314))
    END ReadabilityStatistics;

    PROCEDURE (this: Range) GrammaticalErrors* (): ProofreadingErrors, NEW;
    BEGIN
        RETURN ThisProofreadingErrors(CtlC.GetAny(this, 315))
    END GrammaticalErrors;

    PROCEDURE (this: Range) SpellingErrors* (): ProofreadingErrors, NEW;
    BEGIN
        RETURN ThisProofreadingErrors(CtlC.GetAny(this, 316))
    END SpellingErrors;

    PROCEDURE (this: Range) Orientation* (): WdTextOrientation, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 317)
    END Orientation;

    PROCEDURE (this: Range) PUTOrientation* (p1: WdTextOrientation), NEW;
    BEGIN
        CtlC.PutInt(this, 317, p1)
    END PUTOrientation;

    PROCEDURE (this: Range) InlineShapes* (): InlineShapes, NEW;
    BEGIN
        RETURN ThisInlineShapes(CtlC.GetAny(this, 319))
    END InlineShapes;

    PROCEDURE (this: Range) NextStoryRange* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 320))
    END NextStoryRange;

    PROCEDURE (this: Range) LanguageIDFarEast* (): WdLanguageID, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 321)
    END LanguageIDFarEast;

    PROCEDURE (this: Range) PUTLanguageIDFarEast* (p1: WdLanguageID), NEW;
    BEGIN
        CtlC.PutInt(this, 321, p1)
    END PUTLanguageIDFarEast;

    PROCEDURE (this: Range) LanguageIDOther* (): WdLanguageID, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 322)
    END LanguageIDOther;

    PROCEDURE (this: Range) PUTLanguageIDOther* (p1: WdLanguageID), NEW;
    BEGIN
        CtlC.PutInt(this, 322, p1)
    END PUTLanguageIDOther;

    PROCEDURE (this: Range) Select* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 65535, NIL);
    END Select;

    PROCEDURE (this: Range) SetRange* (Start: INTEGER; End: INTEGER), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(Start, arg[1]);
        CtlC.IntVar(End, arg[0]);
        CtlC.CallParMethod(this, 100, arg, NIL);
    END SetRange;

    PROCEDURE (this: Range) Collapse* ((* optional *) Direction: CtlT.Any), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Direction, arg[0]);
        CtlC.CallParMethod(this, 101, arg, NIL);
    END Collapse;

    PROCEDURE (this: Range) InsertBefore* (Text: ARRAY OF CHAR), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.StrVar(Text, arg[0]);
        CtlC.CallParMethod(this, 102, arg, NIL);
    END InsertBefore;

    PROCEDURE (this: Range) InsertAfter* (Text: ARRAY OF CHAR), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.StrVar(Text, arg[0]);
        CtlC.CallParMethod(this, 104, arg, NIL);
    END InsertAfter;

    PROCEDURE (this: Range) Next* ((* optional *) Unit: CtlT.Any; Count: CtlT.Any): Range, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Unit, arg[1]);
        CtlC.AnyVar(Count, arg[0]);
        CtlC.CallParMethod(this, 105, arg, ret);
        RETURN ThisRange(CtlC.VarAny(ret))
    END Next;

    PROCEDURE (this: Range) Previous* ((* optional *) Unit: CtlT.Any; Count: CtlT.Any): Range, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Unit, arg[1]);
        CtlC.AnyVar(Count, arg[0]);
        CtlC.CallParMethod(this, 106, arg, ret);
        RETURN ThisRange(CtlC.VarAny(ret))
    END Previous;

    PROCEDURE (this: Range) StartOf* ((* optional *) Unit: CtlT.Any; Extend: CtlT.Any): INTEGER, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Unit, arg[1]);
        CtlC.AnyVar(Extend, arg[0]);
        CtlC.CallParMethod(this, 107, arg, ret);
        RETURN CtlC.VarInt(ret)
    END StartOf;

    PROCEDURE (this: Range) EndOf* ((* optional *) Unit: CtlT.Any; Extend: CtlT.Any): INTEGER, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Unit, arg[1]);
        CtlC.AnyVar(Extend, arg[0]);
        CtlC.CallParMethod(this, 108, arg, ret);
        RETURN CtlC.VarInt(ret)
    END EndOf;

    PROCEDURE (this: Range) Move* ((* optional *) Unit: CtlT.Any; Count: CtlT.Any): INTEGER, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Unit, arg[1]);
        CtlC.AnyVar(Count, arg[0]);
        CtlC.CallParMethod(this, 109, arg, ret);
        RETURN CtlC.VarInt(ret)
    END Move;

    PROCEDURE (this: Range) MoveStart* ((* optional *) Unit: CtlT.Any; Count: CtlT.Any): INTEGER, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Unit, arg[1]);
        CtlC.AnyVar(Count, arg[0]);
        CtlC.CallParMethod(this, 110, arg, ret);
        RETURN CtlC.VarInt(ret)
    END MoveStart;

    PROCEDURE (this: Range) MoveEnd* ((* optional *) Unit: CtlT.Any; Count: CtlT.Any): INTEGER, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Unit, arg[1]);
        CtlC.AnyVar(Count, arg[0]);
        CtlC.CallParMethod(this, 111, arg, ret);
        RETURN CtlC.VarInt(ret)
    END MoveEnd;

    PROCEDURE (this: Range) MoveWhile* (Cset: CtlT.Any; (* optional *) Count: CtlT.Any): INTEGER, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Cset, arg[1]);
        CtlC.AnyVar(Count, arg[0]);
        CtlC.CallParMethod(this, 112, arg, ret);
        RETURN CtlC.VarInt(ret)
    END MoveWhile;

    PROCEDURE (this: Range) MoveStartWhile* (Cset: CtlT.Any; (* optional *) Count: CtlT.Any): INTEGER, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Cset, arg[1]);
        CtlC.AnyVar(Count, arg[0]);
        CtlC.CallParMethod(this, 113, arg, ret);
        RETURN CtlC.VarInt(ret)
    END MoveStartWhile;

    PROCEDURE (this: Range) MoveEndWhile* (Cset: CtlT.Any; (* optional *) Count: CtlT.Any): INTEGER, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Cset, arg[1]);
        CtlC.AnyVar(Count, arg[0]);
        CtlC.CallParMethod(this, 114, arg, ret);
        RETURN CtlC.VarInt(ret)
    END MoveEndWhile;

    PROCEDURE (this: Range) MoveUntil* (Cset: CtlT.Any; (* optional *) Count: CtlT.Any): INTEGER, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Cset, arg[1]);
        CtlC.AnyVar(Count, arg[0]);
        CtlC.CallParMethod(this, 115, arg, ret);
        RETURN CtlC.VarInt(ret)
    END MoveUntil;

    PROCEDURE (this: Range) MoveStartUntil* (Cset: CtlT.Any; (* optional *) Count: CtlT.Any): INTEGER, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Cset, arg[1]);
        CtlC.AnyVar(Count, arg[0]);
        CtlC.CallParMethod(this, 116, arg, ret);
        RETURN CtlC.VarInt(ret)
    END MoveStartUntil;

    PROCEDURE (this: Range) MoveEndUntil* (Cset: CtlT.Any; (* optional *) Count: CtlT.Any): INTEGER, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Cset, arg[1]);
        CtlC.AnyVar(Count, arg[0]);
        CtlC.CallParMethod(this, 117, arg, ret);
        RETURN CtlC.VarInt(ret)
    END MoveEndUntil;

    PROCEDURE (this: Range) Cut* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 119, NIL);
    END Cut;

    PROCEDURE (this: Range) Copy* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 120, NIL);
    END Copy;

    PROCEDURE (this: Range) Paste* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 121, NIL);
    END Paste;

    PROCEDURE (this: Range) InsertBreak* ((* optional *) Type: CtlT.Any), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Type, arg[0]);
        CtlC.CallParMethod(this, 122, arg, NIL);
    END InsertBreak;

    PROCEDURE (this: Range) InsertFile* (FileName: ARRAY OF CHAR; (* optional *) Range: CtlT.Any; ConfirmConversions: CtlT.Any; Link: CtlT.Any; Attachment: CtlT.Any), NEW;
        VAR arg: ARRAY 5 OF CtlT.Variant;
    BEGIN
        CtlC.StrVar(FileName, arg[4]);
        CtlC.AnyVar(Range, arg[3]);
        CtlC.AnyVar(ConfirmConversions, arg[2]);
        CtlC.AnyVar(Link, arg[1]);
        CtlC.AnyVar(Attachment, arg[0]);
        CtlC.CallParMethod(this, 123, arg, NIL);
    END InsertFile;

    PROCEDURE (this: Range) InStory* (range: Range): BOOLEAN, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.ObjVar(range, arg[0]);
        CtlC.CallParMethod(this, 125, arg, ret);
        RETURN CtlC.VarBool(ret)
    END InStory;

    PROCEDURE (this: Range) InRange* (range: Range): BOOLEAN, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.ObjVar(range, arg[0]);
        CtlC.CallParMethod(this, 126, arg, ret);
        RETURN CtlC.VarBool(ret)
    END InRange;

    PROCEDURE (this: Range) Delete* ((* optional *) Unit: CtlT.Any; Count: CtlT.Any): INTEGER, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Unit, arg[1]);
        CtlC.AnyVar(Count, arg[0]);
        CtlC.CallParMethod(this, 127, arg, ret);
        RETURN CtlC.VarInt(ret)
    END Delete;

    PROCEDURE (this: Range) WholeStory* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 128, NIL);
    END WholeStory;

    PROCEDURE (this: Range) Expand* ((* optional *) Unit: CtlT.Any): INTEGER, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Unit, arg[0]);
        CtlC.CallParMethod(this, 129, arg, ret);
        RETURN CtlC.VarInt(ret)
    END Expand;

    PROCEDURE (this: Range) InsertParagraph* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 160, NIL);
    END InsertParagraph;

    PROCEDURE (this: Range) InsertParagraphAfter* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 161, NIL);
    END InsertParagraphAfter;

    PROCEDURE (this: Range) ConvertToTable* ((* optional *) Separator: CtlT.Any; NumRows: CtlT.Any; NumColumns: CtlT.Any; InitialColumnWidth: CtlT.Any; Format: CtlT.Any; ApplyBorders: CtlT.Any; ApplyShading: CtlT.Any; ApplyFont: CtlT.Any; ApplyColor: CtlT.Any; ApplyHeadingRows: CtlT.Any; ApplyLastRow: CtlT.Any; ApplyFirstColumn: CtlT.Any; ApplyLastColumn: CtlT.Any; AutoFit: CtlT.Any): Table, NEW;
        VAR arg: ARRAY 14 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Separator, arg[13]);
        CtlC.AnyVar(NumRows, arg[12]);
        CtlC.AnyVar(NumColumns, arg[11]);
        CtlC.AnyVar(InitialColumnWidth, arg[10]);
        CtlC.AnyVar(Format, arg[9]);
        CtlC.AnyVar(ApplyBorders, arg[8]);
        CtlC.AnyVar(ApplyShading, arg[7]);
        CtlC.AnyVar(ApplyFont, arg[6]);
        CtlC.AnyVar(ApplyColor, arg[5]);
        CtlC.AnyVar(ApplyHeadingRows, arg[4]);
        CtlC.AnyVar(ApplyLastRow, arg[3]);
        CtlC.AnyVar(ApplyFirstColumn, arg[2]);
        CtlC.AnyVar(ApplyLastColumn, arg[1]);
        CtlC.AnyVar(AutoFit, arg[0]);
        CtlC.CallParMethod(this, 162, arg, ret);
        RETURN ThisTable(CtlC.VarAny(ret))
    END ConvertToTable;

    PROCEDURE (this: Range) InsertDateTime* ((* optional *) DateTimeFormat: CtlT.Any; InsertAsField: CtlT.Any; InsertAsFullWidth: CtlT.Any), NEW;
        VAR arg: ARRAY 3 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(DateTimeFormat, arg[2]);
        CtlC.AnyVar(InsertAsField, arg[1]);
        CtlC.AnyVar(InsertAsFullWidth, arg[0]);
        CtlC.CallParMethod(this, 163, arg, NIL);
    END InsertDateTime;

    PROCEDURE (this: Range) InsertSymbol* (CharacterNumber: INTEGER; (* optional *) Font: CtlT.Any; Unicode: CtlT.Any; Bias: CtlT.Any), NEW;
        VAR arg: ARRAY 4 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(CharacterNumber, arg[3]);
        CtlC.AnyVar(Font, arg[2]);
        CtlC.AnyVar(Unicode, arg[1]);
        CtlC.AnyVar(Bias, arg[0]);
        CtlC.CallParMethod(this, 164, arg, NIL);
    END InsertSymbol;

    PROCEDURE (this: Range) InsertCrossReference* (ReferenceType: CtlT.Any; ReferenceKind: WdReferenceKind; ReferenceItem: CtlT.Any; (* optional *) InsertAsHyperlink: CtlT.Any; IncludePosition: CtlT.Any), NEW;
        VAR arg: ARRAY 5 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(ReferenceType, arg[4]);
        CtlC.IntVar(ReferenceKind, arg[3]);
        CtlC.AnyVar(ReferenceItem, arg[2]);
        CtlC.AnyVar(InsertAsHyperlink, arg[1]);
        CtlC.AnyVar(IncludePosition, arg[0]);
        CtlC.CallParMethod(this, 165, arg, NIL);
    END InsertCrossReference;

    PROCEDURE (this: Range) InsertCaption* (Label: CtlT.Any; (* optional *) Title: CtlT.Any; TitleAutoText: CtlT.Any; Position: CtlT.Any), NEW;
        VAR arg: ARRAY 4 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Label, arg[3]);
        CtlC.AnyVar(Title, arg[2]);
        CtlC.AnyVar(TitleAutoText, arg[1]);
        CtlC.AnyVar(Position, arg[0]);
        CtlC.CallParMethod(this, 166, arg, NIL);
    END InsertCaption;

    PROCEDURE (this: Range) CopyAsPicture* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 167, NIL);
    END CopyAsPicture;

    PROCEDURE (this: Range) Sort* ((* optional *) ExcludeHeader: CtlT.Any; FieldNumber: CtlT.Any; SortFieldType: CtlT.Any; SortOrder: CtlT.Any; FieldNumber2: CtlT.Any; SortFieldType2: CtlT.Any; SortOrder2: CtlT.Any; FieldNumber3: CtlT.Any; SortFieldType3: CtlT.Any; SortOrder3: CtlT.Any; SortColumn: CtlT.Any; Separator: CtlT.Any; CaseSensitive: CtlT.Any; LanguageID: CtlT.Any), NEW;
        VAR arg: ARRAY 14 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(ExcludeHeader, arg[13]);
        CtlC.AnyVar(FieldNumber, arg[12]);
        CtlC.AnyVar(SortFieldType, arg[11]);
        CtlC.AnyVar(SortOrder, arg[10]);
        CtlC.AnyVar(FieldNumber2, arg[9]);
        CtlC.AnyVar(SortFieldType2, arg[8]);
        CtlC.AnyVar(SortOrder2, arg[7]);
        CtlC.AnyVar(FieldNumber3, arg[6]);
        CtlC.AnyVar(SortFieldType3, arg[5]);
        CtlC.AnyVar(SortOrder3, arg[4]);
        CtlC.AnyVar(SortColumn, arg[3]);
        CtlC.AnyVar(Separator, arg[2]);
        CtlC.AnyVar(CaseSensitive, arg[1]);
        CtlC.AnyVar(LanguageID, arg[0]);
        CtlC.CallParMethod(this, 168, arg, NIL);
    END Sort;

    PROCEDURE (this: Range) SortAscending* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 169, NIL);
    END SortAscending;

    PROCEDURE (this: Range) SortDescending* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 170, NIL);
    END SortDescending;

    PROCEDURE (this: Range) IsEqual* (range: Range): BOOLEAN, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.ObjVar(range, arg[0]);
        CtlC.CallParMethod(this, 171, arg, ret);
        RETURN CtlC.VarBool(ret)
    END IsEqual;

    PROCEDURE (this: Range) Calculate* (): SHORTREAL, NEW;
        VAR ret: CtlT.Variant;
    BEGIN
        CtlC.CallMethod(this, 172, ret);
        RETURN CtlC.VarSReal(ret)
    END Calculate;

    PROCEDURE (this: Range) GoTo* ((* optional *) What: CtlT.Any; Which: CtlT.Any; Count: CtlT.Any; Name: CtlT.Any): Range, NEW;
        VAR arg: ARRAY 4 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(What, arg[3]);
        CtlC.AnyVar(Which, arg[2]);
        CtlC.AnyVar(Count, arg[1]);
        CtlC.AnyVar(Name, arg[0]);
        CtlC.CallParMethod(this, 173, arg, ret);
        RETURN ThisRange(CtlC.VarAny(ret))
    END GoTo;

    PROCEDURE (this: Range) GoToNext* (What: WdGoToItem): Range, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(What, arg[0]);
        CtlC.CallParMethod(this, 174, arg, ret);
        RETURN ThisRange(CtlC.VarAny(ret))
    END GoToNext;

    PROCEDURE (this: Range) GoToPrevious* (What: WdGoToItem): Range, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(What, arg[0]);
        CtlC.CallParMethod(this, 175, arg, ret);
        RETURN ThisRange(CtlC.VarAny(ret))
    END GoToPrevious;

    PROCEDURE (this: Range) PasteSpecial* ((* optional *) IconIndex: CtlT.Any; Link: CtlT.Any; Placement: CtlT.Any; DisplayAsIcon: CtlT.Any; DataType: CtlT.Any; IconFileName: CtlT.Any; IconLabel: CtlT.Any), NEW;
        VAR arg: ARRAY 7 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(IconIndex, arg[6]);
        CtlC.AnyVar(Link, arg[5]);
        CtlC.AnyVar(Placement, arg[4]);
        CtlC.AnyVar(DisplayAsIcon, arg[3]);
        CtlC.AnyVar(DataType, arg[2]);
        CtlC.AnyVar(IconFileName, arg[1]);
        CtlC.AnyVar(IconLabel, arg[0]);
        CtlC.CallParMethod(this, 176, arg, NIL);
    END PasteSpecial;

    PROCEDURE (this: Range) LookupNameProperties* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 177, NIL);
    END LookupNameProperties;

    PROCEDURE (this: Range) ComputeStatistics* (Statistic: WdStatistic): INTEGER, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Statistic, arg[0]);
        CtlC.CallParMethod(this, 178, arg, ret);
        RETURN CtlC.VarInt(ret)
    END ComputeStatistics;

    PROCEDURE (this: Range) Relocate* (Direction: INTEGER), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(Direction, arg[0]);
        CtlC.CallParMethod(this, 179, arg, NIL);
    END Relocate;

    PROCEDURE (this: Range) CheckSynonyms* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 180, NIL);
    END CheckSynonyms;

    PROCEDURE (this: Range) SubscribeTo* (Edition: ARRAY OF CHAR; (* optional *) Format: CtlT.Any), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.StrVar(Edition, arg[1]);
        CtlC.AnyVar(Format, arg[0]);
        CtlC.CallParMethod(this, 181, arg, NIL);
    END SubscribeTo;

    PROCEDURE (this: Range) CreatePublisher* ((* optional *) Edition: CtlT.Any; ContainsPICT: CtlT.Any; ContainsRTF: CtlT.Any; ContainsText: CtlT.Any), NEW;
        VAR arg: ARRAY 4 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Edition, arg[3]);
        CtlC.AnyVar(ContainsPICT, arg[2]);
        CtlC.AnyVar(ContainsRTF, arg[1]);
        CtlC.AnyVar(ContainsText, arg[0]);
        CtlC.CallParMethod(this, 182, arg, NIL);
    END CreatePublisher;

    PROCEDURE (this: Range) InsertAutoText* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 183, NIL);
    END InsertAutoText;

    PROCEDURE (this: Range) InsertDatabase* ((* optional *) Format: CtlT.Any; Style: CtlT.Any; LinkToSource: CtlT.Any; Connection: CtlT.Any; SQLStatement: CtlT.Any; SQLStatement1: CtlT.Any; PasswordDocument: CtlT.Any; PasswordTemplate: CtlT.Any; WritePasswordDocument: CtlT.Any; WritePasswordTemplate: CtlT.Any; DataSource: CtlT.Any; From: CtlT.Any; To: CtlT.Any; IncludeFields: CtlT.Any), NEW;
        VAR arg: ARRAY 14 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Format, arg[13]);
        CtlC.AnyVar(Style, arg[12]);
        CtlC.AnyVar(LinkToSource, arg[11]);
        CtlC.AnyVar(Connection, arg[10]);
        CtlC.AnyVar(SQLStatement, arg[9]);
        CtlC.AnyVar(SQLStatement1, arg[8]);
        CtlC.AnyVar(PasswordDocument, arg[7]);
        CtlC.AnyVar(PasswordTemplate, arg[6]);
        CtlC.AnyVar(WritePasswordDocument, arg[5]);
        CtlC.AnyVar(WritePasswordTemplate, arg[4]);
        CtlC.AnyVar(DataSource, arg[3]);
        CtlC.AnyVar(From, arg[2]);
        CtlC.AnyVar(To, arg[1]);
        CtlC.AnyVar(IncludeFields, arg[0]);
        CtlC.CallParMethod(this, 194, arg, NIL);
    END InsertDatabase;

    PROCEDURE (this: Range) AutoFormat* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 195, NIL);
    END AutoFormat;

    PROCEDURE (this: Range) CheckGrammar* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 204, NIL);
    END CheckGrammar;

    PROCEDURE (this: Range) CheckSpelling* ((* optional *) CustomDictionary: CtlT.Any; IgnoreUppercase: CtlT.Any; AlwaysSuggest: CtlT.Any; CustomDictionary2: CtlT.Any; CustomDictionary3: CtlT.Any; CustomDictionary4: CtlT.Any; CustomDictionary5: CtlT.Any; CustomDictionary6: CtlT.Any; CustomDictionary7: CtlT.Any; CustomDictionary8: CtlT.Any; CustomDictionary9: CtlT.Any; CustomDictionary10: CtlT.Any), NEW;
        VAR arg: ARRAY 12 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(CustomDictionary, arg[11]);
        CtlC.AnyVar(IgnoreUppercase, arg[10]);
        CtlC.AnyVar(AlwaysSuggest, arg[9]);
        CtlC.AnyVar(CustomDictionary2, arg[8]);
        CtlC.AnyVar(CustomDictionary3, arg[7]);
        CtlC.AnyVar(CustomDictionary4, arg[6]);
        CtlC.AnyVar(CustomDictionary5, arg[5]);
        CtlC.AnyVar(CustomDictionary6, arg[4]);
        CtlC.AnyVar(CustomDictionary7, arg[3]);
        CtlC.AnyVar(CustomDictionary8, arg[2]);
        CtlC.AnyVar(CustomDictionary9, arg[1]);
        CtlC.AnyVar(CustomDictionary10, arg[0]);
        CtlC.CallParMethod(this, 205, arg, NIL);
    END CheckSpelling;

    PROCEDURE (this: Range) GetSpellingSuggestions* ((* optional *) CustomDictionary: CtlT.Any; IgnoreUppercase: CtlT.Any; MainDictionary: CtlT.Any; SuggestionMode: CtlT.Any; CustomDictionary2: CtlT.Any; CustomDictionary3: CtlT.Any; CustomDictionary4: CtlT.Any; CustomDictionary5: CtlT.Any; CustomDictionary6: CtlT.Any; CustomDictionary7: CtlT.Any; CustomDictionary8: CtlT.Any; CustomDictionary9: CtlT.Any; CustomDictionary10: CtlT.Any): SpellingSuggestions, NEW;
        VAR arg: ARRAY 13 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(CustomDictionary, arg[12]);
        CtlC.AnyVar(IgnoreUppercase, arg[11]);
        CtlC.AnyVar(MainDictionary, arg[10]);
        CtlC.AnyVar(SuggestionMode, arg[9]);
        CtlC.AnyVar(CustomDictionary2, arg[8]);
        CtlC.AnyVar(CustomDictionary3, arg[7]);
        CtlC.AnyVar(CustomDictionary4, arg[6]);
        CtlC.AnyVar(CustomDictionary5, arg[5]);
        CtlC.AnyVar(CustomDictionary6, arg[4]);
        CtlC.AnyVar(CustomDictionary7, arg[3]);
        CtlC.AnyVar(CustomDictionary8, arg[2]);
        CtlC.AnyVar(CustomDictionary9, arg[1]);
        CtlC.AnyVar(CustomDictionary10, arg[0]);
        CtlC.CallParMethod(this, 209, arg, ret);
        RETURN ThisSpellingSuggestions(CtlC.VarAny(ret))
    END GetSpellingSuggestions;

    PROCEDURE (this: Range) InsertParagraphBefore* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 212, NIL);
    END InsertParagraphBefore;

    PROCEDURE (this: Range) NextSubdocument* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 219, NIL);
    END NextSubdocument;

    PROCEDURE (this: Range) PreviousSubdocument* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 220, NIL);
    END PreviousSubdocument;

    PROCEDURE (this: Range) ConvertHangulAndHanja* ((* optional *) ConversionsMode: CtlT.Any; FastConversion: CtlT.Any; CheckHangulEnding: CtlT.Any; EnableRecentOrdering: CtlT.Any; CustomDictionary: CtlT.Any), NEW;
        VAR arg: ARRAY 5 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(ConversionsMode, arg[4]);
        CtlC.AnyVar(FastConversion, arg[3]);
        CtlC.AnyVar(CheckHangulEnding, arg[2]);
        CtlC.AnyVar(EnableRecentOrdering, arg[1]);
        CtlC.AnyVar(CustomDictionary, arg[0]);
        CtlC.CallParMethod(this, 221, arg, NIL);
    END ConvertHangulAndHanja;


    (* ---------- ListFormat, dual, nonextensible ---------- *)

    PROCEDURE (this: ListFormat) ListLevelNumber* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 68)
    END ListLevelNumber;

    PROCEDURE (this: ListFormat) PUTListLevelNumber* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 68, p1)
    END PUTListLevelNumber;

    PROCEDURE (this: ListFormat) List* (): List, NEW;
    BEGIN
        RETURN ThisList(CtlC.GetAny(this, 69))
    END List;

    PROCEDURE (this: ListFormat) ListTemplate* (): ListTemplate, NEW;
    BEGIN
        RETURN ThisListTemplate(CtlC.GetAny(this, 70))
    END ListTemplate;

    PROCEDURE (this: ListFormat) ListValue* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 71)
    END ListValue;

    PROCEDURE (this: ListFormat) SingleList* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 72)
    END SingleList;

    PROCEDURE (this: ListFormat) SingleListTemplate* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 73)
    END SingleListTemplate;

    PROCEDURE (this: ListFormat) ListType* (): WdListType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 74)
    END ListType;

    PROCEDURE (this: ListFormat) ListString* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 75)
    END ListString;

    PROCEDURE (this: ListFormat) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: ListFormat) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: ListFormat) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: ListFormat) CanContinuePreviousList* (listTemplate: ListTemplate): WdContinue, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.ObjVar(listTemplate, arg[0]);
        CtlC.CallParMethod(this, 184, arg, ret);
        RETURN CtlC.VarInt(ret)
    END CanContinuePreviousList;

    PROCEDURE (this: ListFormat) RemoveNumbers* ((* optional *) NumberType: CtlT.Any), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(NumberType, arg[0]);
        CtlC.CallParMethod(this, 185, arg, NIL);
    END RemoveNumbers;

    PROCEDURE (this: ListFormat) ConvertNumbersToText* ((* optional *) NumberType: CtlT.Any), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(NumberType, arg[0]);
        CtlC.CallParMethod(this, 186, arg, NIL);
    END ConvertNumbersToText;

    PROCEDURE (this: ListFormat) CountNumberedItems* ((* optional *) NumberType: CtlT.Any; Level: CtlT.Any): INTEGER, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(NumberType, arg[1]);
        CtlC.AnyVar(Level, arg[0]);
        CtlC.CallParMethod(this, 187, arg, ret);
        RETURN CtlC.VarInt(ret)
    END CountNumberedItems;

    PROCEDURE (this: ListFormat) ApplyBulletDefault* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 188, NIL);
    END ApplyBulletDefault;

    PROCEDURE (this: ListFormat) ApplyNumberDefault* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 189, NIL);
    END ApplyNumberDefault;

    PROCEDURE (this: ListFormat) ApplyOutlineNumberDefault* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 190, NIL);
    END ApplyOutlineNumberDefault;

    PROCEDURE (this: ListFormat) ApplyListTemplate* (listTemplate: ListTemplate; (* optional *) ContinuePreviousList: CtlT.Any; ApplyTo: CtlT.Any), NEW;
        VAR arg: ARRAY 3 OF CtlT.Variant;
    BEGIN
        CtlC.ObjVar(listTemplate, arg[2]);
        CtlC.AnyVar(ContinuePreviousList, arg[1]);
        CtlC.AnyVar(ApplyTo, arg[0]);
        CtlC.CallParMethod(this, 191, arg, NIL);
    END ApplyListTemplate;

    PROCEDURE (this: ListFormat) ListOutdent* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 210, NIL);
    END ListOutdent;

    PROCEDURE (this: ListFormat) ListIndent* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 211, NIL);
    END ListIndent;


    (* ---------- Find, dual, nonextensible ---------- *)

    PROCEDURE (this: Find) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Find) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Find) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Find) Forward* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 10)
    END Forward;

    PROCEDURE (this: Find) PUTForward* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 10, p1)
    END PUTForward;

    PROCEDURE (this: Find) Font* (): Font, NEW;
    BEGIN
        RETURN This_Font(CtlC.GetAny(this, 11))
    END Font;

    PROCEDURE (this: Find) PUTFont* (p1: Font), NEW;
    BEGIN
        CtlC.PutObj(this, 11, p1)
    END PUTFont;

    PROCEDURE (this: Find) Found* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 12)
    END Found;

    PROCEDURE (this: Find) MatchAllWordForms* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 13)
    END MatchAllWordForms;

    PROCEDURE (this: Find) PUTMatchAllWordForms* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 13, p1)
    END PUTMatchAllWordForms;

    PROCEDURE (this: Find) MatchCase* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 14)
    END MatchCase;

    PROCEDURE (this: Find) PUTMatchCase* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 14, p1)
    END PUTMatchCase;

    PROCEDURE (this: Find) MatchWildcards* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 15)
    END MatchWildcards;

    PROCEDURE (this: Find) PUTMatchWildcards* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 15, p1)
    END PUTMatchWildcards;

    PROCEDURE (this: Find) MatchSoundsLike* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 16)
    END MatchSoundsLike;

    PROCEDURE (this: Find) PUTMatchSoundsLike* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 16, p1)
    END PUTMatchSoundsLike;

    PROCEDURE (this: Find) MatchWholeWord* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 17)
    END MatchWholeWord;

    PROCEDURE (this: Find) PUTMatchWholeWord* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 17, p1)
    END PUTMatchWholeWord;

    PROCEDURE (this: Find) MatchFuzzy* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 40)
    END MatchFuzzy;

    PROCEDURE (this: Find) PUTMatchFuzzy* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 40, p1)
    END PUTMatchFuzzy;

    PROCEDURE (this: Find) MatchByte* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 41)
    END MatchByte;

    PROCEDURE (this: Find) PUTMatchByte* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 41, p1)
    END PUTMatchByte;

    PROCEDURE (this: Find) ParagraphFormat* (): ParagraphFormat, NEW;
    BEGIN
        RETURN This_ParagraphFormat(CtlC.GetAny(this, 18))
    END ParagraphFormat;

    PROCEDURE (this: Find) PUTParagraphFormat* (p1: ParagraphFormat), NEW;
    BEGIN
        CtlC.PutObj(this, 18, p1)
    END PUTParagraphFormat;

    PROCEDURE (this: Find) Style* (): CtlT.Any, NEW;
    BEGIN
        RETURN CtlC.GetAny(this, 19)
    END Style;

    PROCEDURE (this: Find) PUTStyle* (p1: CtlT.Any), NEW;
    BEGIN
        CtlC.PutAny(this, 19, p1)
    END PUTStyle;

    PROCEDURE (this: Find) Text* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 22)
    END Text;

    PROCEDURE (this: Find) PUTText* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 22, p1)
    END PUTText;

    PROCEDURE (this: Find) LanguageID* (): WdLanguageID, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 23)
    END LanguageID;

    PROCEDURE (this: Find) PUTLanguageID* (p1: WdLanguageID), NEW;
    BEGIN
        CtlC.PutInt(this, 23, p1)
    END PUTLanguageID;

    PROCEDURE (this: Find) Highlight* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 24)
    END Highlight;

    PROCEDURE (this: Find) PUTHighlight* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 24, p1)
    END PUTHighlight;

    PROCEDURE (this: Find) Replacement* (): Replacement, NEW;
    BEGIN
        RETURN ThisReplacement(CtlC.GetAny(this, 25))
    END Replacement;

    PROCEDURE (this: Find) Frame* (): Frame, NEW;
    BEGIN
        RETURN ThisFrame(CtlC.GetAny(this, 26))
    END Frame;

    PROCEDURE (this: Find) Wrap* (): WdFindWrap, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 27)
    END Wrap;

    PROCEDURE (this: Find) PUTWrap* (p1: WdFindWrap), NEW;
    BEGIN
        CtlC.PutInt(this, 27, p1)
    END PUTWrap;

    PROCEDURE (this: Find) Format* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 28)
    END Format;

    PROCEDURE (this: Find) PUTFormat* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 28, p1)
    END PUTFormat;

    PROCEDURE (this: Find) LanguageIDFarEast* (): WdLanguageID, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 29)
    END LanguageIDFarEast;

    PROCEDURE (this: Find) PUTLanguageIDFarEast* (p1: WdLanguageID), NEW;
    BEGIN
        CtlC.PutInt(this, 29, p1)
    END PUTLanguageIDFarEast;

    PROCEDURE (this: Find) LanguageIDOther* (): WdLanguageID, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 60)
    END LanguageIDOther;

    PROCEDURE (this: Find) PUTLanguageIDOther* (p1: WdLanguageID), NEW;
    BEGIN
        CtlC.PutInt(this, 60, p1)
    END PUTLanguageIDOther;

    PROCEDURE (this: Find) CorrectHangulEndings* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 61)
    END CorrectHangulEndings;

    PROCEDURE (this: Find) PUTCorrectHangulEndings* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 61, p1)
    END PUTCorrectHangulEndings;

    PROCEDURE (this: Find) Execute* ((* optional *) FindText: CtlT.Any; MatchCase: CtlT.Any; MatchWholeWord: CtlT.Any; MatchWildcards: CtlT.Any; MatchSoundsLike: CtlT.Any; MatchAllWordForms: CtlT.Any; Forward: CtlT.Any; Wrap: CtlT.Any; Format: CtlT.Any; ReplaceWith: CtlT.Any; Replace: CtlT.Any): BOOLEAN, NEW;
        VAR arg: ARRAY 11 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(FindText, arg[10]);
        CtlC.AnyVar(MatchCase, arg[9]);
        CtlC.AnyVar(MatchWholeWord, arg[8]);
        CtlC.AnyVar(MatchWildcards, arg[7]);
        CtlC.AnyVar(MatchSoundsLike, arg[6]);
        CtlC.AnyVar(MatchAllWordForms, arg[5]);
        CtlC.AnyVar(Forward, arg[4]);
        CtlC.AnyVar(Wrap, arg[3]);
        CtlC.AnyVar(Format, arg[2]);
        CtlC.AnyVar(ReplaceWith, arg[1]);
        CtlC.AnyVar(Replace, arg[0]);
        CtlC.CallParMethod(this, 30, arg, ret);
        RETURN CtlC.VarBool(ret)
    END Execute;

    PROCEDURE (this: Find) ClearFormatting* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 31, NIL);
    END ClearFormatting;

    PROCEDURE (this: Find) SetAllFuzzyOptions* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 32, NIL);
    END SetAllFuzzyOptions;

    PROCEDURE (this: Find) ClearAllFuzzyOptions* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 33, NIL);
    END ClearAllFuzzyOptions;


    (* ---------- Replacement, dual, nonextensible ---------- *)

    PROCEDURE (this: Replacement) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Replacement) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Replacement) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Replacement) Font* (): Font, NEW;
    BEGIN
        RETURN This_Font(CtlC.GetAny(this, 10))
    END Font;

    PROCEDURE (this: Replacement) PUTFont* (p1: Font), NEW;
    BEGIN
        CtlC.PutObj(this, 10, p1)
    END PUTFont;

    PROCEDURE (this: Replacement) ParagraphFormat* (): ParagraphFormat, NEW;
    BEGIN
        RETURN This_ParagraphFormat(CtlC.GetAny(this, 11))
    END ParagraphFormat;

    PROCEDURE (this: Replacement) PUTParagraphFormat* (p1: ParagraphFormat), NEW;
    BEGIN
        CtlC.PutObj(this, 11, p1)
    END PUTParagraphFormat;

    PROCEDURE (this: Replacement) Style* (): CtlT.Any, NEW;
    BEGIN
        RETURN CtlC.GetAny(this, 12)
    END Style;

    PROCEDURE (this: Replacement) PUTStyle* (p1: CtlT.Any), NEW;
    BEGIN
        CtlC.PutAny(this, 12, p1)
    END PUTStyle;

    PROCEDURE (this: Replacement) Text* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 15)
    END Text;

    PROCEDURE (this: Replacement) PUTText* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 15, p1)
    END PUTText;

    PROCEDURE (this: Replacement) LanguageID* (): WdLanguageID, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 16)
    END LanguageID;

    PROCEDURE (this: Replacement) PUTLanguageID* (p1: WdLanguageID), NEW;
    BEGIN
        CtlC.PutInt(this, 16, p1)
    END PUTLanguageID;

    PROCEDURE (this: Replacement) Highlight* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 17)
    END Highlight;

    PROCEDURE (this: Replacement) PUTHighlight* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 17, p1)
    END PUTHighlight;

    PROCEDURE (this: Replacement) Frame* (): Frame, NEW;
    BEGIN
        RETURN ThisFrame(CtlC.GetAny(this, 18))
    END Frame;

    PROCEDURE (this: Replacement) LanguageIDFarEast* (): WdLanguageID, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 19)
    END LanguageIDFarEast;

    PROCEDURE (this: Replacement) PUTLanguageIDFarEast* (p1: WdLanguageID), NEW;
    BEGIN
        CtlC.PutInt(this, 19, p1)
    END PUTLanguageIDFarEast;

    PROCEDURE (this: Replacement) ClearFormatting* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 20, NIL);
    END ClearFormatting;


    (* ---------- Characters, dual, nonextensible ---------- *)

    PROCEDURE (this: Characters) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: Characters) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Count;

    PROCEDURE (this: Characters) First* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 3))
    END First;

    PROCEDURE (this: Characters) Last* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 4))
    END Last;

    PROCEDURE (this: Characters) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Characters) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Characters) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Characters) Item* (Index: INTEGER): Range, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisRange(CtlC.VarAny(ret))
    END Item;


    (* ---------- Words, dual, nonextensible ---------- *)

    PROCEDURE (this: Words) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: Words) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Count;

    PROCEDURE (this: Words) First* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 3))
    END First;

    PROCEDURE (this: Words) Last* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 4))
    END Last;

    PROCEDURE (this: Words) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Words) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Words) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Words) Item* (Index: INTEGER): Range, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisRange(CtlC.VarAny(ret))
    END Item;


    (* ---------- Sentences, dual, nonextensible ---------- *)

    PROCEDURE (this: Sentences) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: Sentences) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Count;

    PROCEDURE (this: Sentences) First* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 3))
    END First;

    PROCEDURE (this: Sentences) Last* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 4))
    END Last;

    PROCEDURE (this: Sentences) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Sentences) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Sentences) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Sentences) Item* (Index: INTEGER): Range, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisRange(CtlC.VarAny(ret))
    END Item;


    (* ---------- Sections, dual, nonextensible ---------- *)

    PROCEDURE (this: Sections) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: Sections) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Count;

    PROCEDURE (this: Sections) First* (): Section, NEW;
    BEGIN
        RETURN ThisSection(CtlC.GetAny(this, 3))
    END First;

    PROCEDURE (this: Sections) Last* (): Section, NEW;
    BEGIN
        RETURN ThisSection(CtlC.GetAny(this, 4))
    END Last;

    PROCEDURE (this: Sections) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Sections) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Sections) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Sections) PageSetup* (): PageSetup, NEW;
    BEGIN
        RETURN ThisPageSetup(CtlC.GetAny(this, 1101))
    END PageSetup;

    PROCEDURE (this: Sections) PUTPageSetup* (p1: PageSetup), NEW;
    BEGIN
        CtlC.PutObj(this, 1101, p1)
    END PUTPageSetup;

    PROCEDURE (this: Sections) Item* (Index: INTEGER): Section, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisSection(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: Sections) Add* ((* optional *) Range: CtlT.Any; Start: CtlT.Any): Section, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Range, arg[1]);
        CtlC.AnyVar(Start, arg[0]);
        CtlC.CallParMethod(this, 5, arg, ret);
        RETURN ThisSection(CtlC.VarAny(ret))
    END Add;


    (* ---------- Section, dual, nonextensible ---------- *)

    PROCEDURE (this: Section) Range* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 0))
    END Range;

    PROCEDURE (this: Section) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Section) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Section) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Section) PageSetup* (): PageSetup, NEW;
    BEGIN
        RETURN ThisPageSetup(CtlC.GetAny(this, 1101))
    END PageSetup;

    PROCEDURE (this: Section) PUTPageSetup* (p1: PageSetup), NEW;
    BEGIN
        CtlC.PutObj(this, 1101, p1)
    END PUTPageSetup;

    PROCEDURE (this: Section) Headers* (): HeadersFooters, NEW;
    BEGIN
        RETURN ThisHeadersFooters(CtlC.GetAny(this, 121))
    END Headers;

    PROCEDURE (this: Section) Footers* (): HeadersFooters, NEW;
    BEGIN
        RETURN ThisHeadersFooters(CtlC.GetAny(this, 122))
    END Footers;

    PROCEDURE (this: Section) ProtectedForForms* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 123)
    END ProtectedForForms;

    PROCEDURE (this: Section) PUTProtectedForForms* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 123, p1)
    END PUTProtectedForForms;

    PROCEDURE (this: Section) Index* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 124)
    END Index;

    PROCEDURE (this: Section) Borders* (): Borders, NEW;
    BEGIN
        RETURN ThisBorders(CtlC.GetAny(this, 1100))
    END Borders;

    PROCEDURE (this: Section) PUTBorders* (p1: Borders), NEW;
    BEGIN
        CtlC.PutObj(this, 1100, p1)
    END PUTBorders;


    (* ---------- Paragraphs, dual, nonextensible ---------- *)

    PROCEDURE (this: Paragraphs) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: Paragraphs) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Count;

    PROCEDURE (this: Paragraphs) First* (): Paragraph, NEW;
    BEGIN
        RETURN ThisParagraph(CtlC.GetAny(this, 3))
    END First;

    PROCEDURE (this: Paragraphs) Last* (): Paragraph, NEW;
    BEGIN
        RETURN ThisParagraph(CtlC.GetAny(this, 4))
    END Last;

    PROCEDURE (this: Paragraphs) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Paragraphs) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Paragraphs) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Paragraphs) Format* (): ParagraphFormat, NEW;
    BEGIN
        RETURN This_ParagraphFormat(CtlC.GetAny(this, 1102))
    END Format;

    PROCEDURE (this: Paragraphs) PUTFormat* (p1: ParagraphFormat), NEW;
    BEGIN
        CtlC.PutObj(this, 1102, p1)
    END PUTFormat;

    PROCEDURE (this: Paragraphs) TabStops* (): TabStops, NEW;
    BEGIN
        RETURN ThisTabStops(CtlC.GetAny(this, 1103))
    END TabStops;

    PROCEDURE (this: Paragraphs) PUTTabStops* (p1: TabStops), NEW;
    BEGIN
        CtlC.PutObj(this, 1103, p1)
    END PUTTabStops;

    PROCEDURE (this: Paragraphs) Borders* (): Borders, NEW;
    BEGIN
        RETURN ThisBorders(CtlC.GetAny(this, 1100))
    END Borders;

    PROCEDURE (this: Paragraphs) PUTBorders* (p1: Borders), NEW;
    BEGIN
        CtlC.PutObj(this, 1100, p1)
    END PUTBorders;

    PROCEDURE (this: Paragraphs) Style* (): CtlT.Any, NEW;
    BEGIN
        RETURN CtlC.GetAny(this, 100)
    END Style;

    PROCEDURE (this: Paragraphs) PUTStyle* (p1: CtlT.Any), NEW;
    BEGIN
        CtlC.PutAny(this, 100, p1)
    END PUTStyle;

    PROCEDURE (this: Paragraphs) Alignment* (): WdParagraphAlignment, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 101)
    END Alignment;

    PROCEDURE (this: Paragraphs) PUTAlignment* (p1: WdParagraphAlignment), NEW;
    BEGIN
        CtlC.PutInt(this, 101, p1)
    END PUTAlignment;

    PROCEDURE (this: Paragraphs) KeepTogether* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 102)
    END KeepTogether;

    PROCEDURE (this: Paragraphs) PUTKeepTogether* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 102, p1)
    END PUTKeepTogether;

    PROCEDURE (this: Paragraphs) KeepWithNext* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 103)
    END KeepWithNext;

    PROCEDURE (this: Paragraphs) PUTKeepWithNext* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 103, p1)
    END PUTKeepWithNext;

    PROCEDURE (this: Paragraphs) PageBreakBefore* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 104)
    END PageBreakBefore;

    PROCEDURE (this: Paragraphs) PUTPageBreakBefore* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 104, p1)
    END PUTPageBreakBefore;

    PROCEDURE (this: Paragraphs) NoLineNumber* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 105)
    END NoLineNumber;

    PROCEDURE (this: Paragraphs) PUTNoLineNumber* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 105, p1)
    END PUTNoLineNumber;

    PROCEDURE (this: Paragraphs) RightIndent* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 106)
    END RightIndent;

    PROCEDURE (this: Paragraphs) PUTRightIndent* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 106, p1)
    END PUTRightIndent;

    PROCEDURE (this: Paragraphs) LeftIndent* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 107)
    END LeftIndent;

    PROCEDURE (this: Paragraphs) PUTLeftIndent* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 107, p1)
    END PUTLeftIndent;

    PROCEDURE (this: Paragraphs) FirstLineIndent* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 108)
    END FirstLineIndent;

    PROCEDURE (this: Paragraphs) PUTFirstLineIndent* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 108, p1)
    END PUTFirstLineIndent;

    PROCEDURE (this: Paragraphs) LineSpacing* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 109)
    END LineSpacing;

    PROCEDURE (this: Paragraphs) PUTLineSpacing* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 109, p1)
    END PUTLineSpacing;

    PROCEDURE (this: Paragraphs) LineSpacingRule* (): WdLineSpacing, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 110)
    END LineSpacingRule;

    PROCEDURE (this: Paragraphs) PUTLineSpacingRule* (p1: WdLineSpacing), NEW;
    BEGIN
        CtlC.PutInt(this, 110, p1)
    END PUTLineSpacingRule;

    PROCEDURE (this: Paragraphs) SpaceBefore* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 111)
    END SpaceBefore;

    PROCEDURE (this: Paragraphs) PUTSpaceBefore* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 111, p1)
    END PUTSpaceBefore;

    PROCEDURE (this: Paragraphs) SpaceAfter* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 112)
    END SpaceAfter;

    PROCEDURE (this: Paragraphs) PUTSpaceAfter* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 112, p1)
    END PUTSpaceAfter;

    PROCEDURE (this: Paragraphs) Hyphenation* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 113)
    END Hyphenation;

    PROCEDURE (this: Paragraphs) PUTHyphenation* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 113, p1)
    END PUTHyphenation;

    PROCEDURE (this: Paragraphs) WidowControl* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 114)
    END WidowControl;

    PROCEDURE (this: Paragraphs) PUTWidowControl* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 114, p1)
    END PUTWidowControl;

    PROCEDURE (this: Paragraphs) Shading* (): Shading, NEW;
    BEGIN
        RETURN ThisShading(CtlC.GetAny(this, 116))
    END Shading;

    PROCEDURE (this: Paragraphs) FarEastLineBreakControl* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 117)
    END FarEastLineBreakControl;

    PROCEDURE (this: Paragraphs) PUTFarEastLineBreakControl* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 117, p1)
    END PUTFarEastLineBreakControl;

    PROCEDURE (this: Paragraphs) WordWrap* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 118)
    END WordWrap;

    PROCEDURE (this: Paragraphs) PUTWordWrap* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 118, p1)
    END PUTWordWrap;

    PROCEDURE (this: Paragraphs) HangingPunctuation* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 119)
    END HangingPunctuation;

    PROCEDURE (this: Paragraphs) PUTHangingPunctuation* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 119, p1)
    END PUTHangingPunctuation;

    PROCEDURE (this: Paragraphs) HalfWidthPunctuationOnTopOfLine* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 120)
    END HalfWidthPunctuationOnTopOfLine;

    PROCEDURE (this: Paragraphs) PUTHalfWidthPunctuationOnTopOfLine* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 120, p1)
    END PUTHalfWidthPunctuationOnTopOfLine;

    PROCEDURE (this: Paragraphs) AddSpaceBetweenFarEastAndAlpha* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 121)
    END AddSpaceBetweenFarEastAndAlpha;

    PROCEDURE (this: Paragraphs) PUTAddSpaceBetweenFarEastAndAlpha* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 121, p1)
    END PUTAddSpaceBetweenFarEastAndAlpha;

    PROCEDURE (this: Paragraphs) AddSpaceBetweenFarEastAndDigit* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 122)
    END AddSpaceBetweenFarEastAndDigit;

    PROCEDURE (this: Paragraphs) PUTAddSpaceBetweenFarEastAndDigit* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 122, p1)
    END PUTAddSpaceBetweenFarEastAndDigit;

    PROCEDURE (this: Paragraphs) BaseLineAlignment* (): WdBaselineAlignment, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 123)
    END BaseLineAlignment;

    PROCEDURE (this: Paragraphs) PUTBaseLineAlignment* (p1: WdBaselineAlignment), NEW;
    BEGIN
        CtlC.PutInt(this, 123, p1)
    END PUTBaseLineAlignment;

    PROCEDURE (this: Paragraphs) AutoAdjustRightIndent* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 124)
    END AutoAdjustRightIndent;

    PROCEDURE (this: Paragraphs) PUTAutoAdjustRightIndent* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 124, p1)
    END PUTAutoAdjustRightIndent;

    PROCEDURE (this: Paragraphs) DisableLineHeightGrid* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 125)
    END DisableLineHeightGrid;

    PROCEDURE (this: Paragraphs) PUTDisableLineHeightGrid* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 125, p1)
    END PUTDisableLineHeightGrid;

    PROCEDURE (this: Paragraphs) OutlineLevel* (): WdOutlineLevel, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 202)
    END OutlineLevel;

    PROCEDURE (this: Paragraphs) PUTOutlineLevel* (p1: WdOutlineLevel), NEW;
    BEGIN
        CtlC.PutInt(this, 202, p1)
    END PUTOutlineLevel;

    PROCEDURE (this: Paragraphs) Item* (Index: INTEGER): Paragraph, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisParagraph(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: Paragraphs) Add* ((* optional *) Range: CtlT.Any): Paragraph, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Range, arg[0]);
        CtlC.CallParMethod(this, 5, arg, ret);
        RETURN ThisParagraph(CtlC.VarAny(ret))
    END Add;

    PROCEDURE (this: Paragraphs) CloseUp* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 301, NIL);
    END CloseUp;

    PROCEDURE (this: Paragraphs) OpenUp* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 302, NIL);
    END OpenUp;

    PROCEDURE (this: Paragraphs) OpenOrCloseUp* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 303, NIL);
    END OpenOrCloseUp;

    PROCEDURE (this: Paragraphs) TabHangingIndent* (Count: SHORTINT), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.SIntVar(Count, arg[0]);
        CtlC.CallParMethod(this, 304, arg, NIL);
    END TabHangingIndent;

    PROCEDURE (this: Paragraphs) TabIndent* (Count: SHORTINT), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.SIntVar(Count, arg[0]);
        CtlC.CallParMethod(this, 306, arg, NIL);
    END TabIndent;

    PROCEDURE (this: Paragraphs) Reset* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 312, NIL);
    END Reset;

    PROCEDURE (this: Paragraphs) Space1* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 313, NIL);
    END Space1;

    PROCEDURE (this: Paragraphs) Space15* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 314, NIL);
    END Space15;

    PROCEDURE (this: Paragraphs) Space2* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 315, NIL);
    END Space2;

    PROCEDURE (this: Paragraphs) IndentCharWidth* (Count: SHORTINT), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.SIntVar(Count, arg[0]);
        CtlC.CallParMethod(this, 320, arg, NIL);
    END IndentCharWidth;

    PROCEDURE (this: Paragraphs) IndentFirstLineCharWidth* (Count: SHORTINT), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.SIntVar(Count, arg[0]);
        CtlC.CallParMethod(this, 322, arg, NIL);
    END IndentFirstLineCharWidth;

    PROCEDURE (this: Paragraphs) OutlinePromote* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 324, NIL);
    END OutlinePromote;

    PROCEDURE (this: Paragraphs) OutlineDemote* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 325, NIL);
    END OutlineDemote;

    PROCEDURE (this: Paragraphs) OutlineDemoteToBody* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 326, NIL);
    END OutlineDemoteToBody;

    PROCEDURE (this: Paragraphs) Indent* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 333, NIL);
    END Indent;

    PROCEDURE (this: Paragraphs) Outdent* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 334, NIL);
    END Outdent;


    (* ---------- Paragraph, dual, nonextensible ---------- *)

    PROCEDURE (this: Paragraph) Range* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 0))
    END Range;

    PROCEDURE (this: Paragraph) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Paragraph) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Paragraph) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Paragraph) Format* (): ParagraphFormat, NEW;
    BEGIN
        RETURN This_ParagraphFormat(CtlC.GetAny(this, 1102))
    END Format;

    PROCEDURE (this: Paragraph) PUTFormat* (p1: ParagraphFormat), NEW;
    BEGIN
        CtlC.PutObj(this, 1102, p1)
    END PUTFormat;

    PROCEDURE (this: Paragraph) TabStops* (): TabStops, NEW;
    BEGIN
        RETURN ThisTabStops(CtlC.GetAny(this, 1103))
    END TabStops;

    PROCEDURE (this: Paragraph) PUTTabStops* (p1: TabStops), NEW;
    BEGIN
        CtlC.PutObj(this, 1103, p1)
    END PUTTabStops;

    PROCEDURE (this: Paragraph) Borders* (): Borders, NEW;
    BEGIN
        RETURN ThisBorders(CtlC.GetAny(this, 1100))
    END Borders;

    PROCEDURE (this: Paragraph) PUTBorders* (p1: Borders), NEW;
    BEGIN
        CtlC.PutObj(this, 1100, p1)
    END PUTBorders;

    PROCEDURE (this: Paragraph) DropCap* (): DropCap, NEW;
    BEGIN
        RETURN ThisDropCap(CtlC.GetAny(this, 13))
    END DropCap;

    PROCEDURE (this: Paragraph) Style* (): CtlT.Any, NEW;
    BEGIN
        RETURN CtlC.GetAny(this, 100)
    END Style;

    PROCEDURE (this: Paragraph) PUTStyle* (p1: CtlT.Any), NEW;
    BEGIN
        CtlC.PutAny(this, 100, p1)
    END PUTStyle;

    PROCEDURE (this: Paragraph) Alignment* (): WdParagraphAlignment, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 101)
    END Alignment;

    PROCEDURE (this: Paragraph) PUTAlignment* (p1: WdParagraphAlignment), NEW;
    BEGIN
        CtlC.PutInt(this, 101, p1)
    END PUTAlignment;

    PROCEDURE (this: Paragraph) KeepTogether* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 102)
    END KeepTogether;

    PROCEDURE (this: Paragraph) PUTKeepTogether* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 102, p1)
    END PUTKeepTogether;

    PROCEDURE (this: Paragraph) KeepWithNext* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 103)
    END KeepWithNext;

    PROCEDURE (this: Paragraph) PUTKeepWithNext* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 103, p1)
    END PUTKeepWithNext;

    PROCEDURE (this: Paragraph) PageBreakBefore* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 104)
    END PageBreakBefore;

    PROCEDURE (this: Paragraph) PUTPageBreakBefore* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 104, p1)
    END PUTPageBreakBefore;

    PROCEDURE (this: Paragraph) NoLineNumber* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 105)
    END NoLineNumber;

    PROCEDURE (this: Paragraph) PUTNoLineNumber* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 105, p1)
    END PUTNoLineNumber;

    PROCEDURE (this: Paragraph) RightIndent* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 106)
    END RightIndent;

    PROCEDURE (this: Paragraph) PUTRightIndent* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 106, p1)
    END PUTRightIndent;

    PROCEDURE (this: Paragraph) LeftIndent* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 107)
    END LeftIndent;

    PROCEDURE (this: Paragraph) PUTLeftIndent* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 107, p1)
    END PUTLeftIndent;

    PROCEDURE (this: Paragraph) FirstLineIndent* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 108)
    END FirstLineIndent;

    PROCEDURE (this: Paragraph) PUTFirstLineIndent* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 108, p1)
    END PUTFirstLineIndent;

    PROCEDURE (this: Paragraph) LineSpacing* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 109)
    END LineSpacing;

    PROCEDURE (this: Paragraph) PUTLineSpacing* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 109, p1)
    END PUTLineSpacing;

    PROCEDURE (this: Paragraph) LineSpacingRule* (): WdLineSpacing, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 110)
    END LineSpacingRule;

    PROCEDURE (this: Paragraph) PUTLineSpacingRule* (p1: WdLineSpacing), NEW;
    BEGIN
        CtlC.PutInt(this, 110, p1)
    END PUTLineSpacingRule;

    PROCEDURE (this: Paragraph) SpaceBefore* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 111)
    END SpaceBefore;

    PROCEDURE (this: Paragraph) PUTSpaceBefore* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 111, p1)
    END PUTSpaceBefore;

    PROCEDURE (this: Paragraph) SpaceAfter* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 112)
    END SpaceAfter;

    PROCEDURE (this: Paragraph) PUTSpaceAfter* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 112, p1)
    END PUTSpaceAfter;

    PROCEDURE (this: Paragraph) Hyphenation* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 113)
    END Hyphenation;

    PROCEDURE (this: Paragraph) PUTHyphenation* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 113, p1)
    END PUTHyphenation;

    PROCEDURE (this: Paragraph) WidowControl* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 114)
    END WidowControl;

    PROCEDURE (this: Paragraph) PUTWidowControl* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 114, p1)
    END PUTWidowControl;

    PROCEDURE (this: Paragraph) Shading* (): Shading, NEW;
    BEGIN
        RETURN ThisShading(CtlC.GetAny(this, 116))
    END Shading;

    PROCEDURE (this: Paragraph) FarEastLineBreakControl* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 117)
    END FarEastLineBreakControl;

    PROCEDURE (this: Paragraph) PUTFarEastLineBreakControl* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 117, p1)
    END PUTFarEastLineBreakControl;

    PROCEDURE (this: Paragraph) WordWrap* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 118)
    END WordWrap;

    PROCEDURE (this: Paragraph) PUTWordWrap* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 118, p1)
    END PUTWordWrap;

    PROCEDURE (this: Paragraph) HangingPunctuation* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 119)
    END HangingPunctuation;

    PROCEDURE (this: Paragraph) PUTHangingPunctuation* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 119, p1)
    END PUTHangingPunctuation;

    PROCEDURE (this: Paragraph) HalfWidthPunctuationOnTopOfLine* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 120)
    END HalfWidthPunctuationOnTopOfLine;

    PROCEDURE (this: Paragraph) PUTHalfWidthPunctuationOnTopOfLine* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 120, p1)
    END PUTHalfWidthPunctuationOnTopOfLine;

    PROCEDURE (this: Paragraph) AddSpaceBetweenFarEastAndAlpha* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 121)
    END AddSpaceBetweenFarEastAndAlpha;

    PROCEDURE (this: Paragraph) PUTAddSpaceBetweenFarEastAndAlpha* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 121, p1)
    END PUTAddSpaceBetweenFarEastAndAlpha;

    PROCEDURE (this: Paragraph) AddSpaceBetweenFarEastAndDigit* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 122)
    END AddSpaceBetweenFarEastAndDigit;

    PROCEDURE (this: Paragraph) PUTAddSpaceBetweenFarEastAndDigit* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 122, p1)
    END PUTAddSpaceBetweenFarEastAndDigit;

    PROCEDURE (this: Paragraph) BaseLineAlignment* (): WdBaselineAlignment, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 123)
    END BaseLineAlignment;

    PROCEDURE (this: Paragraph) PUTBaseLineAlignment* (p1: WdBaselineAlignment), NEW;
    BEGIN
        CtlC.PutInt(this, 123, p1)
    END PUTBaseLineAlignment;

    PROCEDURE (this: Paragraph) AutoAdjustRightIndent* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 124)
    END AutoAdjustRightIndent;

    PROCEDURE (this: Paragraph) PUTAutoAdjustRightIndent* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 124, p1)
    END PUTAutoAdjustRightIndent;

    PROCEDURE (this: Paragraph) DisableLineHeightGrid* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 125)
    END DisableLineHeightGrid;

    PROCEDURE (this: Paragraph) PUTDisableLineHeightGrid* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 125, p1)
    END PUTDisableLineHeightGrid;

    PROCEDURE (this: Paragraph) OutlineLevel* (): WdOutlineLevel, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 202)
    END OutlineLevel;

    PROCEDURE (this: Paragraph) PUTOutlineLevel* (p1: WdOutlineLevel), NEW;
    BEGIN
        CtlC.PutInt(this, 202, p1)
    END PUTOutlineLevel;

    PROCEDURE (this: Paragraph) CloseUp* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 301, NIL);
    END CloseUp;

    PROCEDURE (this: Paragraph) OpenUp* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 302, NIL);
    END OpenUp;

    PROCEDURE (this: Paragraph) OpenOrCloseUp* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 303, NIL);
    END OpenOrCloseUp;

    PROCEDURE (this: Paragraph) TabHangingIndent* (Count: SHORTINT), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.SIntVar(Count, arg[0]);
        CtlC.CallParMethod(this, 304, arg, NIL);
    END TabHangingIndent;

    PROCEDURE (this: Paragraph) TabIndent* (Count: SHORTINT), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.SIntVar(Count, arg[0]);
        CtlC.CallParMethod(this, 306, arg, NIL);
    END TabIndent;

    PROCEDURE (this: Paragraph) Reset* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 312, NIL);
    END Reset;

    PROCEDURE (this: Paragraph) Space1* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 313, NIL);
    END Space1;

    PROCEDURE (this: Paragraph) Space15* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 314, NIL);
    END Space15;

    PROCEDURE (this: Paragraph) Space2* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 315, NIL);
    END Space2;

    PROCEDURE (this: Paragraph) IndentCharWidth* (Count: SHORTINT), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.SIntVar(Count, arg[0]);
        CtlC.CallParMethod(this, 320, arg, NIL);
    END IndentCharWidth;

    PROCEDURE (this: Paragraph) IndentFirstLineCharWidth* (Count: SHORTINT), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.SIntVar(Count, arg[0]);
        CtlC.CallParMethod(this, 322, arg, NIL);
    END IndentFirstLineCharWidth;

    PROCEDURE (this: Paragraph) Next* ((* optional *) Count: CtlT.Any): Paragraph, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Count, arg[0]);
        CtlC.CallParMethod(this, 324, arg, ret);
        RETURN ThisParagraph(CtlC.VarAny(ret))
    END Next;

    PROCEDURE (this: Paragraph) Previous* ((* optional *) Count: CtlT.Any): Paragraph, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Count, arg[0]);
        CtlC.CallParMethod(this, 325, arg, ret);
        RETURN ThisParagraph(CtlC.VarAny(ret))
    END Previous;

    PROCEDURE (this: Paragraph) OutlinePromote* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 326, NIL);
    END OutlinePromote;

    PROCEDURE (this: Paragraph) OutlineDemote* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 327, NIL);
    END OutlineDemote;

    PROCEDURE (this: Paragraph) OutlineDemoteToBody* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 328, NIL);
    END OutlineDemoteToBody;

    PROCEDURE (this: Paragraph) Indent* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 333, NIL);
    END Indent;

    PROCEDURE (this: Paragraph) Outdent* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 334, NIL);
    END Outdent;


    (* ---------- DropCap, dual, nonextensible ---------- *)

    PROCEDURE (this: DropCap) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: DropCap) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: DropCap) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: DropCap) Position* (): WdDropPosition, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 10)
    END Position;

    PROCEDURE (this: DropCap) PUTPosition* (p1: WdDropPosition), NEW;
    BEGIN
        CtlC.PutInt(this, 10, p1)
    END PUTPosition;

    PROCEDURE (this: DropCap) FontName* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 11)
    END FontName;

    PROCEDURE (this: DropCap) PUTFontName* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 11, p1)
    END PUTFontName;

    PROCEDURE (this: DropCap) LinesToDrop* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 12)
    END LinesToDrop;

    PROCEDURE (this: DropCap) PUTLinesToDrop* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 12, p1)
    END PUTLinesToDrop;

    PROCEDURE (this: DropCap) DistanceFromText* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 13)
    END DistanceFromText;

    PROCEDURE (this: DropCap) PUTDistanceFromText* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 13, p1)
    END PUTDistanceFromText;

    PROCEDURE (this: DropCap) Clear* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 100, NIL);
    END Clear;

    PROCEDURE (this: DropCap) Enable* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 101, NIL);
    END Enable;


    (* ---------- TabStops, dual, nonextensible ---------- *)

    PROCEDURE (this: TabStops) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: TabStops) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Count;

    PROCEDURE (this: TabStops) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: TabStops) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: TabStops) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: TabStops) Item* (Index: CtlT.Any): TabStop, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisTabStop(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: TabStops) Add* (Position: SHORTREAL; (* optional *) Alignment: CtlT.Any; Leader: CtlT.Any): TabStop, NEW;
        VAR arg: ARRAY 3 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.SRealVar(Position, arg[2]);
        CtlC.AnyVar(Alignment, arg[1]);
        CtlC.AnyVar(Leader, arg[0]);
        CtlC.CallParMethod(this, 100, arg, ret);
        RETURN ThisTabStop(CtlC.VarAny(ret))
    END Add;

    PROCEDURE (this: TabStops) ClearAll* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 101, NIL);
    END ClearAll;

    PROCEDURE (this: TabStops) Before* (Position: SHORTREAL): TabStop, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.SRealVar(Position, arg[0]);
        CtlC.CallParMethod(this, 102, arg, ret);
        RETURN ThisTabStop(CtlC.VarAny(ret))
    END Before;

    PROCEDURE (this: TabStops) After* (Position: SHORTREAL): TabStop, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.SRealVar(Position, arg[0]);
        CtlC.CallParMethod(this, 103, arg, ret);
        RETURN ThisTabStop(CtlC.VarAny(ret))
    END After;


    (* ---------- TabStop, dual, nonextensible ---------- *)

    PROCEDURE (this: TabStop) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: TabStop) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: TabStop) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: TabStop) Alignment* (): WdTabAlignment, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 100)
    END Alignment;

    PROCEDURE (this: TabStop) PUTAlignment* (p1: WdTabAlignment), NEW;
    BEGIN
        CtlC.PutInt(this, 100, p1)
    END PUTAlignment;

    PROCEDURE (this: TabStop) Leader* (): WdTabLeader, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 101)
    END Leader;

    PROCEDURE (this: TabStop) PUTLeader* (p1: WdTabLeader), NEW;
    BEGIN
        CtlC.PutInt(this, 101, p1)
    END PUTLeader;

    PROCEDURE (this: TabStop) Position* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 102)
    END Position;

    PROCEDURE (this: TabStop) PUTPosition* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 102, p1)
    END PUTPosition;

    PROCEDURE (this: TabStop) CustomTab* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 103)
    END CustomTab;

    PROCEDURE (this: TabStop) Next* (): TabStop, NEW;
    BEGIN
        RETURN ThisTabStop(CtlC.GetAny(this, 104))
    END Next;

    PROCEDURE (this: TabStop) Previous* (): TabStop, NEW;
    BEGIN
        RETURN ThisTabStop(CtlC.GetAny(this, 105))
    END Previous;

    PROCEDURE (this: TabStop) Clear* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 200, NIL);
    END Clear;


    (* ---------- _ParagraphFormat, hidden, dual, nonextensible ---------- *)

    PROCEDURE (this: _ParagraphFormat) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: _ParagraphFormat) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: _ParagraphFormat) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: _ParagraphFormat) Duplicate* (): ParagraphFormat, NEW;
    BEGIN
        RETURN This_ParagraphFormat(CtlC.GetAny(this, 10))
    END Duplicate;

    PROCEDURE (this: _ParagraphFormat) Style* (): CtlT.Any, NEW;
    BEGIN
        RETURN CtlC.GetAny(this, 100)
    END Style;

    PROCEDURE (this: _ParagraphFormat) PUTStyle* (p1: CtlT.Any), NEW;
    BEGIN
        CtlC.PutAny(this, 100, p1)
    END PUTStyle;

    PROCEDURE (this: _ParagraphFormat) Alignment* (): WdParagraphAlignment, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 101)
    END Alignment;

    PROCEDURE (this: _ParagraphFormat) PUTAlignment* (p1: WdParagraphAlignment), NEW;
    BEGIN
        CtlC.PutInt(this, 101, p1)
    END PUTAlignment;

    PROCEDURE (this: _ParagraphFormat) KeepTogether* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 102)
    END KeepTogether;

    PROCEDURE (this: _ParagraphFormat) PUTKeepTogether* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 102, p1)
    END PUTKeepTogether;

    PROCEDURE (this: _ParagraphFormat) KeepWithNext* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 103)
    END KeepWithNext;

    PROCEDURE (this: _ParagraphFormat) PUTKeepWithNext* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 103, p1)
    END PUTKeepWithNext;

    PROCEDURE (this: _ParagraphFormat) PageBreakBefore* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 104)
    END PageBreakBefore;

    PROCEDURE (this: _ParagraphFormat) PUTPageBreakBefore* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 104, p1)
    END PUTPageBreakBefore;

    PROCEDURE (this: _ParagraphFormat) NoLineNumber* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 105)
    END NoLineNumber;

    PROCEDURE (this: _ParagraphFormat) PUTNoLineNumber* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 105, p1)
    END PUTNoLineNumber;

    PROCEDURE (this: _ParagraphFormat) RightIndent* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 106)
    END RightIndent;

    PROCEDURE (this: _ParagraphFormat) PUTRightIndent* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 106, p1)
    END PUTRightIndent;

    PROCEDURE (this: _ParagraphFormat) LeftIndent* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 107)
    END LeftIndent;

    PROCEDURE (this: _ParagraphFormat) PUTLeftIndent* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 107, p1)
    END PUTLeftIndent;

    PROCEDURE (this: _ParagraphFormat) FirstLineIndent* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 108)
    END FirstLineIndent;

    PROCEDURE (this: _ParagraphFormat) PUTFirstLineIndent* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 108, p1)
    END PUTFirstLineIndent;

    PROCEDURE (this: _ParagraphFormat) LineSpacing* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 109)
    END LineSpacing;

    PROCEDURE (this: _ParagraphFormat) PUTLineSpacing* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 109, p1)
    END PUTLineSpacing;

    PROCEDURE (this: _ParagraphFormat) LineSpacingRule* (): WdLineSpacing, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 110)
    END LineSpacingRule;

    PROCEDURE (this: _ParagraphFormat) PUTLineSpacingRule* (p1: WdLineSpacing), NEW;
    BEGIN
        CtlC.PutInt(this, 110, p1)
    END PUTLineSpacingRule;

    PROCEDURE (this: _ParagraphFormat) SpaceBefore* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 111)
    END SpaceBefore;

    PROCEDURE (this: _ParagraphFormat) PUTSpaceBefore* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 111, p1)
    END PUTSpaceBefore;

    PROCEDURE (this: _ParagraphFormat) SpaceAfter* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 112)
    END SpaceAfter;

    PROCEDURE (this: _ParagraphFormat) PUTSpaceAfter* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 112, p1)
    END PUTSpaceAfter;

    PROCEDURE (this: _ParagraphFormat) Hyphenation* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 113)
    END Hyphenation;

    PROCEDURE (this: _ParagraphFormat) PUTHyphenation* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 113, p1)
    END PUTHyphenation;

    PROCEDURE (this: _ParagraphFormat) WidowControl* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 114)
    END WidowControl;

    PROCEDURE (this: _ParagraphFormat) PUTWidowControl* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 114, p1)
    END PUTWidowControl;

    PROCEDURE (this: _ParagraphFormat) FarEastLineBreakControl* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 117)
    END FarEastLineBreakControl;

    PROCEDURE (this: _ParagraphFormat) PUTFarEastLineBreakControl* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 117, p1)
    END PUTFarEastLineBreakControl;

    PROCEDURE (this: _ParagraphFormat) WordWrap* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 118)
    END WordWrap;

    PROCEDURE (this: _ParagraphFormat) PUTWordWrap* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 118, p1)
    END PUTWordWrap;

    PROCEDURE (this: _ParagraphFormat) HangingPunctuation* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 119)
    END HangingPunctuation;

    PROCEDURE (this: _ParagraphFormat) PUTHangingPunctuation* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 119, p1)
    END PUTHangingPunctuation;

    PROCEDURE (this: _ParagraphFormat) HalfWidthPunctuationOnTopOfLine* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 120)
    END HalfWidthPunctuationOnTopOfLine;

    PROCEDURE (this: _ParagraphFormat) PUTHalfWidthPunctuationOnTopOfLine* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 120, p1)
    END PUTHalfWidthPunctuationOnTopOfLine;

    PROCEDURE (this: _ParagraphFormat) AddSpaceBetweenFarEastAndAlpha* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 121)
    END AddSpaceBetweenFarEastAndAlpha;

    PROCEDURE (this: _ParagraphFormat) PUTAddSpaceBetweenFarEastAndAlpha* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 121, p1)
    END PUTAddSpaceBetweenFarEastAndAlpha;

    PROCEDURE (this: _ParagraphFormat) AddSpaceBetweenFarEastAndDigit* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 122)
    END AddSpaceBetweenFarEastAndDigit;

    PROCEDURE (this: _ParagraphFormat) PUTAddSpaceBetweenFarEastAndDigit* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 122, p1)
    END PUTAddSpaceBetweenFarEastAndDigit;

    PROCEDURE (this: _ParagraphFormat) BaseLineAlignment* (): WdBaselineAlignment, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 123)
    END BaseLineAlignment;

    PROCEDURE (this: _ParagraphFormat) PUTBaseLineAlignment* (p1: WdBaselineAlignment), NEW;
    BEGIN
        CtlC.PutInt(this, 123, p1)
    END PUTBaseLineAlignment;

    PROCEDURE (this: _ParagraphFormat) AutoAdjustRightIndent* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 124)
    END AutoAdjustRightIndent;

    PROCEDURE (this: _ParagraphFormat) PUTAutoAdjustRightIndent* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 124, p1)
    END PUTAutoAdjustRightIndent;

    PROCEDURE (this: _ParagraphFormat) DisableLineHeightGrid* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 125)
    END DisableLineHeightGrid;

    PROCEDURE (this: _ParagraphFormat) PUTDisableLineHeightGrid* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 125, p1)
    END PUTDisableLineHeightGrid;

    PROCEDURE (this: _ParagraphFormat) TabStops* (): TabStops, NEW;
    BEGIN
        RETURN ThisTabStops(CtlC.GetAny(this, 1103))
    END TabStops;

    PROCEDURE (this: _ParagraphFormat) PUTTabStops* (p1: TabStops), NEW;
    BEGIN
        CtlC.PutObj(this, 1103, p1)
    END PUTTabStops;

    PROCEDURE (this: _ParagraphFormat) Borders* (): Borders, NEW;
    BEGIN
        RETURN ThisBorders(CtlC.GetAny(this, 1100))
    END Borders;

    PROCEDURE (this: _ParagraphFormat) PUTBorders* (p1: Borders), NEW;
    BEGIN
        CtlC.PutObj(this, 1100, p1)
    END PUTBorders;

    PROCEDURE (this: _ParagraphFormat) Shading* (): Shading, NEW;
    BEGIN
        RETURN ThisShading(CtlC.GetAny(this, 1101))
    END Shading;

    PROCEDURE (this: _ParagraphFormat) OutlineLevel* (): WdOutlineLevel, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 202)
    END OutlineLevel;

    PROCEDURE (this: _ParagraphFormat) PUTOutlineLevel* (p1: WdOutlineLevel), NEW;
    BEGIN
        CtlC.PutInt(this, 202, p1)
    END PUTOutlineLevel;

    PROCEDURE (this: _ParagraphFormat) CloseUp* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 301, NIL);
    END CloseUp;

    PROCEDURE (this: _ParagraphFormat) OpenUp* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 302, NIL);
    END OpenUp;

    PROCEDURE (this: _ParagraphFormat) OpenOrCloseUp* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 303, NIL);
    END OpenOrCloseUp;

    PROCEDURE (this: _ParagraphFormat) TabHangingIndent* (Count: SHORTINT), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.SIntVar(Count, arg[0]);
        CtlC.CallParMethod(this, 304, arg, NIL);
    END TabHangingIndent;

    PROCEDURE (this: _ParagraphFormat) TabIndent* (Count: SHORTINT), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.SIntVar(Count, arg[0]);
        CtlC.CallParMethod(this, 306, arg, NIL);
    END TabIndent;

    PROCEDURE (this: _ParagraphFormat) Reset* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 312, NIL);
    END Reset;

    PROCEDURE (this: _ParagraphFormat) Space1* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 313, NIL);
    END Space1;

    PROCEDURE (this: _ParagraphFormat) Space15* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 314, NIL);
    END Space15;

    PROCEDURE (this: _ParagraphFormat) Space2* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 315, NIL);
    END Space2;

    PROCEDURE (this: _ParagraphFormat) IndentCharWidth* (Count: SHORTINT), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.SIntVar(Count, arg[0]);
        CtlC.CallParMethod(this, 320, arg, NIL);
    END IndentCharWidth;

    PROCEDURE (this: _ParagraphFormat) IndentFirstLineCharWidth* (Count: SHORTINT), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.SIntVar(Count, arg[0]);
        CtlC.CallParMethod(this, 322, arg, NIL);
    END IndentFirstLineCharWidth;


    (* ---------- _Font, hidden, dual, nonextensible ---------- *)

    PROCEDURE (this: _Font) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: _Font) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: _Font) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: _Font) Duplicate* (): Font, NEW;
    BEGIN
        RETURN This_Font(CtlC.GetAny(this, 10))
    END Duplicate;

    PROCEDURE (this: _Font) Bold* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 130)
    END Bold;

    PROCEDURE (this: _Font) PUTBold* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 130, p1)
    END PUTBold;

    PROCEDURE (this: _Font) Italic* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 131)
    END Italic;

    PROCEDURE (this: _Font) PUTItalic* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 131, p1)
    END PUTItalic;

    PROCEDURE (this: _Font) Hidden* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 132)
    END Hidden;

    PROCEDURE (this: _Font) PUTHidden* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 132, p1)
    END PUTHidden;

    PROCEDURE (this: _Font) SmallCaps* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 133)
    END SmallCaps;

    PROCEDURE (this: _Font) PUTSmallCaps* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 133, p1)
    END PUTSmallCaps;

    PROCEDURE (this: _Font) AllCaps* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 134)
    END AllCaps;

    PROCEDURE (this: _Font) PUTAllCaps* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 134, p1)
    END PUTAllCaps;

    PROCEDURE (this: _Font) StrikeThrough* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 135)
    END StrikeThrough;

    PROCEDURE (this: _Font) PUTStrikeThrough* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 135, p1)
    END PUTStrikeThrough;

    PROCEDURE (this: _Font) DoubleStrikeThrough* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 136)
    END DoubleStrikeThrough;

    PROCEDURE (this: _Font) PUTDoubleStrikeThrough* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 136, p1)
    END PUTDoubleStrikeThrough;

    PROCEDURE (this: _Font) ColorIndex* (): WdColorIndex, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 137)
    END ColorIndex;

    PROCEDURE (this: _Font) PUTColorIndex* (p1: WdColorIndex), NEW;
    BEGIN
        CtlC.PutInt(this, 137, p1)
    END PUTColorIndex;

    PROCEDURE (this: _Font) Subscript* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 138)
    END Subscript;

    PROCEDURE (this: _Font) PUTSubscript* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 138, p1)
    END PUTSubscript;

    PROCEDURE (this: _Font) Superscript* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 139)
    END Superscript;

    PROCEDURE (this: _Font) PUTSuperscript* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 139, p1)
    END PUTSuperscript;

    PROCEDURE (this: _Font) Underline* (): WdUnderline, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 140)
    END Underline;

    PROCEDURE (this: _Font) PUTUnderline* (p1: WdUnderline), NEW;
    BEGIN
        CtlC.PutInt(this, 140, p1)
    END PUTUnderline;

    PROCEDURE (this: _Font) Size* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 141)
    END Size;

    PROCEDURE (this: _Font) PUTSize* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 141, p1)
    END PUTSize;

    PROCEDURE (this: _Font) Name* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 142)
    END Name;

    PROCEDURE (this: _Font) PUTName* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 142, p1)
    END PUTName;

    PROCEDURE (this: _Font) Position* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 143)
    END Position;

    PROCEDURE (this: _Font) PUTPosition* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 143, p1)
    END PUTPosition;

    PROCEDURE (this: _Font) Spacing* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 144)
    END Spacing;

    PROCEDURE (this: _Font) PUTSpacing* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 144, p1)
    END PUTSpacing;

    PROCEDURE (this: _Font) Scaling* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 145)
    END Scaling;

    PROCEDURE (this: _Font) PUTScaling* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 145, p1)
    END PUTScaling;

    PROCEDURE (this: _Font) Shadow* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 146)
    END Shadow;

    PROCEDURE (this: _Font) PUTShadow* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 146, p1)
    END PUTShadow;

    PROCEDURE (this: _Font) Outline* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 147)
    END Outline;

    PROCEDURE (this: _Font) PUTOutline* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 147, p1)
    END PUTOutline;

    PROCEDURE (this: _Font) Emboss* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 148)
    END Emboss;

    PROCEDURE (this: _Font) PUTEmboss* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 148, p1)
    END PUTEmboss;

    PROCEDURE (this: _Font) Kerning* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 149)
    END Kerning;

    PROCEDURE (this: _Font) PUTKerning* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 149, p1)
    END PUTKerning;

    PROCEDURE (this: _Font) Engrave* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 150)
    END Engrave;

    PROCEDURE (this: _Font) PUTEngrave* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 150, p1)
    END PUTEngrave;

    PROCEDURE (this: _Font) Animation* (): WdAnimation, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 151)
    END Animation;

    PROCEDURE (this: _Font) PUTAnimation* (p1: WdAnimation), NEW;
    BEGIN
        CtlC.PutInt(this, 151, p1)
    END PUTAnimation;

    PROCEDURE (this: _Font) Borders* (): Borders, NEW;
    BEGIN
        RETURN ThisBorders(CtlC.GetAny(this, 1100))
    END Borders;

    PROCEDURE (this: _Font) PUTBorders* (p1: Borders), NEW;
    BEGIN
        CtlC.PutObj(this, 1100, p1)
    END PUTBorders;

    PROCEDURE (this: _Font) Shading* (): Shading, NEW;
    BEGIN
        RETURN ThisShading(CtlC.GetAny(this, 153))
    END Shading;

    PROCEDURE (this: _Font) EmphasisMark* (): WdEmphasisMark, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 154)
    END EmphasisMark;

    PROCEDURE (this: _Font) PUTEmphasisMark* (p1: WdEmphasisMark), NEW;
    BEGIN
        CtlC.PutInt(this, 154, p1)
    END PUTEmphasisMark;

    PROCEDURE (this: _Font) DisableCharacterSpaceGrid* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 155)
    END DisableCharacterSpaceGrid;

    PROCEDURE (this: _Font) PUTDisableCharacterSpaceGrid* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 155, p1)
    END PUTDisableCharacterSpaceGrid;

    PROCEDURE (this: _Font) NameFarEast* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 156)
    END NameFarEast;

    PROCEDURE (this: _Font) PUTNameFarEast* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 156, p1)
    END PUTNameFarEast;

    PROCEDURE (this: _Font) NameAscii* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 157)
    END NameAscii;

    PROCEDURE (this: _Font) PUTNameAscii* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 157, p1)
    END PUTNameAscii;

    PROCEDURE (this: _Font) NameOther* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 158)
    END NameOther;

    PROCEDURE (this: _Font) PUTNameOther* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 158, p1)
    END PUTNameOther;

    PROCEDURE (this: _Font) Grow* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 100, NIL);
    END Grow;

    PROCEDURE (this: _Font) Shrink* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 101, NIL);
    END Shrink;

    PROCEDURE (this: _Font) Reset* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 102, NIL);
    END Reset;

    PROCEDURE (this: _Font) SetAsTemplateDefault* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 103, NIL);
    END SetAsTemplateDefault;


    (* ---------- Table, dual, nonextensible ---------- *)

    PROCEDURE (this: Table) Range* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 0))
    END Range;

    PROCEDURE (this: Table) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Table) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Table) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Table) Columns* (): Columns, NEW;
    BEGIN
        RETURN ThisColumns(CtlC.GetAny(this, 100))
    END Columns;

    PROCEDURE (this: Table) Rows* (): Rows, NEW;
    BEGIN
        RETURN ThisRows(CtlC.GetAny(this, 101))
    END Rows;

    PROCEDURE (this: Table) Borders* (): Borders, NEW;
    BEGIN
        RETURN ThisBorders(CtlC.GetAny(this, 1100))
    END Borders;

    PROCEDURE (this: Table) PUTBorders* (p1: Borders), NEW;
    BEGIN
        CtlC.PutObj(this, 1100, p1)
    END PUTBorders;

    PROCEDURE (this: Table) Shading* (): Shading, NEW;
    BEGIN
        RETURN ThisShading(CtlC.GetAny(this, 104))
    END Shading;

    PROCEDURE (this: Table) Uniform* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 105)
    END Uniform;

    PROCEDURE (this: Table) AutoFormatType* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 106)
    END AutoFormatType;

    PROCEDURE (this: Table) Select* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 200, NIL);
    END Select;

    PROCEDURE (this: Table) Delete* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 9, NIL);
    END Delete;

    PROCEDURE (this: Table) Sort* ((* optional *) ExcludeHeader: CtlT.Any; FieldNumber: CtlT.Any; SortFieldType: CtlT.Any; SortOrder: CtlT.Any; FieldNumber2: CtlT.Any; SortFieldType2: CtlT.Any; SortOrder2: CtlT.Any; FieldNumber3: CtlT.Any; SortFieldType3: CtlT.Any; SortOrder3: CtlT.Any; CaseSensitive: CtlT.Any; LanguageID: CtlT.Any), NEW;
        VAR arg: ARRAY 12 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(ExcludeHeader, arg[11]);
        CtlC.AnyVar(FieldNumber, arg[10]);
        CtlC.AnyVar(SortFieldType, arg[9]);
        CtlC.AnyVar(SortOrder, arg[8]);
        CtlC.AnyVar(FieldNumber2, arg[7]);
        CtlC.AnyVar(SortFieldType2, arg[6]);
        CtlC.AnyVar(SortOrder2, arg[5]);
        CtlC.AnyVar(FieldNumber3, arg[4]);
        CtlC.AnyVar(SortFieldType3, arg[3]);
        CtlC.AnyVar(SortOrder3, arg[2]);
        CtlC.AnyVar(CaseSensitive, arg[1]);
        CtlC.AnyVar(LanguageID, arg[0]);
        CtlC.CallParMethod(this, 10, arg, NIL);
    END Sort;

    PROCEDURE (this: Table) SortAscending* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 12, NIL);
    END SortAscending;

    PROCEDURE (this: Table) SortDescending* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 13, NIL);
    END SortDescending;

    PROCEDURE (this: Table) AutoFormat* ((* optional *) Format: CtlT.Any; ApplyBorders: CtlT.Any; ApplyShading: CtlT.Any; ApplyFont: CtlT.Any; ApplyColor: CtlT.Any; ApplyHeadingRows: CtlT.Any; ApplyLastRow: CtlT.Any; ApplyFirstColumn: CtlT.Any; ApplyLastColumn: CtlT.Any; AutoFit: CtlT.Any), NEW;
        VAR arg: ARRAY 10 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Format, arg[9]);
        CtlC.AnyVar(ApplyBorders, arg[8]);
        CtlC.AnyVar(ApplyShading, arg[7]);
        CtlC.AnyVar(ApplyFont, arg[6]);
        CtlC.AnyVar(ApplyColor, arg[5]);
        CtlC.AnyVar(ApplyHeadingRows, arg[4]);
        CtlC.AnyVar(ApplyLastRow, arg[3]);
        CtlC.AnyVar(ApplyFirstColumn, arg[2]);
        CtlC.AnyVar(ApplyLastColumn, arg[1]);
        CtlC.AnyVar(AutoFit, arg[0]);
        CtlC.CallParMethod(this, 14, arg, NIL);
    END AutoFormat;

    PROCEDURE (this: Table) UpdateAutoFormat* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 15, NIL);
    END UpdateAutoFormat;

    PROCEDURE (this: Table) ConvertToText* ((* optional *) Separator: CtlT.Any): Range, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Separator, arg[0]);
        CtlC.CallParMethod(this, 16, arg, ret);
        RETURN ThisRange(CtlC.VarAny(ret))
    END ConvertToText;

    PROCEDURE (this: Table) Cell* (Row: INTEGER; Column: INTEGER): Cell, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Row, arg[1]);
        CtlC.IntVar(Column, arg[0]);
        CtlC.CallParMethod(this, 17, arg, ret);
        RETURN ThisCell(CtlC.VarAny(ret))
    END Cell;

    PROCEDURE (this: Table) Split* (BeforeRow: CtlT.Any): Table, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(BeforeRow, arg[0]);
        CtlC.CallParMethod(this, 18, arg, ret);
        RETURN ThisTable(CtlC.VarAny(ret))
    END Split;


    (* ---------- Row, dual, nonextensible ---------- *)

    PROCEDURE (this: Row) Range* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 0))
    END Range;

    PROCEDURE (this: Row) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Row) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Row) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Row) AllowBreakAcrossPages* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 3)
    END AllowBreakAcrossPages;

    PROCEDURE (this: Row) PUTAllowBreakAcrossPages* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 3, p1)
    END PUTAllowBreakAcrossPages;

    PROCEDURE (this: Row) Alignment* (): WdRowAlignment, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 4)
    END Alignment;

    PROCEDURE (this: Row) PUTAlignment* (p1: WdRowAlignment), NEW;
    BEGIN
        CtlC.PutInt(this, 4, p1)
    END PUTAlignment;

    PROCEDURE (this: Row) HeadingFormat* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 5)
    END HeadingFormat;

    PROCEDURE (this: Row) PUTHeadingFormat* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 5, p1)
    END PUTHeadingFormat;

    PROCEDURE (this: Row) SpaceBetweenColumns* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 6)
    END SpaceBetweenColumns;

    PROCEDURE (this: Row) PUTSpaceBetweenColumns* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 6, p1)
    END PUTSpaceBetweenColumns;

    PROCEDURE (this: Row) Height* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 7)
    END Height;

    PROCEDURE (this: Row) PUTHeight* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 7, p1)
    END PUTHeight;

    PROCEDURE (this: Row) HeightRule* (): WdRowHeightRule, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 8)
    END HeightRule;

    PROCEDURE (this: Row) PUTHeightRule* (p1: WdRowHeightRule), NEW;
    BEGIN
        CtlC.PutInt(this, 8, p1)
    END PUTHeightRule;

    PROCEDURE (this: Row) LeftIndent* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 9)
    END LeftIndent;

    PROCEDURE (this: Row) PUTLeftIndent* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 9, p1)
    END PUTLeftIndent;

    PROCEDURE (this: Row) IsLast* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 10)
    END IsLast;

    PROCEDURE (this: Row) IsFirst* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 11)
    END IsFirst;

    PROCEDURE (this: Row) Index* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 12)
    END Index;

    PROCEDURE (this: Row) Cells* (): Cells, NEW;
    BEGIN
        RETURN ThisCells(CtlC.GetAny(this, 100))
    END Cells;

    PROCEDURE (this: Row) Borders* (): Borders, NEW;
    BEGIN
        RETURN ThisBorders(CtlC.GetAny(this, 1100))
    END Borders;

    PROCEDURE (this: Row) PUTBorders* (p1: Borders), NEW;
    BEGIN
        CtlC.PutObj(this, 1100, p1)
    END PUTBorders;

    PROCEDURE (this: Row) Shading* (): Shading, NEW;
    BEGIN
        RETURN ThisShading(CtlC.GetAny(this, 103))
    END Shading;

    PROCEDURE (this: Row) Next* (): Row, NEW;
    BEGIN
        RETURN ThisRow(CtlC.GetAny(this, 104))
    END Next;

    PROCEDURE (this: Row) Previous* (): Row, NEW;
    BEGIN
        RETURN ThisRow(CtlC.GetAny(this, 105))
    END Previous;

    PROCEDURE (this: Row) Select* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 65535, NIL);
    END Select;

    PROCEDURE (this: Row) Delete* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 200, NIL);
    END Delete;

    PROCEDURE (this: Row) SetLeftIndent* (LeftIndent: SHORTREAL; RulerStyle: WdRulerStyle), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.SRealVar(LeftIndent, arg[1]);
        CtlC.IntVar(RulerStyle, arg[0]);
        CtlC.CallParMethod(this, 202, arg, NIL);
    END SetLeftIndent;

    PROCEDURE (this: Row) SetHeight* (RowHeight: SHORTREAL; HeightRule: WdRowHeightRule), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.SRealVar(RowHeight, arg[1]);
        CtlC.IntVar(HeightRule, arg[0]);
        CtlC.CallParMethod(this, 203, arg, NIL);
    END SetHeight;

    PROCEDURE (this: Row) ConvertToText* ((* optional *) Separator: CtlT.Any): Range, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Separator, arg[0]);
        CtlC.CallParMethod(this, 16, arg, ret);
        RETURN ThisRange(CtlC.VarAny(ret))
    END ConvertToText;


    (* ---------- Column, dual, nonextensible ---------- *)

    PROCEDURE (this: Column) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Column) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Column) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Column) Width* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 3)
    END Width;

    PROCEDURE (this: Column) PUTWidth* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 3, p1)
    END PUTWidth;

    PROCEDURE (this: Column) IsFirst* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 4)
    END IsFirst;

    PROCEDURE (this: Column) IsLast* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 5)
    END IsLast;

    PROCEDURE (this: Column) Index* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 6)
    END Index;

    PROCEDURE (this: Column) Cells* (): Cells, NEW;
    BEGIN
        RETURN ThisCells(CtlC.GetAny(this, 100))
    END Cells;

    PROCEDURE (this: Column) Borders* (): Borders, NEW;
    BEGIN
        RETURN ThisBorders(CtlC.GetAny(this, 1100))
    END Borders;

    PROCEDURE (this: Column) PUTBorders* (p1: Borders), NEW;
    BEGIN
        CtlC.PutObj(this, 1100, p1)
    END PUTBorders;

    PROCEDURE (this: Column) Shading* (): Shading, NEW;
    BEGIN
        RETURN ThisShading(CtlC.GetAny(this, 102))
    END Shading;

    PROCEDURE (this: Column) Next* (): Column, NEW;
    BEGIN
        RETURN ThisColumn(CtlC.GetAny(this, 103))
    END Next;

    PROCEDURE (this: Column) Previous* (): Column, NEW;
    BEGIN
        RETURN ThisColumn(CtlC.GetAny(this, 104))
    END Previous;

    PROCEDURE (this: Column) Select* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 65535, NIL);
    END Select;

    PROCEDURE (this: Column) Delete* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 200, NIL);
    END Delete;

    PROCEDURE (this: Column) SetWidth* (ColumnWidth: SHORTREAL; RulerStyle: WdRulerStyle), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.SRealVar(ColumnWidth, arg[1]);
        CtlC.IntVar(RulerStyle, arg[0]);
        CtlC.CallParMethod(this, 201, arg, NIL);
    END SetWidth;

    PROCEDURE (this: Column) AutoFit* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 202, NIL);
    END AutoFit;

    PROCEDURE (this: Column) Sort* ((* optional *) ExcludeHeader: CtlT.Any; SortFieldType: CtlT.Any; SortOrder: CtlT.Any; CaseSensitive: CtlT.Any; LanguageID: CtlT.Any), NEW;
        VAR arg: ARRAY 5 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(ExcludeHeader, arg[4]);
        CtlC.AnyVar(SortFieldType, arg[3]);
        CtlC.AnyVar(SortOrder, arg[2]);
        CtlC.AnyVar(CaseSensitive, arg[1]);
        CtlC.AnyVar(LanguageID, arg[0]);
        CtlC.CallParMethod(this, 203, arg, NIL);
    END Sort;


    (* ---------- Cell, dual, nonextensible ---------- *)

    PROCEDURE (this: Cell) Range* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 0))
    END Range;

    PROCEDURE (this: Cell) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Cell) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Cell) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Cell) RowIndex* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 4)
    END RowIndex;

    PROCEDURE (this: Cell) ColumnIndex* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 5)
    END ColumnIndex;

    PROCEDURE (this: Cell) Width* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 6)
    END Width;

    PROCEDURE (this: Cell) PUTWidth* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 6, p1)
    END PUTWidth;

    PROCEDURE (this: Cell) Height* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 7)
    END Height;

    PROCEDURE (this: Cell) PUTHeight* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 7, p1)
    END PUTHeight;

    PROCEDURE (this: Cell) HeightRule* (): WdRowHeightRule, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 8)
    END HeightRule;

    PROCEDURE (this: Cell) PUTHeightRule* (p1: WdRowHeightRule), NEW;
    BEGIN
        CtlC.PutInt(this, 8, p1)
    END PUTHeightRule;

    PROCEDURE (this: Cell) VerticalAlignment* (): WdCellVerticalAlignment, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1104)
    END VerticalAlignment;

    PROCEDURE (this: Cell) PUTVerticalAlignment* (p1: WdCellVerticalAlignment), NEW;
    BEGIN
        CtlC.PutInt(this, 1104, p1)
    END PUTVerticalAlignment;

    PROCEDURE (this: Cell) Column* (): Column, NEW;
    BEGIN
        RETURN ThisColumn(CtlC.GetAny(this, 101))
    END Column;

    PROCEDURE (this: Cell) Row* (): Row, NEW;
    BEGIN
        RETURN ThisRow(CtlC.GetAny(this, 102))
    END Row;

    PROCEDURE (this: Cell) Next* (): Cell, NEW;
    BEGIN
        RETURN ThisCell(CtlC.GetAny(this, 103))
    END Next;

    PROCEDURE (this: Cell) Previous* (): Cell, NEW;
    BEGIN
        RETURN ThisCell(CtlC.GetAny(this, 104))
    END Previous;

    PROCEDURE (this: Cell) Shading* (): Shading, NEW;
    BEGIN
        RETURN ThisShading(CtlC.GetAny(this, 105))
    END Shading;

    PROCEDURE (this: Cell) Borders* (): Borders, NEW;
    BEGIN
        RETURN ThisBorders(CtlC.GetAny(this, 1100))
    END Borders;

    PROCEDURE (this: Cell) PUTBorders* (p1: Borders), NEW;
    BEGIN
        CtlC.PutObj(this, 1100, p1)
    END PUTBorders;

    PROCEDURE (this: Cell) Select* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 65535, NIL);
    END Select;

    PROCEDURE (this: Cell) Delete* ((* optional *) ShiftCells: CtlT.Any), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(ShiftCells, arg[0]);
        CtlC.CallParMethod(this, 200, arg, NIL);
    END Delete;

    PROCEDURE (this: Cell) Formula* ((* optional *) Formula: CtlT.Any; NumFormat: CtlT.Any), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Formula, arg[1]);
        CtlC.AnyVar(NumFormat, arg[0]);
        CtlC.CallParMethod(this, 201, arg, NIL);
    END Formula;

    PROCEDURE (this: Cell) SetWidth* (ColumnWidth: SHORTREAL; RulerStyle: WdRulerStyle), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.SRealVar(ColumnWidth, arg[1]);
        CtlC.IntVar(RulerStyle, arg[0]);
        CtlC.CallParMethod(this, 202, arg, NIL);
    END SetWidth;

    PROCEDURE (this: Cell) SetHeight* (RowHeight: CtlT.Any; HeightRule: WdRowHeightRule), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(RowHeight, arg[1]);
        CtlC.IntVar(HeightRule, arg[0]);
        CtlC.CallParMethod(this, 203, arg, NIL);
    END SetHeight;

    PROCEDURE (this: Cell) Merge* (MergeTo: Cell), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.ObjVar(MergeTo, arg[0]);
        CtlC.CallParMethod(this, 204, arg, NIL);
    END Merge;

    PROCEDURE (this: Cell) Split* ((* optional *) NumRows: CtlT.Any; NumColumns: CtlT.Any), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(NumRows, arg[1]);
        CtlC.AnyVar(NumColumns, arg[0]);
        CtlC.CallParMethod(this, 205, arg, NIL);
    END Split;

    PROCEDURE (this: Cell) AutoSum* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 206, NIL);
    END AutoSum;


    (* ---------- Tables, dual, nonextensible ---------- *)

    PROCEDURE (this: Tables) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: Tables) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Count;

    PROCEDURE (this: Tables) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Tables) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Tables) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Tables) Item* (Index: INTEGER): Table, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisTable(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: Tables) Add* (range: Range; NumRows: INTEGER; NumColumns: INTEGER): Table, NEW;
        VAR arg: ARRAY 3 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.ObjVar(range, arg[2]);
        CtlC.IntVar(NumRows, arg[1]);
        CtlC.IntVar(NumColumns, arg[0]);
        CtlC.CallParMethod(this, 4, arg, ret);
        RETURN ThisTable(CtlC.VarAny(ret))
    END Add;


    (* ---------- Rows, dual, nonextensible ---------- *)

    PROCEDURE (this: Rows) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: Rows) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Count;

    PROCEDURE (this: Rows) AllowBreakAcrossPages* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 3)
    END AllowBreakAcrossPages;

    PROCEDURE (this: Rows) PUTAllowBreakAcrossPages* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 3, p1)
    END PUTAllowBreakAcrossPages;

    PROCEDURE (this: Rows) Alignment* (): WdRowAlignment, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 4)
    END Alignment;

    PROCEDURE (this: Rows) PUTAlignment* (p1: WdRowAlignment), NEW;
    BEGIN
        CtlC.PutInt(this, 4, p1)
    END PUTAlignment;

    PROCEDURE (this: Rows) HeadingFormat* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 5)
    END HeadingFormat;

    PROCEDURE (this: Rows) PUTHeadingFormat* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 5, p1)
    END PUTHeadingFormat;

    PROCEDURE (this: Rows) SpaceBetweenColumns* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 6)
    END SpaceBetweenColumns;

    PROCEDURE (this: Rows) PUTSpaceBetweenColumns* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 6, p1)
    END PUTSpaceBetweenColumns;

    PROCEDURE (this: Rows) Height* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 7)
    END Height;

    PROCEDURE (this: Rows) PUTHeight* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 7, p1)
    END PUTHeight;

    PROCEDURE (this: Rows) HeightRule* (): WdRowHeightRule, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 8)
    END HeightRule;

    PROCEDURE (this: Rows) PUTHeightRule* (p1: WdRowHeightRule), NEW;
    BEGIN
        CtlC.PutInt(this, 8, p1)
    END PUTHeightRule;

    PROCEDURE (this: Rows) LeftIndent* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 9)
    END LeftIndent;

    PROCEDURE (this: Rows) PUTLeftIndent* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 9, p1)
    END PUTLeftIndent;

    PROCEDURE (this: Rows) First* (): Row, NEW;
    BEGIN
        RETURN ThisRow(CtlC.GetAny(this, 10))
    END First;

    PROCEDURE (this: Rows) Last* (): Row, NEW;
    BEGIN
        RETURN ThisRow(CtlC.GetAny(this, 11))
    END Last;

    PROCEDURE (this: Rows) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Rows) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Rows) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Rows) Borders* (): Borders, NEW;
    BEGIN
        RETURN ThisBorders(CtlC.GetAny(this, 1100))
    END Borders;

    PROCEDURE (this: Rows) PUTBorders* (p1: Borders), NEW;
    BEGIN
        CtlC.PutObj(this, 1100, p1)
    END PUTBorders;

    PROCEDURE (this: Rows) Shading* (): Shading, NEW;
    BEGIN
        RETURN ThisShading(CtlC.GetAny(this, 102))
    END Shading;

    PROCEDURE (this: Rows) Item* (Index: INTEGER): Row, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisRow(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: Rows) Add* ((* optional *) BeforeRow: CtlT.Any): Row, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(BeforeRow, arg[0]);
        CtlC.CallParMethod(this, 100, arg, ret);
        RETURN ThisRow(CtlC.VarAny(ret))
    END Add;

    PROCEDURE (this: Rows) Select* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 199, NIL);
    END Select;

    PROCEDURE (this: Rows) Delete* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 200, NIL);
    END Delete;

    PROCEDURE (this: Rows) SetLeftIndent* (LeftIndent: SHORTREAL; RulerStyle: WdRulerStyle), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.SRealVar(LeftIndent, arg[1]);
        CtlC.IntVar(RulerStyle, arg[0]);
        CtlC.CallParMethod(this, 202, arg, NIL);
    END SetLeftIndent;

    PROCEDURE (this: Rows) SetHeight* (RowHeight: SHORTREAL; HeightRule: WdRowHeightRule), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.SRealVar(RowHeight, arg[1]);
        CtlC.IntVar(HeightRule, arg[0]);
        CtlC.CallParMethod(this, 203, arg, NIL);
    END SetHeight;

    PROCEDURE (this: Rows) ConvertToText* ((* optional *) Separator: CtlT.Any): Range, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Separator, arg[0]);
        CtlC.CallParMethod(this, 16, arg, ret);
        RETURN ThisRange(CtlC.VarAny(ret))
    END ConvertToText;

    PROCEDURE (this: Rows) DistributeHeight* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 206, NIL);
    END DistributeHeight;


    (* ---------- Columns, dual, nonextensible ---------- *)

    PROCEDURE (this: Columns) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: Columns) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Count;

    PROCEDURE (this: Columns) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Columns) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Columns) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Columns) First* (): Column, NEW;
    BEGIN
        RETURN ThisColumn(CtlC.GetAny(this, 100))
    END First;

    PROCEDURE (this: Columns) Last* (): Column, NEW;
    BEGIN
        RETURN ThisColumn(CtlC.GetAny(this, 101))
    END Last;

    PROCEDURE (this: Columns) Width* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 3)
    END Width;

    PROCEDURE (this: Columns) PUTWidth* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 3, p1)
    END PUTWidth;

    PROCEDURE (this: Columns) Borders* (): Borders, NEW;
    BEGIN
        RETURN ThisBorders(CtlC.GetAny(this, 1100))
    END Borders;

    PROCEDURE (this: Columns) PUTBorders* (p1: Borders), NEW;
    BEGIN
        CtlC.PutObj(this, 1100, p1)
    END PUTBorders;

    PROCEDURE (this: Columns) Shading* (): Shading, NEW;
    BEGIN
        RETURN ThisShading(CtlC.GetAny(this, 103))
    END Shading;

    PROCEDURE (this: Columns) Item* (Index: INTEGER): Column, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisColumn(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: Columns) Add* ((* optional *) BeforeColumn: CtlT.Any): Column, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(BeforeColumn, arg[0]);
        CtlC.CallParMethod(this, 5, arg, ret);
        RETURN ThisColumn(CtlC.VarAny(ret))
    END Add;

    PROCEDURE (this: Columns) Select* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 199, NIL);
    END Select;

    PROCEDURE (this: Columns) Delete* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 200, NIL);
    END Delete;

    PROCEDURE (this: Columns) SetWidth* (ColumnWidth: SHORTREAL; RulerStyle: WdRulerStyle), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.SRealVar(ColumnWidth, arg[1]);
        CtlC.IntVar(RulerStyle, arg[0]);
        CtlC.CallParMethod(this, 201, arg, NIL);
    END SetWidth;

    PROCEDURE (this: Columns) AutoFit* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 202, NIL);
    END AutoFit;

    PROCEDURE (this: Columns) DistributeWidth* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 203, NIL);
    END DistributeWidth;


    (* ---------- Cells, dual, nonextensible ---------- *)

    PROCEDURE (this: Cells) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: Cells) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Count;

    PROCEDURE (this: Cells) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Cells) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Cells) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Cells) Width* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 6)
    END Width;

    PROCEDURE (this: Cells) PUTWidth* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 6, p1)
    END PUTWidth;

    PROCEDURE (this: Cells) Height* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 7)
    END Height;

    PROCEDURE (this: Cells) PUTHeight* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 7, p1)
    END PUTHeight;

    PROCEDURE (this: Cells) HeightRule* (): WdRowHeightRule, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 8)
    END HeightRule;

    PROCEDURE (this: Cells) PUTHeightRule* (p1: WdRowHeightRule), NEW;
    BEGIN
        CtlC.PutInt(this, 8, p1)
    END PUTHeightRule;

    PROCEDURE (this: Cells) VerticalAlignment* (): WdCellVerticalAlignment, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1104)
    END VerticalAlignment;

    PROCEDURE (this: Cells) PUTVerticalAlignment* (p1: WdCellVerticalAlignment), NEW;
    BEGIN
        CtlC.PutInt(this, 1104, p1)
    END PUTVerticalAlignment;

    PROCEDURE (this: Cells) Borders* (): Borders, NEW;
    BEGIN
        RETURN ThisBorders(CtlC.GetAny(this, 1100))
    END Borders;

    PROCEDURE (this: Cells) PUTBorders* (p1: Borders), NEW;
    BEGIN
        CtlC.PutObj(this, 1100, p1)
    END PUTBorders;

    PROCEDURE (this: Cells) Shading* (): Shading, NEW;
    BEGIN
        RETURN ThisShading(CtlC.GetAny(this, 101))
    END Shading;

    PROCEDURE (this: Cells) Item* (Index: INTEGER): Cell, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisCell(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: Cells) Add* ((* optional *) BeforeCell: CtlT.Any): Cell, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(BeforeCell, arg[0]);
        CtlC.CallParMethod(this, 4, arg, ret);
        RETURN ThisCell(CtlC.VarAny(ret))
    END Add;

    PROCEDURE (this: Cells) Delete* ((* optional *) ShiftCells: CtlT.Any), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(ShiftCells, arg[0]);
        CtlC.CallParMethod(this, 200, arg, NIL);
    END Delete;

    PROCEDURE (this: Cells) SetWidth* (ColumnWidth: SHORTREAL; RulerStyle: WdRulerStyle), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.SRealVar(ColumnWidth, arg[1]);
        CtlC.IntVar(RulerStyle, arg[0]);
        CtlC.CallParMethod(this, 202, arg, NIL);
    END SetWidth;

    PROCEDURE (this: Cells) SetHeight* (RowHeight: CtlT.Any; HeightRule: WdRowHeightRule), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(RowHeight, arg[1]);
        CtlC.IntVar(HeightRule, arg[0]);
        CtlC.CallParMethod(this, 203, arg, NIL);
    END SetHeight;

    PROCEDURE (this: Cells) Merge* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 204, NIL);
    END Merge;

    PROCEDURE (this: Cells) Split* ((* optional *) NumRows: CtlT.Any; NumColumns: CtlT.Any; MergeBeforeSplit: CtlT.Any), NEW;
        VAR arg: ARRAY 3 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(NumRows, arg[2]);
        CtlC.AnyVar(NumColumns, arg[1]);
        CtlC.AnyVar(MergeBeforeSplit, arg[0]);
        CtlC.CallParMethod(this, 205, arg, NIL);
    END Split;

    PROCEDURE (this: Cells) DistributeHeight* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 206, NIL);
    END DistributeHeight;

    PROCEDURE (this: Cells) DistributeWidth* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 207, NIL);
    END DistributeWidth;

    PROCEDURE (this: Cells) AutoFit* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 208, NIL);
    END AutoFit;


    (* ---------- AutoCorrect, dual, nonextensible ---------- *)

    PROCEDURE (this: AutoCorrect) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: AutoCorrect) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: AutoCorrect) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: AutoCorrect) CorrectDays* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 1)
    END CorrectDays;

    PROCEDURE (this: AutoCorrect) PUTCorrectDays* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 1, p1)
    END PUTCorrectDays;

    PROCEDURE (this: AutoCorrect) CorrectInitialCaps* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 2)
    END CorrectInitialCaps;

    PROCEDURE (this: AutoCorrect) PUTCorrectInitialCaps* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 2, p1)
    END PUTCorrectInitialCaps;

    PROCEDURE (this: AutoCorrect) CorrectSentenceCaps* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 3)
    END CorrectSentenceCaps;

    PROCEDURE (this: AutoCorrect) PUTCorrectSentenceCaps* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 3, p1)
    END PUTCorrectSentenceCaps;

    PROCEDURE (this: AutoCorrect) ReplaceText* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 4)
    END ReplaceText;

    PROCEDURE (this: AutoCorrect) PUTReplaceText* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 4, p1)
    END PUTReplaceText;

    PROCEDURE (this: AutoCorrect) Entries* (): AutoCorrectEntries, NEW;
    BEGIN
        RETURN ThisAutoCorrectEntries(CtlC.GetAny(this, 6))
    END Entries;

    PROCEDURE (this: AutoCorrect) FirstLetterExceptions* (): FirstLetterExceptions, NEW;
    BEGIN
        RETURN ThisFirstLetterExceptions(CtlC.GetAny(this, 7))
    END FirstLetterExceptions;

    PROCEDURE (this: AutoCorrect) FirstLetterAutoAdd* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 8)
    END FirstLetterAutoAdd;

    PROCEDURE (this: AutoCorrect) PUTFirstLetterAutoAdd* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 8, p1)
    END PUTFirstLetterAutoAdd;

    PROCEDURE (this: AutoCorrect) TwoInitialCapsExceptions* (): TwoInitialCapsExceptions, NEW;
    BEGIN
        RETURN ThisTwoInitialCapsExceptions(CtlC.GetAny(this, 9))
    END TwoInitialCapsExceptions;

    PROCEDURE (this: AutoCorrect) TwoInitialCapsAutoAdd* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 10)
    END TwoInitialCapsAutoAdd;

    PROCEDURE (this: AutoCorrect) PUTTwoInitialCapsAutoAdd* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 10, p1)
    END PUTTwoInitialCapsAutoAdd;

    PROCEDURE (this: AutoCorrect) CorrectCapsLock* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 11)
    END CorrectCapsLock;

    PROCEDURE (this: AutoCorrect) PUTCorrectCapsLock* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 11, p1)
    END PUTCorrectCapsLock;

    PROCEDURE (this: AutoCorrect) CorrectHangulAndAlphabet* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 12)
    END CorrectHangulAndAlphabet;

    PROCEDURE (this: AutoCorrect) PUTCorrectHangulAndAlphabet* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 12, p1)
    END PUTCorrectHangulAndAlphabet;

    PROCEDURE (this: AutoCorrect) HangulAndAlphabetExceptions* (): HangulAndAlphabetExceptions, NEW;
    BEGIN
        RETURN ThisHangulAndAlphabetExceptions(CtlC.GetAny(this, 13))
    END HangulAndAlphabetExceptions;

    PROCEDURE (this: AutoCorrect) HangulAndAlphabetAutoAdd* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 14)
    END HangulAndAlphabetAutoAdd;

    PROCEDURE (this: AutoCorrect) PUTHangulAndAlphabetAutoAdd* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 14, p1)
    END PUTHangulAndAlphabetAutoAdd;


    (* ---------- AutoCorrectEntries, dual, nonextensible ---------- *)

    PROCEDURE (this: AutoCorrectEntries) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: AutoCorrectEntries) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: AutoCorrectEntries) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: AutoCorrectEntries) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: AutoCorrectEntries) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Count;

    PROCEDURE (this: AutoCorrectEntries) Item* (Index: CtlT.Any): AutoCorrectEntry, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisAutoCorrectEntry(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: AutoCorrectEntries) Add* (Name: ARRAY OF CHAR; Value: ARRAY OF CHAR): AutoCorrectEntry, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.StrVar(Name, arg[1]);
        CtlC.StrVar(Value, arg[0]);
        CtlC.CallParMethod(this, 101, arg, ret);
        RETURN ThisAutoCorrectEntry(CtlC.VarAny(ret))
    END Add;

    PROCEDURE (this: AutoCorrectEntries) AddRichText* (Name: ARRAY OF CHAR; range: Range): AutoCorrectEntry, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.StrVar(Name, arg[1]);
        CtlC.ObjVar(range, arg[0]);
        CtlC.CallParMethod(this, 102, arg, ret);
        RETURN ThisAutoCorrectEntry(CtlC.VarAny(ret))
    END AddRichText;


    (* ---------- AutoCorrectEntry, dual, nonextensible ---------- *)

    PROCEDURE (this: AutoCorrectEntry) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: AutoCorrectEntry) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: AutoCorrectEntry) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: AutoCorrectEntry) Index* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Index;

    PROCEDURE (this: AutoCorrectEntry) Name* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 2)
    END Name;

    PROCEDURE (this: AutoCorrectEntry) PUTName* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 2, p1)
    END PUTName;

    PROCEDURE (this: AutoCorrectEntry) Value* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 3)
    END Value;

    PROCEDURE (this: AutoCorrectEntry) PUTValue* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 3, p1)
    END PUTValue;

    PROCEDURE (this: AutoCorrectEntry) RichText* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 4)
    END RichText;

    PROCEDURE (this: AutoCorrectEntry) Delete* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 101, NIL);
    END Delete;

    PROCEDURE (this: AutoCorrectEntry) Apply* (range: Range), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.ObjVar(range, arg[0]);
        CtlC.CallParMethod(this, 102, arg, NIL);
    END Apply;


    (* ---------- FirstLetterExceptions, dual, nonextensible ---------- *)

    PROCEDURE (this: FirstLetterExceptions) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: FirstLetterExceptions) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: FirstLetterExceptions) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: FirstLetterExceptions) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: FirstLetterExceptions) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Count;

    PROCEDURE (this: FirstLetterExceptions) Item* (Index: CtlT.Any): FirstLetterException, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisFirstLetterException(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: FirstLetterExceptions) Add* (Name: ARRAY OF CHAR): FirstLetterException, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.StrVar(Name, arg[0]);
        CtlC.CallParMethod(this, 101, arg, ret);
        RETURN ThisFirstLetterException(CtlC.VarAny(ret))
    END Add;


    (* ---------- FirstLetterException, dual, nonextensible ---------- *)

    PROCEDURE (this: FirstLetterException) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: FirstLetterException) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: FirstLetterException) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: FirstLetterException) Index* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Index;

    PROCEDURE (this: FirstLetterException) Name* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 2)
    END Name;

    PROCEDURE (this: FirstLetterException) Delete* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 101, NIL);
    END Delete;


    (* ---------- TwoInitialCapsExceptions, dual, nonextensible ---------- *)

    PROCEDURE (this: TwoInitialCapsExceptions) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: TwoInitialCapsExceptions) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: TwoInitialCapsExceptions) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: TwoInitialCapsExceptions) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: TwoInitialCapsExceptions) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Count;

    PROCEDURE (this: TwoInitialCapsExceptions) Item* (Index: CtlT.Any): TwoInitialCapsException, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisTwoInitialCapsException(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: TwoInitialCapsExceptions) Add* (Name: ARRAY OF CHAR): TwoInitialCapsException, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.StrVar(Name, arg[0]);
        CtlC.CallParMethod(this, 101, arg, ret);
        RETURN ThisTwoInitialCapsException(CtlC.VarAny(ret))
    END Add;


    (* ---------- TwoInitialCapsException, dual, nonextensible ---------- *)

    PROCEDURE (this: TwoInitialCapsException) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: TwoInitialCapsException) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: TwoInitialCapsException) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: TwoInitialCapsException) Index* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Index;

    PROCEDURE (this: TwoInitialCapsException) Name* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 2)
    END Name;

    PROCEDURE (this: TwoInitialCapsException) Delete* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 101, NIL);
    END Delete;


    (* ---------- Footnotes, dual, nonextensible ---------- *)

    PROCEDURE (this: Footnotes) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: Footnotes) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Count;

    PROCEDURE (this: Footnotes) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Footnotes) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Footnotes) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Footnotes) Location* (): WdFootnoteLocation, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 100)
    END Location;

    PROCEDURE (this: Footnotes) PUTLocation* (p1: WdFootnoteLocation), NEW;
    BEGIN
        CtlC.PutInt(this, 100, p1)
    END PUTLocation;

    PROCEDURE (this: Footnotes) NumberStyle* (): WdNoteNumberStyle, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 101)
    END NumberStyle;

    PROCEDURE (this: Footnotes) PUTNumberStyle* (p1: WdNoteNumberStyle), NEW;
    BEGIN
        CtlC.PutInt(this, 101, p1)
    END PUTNumberStyle;

    PROCEDURE (this: Footnotes) StartingNumber* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 102)
    END StartingNumber;

    PROCEDURE (this: Footnotes) PUTStartingNumber* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 102, p1)
    END PUTStartingNumber;

    PROCEDURE (this: Footnotes) NumberingRule* (): WdNumberingRule, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 103)
    END NumberingRule;

    PROCEDURE (this: Footnotes) PUTNumberingRule* (p1: WdNumberingRule), NEW;
    BEGIN
        CtlC.PutInt(this, 103, p1)
    END PUTNumberingRule;

    PROCEDURE (this: Footnotes) Separator* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 104))
    END Separator;

    PROCEDURE (this: Footnotes) ContinuationSeparator* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 105))
    END ContinuationSeparator;

    PROCEDURE (this: Footnotes) ContinuationNotice* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 106))
    END ContinuationNotice;

    PROCEDURE (this: Footnotes) Item* (Index: INTEGER): Footnote, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisFootnote(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: Footnotes) Add* (range: Range; (* optional *) Reference: CtlT.Any; Text: CtlT.Any): Footnote, NEW;
        VAR arg: ARRAY 3 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.ObjVar(range, arg[2]);
        CtlC.AnyVar(Reference, arg[1]);
        CtlC.AnyVar(Text, arg[0]);
        CtlC.CallParMethod(this, 4, arg, ret);
        RETURN ThisFootnote(CtlC.VarAny(ret))
    END Add;

    PROCEDURE (this: Footnotes) Convert* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 5, NIL);
    END Convert;

    PROCEDURE (this: Footnotes) SwapWithEndnotes* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 6, NIL);
    END SwapWithEndnotes;

    PROCEDURE (this: Footnotes) ResetSeparator* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 7, NIL);
    END ResetSeparator;

    PROCEDURE (this: Footnotes) ResetContinuationSeparator* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 8, NIL);
    END ResetContinuationSeparator;

    PROCEDURE (this: Footnotes) ResetContinuationNotice* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 9, NIL);
    END ResetContinuationNotice;


    (* ---------- Endnotes, dual, nonextensible ---------- *)

    PROCEDURE (this: Endnotes) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: Endnotes) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Count;

    PROCEDURE (this: Endnotes) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Endnotes) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Endnotes) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Endnotes) Location* (): WdEndnoteLocation, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 100)
    END Location;

    PROCEDURE (this: Endnotes) PUTLocation* (p1: WdEndnoteLocation), NEW;
    BEGIN
        CtlC.PutInt(this, 100, p1)
    END PUTLocation;

    PROCEDURE (this: Endnotes) NumberStyle* (): WdNoteNumberStyle, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 101)
    END NumberStyle;

    PROCEDURE (this: Endnotes) PUTNumberStyle* (p1: WdNoteNumberStyle), NEW;
    BEGIN
        CtlC.PutInt(this, 101, p1)
    END PUTNumberStyle;

    PROCEDURE (this: Endnotes) StartingNumber* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 102)
    END StartingNumber;

    PROCEDURE (this: Endnotes) PUTStartingNumber* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 102, p1)
    END PUTStartingNumber;

    PROCEDURE (this: Endnotes) NumberingRule* (): WdNumberingRule, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 103)
    END NumberingRule;

    PROCEDURE (this: Endnotes) PUTNumberingRule* (p1: WdNumberingRule), NEW;
    BEGIN
        CtlC.PutInt(this, 103, p1)
    END PUTNumberingRule;

    PROCEDURE (this: Endnotes) Separator* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 104))
    END Separator;

    PROCEDURE (this: Endnotes) ContinuationSeparator* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 105))
    END ContinuationSeparator;

    PROCEDURE (this: Endnotes) ContinuationNotice* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 106))
    END ContinuationNotice;

    PROCEDURE (this: Endnotes) Item* (Index: INTEGER): Endnote, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisEndnote(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: Endnotes) Add* (range: Range; (* optional *) Reference: CtlT.Any; Text: CtlT.Any): Endnote, NEW;
        VAR arg: ARRAY 3 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.ObjVar(range, arg[2]);
        CtlC.AnyVar(Reference, arg[1]);
        CtlC.AnyVar(Text, arg[0]);
        CtlC.CallParMethod(this, 4, arg, ret);
        RETURN ThisEndnote(CtlC.VarAny(ret))
    END Add;

    PROCEDURE (this: Endnotes) Convert* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 5, NIL);
    END Convert;

    PROCEDURE (this: Endnotes) SwapWithFootnotes* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 6, NIL);
    END SwapWithFootnotes;

    PROCEDURE (this: Endnotes) ResetSeparator* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 7, NIL);
    END ResetSeparator;

    PROCEDURE (this: Endnotes) ResetContinuationSeparator* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 8, NIL);
    END ResetContinuationSeparator;

    PROCEDURE (this: Endnotes) ResetContinuationNotice* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 9, NIL);
    END ResetContinuationNotice;


    (* ---------- Comments, dual, nonextensible ---------- *)

    PROCEDURE (this: Comments) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: Comments) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Count;

    PROCEDURE (this: Comments) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Comments) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Comments) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Comments) ShowBy* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 1003)
    END ShowBy;

    PROCEDURE (this: Comments) PUTShowBy* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 1003, p1)
    END PUTShowBy;

    PROCEDURE (this: Comments) Item* (Index: INTEGER): Comment, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisComment(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: Comments) Add* (range: Range; (* optional *) Text: CtlT.Any): Comment, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.ObjVar(range, arg[1]);
        CtlC.AnyVar(Text, arg[0]);
        CtlC.CallParMethod(this, 4, arg, ret);
        RETURN ThisComment(CtlC.VarAny(ret))
    END Add;


    (* ---------- Footnote, dual, nonextensible ---------- *)

    PROCEDURE (this: Footnote) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Footnote) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Footnote) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Footnote) Range* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 4))
    END Range;

    PROCEDURE (this: Footnote) Reference* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 5))
    END Reference;

    PROCEDURE (this: Footnote) Index* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 6)
    END Index;

    PROCEDURE (this: Footnote) Delete* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 10, NIL);
    END Delete;


    (* ---------- Endnote, dual, nonextensible ---------- *)

    PROCEDURE (this: Endnote) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Endnote) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Endnote) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Endnote) Range* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 4))
    END Range;

    PROCEDURE (this: Endnote) Reference* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 5))
    END Reference;

    PROCEDURE (this: Endnote) Index* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 6)
    END Index;

    PROCEDURE (this: Endnote) Delete* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 10, NIL);
    END Delete;


    (* ---------- Comment, dual, nonextensible ---------- *)

    PROCEDURE (this: Comment) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Comment) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Comment) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Comment) Range* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 1003))
    END Range;

    PROCEDURE (this: Comment) Reference* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 1004))
    END Reference;

    PROCEDURE (this: Comment) Scope* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 1005))
    END Scope;

    PROCEDURE (this: Comment) Index* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1006)
    END Index;

    PROCEDURE (this: Comment) Author* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 1007)
    END Author;

    PROCEDURE (this: Comment) PUTAuthor* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 1007, p1)
    END PUTAuthor;

    PROCEDURE (this: Comment) Initial* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 1008)
    END Initial;

    PROCEDURE (this: Comment) PUTInitial* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 1008, p1)
    END PUTInitial;

    PROCEDURE (this: Comment) ShowTip* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 1009)
    END ShowTip;

    PROCEDURE (this: Comment) PUTShowTip* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 1009, p1)
    END PUTShowTip;

    PROCEDURE (this: Comment) Delete* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 10, NIL);
    END Delete;


    (* ---------- Borders, dual, nonextensible ---------- *)

    PROCEDURE (this: Borders) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Borders) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Borders) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Borders) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: Borders) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Count;

    PROCEDURE (this: Borders) Enable* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Enable;

    PROCEDURE (this: Borders) PUTEnable* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 2, p1)
    END PUTEnable;

    PROCEDURE (this: Borders) DistanceFromTop* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 4)
    END DistanceFromTop;

    PROCEDURE (this: Borders) PUTDistanceFromTop* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 4, p1)
    END PUTDistanceFromTop;

    PROCEDURE (this: Borders) Shadow* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 5)
    END Shadow;

    PROCEDURE (this: Borders) PUTShadow* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 5, p1)
    END PUTShadow;

    PROCEDURE (this: Borders) InsideLineStyle* (): WdLineStyle, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 6)
    END InsideLineStyle;

    PROCEDURE (this: Borders) PUTInsideLineStyle* (p1: WdLineStyle), NEW;
    BEGIN
        CtlC.PutInt(this, 6, p1)
    END PUTInsideLineStyle;

    PROCEDURE (this: Borders) OutsideLineStyle* (): WdLineStyle, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 7)
    END OutsideLineStyle;

    PROCEDURE (this: Borders) PUTOutsideLineStyle* (p1: WdLineStyle), NEW;
    BEGIN
        CtlC.PutInt(this, 7, p1)
    END PUTOutsideLineStyle;

    PROCEDURE (this: Borders) InsideLineWidth* (): WdLineWidth, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 8)
    END InsideLineWidth;

    PROCEDURE (this: Borders) PUTInsideLineWidth* (p1: WdLineWidth), NEW;
    BEGIN
        CtlC.PutInt(this, 8, p1)
    END PUTInsideLineWidth;

    PROCEDURE (this: Borders) OutsideLineWidth* (): WdLineWidth, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 9)
    END OutsideLineWidth;

    PROCEDURE (this: Borders) PUTOutsideLineWidth* (p1: WdLineWidth), NEW;
    BEGIN
        CtlC.PutInt(this, 9, p1)
    END PUTOutsideLineWidth;

    PROCEDURE (this: Borders) InsideColorIndex* (): WdColorIndex, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 10)
    END InsideColorIndex;

    PROCEDURE (this: Borders) PUTInsideColorIndex* (p1: WdColorIndex), NEW;
    BEGIN
        CtlC.PutInt(this, 10, p1)
    END PUTInsideColorIndex;

    PROCEDURE (this: Borders) OutsideColorIndex* (): WdColorIndex, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 11)
    END OutsideColorIndex;

    PROCEDURE (this: Borders) PUTOutsideColorIndex* (p1: WdColorIndex), NEW;
    BEGIN
        CtlC.PutInt(this, 11, p1)
    END PUTOutsideColorIndex;

    PROCEDURE (this: Borders) DistanceFromLeft* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 20)
    END DistanceFromLeft;

    PROCEDURE (this: Borders) PUTDistanceFromLeft* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 20, p1)
    END PUTDistanceFromLeft;

    PROCEDURE (this: Borders) DistanceFromBottom* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 21)
    END DistanceFromBottom;

    PROCEDURE (this: Borders) PUTDistanceFromBottom* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 21, p1)
    END PUTDistanceFromBottom;

    PROCEDURE (this: Borders) DistanceFromRight* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 22)
    END DistanceFromRight;

    PROCEDURE (this: Borders) PUTDistanceFromRight* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 22, p1)
    END PUTDistanceFromRight;

    PROCEDURE (this: Borders) AlwaysInFront* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 23)
    END AlwaysInFront;

    PROCEDURE (this: Borders) PUTAlwaysInFront* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 23, p1)
    END PUTAlwaysInFront;

    PROCEDURE (this: Borders) SurroundHeader* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 24)
    END SurroundHeader;

    PROCEDURE (this: Borders) PUTSurroundHeader* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 24, p1)
    END PUTSurroundHeader;

    PROCEDURE (this: Borders) SurroundFooter* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 25)
    END SurroundFooter;

    PROCEDURE (this: Borders) PUTSurroundFooter* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 25, p1)
    END PUTSurroundFooter;

    PROCEDURE (this: Borders) JoinBorders* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 26)
    END JoinBorders;

    PROCEDURE (this: Borders) PUTJoinBorders* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 26, p1)
    END PUTJoinBorders;

    PROCEDURE (this: Borders) HasHorizontal* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 27)
    END HasHorizontal;

    PROCEDURE (this: Borders) HasVertical* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 28)
    END HasVertical;

    PROCEDURE (this: Borders) DistanceFrom* (): WdBorderDistanceFrom, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 29)
    END DistanceFrom;

    PROCEDURE (this: Borders) PUTDistanceFrom* (p1: WdBorderDistanceFrom), NEW;
    BEGIN
        CtlC.PutInt(this, 29, p1)
    END PUTDistanceFrom;

    PROCEDURE (this: Borders) EnableFirstPageInSection* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 30)
    END EnableFirstPageInSection;

    PROCEDURE (this: Borders) PUTEnableFirstPageInSection* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 30, p1)
    END PUTEnableFirstPageInSection;

    PROCEDURE (this: Borders) EnableOtherPagesInSection* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 31)
    END EnableOtherPagesInSection;

    PROCEDURE (this: Borders) PUTEnableOtherPagesInSection* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 31, p1)
    END PUTEnableOtherPagesInSection;

    PROCEDURE (this: Borders) Item* (Index: WdBorderType): Border, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisBorder(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: Borders) ApplyPageBordersToAllSections* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 2000, NIL);
    END ApplyPageBordersToAllSections;


    (* ---------- Border, dual, nonextensible ---------- *)

    PROCEDURE (this: Border) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Border) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Border) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Border) Visible* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 0)
    END Visible;

    PROCEDURE (this: Border) PUTVisible* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 0, p1)
    END PUTVisible;

    PROCEDURE (this: Border) ColorIndex* (): WdColorIndex, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END ColorIndex;

    PROCEDURE (this: Border) PUTColorIndex* (p1: WdColorIndex), NEW;
    BEGIN
        CtlC.PutInt(this, 1, p1)
    END PUTColorIndex;

    PROCEDURE (this: Border) Inside* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 2)
    END Inside;

    PROCEDURE (this: Border) LineStyle* (): WdLineStyle, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 3)
    END LineStyle;

    PROCEDURE (this: Border) PUTLineStyle* (p1: WdLineStyle), NEW;
    BEGIN
        CtlC.PutInt(this, 3, p1)
    END PUTLineStyle;

    PROCEDURE (this: Border) LineWidth* (): WdLineWidth, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 4)
    END LineWidth;

    PROCEDURE (this: Border) PUTLineWidth* (p1: WdLineWidth), NEW;
    BEGIN
        CtlC.PutInt(this, 4, p1)
    END PUTLineWidth;

    PROCEDURE (this: Border) ArtStyle* (): WdPageBorderArt, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 5)
    END ArtStyle;

    PROCEDURE (this: Border) PUTArtStyle* (p1: WdPageBorderArt), NEW;
    BEGIN
        CtlC.PutInt(this, 5, p1)
    END PUTArtStyle;

    PROCEDURE (this: Border) ArtWidth* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 6)
    END ArtWidth;

    PROCEDURE (this: Border) PUTArtWidth* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 6, p1)
    END PUTArtWidth;


    (* ---------- Shading, dual, nonextensible ---------- *)

    PROCEDURE (this: Shading) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Shading) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Shading) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Shading) ForegroundPatternColorIndex* (): WdColorIndex, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END ForegroundPatternColorIndex;

    PROCEDURE (this: Shading) PUTForegroundPatternColorIndex* (p1: WdColorIndex), NEW;
    BEGIN
        CtlC.PutInt(this, 1, p1)
    END PUTForegroundPatternColorIndex;

    PROCEDURE (this: Shading) BackgroundPatternColorIndex* (): WdColorIndex, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END BackgroundPatternColorIndex;

    PROCEDURE (this: Shading) PUTBackgroundPatternColorIndex* (p1: WdColorIndex), NEW;
    BEGIN
        CtlC.PutInt(this, 2, p1)
    END PUTBackgroundPatternColorIndex;

    PROCEDURE (this: Shading) Texture* (): WdTextureIndex, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 3)
    END Texture;

    PROCEDURE (this: Shading) PUTTexture* (p1: WdTextureIndex), NEW;
    BEGIN
        CtlC.PutInt(this, 3, p1)
    END PUTTexture;


    (* ---------- TextRetrievalMode, dual, nonextensible ---------- *)

    PROCEDURE (this: TextRetrievalMode) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: TextRetrievalMode) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: TextRetrievalMode) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: TextRetrievalMode) ViewType* (): WdViewType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 0)
    END ViewType;

    PROCEDURE (this: TextRetrievalMode) PUTViewType* (p1: WdViewType), NEW;
    BEGIN
        CtlC.PutInt(this, 0, p1)
    END PUTViewType;

    PROCEDURE (this: TextRetrievalMode) Duplicate* (): TextRetrievalMode, NEW;
    BEGIN
        RETURN ThisTextRetrievalMode(CtlC.GetAny(this, 1))
    END Duplicate;

    PROCEDURE (this: TextRetrievalMode) IncludeHiddenText* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 2)
    END IncludeHiddenText;

    PROCEDURE (this: TextRetrievalMode) PUTIncludeHiddenText* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 2, p1)
    END PUTIncludeHiddenText;

    PROCEDURE (this: TextRetrievalMode) IncludeFieldCodes* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 3)
    END IncludeFieldCodes;

    PROCEDURE (this: TextRetrievalMode) PUTIncludeFieldCodes* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 3, p1)
    END PUTIncludeFieldCodes;


    (* ---------- AutoTextEntries, dual, nonextensible ---------- *)

    PROCEDURE (this: AutoTextEntries) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: AutoTextEntries) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: AutoTextEntries) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: AutoTextEntries) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: AutoTextEntries) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Count;

    PROCEDURE (this: AutoTextEntries) Item* (Index: CtlT.Any): AutoTextEntry, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisAutoTextEntry(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: AutoTextEntries) Add* (Name: ARRAY OF CHAR; range: Range): AutoTextEntry, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.StrVar(Name, arg[1]);
        CtlC.ObjVar(range, arg[0]);
        CtlC.CallParMethod(this, 101, arg, ret);
        RETURN ThisAutoTextEntry(CtlC.VarAny(ret))
    END Add;

    PROCEDURE (this: AutoTextEntries) AppendToSpike* (range: Range): AutoTextEntry, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.ObjVar(range, arg[0]);
        CtlC.CallParMethod(this, 102, arg, ret);
        RETURN ThisAutoTextEntry(CtlC.VarAny(ret))
    END AppendToSpike;


    (* ---------- AutoTextEntry, dual, nonextensible ---------- *)

    PROCEDURE (this: AutoTextEntry) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: AutoTextEntry) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: AutoTextEntry) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: AutoTextEntry) Index* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Index;

    PROCEDURE (this: AutoTextEntry) Name* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 2)
    END Name;

    PROCEDURE (this: AutoTextEntry) PUTName* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 2, p1)
    END PUTName;

    PROCEDURE (this: AutoTextEntry) StyleName* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 3)
    END StyleName;

    PROCEDURE (this: AutoTextEntry) Value* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 0)
    END Value;

    PROCEDURE (this: AutoTextEntry) PUTValue* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 0, p1)
    END PUTValue;

    PROCEDURE (this: AutoTextEntry) Delete* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 101, NIL);
    END Delete;

    PROCEDURE (this: AutoTextEntry) Insert* (Where: Range; (* optional *) RichText: CtlT.Any): Range, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.ObjVar(Where, arg[1]);
        CtlC.AnyVar(RichText, arg[0]);
        CtlC.CallParMethod(this, 102, arg, ret);
        RETURN ThisRange(CtlC.VarAny(ret))
    END Insert;


    (* ---------- System, dual, nonextensible ---------- *)

    PROCEDURE (this: System) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: System) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: System) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: System) OperatingSystem* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 1)
    END OperatingSystem;

    PROCEDURE (this: System) ProcessorType* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 2)
    END ProcessorType;

    PROCEDURE (this: System) Version* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 3)
    END Version;

    PROCEDURE (this: System) FreeDiskSpace* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 4)
    END FreeDiskSpace;

    PROCEDURE (this: System) Country* (): WdCountry, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 5)
    END Country;

    PROCEDURE (this: System) LanguageDesignation* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 6)
    END LanguageDesignation;

    PROCEDURE (this: System) HorizontalResolution* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 7)
    END HorizontalResolution;

    PROCEDURE (this: System) VerticalResolution* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 8)
    END VerticalResolution;

    PROCEDURE (this: System) ProfileString* (Section: ARRAY OF CHAR; Key: ARRAY OF CHAR): CtlT.Strg, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.StrVar(Section, arg[1]);
        CtlC.StrVar(Key, arg[0]);
        CtlC.CallGetMethod(this, 9, arg, ret);
        RETURN CtlC.VarStr(ret)
    END ProfileString;

    PROCEDURE (this: System) PUTProfileString* (Section: ARRAY OF CHAR; Key: ARRAY OF CHAR; p3: ARRAY OF CHAR), NEW;
        VAR arg: ARRAY 3 OF CtlT.Variant;
    BEGIN
        CtlC.StrVar(Section, arg[2]);
        CtlC.StrVar(Key, arg[1]);
        CtlC.StrVar(p3, arg[0]);
        CtlC.CallPutMethod(this, 9, arg, NIL);
    END PUTProfileString;

    PROCEDURE (this: System) PrivateProfileString* (FileName: ARRAY OF CHAR; Section: ARRAY OF CHAR; Key: ARRAY OF CHAR): CtlT.Strg, NEW;
        VAR arg: ARRAY 3 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.StrVar(FileName, arg[2]);
        CtlC.StrVar(Section, arg[1]);
        CtlC.StrVar(Key, arg[0]);
        CtlC.CallGetMethod(this, 10, arg, ret);
        RETURN CtlC.VarStr(ret)
    END PrivateProfileString;

    PROCEDURE (this: System) PUTPrivateProfileString* (FileName: ARRAY OF CHAR; Section: ARRAY OF CHAR; Key: ARRAY OF CHAR; p4: ARRAY OF CHAR), NEW;
        VAR arg: ARRAY 4 OF CtlT.Variant;
    BEGIN
        CtlC.StrVar(FileName, arg[3]);
        CtlC.StrVar(Section, arg[2]);
        CtlC.StrVar(Key, arg[1]);
        CtlC.StrVar(p4, arg[0]);
        CtlC.CallPutMethod(this, 10, arg, NIL);
    END PUTPrivateProfileString;

    PROCEDURE (this: System) MathCoprocessorInstalled* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 11)
    END MathCoprocessorInstalled;

    PROCEDURE (this: System) ComputerType* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 12)
    END ComputerType;

    PROCEDURE (this: System) MacintoshName* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 14)
    END MacintoshName;

    PROCEDURE (this: System) QuickDrawInstalled* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 15)
    END QuickDrawInstalled;

    PROCEDURE (this: System) Cursor* (): WdCursorType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 16)
    END Cursor;

    PROCEDURE (this: System) PUTCursor* (p1: WdCursorType), NEW;
    BEGIN
        CtlC.PutInt(this, 16, p1)
    END PUTCursor;

    PROCEDURE (this: System) MSInfo* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 101, NIL);
    END MSInfo;

    PROCEDURE (this: System) Connect* (Path: ARRAY OF CHAR; (* optional *) Drive: CtlT.Any; Password: CtlT.Any), NEW;
        VAR arg: ARRAY 3 OF CtlT.Variant;
    BEGIN
        CtlC.StrVar(Path, arg[2]);
        CtlC.AnyVar(Drive, arg[1]);
        CtlC.AnyVar(Password, arg[0]);
        CtlC.CallParMethod(this, 102, arg, NIL);
    END Connect;


    (* ---------- OLEFormat, dual, nonextensible ---------- *)

    PROCEDURE (this: OLEFormat) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: OLEFormat) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: OLEFormat) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: OLEFormat) ClassType* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 2)
    END ClassType;

    PROCEDURE (this: OLEFormat) PUTClassType* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 2, p1)
    END PUTClassType;

    PROCEDURE (this: OLEFormat) DisplayAsIcon* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 3)
    END DisplayAsIcon;

    PROCEDURE (this: OLEFormat) PUTDisplayAsIcon* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 3, p1)
    END PUTDisplayAsIcon;

    PROCEDURE (this: OLEFormat) IconName* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 7)
    END IconName;

    PROCEDURE (this: OLEFormat) PUTIconName* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 7, p1)
    END PUTIconName;

    PROCEDURE (this: OLEFormat) IconPath* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 8)
    END IconPath;

    PROCEDURE (this: OLEFormat) IconIndex* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 9)
    END IconIndex;

    PROCEDURE (this: OLEFormat) PUTIconIndex* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 9, p1)
    END PUTIconIndex;

    PROCEDURE (this: OLEFormat) IconLabel* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 10)
    END IconLabel;

    PROCEDURE (this: OLEFormat) PUTIconLabel* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 10, p1)
    END PUTIconLabel;

    PROCEDURE (this: OLEFormat) Label* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 12)
    END Label;

    PROCEDURE (this: OLEFormat) Object* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 14)
    END Object;

    PROCEDURE (this: OLEFormat) ProgID* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 22)
    END ProgID;

    PROCEDURE (this: OLEFormat) Activate* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 104, NIL);
    END Activate;

    PROCEDURE (this: OLEFormat) Edit* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 106, NIL);
    END Edit;

    PROCEDURE (this: OLEFormat) Open* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 107, NIL);
    END Open;

    PROCEDURE (this: OLEFormat) DoVerb* ((* optional *) VerbIndex: CtlT.Any), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(VerbIndex, arg[0]);
        CtlC.CallParMethod(this, 109, arg, NIL);
    END DoVerb;

    PROCEDURE (this: OLEFormat) ConvertTo* ((* optional *) ClassType: CtlT.Any; DisplayAsIcon: CtlT.Any; IconFileName: CtlT.Any; IconIndex: CtlT.Any; IconLabel: CtlT.Any), NEW;
        VAR arg: ARRAY 5 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(ClassType, arg[4]);
        CtlC.AnyVar(DisplayAsIcon, arg[3]);
        CtlC.AnyVar(IconFileName, arg[2]);
        CtlC.AnyVar(IconIndex, arg[1]);
        CtlC.AnyVar(IconLabel, arg[0]);
        CtlC.CallParMethod(this, 110, arg, NIL);
    END ConvertTo;

    PROCEDURE (this: OLEFormat) ActivateAs* (ClassType: ARRAY OF CHAR), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.StrVar(ClassType, arg[0]);
        CtlC.CallParMethod(this, 111, arg, NIL);
    END ActivateAs;


    (* ---------- LinkFormat, dual, nonextensible ---------- *)

    PROCEDURE (this: LinkFormat) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: LinkFormat) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: LinkFormat) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: LinkFormat) AutoUpdate* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 1)
    END AutoUpdate;

    PROCEDURE (this: LinkFormat) PUTAutoUpdate* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 1, p1)
    END PUTAutoUpdate;

    PROCEDURE (this: LinkFormat) SourceName* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 4)
    END SourceName;

    PROCEDURE (this: LinkFormat) SourcePath* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 5)
    END SourcePath;

    PROCEDURE (this: LinkFormat) Locked* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 13)
    END Locked;

    PROCEDURE (this: LinkFormat) PUTLocked* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 13, p1)
    END PUTLocked;

    PROCEDURE (this: LinkFormat) Type* (): WdLinkType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 16)
    END Type;

    PROCEDURE (this: LinkFormat) SourceFullName* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 21)
    END SourceFullName;

    PROCEDURE (this: LinkFormat) PUTSourceFullName* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 21, p1)
    END PUTSourceFullName;

    PROCEDURE (this: LinkFormat) SavePictureWithDocument* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 22)
    END SavePictureWithDocument;

    PROCEDURE (this: LinkFormat) PUTSavePictureWithDocument* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 22, p1)
    END PUTSavePictureWithDocument;

    PROCEDURE (this: LinkFormat) BreakLink* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 104, NIL);
    END BreakLink;

    PROCEDURE (this: LinkFormat) Update* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 105, NIL);
    END Update;


    (* ---------- _OLEControl, hidden, dual ---------- *)

    PROCEDURE (this: _OLEControl) Left* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, -2147417853)
    END Left;

    PROCEDURE (this: _OLEControl) PUTLeft* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, -2147417853, p1)
    END PUTLeft;

    PROCEDURE (this: _OLEControl) Top* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, -2147417852)
    END Top;

    PROCEDURE (this: _OLEControl) PUTTop* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, -2147417852, p1)
    END PUTTop;

    PROCEDURE (this: _OLEControl) Height* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, -2147417851)
    END Height;

    PROCEDURE (this: _OLEControl) PUTHeight* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, -2147417851, p1)
    END PUTHeight;

    PROCEDURE (this: _OLEControl) Width* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, -2147417850)
    END Width;

    PROCEDURE (this: _OLEControl) PUTWidth* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, -2147417850, p1)
    END PUTWidth;

    PROCEDURE (this: _OLEControl) Name* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, -2147418112)
    END Name;

    PROCEDURE (this: _OLEControl) PUTName* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, -2147418112, p1)
    END PUTName;

    PROCEDURE (this: _OLEControl) Automation* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, -2147417849)
    END Automation;

    PROCEDURE (this: _OLEControl) Select* (), NEW;
    BEGIN
        CtlC.CallMethod(this, -2147417568, NIL);
    END Select;

    PROCEDURE (this: _OLEControl) Copy* (), NEW;
    BEGIN
        CtlC.CallMethod(this, -2147417560, NIL);
    END Copy;

    PROCEDURE (this: _OLEControl) Cut* (), NEW;
    BEGIN
        CtlC.CallMethod(this, -2147417559, NIL);
    END Cut;

    PROCEDURE (this: _OLEControl) Delete* (), NEW;
    BEGIN
        CtlC.CallMethod(this, -2147417520, NIL);
    END Delete;

    PROCEDURE (this: _OLEControl) Activate* (), NEW;
    BEGIN
        CtlC.CallMethod(this, -2147417519, NIL);
    END Activate;


    (* ---------- Fields, dual, nonextensible ---------- *)

    PROCEDURE (this: Fields) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Fields) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Fields) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Fields) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Count;

    PROCEDURE (this: Fields) Locked* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Locked;

    PROCEDURE (this: Fields) PUTLocked* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 2, p1)
    END PUTLocked;

    PROCEDURE (this: Fields) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: Fields) Item* (Index: INTEGER): Field, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisField(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: Fields) ToggleShowCodes* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 100, NIL);
    END ToggleShowCodes;

    PROCEDURE (this: Fields) Update* (): INTEGER, NEW;
        VAR ret: CtlT.Variant;
    BEGIN
        CtlC.CallMethod(this, 101, ret);
        RETURN CtlC.VarInt(ret)
    END Update;

    PROCEDURE (this: Fields) Unlink* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 102, NIL);
    END Unlink;

    PROCEDURE (this: Fields) UpdateSource* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 104, NIL);
    END UpdateSource;

    PROCEDURE (this: Fields) Add* (range: Range; (* optional *) Type: CtlT.Any; Text: CtlT.Any; PreserveFormatting: CtlT.Any): Field, NEW;
        VAR arg: ARRAY 4 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.ObjVar(range, arg[3]);
        CtlC.AnyVar(Type, arg[2]);
        CtlC.AnyVar(Text, arg[1]);
        CtlC.AnyVar(PreserveFormatting, arg[0]);
        CtlC.CallParMethod(this, 105, arg, ret);
        RETURN ThisField(CtlC.VarAny(ret))
    END Add;


    (* ---------- Field, dual, nonextensible ---------- *)

    PROCEDURE (this: Field) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Field) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Field) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Field) Code* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 0))
    END Code;

    PROCEDURE (this: Field) PUTCode* (p1: Range), NEW;
    BEGIN
        CtlC.PutObj(this, 0, p1)
    END PUTCode;

    PROCEDURE (this: Field) Type* (): WdFieldType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Type;

    PROCEDURE (this: Field) Locked* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 2)
    END Locked;

    PROCEDURE (this: Field) PUTLocked* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 2, p1)
    END PUTLocked;

    PROCEDURE (this: Field) Kind* (): WdFieldKind, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 3)
    END Kind;

    PROCEDURE (this: Field) Result* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 4))
    END Result;

    PROCEDURE (this: Field) PUTResult* (p1: Range), NEW;
    BEGIN
        CtlC.PutObj(this, 4, p1)
    END PUTResult;

    PROCEDURE (this: Field) Data* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 5)
    END Data;

    PROCEDURE (this: Field) PUTData* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 5, p1)
    END PUTData;

    PROCEDURE (this: Field) Next* (): Field, NEW;
    BEGIN
        RETURN ThisField(CtlC.GetAny(this, 6))
    END Next;

    PROCEDURE (this: Field) Previous* (): Field, NEW;
    BEGIN
        RETURN ThisField(CtlC.GetAny(this, 7))
    END Previous;

    PROCEDURE (this: Field) Index* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 8)
    END Index;

    PROCEDURE (this: Field) ShowCodes* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 9)
    END ShowCodes;

    PROCEDURE (this: Field) PUTShowCodes* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 9, p1)
    END PUTShowCodes;

    PROCEDURE (this: Field) LinkFormat* (): LinkFormat, NEW;
    BEGIN
        RETURN ThisLinkFormat(CtlC.GetAny(this, 10))
    END LinkFormat;

    PROCEDURE (this: Field) OLEFormat* (): OLEFormat, NEW;
    BEGIN
        RETURN ThisOLEFormat(CtlC.GetAny(this, 11))
    END OLEFormat;

    PROCEDURE (this: Field) InlineShape* (): InlineShape, NEW;
    BEGIN
        RETURN ThisInlineShape(CtlC.GetAny(this, 12))
    END InlineShape;

    PROCEDURE (this: Field) Select* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 65535, NIL);
    END Select;

    PROCEDURE (this: Field) Update* (): BOOLEAN, NEW;
        VAR ret: CtlT.Variant;
    BEGIN
        CtlC.CallMethod(this, 101, ret);
        RETURN CtlC.VarBool(ret)
    END Update;

    PROCEDURE (this: Field) Unlink* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 102, NIL);
    END Unlink;

    PROCEDURE (this: Field) UpdateSource* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 103, NIL);
    END UpdateSource;

    PROCEDURE (this: Field) DoClick* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 104, NIL);
    END DoClick;

    PROCEDURE (this: Field) Copy* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 105, NIL);
    END Copy;

    PROCEDURE (this: Field) Cut* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 106, NIL);
    END Cut;

    PROCEDURE (this: Field) Delete* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 107, NIL);
    END Delete;


    (* ---------- Browser, dual, nonextensible ---------- *)

    PROCEDURE (this: Browser) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Browser) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Browser) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Browser) Target* (): WdBrowseTarget, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Target;

    PROCEDURE (this: Browser) PUTTarget* (p1: WdBrowseTarget), NEW;
    BEGIN
        CtlC.PutInt(this, 1, p1)
    END PUTTarget;

    PROCEDURE (this: Browser) Next* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 101, NIL);
    END Next;

    PROCEDURE (this: Browser) Previous* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 102, NIL);
    END Previous;


    (* ---------- Styles, dual, nonextensible ---------- *)

    PROCEDURE (this: Styles) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Styles) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Styles) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Styles) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: Styles) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Count;

    PROCEDURE (this: Styles) Item* (Index: CtlT.Any): Style, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisStyle(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: Styles) Add* (Name: ARRAY OF CHAR; (* optional *) Type: CtlT.Any): Style, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.StrVar(Name, arg[1]);
        CtlC.AnyVar(Type, arg[0]);
        CtlC.CallParMethod(this, 100, arg, ret);
        RETURN ThisStyle(CtlC.VarAny(ret))
    END Add;


    (* ---------- Style, dual, nonextensible ---------- *)

    PROCEDURE (this: Style) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Style) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Style) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Style) NameLocal* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 0)
    END NameLocal;

    PROCEDURE (this: Style) PUTNameLocal* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 0, p1)
    END PUTNameLocal;

    PROCEDURE (this: Style) BaseStyle* (): CtlT.Any, NEW;
    BEGIN
        RETURN CtlC.GetAny(this, 1)
    END BaseStyle;

    PROCEDURE (this: Style) PUTBaseStyle* (p1: CtlT.Any), NEW;
    BEGIN
        CtlC.PutAny(this, 1, p1)
    END PUTBaseStyle;

    PROCEDURE (this: Style) Description* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 2)
    END Description;

    PROCEDURE (this: Style) Type* (): WdStyleType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 3)
    END Type;

    PROCEDURE (this: Style) BuiltIn* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 4)
    END BuiltIn;

    PROCEDURE (this: Style) NextParagraphStyle* (): CtlT.Any, NEW;
    BEGIN
        RETURN CtlC.GetAny(this, 5)
    END NextParagraphStyle;

    PROCEDURE (this: Style) PUTNextParagraphStyle* (p1: CtlT.Any), NEW;
    BEGIN
        CtlC.PutAny(this, 5, p1)
    END PUTNextParagraphStyle;

    PROCEDURE (this: Style) InUse* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 6)
    END InUse;

    PROCEDURE (this: Style) Shading* (): Shading, NEW;
    BEGIN
        RETURN ThisShading(CtlC.GetAny(this, 7))
    END Shading;

    PROCEDURE (this: Style) Borders* (): Borders, NEW;
    BEGIN
        RETURN ThisBorders(CtlC.GetAny(this, 8))
    END Borders;

    PROCEDURE (this: Style) PUTBorders* (p1: Borders), NEW;
    BEGIN
        CtlC.PutObj(this, 8, p1)
    END PUTBorders;

    PROCEDURE (this: Style) ParagraphFormat* (): ParagraphFormat, NEW;
    BEGIN
        RETURN This_ParagraphFormat(CtlC.GetAny(this, 9))
    END ParagraphFormat;

    PROCEDURE (this: Style) PUTParagraphFormat* (p1: ParagraphFormat), NEW;
    BEGIN
        CtlC.PutObj(this, 9, p1)
    END PUTParagraphFormat;

    PROCEDURE (this: Style) Font* (): Font, NEW;
    BEGIN
        RETURN This_Font(CtlC.GetAny(this, 10))
    END Font;

    PROCEDURE (this: Style) PUTFont* (p1: Font), NEW;
    BEGIN
        CtlC.PutObj(this, 10, p1)
    END PUTFont;

    PROCEDURE (this: Style) Frame* (): Frame, NEW;
    BEGIN
        RETURN ThisFrame(CtlC.GetAny(this, 11))
    END Frame;

    PROCEDURE (this: Style) LanguageID* (): WdLanguageID, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 12)
    END LanguageID;

    PROCEDURE (this: Style) PUTLanguageID* (p1: WdLanguageID), NEW;
    BEGIN
        CtlC.PutInt(this, 12, p1)
    END PUTLanguageID;

    PROCEDURE (this: Style) AutomaticallyUpdate* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 13)
    END AutomaticallyUpdate;

    PROCEDURE (this: Style) PUTAutomaticallyUpdate* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 13, p1)
    END PUTAutomaticallyUpdate;

    PROCEDURE (this: Style) ListTemplate* (): ListTemplate, NEW;
    BEGIN
        RETURN ThisListTemplate(CtlC.GetAny(this, 14))
    END ListTemplate;

    PROCEDURE (this: Style) ListLevelNumber* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 15)
    END ListLevelNumber;

    PROCEDURE (this: Style) LanguageIDFarEast* (): WdLanguageID, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 16)
    END LanguageIDFarEast;

    PROCEDURE (this: Style) PUTLanguageIDFarEast* (p1: WdLanguageID), NEW;
    BEGIN
        CtlC.PutInt(this, 16, p1)
    END PUTLanguageIDFarEast;

    PROCEDURE (this: Style) Hidden* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 17)
    END Hidden;

    PROCEDURE (this: Style) PUTHidden* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 17, p1)
    END PUTHidden;

    PROCEDURE (this: Style) Delete* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 100, NIL);
    END Delete;

    PROCEDURE (this: Style) LinkToListTemplate* (listTemplate: ListTemplate; (* optional *) ListLevelNumber: CtlT.Any), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.ObjVar(listTemplate, arg[1]);
        CtlC.AnyVar(ListLevelNumber, arg[0]);
        CtlC.CallParMethod(this, 101, arg, NIL);
    END LinkToListTemplate;


    (* ---------- Frames, dual, nonextensible ---------- *)

    PROCEDURE (this: Frames) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Frames) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Frames) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Frames) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: Frames) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Count;

    PROCEDURE (this: Frames) Item* (Index: INTEGER): Frame, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisFrame(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: Frames) Add* (range: Range): Frame, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.ObjVar(range, arg[0]);
        CtlC.CallParMethod(this, 100, arg, ret);
        RETURN ThisFrame(CtlC.VarAny(ret))
    END Add;

    PROCEDURE (this: Frames) Delete* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 101, NIL);
    END Delete;


    (* ---------- Frame, dual, nonextensible ---------- *)

    PROCEDURE (this: Frame) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Frame) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Frame) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Frame) HeightRule* (): WdFrameSizeRule, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END HeightRule;

    PROCEDURE (this: Frame) PUTHeightRule* (p1: WdFrameSizeRule), NEW;
    BEGIN
        CtlC.PutInt(this, 1, p1)
    END PUTHeightRule;

    PROCEDURE (this: Frame) WidthRule* (): WdFrameSizeRule, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END WidthRule;

    PROCEDURE (this: Frame) PUTWidthRule* (p1: WdFrameSizeRule), NEW;
    BEGIN
        CtlC.PutInt(this, 2, p1)
    END PUTWidthRule;

    PROCEDURE (this: Frame) HorizontalDistanceFromText* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 3)
    END HorizontalDistanceFromText;

    PROCEDURE (this: Frame) PUTHorizontalDistanceFromText* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 3, p1)
    END PUTHorizontalDistanceFromText;

    PROCEDURE (this: Frame) Height* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 4)
    END Height;

    PROCEDURE (this: Frame) PUTHeight* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 4, p1)
    END PUTHeight;

    PROCEDURE (this: Frame) HorizontalPosition* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 5)
    END HorizontalPosition;

    PROCEDURE (this: Frame) PUTHorizontalPosition* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 5, p1)
    END PUTHorizontalPosition;

    PROCEDURE (this: Frame) LockAnchor* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 6)
    END LockAnchor;

    PROCEDURE (this: Frame) PUTLockAnchor* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 6, p1)
    END PUTLockAnchor;

    PROCEDURE (this: Frame) RelativeHorizontalPosition* (): WdRelativeHorizontalPosition, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 7)
    END RelativeHorizontalPosition;

    PROCEDURE (this: Frame) PUTRelativeHorizontalPosition* (p1: WdRelativeHorizontalPosition), NEW;
    BEGIN
        CtlC.PutInt(this, 7, p1)
    END PUTRelativeHorizontalPosition;

    PROCEDURE (this: Frame) RelativeVerticalPosition* (): WdRelativeVerticalPosition, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 8)
    END RelativeVerticalPosition;

    PROCEDURE (this: Frame) PUTRelativeVerticalPosition* (p1: WdRelativeVerticalPosition), NEW;
    BEGIN
        CtlC.PutInt(this, 8, p1)
    END PUTRelativeVerticalPosition;

    PROCEDURE (this: Frame) VerticalDistanceFromText* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 9)
    END VerticalDistanceFromText;

    PROCEDURE (this: Frame) PUTVerticalDistanceFromText* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 9, p1)
    END PUTVerticalDistanceFromText;

    PROCEDURE (this: Frame) VerticalPosition* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 10)
    END VerticalPosition;

    PROCEDURE (this: Frame) PUTVerticalPosition* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 10, p1)
    END PUTVerticalPosition;

    PROCEDURE (this: Frame) Width* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 11)
    END Width;

    PROCEDURE (this: Frame) PUTWidth* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 11, p1)
    END PUTWidth;

    PROCEDURE (this: Frame) TextWrap* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 12)
    END TextWrap;

    PROCEDURE (this: Frame) PUTTextWrap* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 12, p1)
    END PUTTextWrap;

    PROCEDURE (this: Frame) Shading* (): Shading, NEW;
    BEGIN
        RETURN ThisShading(CtlC.GetAny(this, 13))
    END Shading;

    PROCEDURE (this: Frame) Borders* (): Borders, NEW;
    BEGIN
        RETURN ThisBorders(CtlC.GetAny(this, 1100))
    END Borders;

    PROCEDURE (this: Frame) PUTBorders* (p1: Borders), NEW;
    BEGIN
        CtlC.PutObj(this, 1100, p1)
    END PUTBorders;

    PROCEDURE (this: Frame) Range* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 15))
    END Range;

    PROCEDURE (this: Frame) Delete* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 100, NIL);
    END Delete;

    PROCEDURE (this: Frame) Select* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 65535, NIL);
    END Select;

    PROCEDURE (this: Frame) Copy* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 101, NIL);
    END Copy;

    PROCEDURE (this: Frame) Cut* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 102, NIL);
    END Cut;


    (* ---------- FormFields, dual, nonextensible ---------- *)

    PROCEDURE (this: FormFields) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: FormFields) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: FormFields) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: FormFields) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Count;

    PROCEDURE (this: FormFields) Shaded* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 2)
    END Shaded;

    PROCEDURE (this: FormFields) PUTShaded* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 2, p1)
    END PUTShaded;

    PROCEDURE (this: FormFields) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: FormFields) Item* (Index: CtlT.Any): FormField, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisFormField(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: FormFields) Add* (range: Range; Type: WdFieldType): FormField, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.ObjVar(range, arg[1]);
        CtlC.IntVar(Type, arg[0]);
        CtlC.CallParMethod(this, 101, arg, ret);
        RETURN ThisFormField(CtlC.VarAny(ret))
    END Add;


    (* ---------- FormField, dual, nonextensible ---------- *)

    PROCEDURE (this: FormField) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: FormField) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: FormField) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: FormField) Type* (): WdFieldType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 0)
    END Type;

    PROCEDURE (this: FormField) Name* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 2)
    END Name;

    PROCEDURE (this: FormField) PUTName* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 2, p1)
    END PUTName;

    PROCEDURE (this: FormField) EntryMacro* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 3)
    END EntryMacro;

    PROCEDURE (this: FormField) PUTEntryMacro* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 3, p1)
    END PUTEntryMacro;

    PROCEDURE (this: FormField) ExitMacro* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 4)
    END ExitMacro;

    PROCEDURE (this: FormField) PUTExitMacro* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 4, p1)
    END PUTExitMacro;

    PROCEDURE (this: FormField) OwnHelp* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 5)
    END OwnHelp;

    PROCEDURE (this: FormField) PUTOwnHelp* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 5, p1)
    END PUTOwnHelp;

    PROCEDURE (this: FormField) OwnStatus* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 6)
    END OwnStatus;

    PROCEDURE (this: FormField) PUTOwnStatus* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 6, p1)
    END PUTOwnStatus;

    PROCEDURE (this: FormField) HelpText* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 7)
    END HelpText;

    PROCEDURE (this: FormField) PUTHelpText* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 7, p1)
    END PUTHelpText;

    PROCEDURE (this: FormField) StatusText* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 8)
    END StatusText;

    PROCEDURE (this: FormField) PUTStatusText* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 8, p1)
    END PUTStatusText;

    PROCEDURE (this: FormField) Enabled* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 9)
    END Enabled;

    PROCEDURE (this: FormField) PUTEnabled* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 9, p1)
    END PUTEnabled;

    PROCEDURE (this: FormField) Result* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 10)
    END Result;

    PROCEDURE (this: FormField) PUTResult* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 10, p1)
    END PUTResult;

    PROCEDURE (this: FormField) TextInput* (): TextInput, NEW;
    BEGIN
        RETURN ThisTextInput(CtlC.GetAny(this, 11))
    END TextInput;

    PROCEDURE (this: FormField) CheckBox* (): CheckBox, NEW;
    BEGIN
        RETURN ThisCheckBox(CtlC.GetAny(this, 12))
    END CheckBox;

    PROCEDURE (this: FormField) DropDown* (): DropDown, NEW;
    BEGIN
        RETURN ThisDropDown(CtlC.GetAny(this, 13))
    END DropDown;

    PROCEDURE (this: FormField) Next* (): FormField, NEW;
    BEGIN
        RETURN ThisFormField(CtlC.GetAny(this, 14))
    END Next;

    PROCEDURE (this: FormField) Previous* (): FormField, NEW;
    BEGIN
        RETURN ThisFormField(CtlC.GetAny(this, 15))
    END Previous;

    PROCEDURE (this: FormField) CalculateOnExit* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 16)
    END CalculateOnExit;

    PROCEDURE (this: FormField) PUTCalculateOnExit* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 16, p1)
    END PUTCalculateOnExit;

    PROCEDURE (this: FormField) Range* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 17))
    END Range;

    PROCEDURE (this: FormField) Select* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 65535, NIL);
    END Select;

    PROCEDURE (this: FormField) Copy* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 101, NIL);
    END Copy;

    PROCEDURE (this: FormField) Cut* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 102, NIL);
    END Cut;

    PROCEDURE (this: FormField) Delete* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 103, NIL);
    END Delete;


    (* ---------- TextInput, dual, nonextensible ---------- *)

    PROCEDURE (this: TextInput) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: TextInput) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: TextInput) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: TextInput) Valid* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 0)
    END Valid;

    PROCEDURE (this: TextInput) Default* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 1)
    END Default;

    PROCEDURE (this: TextInput) PUTDefault* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 1, p1)
    END PUTDefault;

    PROCEDURE (this: TextInput) Type* (): WdTextFormFieldType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Type;

    PROCEDURE (this: TextInput) Format* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 3)
    END Format;

    PROCEDURE (this: TextInput) Width* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 4)
    END Width;

    PROCEDURE (this: TextInput) PUTWidth* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 4, p1)
    END PUTWidth;

    PROCEDURE (this: TextInput) Clear* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 101, NIL);
    END Clear;

    PROCEDURE (this: TextInput) EditType* (Type: WdTextFormFieldType; (* optional *) Default: CtlT.Any; Format: CtlT.Any; Enabled: CtlT.Any), NEW;
        VAR arg: ARRAY 4 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(Type, arg[3]);
        CtlC.AnyVar(Default, arg[2]);
        CtlC.AnyVar(Format, arg[1]);
        CtlC.AnyVar(Enabled, arg[0]);
        CtlC.CallParMethod(this, 102, arg, NIL);
    END EditType;


    (* ---------- CheckBox, dual, nonextensible ---------- *)

    PROCEDURE (this: CheckBox) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: CheckBox) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: CheckBox) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: CheckBox) Valid* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 0)
    END Valid;

    PROCEDURE (this: CheckBox) AutoSize* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 1)
    END AutoSize;

    PROCEDURE (this: CheckBox) PUTAutoSize* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 1, p1)
    END PUTAutoSize;

    PROCEDURE (this: CheckBox) Size* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 2)
    END Size;

    PROCEDURE (this: CheckBox) PUTSize* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 2, p1)
    END PUTSize;

    PROCEDURE (this: CheckBox) Default* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 3)
    END Default;

    PROCEDURE (this: CheckBox) PUTDefault* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 3, p1)
    END PUTDefault;

    PROCEDURE (this: CheckBox) Value* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 4)
    END Value;

    PROCEDURE (this: CheckBox) PUTValue* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 4, p1)
    END PUTValue;


    (* ---------- DropDown, dual, nonextensible ---------- *)

    PROCEDURE (this: DropDown) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: DropDown) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: DropDown) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: DropDown) Valid* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 0)
    END Valid;

    PROCEDURE (this: DropDown) Default* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Default;

    PROCEDURE (this: DropDown) PUTDefault* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 1, p1)
    END PUTDefault;

    PROCEDURE (this: DropDown) Value* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Value;

    PROCEDURE (this: DropDown) PUTValue* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 2, p1)
    END PUTValue;

    PROCEDURE (this: DropDown) ListEntries* (): ListEntries, NEW;
    BEGIN
        RETURN ThisListEntries(CtlC.GetAny(this, 3))
    END ListEntries;


    (* ---------- ListEntries, dual, nonextensible ---------- *)

    PROCEDURE (this: ListEntries) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: ListEntries) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: ListEntries) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: ListEntries) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: ListEntries) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Count;

    PROCEDURE (this: ListEntries) Item* (Index: CtlT.Any): ListEntry, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisListEntry(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: ListEntries) Add* (Name: ARRAY OF CHAR; (* optional *) Index: CtlT.Any): ListEntry, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.StrVar(Name, arg[1]);
        CtlC.AnyVar(Index, arg[0]);
        CtlC.CallParMethod(this, 101, arg, ret);
        RETURN ThisListEntry(CtlC.VarAny(ret))
    END Add;

    PROCEDURE (this: ListEntries) Clear* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 102, NIL);
    END Clear;


    (* ---------- ListEntry, dual, nonextensible ---------- *)

    PROCEDURE (this: ListEntry) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: ListEntry) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: ListEntry) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: ListEntry) Index* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Index;

    PROCEDURE (this: ListEntry) Name* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 2)
    END Name;

    PROCEDURE (this: ListEntry) PUTName* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 2, p1)
    END PUTName;

    PROCEDURE (this: ListEntry) Delete* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 11, NIL);
    END Delete;


    (* ---------- TablesOfFigures, dual, nonextensible ---------- *)

    PROCEDURE (this: TablesOfFigures) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: TablesOfFigures) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: TablesOfFigures) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: TablesOfFigures) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: TablesOfFigures) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Count;

    PROCEDURE (this: TablesOfFigures) Format* (): WdTofFormat, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Format;

    PROCEDURE (this: TablesOfFigures) PUTFormat* (p1: WdTofFormat), NEW;
    BEGIN
        CtlC.PutInt(this, 2, p1)
    END PUTFormat;

    PROCEDURE (this: TablesOfFigures) Item* (Index: INTEGER): TableOfFigures, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisTableOfFigures(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: TablesOfFigures) Add* (range: Range; (* optional *) Caption: CtlT.Any; IncludeLabel: CtlT.Any; UseHeadingStyles: CtlT.Any; UpperHeadingLevel: CtlT.Any; LowerHeadingLevel: CtlT.Any; UseFields: CtlT.Any; TableID: CtlT.Any; RightAlignPageNumbers: CtlT.Any; IncludePageNumbers: CtlT.Any; AddedStyles: CtlT.Any): TableOfFigures, NEW;
        VAR arg: ARRAY 11 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.ObjVar(range, arg[10]);
        CtlC.AnyVar(Caption, arg[9]);
        CtlC.AnyVar(IncludeLabel, arg[8]);
        CtlC.AnyVar(UseHeadingStyles, arg[7]);
        CtlC.AnyVar(UpperHeadingLevel, arg[6]);
        CtlC.AnyVar(LowerHeadingLevel, arg[5]);
        CtlC.AnyVar(UseFields, arg[4]);
        CtlC.AnyVar(TableID, arg[3]);
        CtlC.AnyVar(RightAlignPageNumbers, arg[2]);
        CtlC.AnyVar(IncludePageNumbers, arg[1]);
        CtlC.AnyVar(AddedStyles, arg[0]);
        CtlC.CallParMethod(this, 100, arg, ret);
        RETURN ThisTableOfFigures(CtlC.VarAny(ret))
    END Add;

    PROCEDURE (this: TablesOfFigures) MarkEntry* (range: Range; (* optional *) Entry: CtlT.Any; EntryAutoText: CtlT.Any; TableID: CtlT.Any; Level: CtlT.Any): Field, NEW;
        VAR arg: ARRAY 5 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.ObjVar(range, arg[4]);
        CtlC.AnyVar(Entry, arg[3]);
        CtlC.AnyVar(EntryAutoText, arg[2]);
        CtlC.AnyVar(TableID, arg[1]);
        CtlC.AnyVar(Level, arg[0]);
        CtlC.CallParMethod(this, 101, arg, ret);
        RETURN ThisField(CtlC.VarAny(ret))
    END MarkEntry;


    (* ---------- TableOfFigures, dual, nonextensible ---------- *)

    PROCEDURE (this: TableOfFigures) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: TableOfFigures) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: TableOfFigures) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: TableOfFigures) Caption* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 1)
    END Caption;

    PROCEDURE (this: TableOfFigures) PUTCaption* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 1, p1)
    END PUTCaption;

    PROCEDURE (this: TableOfFigures) IncludeLabel* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 2)
    END IncludeLabel;

    PROCEDURE (this: TableOfFigures) PUTIncludeLabel* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 2, p1)
    END PUTIncludeLabel;

    PROCEDURE (this: TableOfFigures) RightAlignPageNumbers* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 3)
    END RightAlignPageNumbers;

    PROCEDURE (this: TableOfFigures) PUTRightAlignPageNumbers* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 3, p1)
    END PUTRightAlignPageNumbers;

    PROCEDURE (this: TableOfFigures) UseHeadingStyles* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 4)
    END UseHeadingStyles;

    PROCEDURE (this: TableOfFigures) PUTUseHeadingStyles* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 4, p1)
    END PUTUseHeadingStyles;

    PROCEDURE (this: TableOfFigures) LowerHeadingLevel* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 5)
    END LowerHeadingLevel;

    PROCEDURE (this: TableOfFigures) PUTLowerHeadingLevel* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 5, p1)
    END PUTLowerHeadingLevel;

    PROCEDURE (this: TableOfFigures) UpperHeadingLevel* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 6)
    END UpperHeadingLevel;

    PROCEDURE (this: TableOfFigures) PUTUpperHeadingLevel* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 6, p1)
    END PUTUpperHeadingLevel;

    PROCEDURE (this: TableOfFigures) IncludePageNumbers* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 7)
    END IncludePageNumbers;

    PROCEDURE (this: TableOfFigures) PUTIncludePageNumbers* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 7, p1)
    END PUTIncludePageNumbers;

    PROCEDURE (this: TableOfFigures) Range* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 8))
    END Range;

    PROCEDURE (this: TableOfFigures) UseFields* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 9)
    END UseFields;

    PROCEDURE (this: TableOfFigures) PUTUseFields* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 9, p1)
    END PUTUseFields;

    PROCEDURE (this: TableOfFigures) TableID* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 10)
    END TableID;

    PROCEDURE (this: TableOfFigures) PUTTableID* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 10, p1)
    END PUTTableID;

    PROCEDURE (this: TableOfFigures) HeadingStyles* (): HeadingStyles, NEW;
    BEGIN
        RETURN ThisHeadingStyles(CtlC.GetAny(this, 11))
    END HeadingStyles;

    PROCEDURE (this: TableOfFigures) TabLeader* (): WdTabLeader, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 12)
    END TabLeader;

    PROCEDURE (this: TableOfFigures) PUTTabLeader* (p1: WdTabLeader), NEW;
    BEGIN
        CtlC.PutInt(this, 12, p1)
    END PUTTabLeader;

    PROCEDURE (this: TableOfFigures) Delete* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 100, NIL);
    END Delete;

    PROCEDURE (this: TableOfFigures) UpdatePageNumbers* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 101, NIL);
    END UpdatePageNumbers;

    PROCEDURE (this: TableOfFigures) Update* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 102, NIL);
    END Update;


    (* ---------- MailMerge, dual, nonextensible ---------- *)

    PROCEDURE (this: MailMerge) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: MailMerge) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: MailMerge) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: MailMerge) MainDocumentType* (): WdMailMergeMainDocType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END MainDocumentType;

    PROCEDURE (this: MailMerge) PUTMainDocumentType* (p1: WdMailMergeMainDocType), NEW;
    BEGIN
        CtlC.PutInt(this, 1, p1)
    END PUTMainDocumentType;

    PROCEDURE (this: MailMerge) State* (): WdMailMergeState, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END State;

    PROCEDURE (this: MailMerge) Destination* (): WdMailMergeDestination, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 3)
    END Destination;

    PROCEDURE (this: MailMerge) PUTDestination* (p1: WdMailMergeDestination), NEW;
    BEGIN
        CtlC.PutInt(this, 3, p1)
    END PUTDestination;

    PROCEDURE (this: MailMerge) DataSource* (): MailMergeDataSource, NEW;
    BEGIN
        RETURN ThisMailMergeDataSource(CtlC.GetAny(this, 4))
    END DataSource;

    PROCEDURE (this: MailMerge) Fields* (): MailMergeFields, NEW;
    BEGIN
        RETURN ThisMailMergeFields(CtlC.GetAny(this, 5))
    END Fields;

    PROCEDURE (this: MailMerge) ViewMailMergeFieldCodes* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 6)
    END ViewMailMergeFieldCodes;

    PROCEDURE (this: MailMerge) PUTViewMailMergeFieldCodes* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 6, p1)
    END PUTViewMailMergeFieldCodes;

    PROCEDURE (this: MailMerge) SuppressBlankLines* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 7)
    END SuppressBlankLines;

    PROCEDURE (this: MailMerge) PUTSuppressBlankLines* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 7, p1)
    END PUTSuppressBlankLines;

    PROCEDURE (this: MailMerge) MailAsAttachment* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 8)
    END MailAsAttachment;

    PROCEDURE (this: MailMerge) PUTMailAsAttachment* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 8, p1)
    END PUTMailAsAttachment;

    PROCEDURE (this: MailMerge) MailAddressFieldName* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 9)
    END MailAddressFieldName;

    PROCEDURE (this: MailMerge) PUTMailAddressFieldName* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 9, p1)
    END PUTMailAddressFieldName;

    PROCEDURE (this: MailMerge) MailSubject* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 10)
    END MailSubject;

    PROCEDURE (this: MailMerge) PUTMailSubject* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 10, p1)
    END PUTMailSubject;

    PROCEDURE (this: MailMerge) CreateDataSource* ((* optional *) Name: CtlT.Any; PasswordDocument: CtlT.Any; WritePasswordDocument: CtlT.Any; HeaderRecord: CtlT.Any; MSQuery: CtlT.Any; SQLStatement: CtlT.Any; SQLStatement1: CtlT.Any; Connection: CtlT.Any; LinkToSource: CtlT.Any), NEW;
        VAR arg: ARRAY 9 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Name, arg[8]);
        CtlC.AnyVar(PasswordDocument, arg[7]);
        CtlC.AnyVar(WritePasswordDocument, arg[6]);
        CtlC.AnyVar(HeaderRecord, arg[5]);
        CtlC.AnyVar(MSQuery, arg[4]);
        CtlC.AnyVar(SQLStatement, arg[3]);
        CtlC.AnyVar(SQLStatement1, arg[2]);
        CtlC.AnyVar(Connection, arg[1]);
        CtlC.AnyVar(LinkToSource, arg[0]);
        CtlC.CallParMethod(this, 101, arg, NIL);
    END CreateDataSource;

    PROCEDURE (this: MailMerge) CreateHeaderSource* (Name: ARRAY OF CHAR; (* optional *) PasswordDocument: CtlT.Any; WritePasswordDocument: CtlT.Any; HeaderRecord: CtlT.Any), NEW;
        VAR arg: ARRAY 4 OF CtlT.Variant;
    BEGIN
        CtlC.StrVar(Name, arg[3]);
        CtlC.AnyVar(PasswordDocument, arg[2]);
        CtlC.AnyVar(WritePasswordDocument, arg[1]);
        CtlC.AnyVar(HeaderRecord, arg[0]);
        CtlC.CallParMethod(this, 102, arg, NIL);
    END CreateHeaderSource;

    PROCEDURE (this: MailMerge) OpenDataSource* (Name: ARRAY OF CHAR; (* optional *) Format: CtlT.Any; ConfirmConversions: CtlT.Any; ReadOnly: CtlT.Any; LinkToSource: CtlT.Any; AddToRecentFiles: CtlT.Any; PasswordDocument: CtlT.Any; PasswordTemplate: CtlT.Any; Revert: CtlT.Any; WritePasswordDocument: CtlT.Any; WritePasswordTemplate: CtlT.Any; Connection: CtlT.Any; SQLStatement: CtlT.Any; SQLStatement1: CtlT.Any), NEW;
        VAR arg: ARRAY 14 OF CtlT.Variant;
    BEGIN
        CtlC.StrVar(Name, arg[13]);
        CtlC.AnyVar(Format, arg[12]);
        CtlC.AnyVar(ConfirmConversions, arg[11]);
        CtlC.AnyVar(ReadOnly, arg[10]);
        CtlC.AnyVar(LinkToSource, arg[9]);
        CtlC.AnyVar(AddToRecentFiles, arg[8]);
        CtlC.AnyVar(PasswordDocument, arg[7]);
        CtlC.AnyVar(PasswordTemplate, arg[6]);
        CtlC.AnyVar(Revert, arg[5]);
        CtlC.AnyVar(WritePasswordDocument, arg[4]);
        CtlC.AnyVar(WritePasswordTemplate, arg[3]);
        CtlC.AnyVar(Connection, arg[2]);
        CtlC.AnyVar(SQLStatement, arg[1]);
        CtlC.AnyVar(SQLStatement1, arg[0]);
        CtlC.CallParMethod(this, 103, arg, NIL);
    END OpenDataSource;

    PROCEDURE (this: MailMerge) OpenHeaderSource* (Name: ARRAY OF CHAR; (* optional *) Format: CtlT.Any; ConfirmConversions: CtlT.Any; ReadOnly: CtlT.Any; AddToRecentFiles: CtlT.Any; PasswordDocument: CtlT.Any; PasswordTemplate: CtlT.Any; Revert: CtlT.Any; WritePasswordDocument: CtlT.Any; WritePasswordTemplate: CtlT.Any), NEW;
        VAR arg: ARRAY 10 OF CtlT.Variant;
    BEGIN
        CtlC.StrVar(Name, arg[9]);
        CtlC.AnyVar(Format, arg[8]);
        CtlC.AnyVar(ConfirmConversions, arg[7]);
        CtlC.AnyVar(ReadOnly, arg[6]);
        CtlC.AnyVar(AddToRecentFiles, arg[5]);
        CtlC.AnyVar(PasswordDocument, arg[4]);
        CtlC.AnyVar(PasswordTemplate, arg[3]);
        CtlC.AnyVar(Revert, arg[2]);
        CtlC.AnyVar(WritePasswordDocument, arg[1]);
        CtlC.AnyVar(WritePasswordTemplate, arg[0]);
        CtlC.CallParMethod(this, 104, arg, NIL);
    END OpenHeaderSource;

    PROCEDURE (this: MailMerge) Execute* ((* optional *) Pause: CtlT.Any), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Pause, arg[0]);
        CtlC.CallParMethod(this, 105, arg, NIL);
    END Execute;

    PROCEDURE (this: MailMerge) Check* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 106, NIL);
    END Check;

    PROCEDURE (this: MailMerge) EditDataSource* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 107, NIL);
    END EditDataSource;

    PROCEDURE (this: MailMerge) EditHeaderSource* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 108, NIL);
    END EditHeaderSource;

    PROCEDURE (this: MailMerge) EditMainDocument* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 109, NIL);
    END EditMainDocument;

    PROCEDURE (this: MailMerge) UseAddressBook* (Type: ARRAY OF CHAR), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.StrVar(Type, arg[0]);
        CtlC.CallParMethod(this, 111, arg, NIL);
    END UseAddressBook;


    (* ---------- MailMergeFields, dual, nonextensible ---------- *)

    PROCEDURE (this: MailMergeFields) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: MailMergeFields) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: MailMergeFields) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: MailMergeFields) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: MailMergeFields) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Count;

    PROCEDURE (this: MailMergeFields) Item* (Index: INTEGER): MailMergeField, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisMailMergeField(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: MailMergeFields) Add* (range: Range; Name: ARRAY OF CHAR): MailMergeField, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.ObjVar(range, arg[1]);
        CtlC.StrVar(Name, arg[0]);
        CtlC.CallParMethod(this, 101, arg, ret);
        RETURN ThisMailMergeField(CtlC.VarAny(ret))
    END Add;

    PROCEDURE (this: MailMergeFields) AddAsk* (range: Range; Name: ARRAY OF CHAR; (* optional *) Prompt: CtlT.Any; DefaultAskText: CtlT.Any; AskOnce: CtlT.Any): MailMergeField, NEW;
        VAR arg: ARRAY 5 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.ObjVar(range, arg[4]);
        CtlC.StrVar(Name, arg[3]);
        CtlC.AnyVar(Prompt, arg[2]);
        CtlC.AnyVar(DefaultAskText, arg[1]);
        CtlC.AnyVar(AskOnce, arg[0]);
        CtlC.CallParMethod(this, 102, arg, ret);
        RETURN ThisMailMergeField(CtlC.VarAny(ret))
    END AddAsk;

    PROCEDURE (this: MailMergeFields) AddFillIn* (range: Range; (* optional *) Prompt: CtlT.Any; DefaultFillInText: CtlT.Any; AskOnce: CtlT.Any): MailMergeField, NEW;
        VAR arg: ARRAY 4 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.ObjVar(range, arg[3]);
        CtlC.AnyVar(Prompt, arg[2]);
        CtlC.AnyVar(DefaultFillInText, arg[1]);
        CtlC.AnyVar(AskOnce, arg[0]);
        CtlC.CallParMethod(this, 103, arg, ret);
        RETURN ThisMailMergeField(CtlC.VarAny(ret))
    END AddFillIn;

    PROCEDURE (this: MailMergeFields) AddIf* (range: Range; MergeField: ARRAY OF CHAR; Comparison: WdMailMergeComparison; (* optional *) CompareTo: CtlT.Any; TrueAutoText: CtlT.Any; TrueText: CtlT.Any; FalseAutoText: CtlT.Any; FalseText: CtlT.Any): MailMergeField, NEW;
        VAR arg: ARRAY 8 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.ObjVar(range, arg[7]);
        CtlC.StrVar(MergeField, arg[6]);
        CtlC.IntVar(Comparison, arg[5]);
        CtlC.AnyVar(CompareTo, arg[4]);
        CtlC.AnyVar(TrueAutoText, arg[3]);
        CtlC.AnyVar(TrueText, arg[2]);
        CtlC.AnyVar(FalseAutoText, arg[1]);
        CtlC.AnyVar(FalseText, arg[0]);
        CtlC.CallParMethod(this, 104, arg, ret);
        RETURN ThisMailMergeField(CtlC.VarAny(ret))
    END AddIf;

    PROCEDURE (this: MailMergeFields) AddMergeRec* (range: Range): MailMergeField, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.ObjVar(range, arg[0]);
        CtlC.CallParMethod(this, 105, arg, ret);
        RETURN ThisMailMergeField(CtlC.VarAny(ret))
    END AddMergeRec;

    PROCEDURE (this: MailMergeFields) AddMergeSeq* (range: Range): MailMergeField, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.ObjVar(range, arg[0]);
        CtlC.CallParMethod(this, 106, arg, ret);
        RETURN ThisMailMergeField(CtlC.VarAny(ret))
    END AddMergeSeq;

    PROCEDURE (this: MailMergeFields) AddNext* (range: Range): MailMergeField, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.ObjVar(range, arg[0]);
        CtlC.CallParMethod(this, 107, arg, ret);
        RETURN ThisMailMergeField(CtlC.VarAny(ret))
    END AddNext;

    PROCEDURE (this: MailMergeFields) AddNextIf* (range: Range; MergeField: ARRAY OF CHAR; Comparison: WdMailMergeComparison; (* optional *) CompareTo: CtlT.Any): MailMergeField, NEW;
        VAR arg: ARRAY 4 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.ObjVar(range, arg[3]);
        CtlC.StrVar(MergeField, arg[2]);
        CtlC.IntVar(Comparison, arg[1]);
        CtlC.AnyVar(CompareTo, arg[0]);
        CtlC.CallParMethod(this, 108, arg, ret);
        RETURN ThisMailMergeField(CtlC.VarAny(ret))
    END AddNextIf;

    PROCEDURE (this: MailMergeFields) AddSet* (range: Range; Name: ARRAY OF CHAR; (* optional *) ValueText: CtlT.Any; ValueAutoText: CtlT.Any): MailMergeField, NEW;
        VAR arg: ARRAY 4 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.ObjVar(range, arg[3]);
        CtlC.StrVar(Name, arg[2]);
        CtlC.AnyVar(ValueText, arg[1]);
        CtlC.AnyVar(ValueAutoText, arg[0]);
        CtlC.CallParMethod(this, 109, arg, ret);
        RETURN ThisMailMergeField(CtlC.VarAny(ret))
    END AddSet;

    PROCEDURE (this: MailMergeFields) AddSkipIf* (range: Range; MergeField: ARRAY OF CHAR; Comparison: WdMailMergeComparison; (* optional *) CompareTo: CtlT.Any): MailMergeField, NEW;
        VAR arg: ARRAY 4 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.ObjVar(range, arg[3]);
        CtlC.StrVar(MergeField, arg[2]);
        CtlC.IntVar(Comparison, arg[1]);
        CtlC.AnyVar(CompareTo, arg[0]);
        CtlC.CallParMethod(this, 110, arg, ret);
        RETURN ThisMailMergeField(CtlC.VarAny(ret))
    END AddSkipIf;


    (* ---------- MailMergeField, dual, nonextensible ---------- *)

    PROCEDURE (this: MailMergeField) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: MailMergeField) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: MailMergeField) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: MailMergeField) Type* (): WdFieldType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 0)
    END Type;

    PROCEDURE (this: MailMergeField) Locked* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 3)
    END Locked;

    PROCEDURE (this: MailMergeField) PUTLocked* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 3, p1)
    END PUTLocked;

    PROCEDURE (this: MailMergeField) Code* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 5))
    END Code;

    PROCEDURE (this: MailMergeField) PUTCode* (p1: Range), NEW;
    BEGIN
        CtlC.PutObj(this, 5, p1)
    END PUTCode;

    PROCEDURE (this: MailMergeField) Next* (): MailMergeField, NEW;
    BEGIN
        RETURN ThisMailMergeField(CtlC.GetAny(this, 8))
    END Next;

    PROCEDURE (this: MailMergeField) Previous* (): MailMergeField, NEW;
    BEGIN
        RETURN ThisMailMergeField(CtlC.GetAny(this, 9))
    END Previous;

    PROCEDURE (this: MailMergeField) Select* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 65535, NIL);
    END Select;

    PROCEDURE (this: MailMergeField) Copy* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 105, NIL);
    END Copy;

    PROCEDURE (this: MailMergeField) Cut* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 106, NIL);
    END Cut;

    PROCEDURE (this: MailMergeField) Delete* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 107, NIL);
    END Delete;


    (* ---------- MailMergeDataSource, dual, nonextensible ---------- *)

    PROCEDURE (this: MailMergeDataSource) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: MailMergeDataSource) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: MailMergeDataSource) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: MailMergeDataSource) Name* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 1)
    END Name;

    PROCEDURE (this: MailMergeDataSource) HeaderSourceName* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 2)
    END HeaderSourceName;

    PROCEDURE (this: MailMergeDataSource) Type* (): WdMailMergeDataSource, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 3)
    END Type;

    PROCEDURE (this: MailMergeDataSource) HeaderSourceType* (): WdMailMergeDataSource, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 4)
    END HeaderSourceType;

    PROCEDURE (this: MailMergeDataSource) ConnectString* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 5)
    END ConnectString;

    PROCEDURE (this: MailMergeDataSource) QueryString* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 6)
    END QueryString;

    PROCEDURE (this: MailMergeDataSource) PUTQueryString* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 6, p1)
    END PUTQueryString;

    PROCEDURE (this: MailMergeDataSource) ActiveRecord* (): WdMailMergeActiveRecord, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 7)
    END ActiveRecord;

    PROCEDURE (this: MailMergeDataSource) PUTActiveRecord* (p1: WdMailMergeActiveRecord), NEW;
    BEGIN
        CtlC.PutInt(this, 7, p1)
    END PUTActiveRecord;

    PROCEDURE (this: MailMergeDataSource) FirstRecord* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 8)
    END FirstRecord;

    PROCEDURE (this: MailMergeDataSource) PUTFirstRecord* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 8, p1)
    END PUTFirstRecord;

    PROCEDURE (this: MailMergeDataSource) LastRecord* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 9)
    END LastRecord;

    PROCEDURE (this: MailMergeDataSource) PUTLastRecord* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 9, p1)
    END PUTLastRecord;

    PROCEDURE (this: MailMergeDataSource) FieldNames* (): MailMergeFieldNames, NEW;
    BEGIN
        RETURN ThisMailMergeFieldNames(CtlC.GetAny(this, 10))
    END FieldNames;

    PROCEDURE (this: MailMergeDataSource) DataFields* (): MailMergeDataFields, NEW;
    BEGIN
        RETURN ThisMailMergeDataFields(CtlC.GetAny(this, 11))
    END DataFields;

    PROCEDURE (this: MailMergeDataSource) FindRecord* (FindText: ARRAY OF CHAR; Field: ARRAY OF CHAR): BOOLEAN, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.StrVar(FindText, arg[1]);
        CtlC.StrVar(Field, arg[0]);
        CtlC.CallParMethod(this, 101, arg, ret);
        RETURN CtlC.VarBool(ret)
    END FindRecord;


    (* ---------- MailMergeFieldNames, dual, nonextensible ---------- *)

    PROCEDURE (this: MailMergeFieldNames) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: MailMergeFieldNames) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: MailMergeFieldNames) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: MailMergeFieldNames) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: MailMergeFieldNames) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Count;

    PROCEDURE (this: MailMergeFieldNames) Item* (Index: CtlT.Any): MailMergeFieldName, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisMailMergeFieldName(CtlC.VarAny(ret))
    END Item;


    (* ---------- MailMergeFieldName, dual, nonextensible ---------- *)

    PROCEDURE (this: MailMergeFieldName) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: MailMergeFieldName) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: MailMergeFieldName) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: MailMergeFieldName) Name* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 0)
    END Name;

    PROCEDURE (this: MailMergeFieldName) Index* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Index;


    (* ---------- MailMergeDataFields, dual, nonextensible ---------- *)

    PROCEDURE (this: MailMergeDataFields) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: MailMergeDataFields) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: MailMergeDataFields) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: MailMergeDataFields) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: MailMergeDataFields) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Count;

    PROCEDURE (this: MailMergeDataFields) Item* (Index: CtlT.Any): MailMergeDataField, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisMailMergeDataField(CtlC.VarAny(ret))
    END Item;


    (* ---------- MailMergeDataField, dual, nonextensible ---------- *)

    PROCEDURE (this: MailMergeDataField) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: MailMergeDataField) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: MailMergeDataField) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: MailMergeDataField) Value* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 0)
    END Value;

    PROCEDURE (this: MailMergeDataField) Name* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 1)
    END Name;

    PROCEDURE (this: MailMergeDataField) Index* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Index;


    (* ---------- Envelope, dual, nonextensible ---------- *)

    PROCEDURE (this: Envelope) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Envelope) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Envelope) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Envelope) Address* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 1))
    END Address;

    PROCEDURE (this: Envelope) ReturnAddress* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 2))
    END ReturnAddress;

    PROCEDURE (this: Envelope) DefaultPrintBarCode* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 4)
    END DefaultPrintBarCode;

    PROCEDURE (this: Envelope) PUTDefaultPrintBarCode* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 4, p1)
    END PUTDefaultPrintBarCode;

    PROCEDURE (this: Envelope) DefaultPrintFIMA* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 5)
    END DefaultPrintFIMA;

    PROCEDURE (this: Envelope) PUTDefaultPrintFIMA* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 5, p1)
    END PUTDefaultPrintFIMA;

    PROCEDURE (this: Envelope) DefaultHeight* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 6)
    END DefaultHeight;

    PROCEDURE (this: Envelope) PUTDefaultHeight* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 6, p1)
    END PUTDefaultHeight;

    PROCEDURE (this: Envelope) DefaultWidth* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 7)
    END DefaultWidth;

    PROCEDURE (this: Envelope) PUTDefaultWidth* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 7, p1)
    END PUTDefaultWidth;

    PROCEDURE (this: Envelope) DefaultSize* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 0)
    END DefaultSize;

    PROCEDURE (this: Envelope) PUTDefaultSize* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 0, p1)
    END PUTDefaultSize;

    PROCEDURE (this: Envelope) DefaultOmitReturnAddress* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 9)
    END DefaultOmitReturnAddress;

    PROCEDURE (this: Envelope) PUTDefaultOmitReturnAddress* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 9, p1)
    END PUTDefaultOmitReturnAddress;

    PROCEDURE (this: Envelope) FeedSource* (): WdPaperTray, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 12)
    END FeedSource;

    PROCEDURE (this: Envelope) PUTFeedSource* (p1: WdPaperTray), NEW;
    BEGIN
        CtlC.PutInt(this, 12, p1)
    END PUTFeedSource;

    PROCEDURE (this: Envelope) AddressFromLeft* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 13)
    END AddressFromLeft;

    PROCEDURE (this: Envelope) PUTAddressFromLeft* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 13, p1)
    END PUTAddressFromLeft;

    PROCEDURE (this: Envelope) AddressFromTop* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 14)
    END AddressFromTop;

    PROCEDURE (this: Envelope) PUTAddressFromTop* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 14, p1)
    END PUTAddressFromTop;

    PROCEDURE (this: Envelope) ReturnAddressFromLeft* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 15)
    END ReturnAddressFromLeft;

    PROCEDURE (this: Envelope) PUTReturnAddressFromLeft* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 15, p1)
    END PUTReturnAddressFromLeft;

    PROCEDURE (this: Envelope) ReturnAddressFromTop* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 16)
    END ReturnAddressFromTop;

    PROCEDURE (this: Envelope) PUTReturnAddressFromTop* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 16, p1)
    END PUTReturnAddressFromTop;

    PROCEDURE (this: Envelope) AddressStyle* (): Style, NEW;
    BEGIN
        RETURN ThisStyle(CtlC.GetAny(this, 17))
    END AddressStyle;

    PROCEDURE (this: Envelope) ReturnAddressStyle* (): Style, NEW;
    BEGIN
        RETURN ThisStyle(CtlC.GetAny(this, 18))
    END ReturnAddressStyle;

    PROCEDURE (this: Envelope) DefaultOrientation* (): WdEnvelopeOrientation, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 19)
    END DefaultOrientation;

    PROCEDURE (this: Envelope) PUTDefaultOrientation* (p1: WdEnvelopeOrientation), NEW;
    BEGIN
        CtlC.PutInt(this, 19, p1)
    END PUTDefaultOrientation;

    PROCEDURE (this: Envelope) DefaultFaceUp* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 20)
    END DefaultFaceUp;

    PROCEDURE (this: Envelope) PUTDefaultFaceUp* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 20, p1)
    END PUTDefaultFaceUp;

    PROCEDURE (this: Envelope) Insert* ((* optional *) ExtractAddress: CtlT.Any; Address: CtlT.Any; AutoText: CtlT.Any; OmitReturnAddress: CtlT.Any; ReturnAddress: CtlT.Any; ReturnAutoText: CtlT.Any; PrintBarCode: CtlT.Any; PrintFIMA: CtlT.Any; Size: CtlT.Any; Height: CtlT.Any; Width: CtlT.Any; FeedSource: CtlT.Any; AddressFromLeft: CtlT.Any; AddressFromTop: CtlT.Any; ReturnAddressFromLeft: CtlT.Any; ReturnAddressFromTop: CtlT.Any; DefaultFaceUp: CtlT.Any; DefaultOrientation: CtlT.Any), NEW;
        VAR arg: ARRAY 18 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(ExtractAddress, arg[17]);
        CtlC.AnyVar(Address, arg[16]);
        CtlC.AnyVar(AutoText, arg[15]);
        CtlC.AnyVar(OmitReturnAddress, arg[14]);
        CtlC.AnyVar(ReturnAddress, arg[13]);
        CtlC.AnyVar(ReturnAutoText, arg[12]);
        CtlC.AnyVar(PrintBarCode, arg[11]);
        CtlC.AnyVar(PrintFIMA, arg[10]);
        CtlC.AnyVar(Size, arg[9]);
        CtlC.AnyVar(Height, arg[8]);
        CtlC.AnyVar(Width, arg[7]);
        CtlC.AnyVar(FeedSource, arg[6]);
        CtlC.AnyVar(AddressFromLeft, arg[5]);
        CtlC.AnyVar(AddressFromTop, arg[4]);
        CtlC.AnyVar(ReturnAddressFromLeft, arg[3]);
        CtlC.AnyVar(ReturnAddressFromTop, arg[2]);
        CtlC.AnyVar(DefaultFaceUp, arg[1]);
        CtlC.AnyVar(DefaultOrientation, arg[0]);
        CtlC.CallParMethod(this, 101, arg, NIL);
    END Insert;

    PROCEDURE (this: Envelope) PrintOut* ((* optional *) ExtractAddress: CtlT.Any; Address: CtlT.Any; AutoText: CtlT.Any; OmitReturnAddress: CtlT.Any; ReturnAddress: CtlT.Any; ReturnAutoText: CtlT.Any; PrintBarCode: CtlT.Any; PrintFIMA: CtlT.Any; Size: CtlT.Any; Height: CtlT.Any; Width: CtlT.Any; FeedSource: CtlT.Any; AddressFromLeft: CtlT.Any; AddressFromTop: CtlT.Any; ReturnAddressFromLeft: CtlT.Any; ReturnAddressFromTop: CtlT.Any; DefaultFaceUp: CtlT.Any; DefaultOrientation: CtlT.Any), NEW;
        VAR arg: ARRAY 18 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(ExtractAddress, arg[17]);
        CtlC.AnyVar(Address, arg[16]);
        CtlC.AnyVar(AutoText, arg[15]);
        CtlC.AnyVar(OmitReturnAddress, arg[14]);
        CtlC.AnyVar(ReturnAddress, arg[13]);
        CtlC.AnyVar(ReturnAutoText, arg[12]);
        CtlC.AnyVar(PrintBarCode, arg[11]);
        CtlC.AnyVar(PrintFIMA, arg[10]);
        CtlC.AnyVar(Size, arg[9]);
        CtlC.AnyVar(Height, arg[8]);
        CtlC.AnyVar(Width, arg[7]);
        CtlC.AnyVar(FeedSource, arg[6]);
        CtlC.AnyVar(AddressFromLeft, arg[5]);
        CtlC.AnyVar(AddressFromTop, arg[4]);
        CtlC.AnyVar(ReturnAddressFromLeft, arg[3]);
        CtlC.AnyVar(ReturnAddressFromTop, arg[2]);
        CtlC.AnyVar(DefaultFaceUp, arg[1]);
        CtlC.AnyVar(DefaultOrientation, arg[0]);
        CtlC.CallParMethod(this, 102, arg, NIL);
    END PrintOut;

    PROCEDURE (this: Envelope) UpdateDocument* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 103, NIL);
    END UpdateDocument;


    (* ---------- MailingLabel, dual, nonextensible ---------- *)

    PROCEDURE (this: MailingLabel) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: MailingLabel) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: MailingLabel) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: MailingLabel) DefaultPrintBarCode* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 2)
    END DefaultPrintBarCode;

    PROCEDURE (this: MailingLabel) PUTDefaultPrintBarCode* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 2, p1)
    END PUTDefaultPrintBarCode;

    PROCEDURE (this: MailingLabel) DefaultLaserTray* (): WdPaperTray, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 4)
    END DefaultLaserTray;

    PROCEDURE (this: MailingLabel) PUTDefaultLaserTray* (p1: WdPaperTray), NEW;
    BEGIN
        CtlC.PutInt(this, 4, p1)
    END PUTDefaultLaserTray;

    PROCEDURE (this: MailingLabel) CustomLabels* (): CustomLabels, NEW;
    BEGIN
        RETURN ThisCustomLabels(CtlC.GetAny(this, 8))
    END CustomLabels;

    PROCEDURE (this: MailingLabel) DefaultLabelName* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 9)
    END DefaultLabelName;

    PROCEDURE (this: MailingLabel) PUTDefaultLabelName* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 9, p1)
    END PUTDefaultLabelName;

    PROCEDURE (this: MailingLabel) CreateNewDocument* ((* optional *) Name: CtlT.Any; Address: CtlT.Any; AutoText: CtlT.Any; ExtractAddress: CtlT.Any; LaserTray: CtlT.Any): Document, NEW;
        VAR arg: ARRAY 5 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Name, arg[4]);
        CtlC.AnyVar(Address, arg[3]);
        CtlC.AnyVar(AutoText, arg[2]);
        CtlC.AnyVar(ExtractAddress, arg[1]);
        CtlC.AnyVar(LaserTray, arg[0]);
        CtlC.CallParMethod(this, 101, arg, ret);
        RETURN This_Document(CtlC.VarAny(ret))
    END CreateNewDocument;

    PROCEDURE (this: MailingLabel) PrintOut* ((* optional *) Name: CtlT.Any; Address: CtlT.Any; ExtractAddress: CtlT.Any; LaserTray: CtlT.Any; SingleLabel: CtlT.Any; Row: CtlT.Any; Column: CtlT.Any), NEW;
        VAR arg: ARRAY 7 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Name, arg[6]);
        CtlC.AnyVar(Address, arg[5]);
        CtlC.AnyVar(ExtractAddress, arg[4]);
        CtlC.AnyVar(LaserTray, arg[3]);
        CtlC.AnyVar(SingleLabel, arg[2]);
        CtlC.AnyVar(Row, arg[1]);
        CtlC.AnyVar(Column, arg[0]);
        CtlC.CallParMethod(this, 102, arg, NIL);
    END PrintOut;


    (* ---------- CustomLabels, dual, nonextensible ---------- *)

    PROCEDURE (this: CustomLabels) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: CustomLabels) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: CustomLabels) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: CustomLabels) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: CustomLabels) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Count;

    PROCEDURE (this: CustomLabels) Item* (Index: CtlT.Any): CustomLabel, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisCustomLabel(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: CustomLabels) Add* (Name: ARRAY OF CHAR; (* optional *) DotMatrix: CtlT.Any): CustomLabel, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.StrVar(Name, arg[1]);
        CtlC.AnyVar(DotMatrix, arg[0]);
        CtlC.CallParMethod(this, 101, arg, ret);
        RETURN ThisCustomLabel(CtlC.VarAny(ret))
    END Add;


    (* ---------- CustomLabel, dual, nonextensible ---------- *)

    PROCEDURE (this: CustomLabel) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: CustomLabel) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: CustomLabel) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: CustomLabel) Index* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Index;

    PROCEDURE (this: CustomLabel) Name* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 2)
    END Name;

    PROCEDURE (this: CustomLabel) PUTName* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 2, p1)
    END PUTName;

    PROCEDURE (this: CustomLabel) TopMargin* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 3)
    END TopMargin;

    PROCEDURE (this: CustomLabel) PUTTopMargin* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 3, p1)
    END PUTTopMargin;

    PROCEDURE (this: CustomLabel) SideMargin* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 4)
    END SideMargin;

    PROCEDURE (this: CustomLabel) PUTSideMargin* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 4, p1)
    END PUTSideMargin;

    PROCEDURE (this: CustomLabel) Height* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 5)
    END Height;

    PROCEDURE (this: CustomLabel) PUTHeight* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 5, p1)
    END PUTHeight;

    PROCEDURE (this: CustomLabel) Width* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 6)
    END Width;

    PROCEDURE (this: CustomLabel) PUTWidth* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 6, p1)
    END PUTWidth;

    PROCEDURE (this: CustomLabel) VerticalPitch* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 7)
    END VerticalPitch;

    PROCEDURE (this: CustomLabel) PUTVerticalPitch* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 7, p1)
    END PUTVerticalPitch;

    PROCEDURE (this: CustomLabel) HorizontalPitch* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 8)
    END HorizontalPitch;

    PROCEDURE (this: CustomLabel) PUTHorizontalPitch* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 8, p1)
    END PUTHorizontalPitch;

    PROCEDURE (this: CustomLabel) NumberAcross* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 9)
    END NumberAcross;

    PROCEDURE (this: CustomLabel) PUTNumberAcross* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 9, p1)
    END PUTNumberAcross;

    PROCEDURE (this: CustomLabel) NumberDown* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 10)
    END NumberDown;

    PROCEDURE (this: CustomLabel) PUTNumberDown* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 10, p1)
    END PUTNumberDown;

    PROCEDURE (this: CustomLabel) DotMatrix* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 11)
    END DotMatrix;

    PROCEDURE (this: CustomLabel) PageSize* (): WdCustomLabelPageSize, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 12)
    END PageSize;

    PROCEDURE (this: CustomLabel) PUTPageSize* (p1: WdCustomLabelPageSize), NEW;
    BEGIN
        CtlC.PutInt(this, 12, p1)
    END PUTPageSize;

    PROCEDURE (this: CustomLabel) Valid* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 13)
    END Valid;

    PROCEDURE (this: CustomLabel) Delete* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 101, NIL);
    END Delete;


    (* ---------- TablesOfContents, dual, nonextensible ---------- *)

    PROCEDURE (this: TablesOfContents) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: TablesOfContents) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: TablesOfContents) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: TablesOfContents) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: TablesOfContents) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Count;

    PROCEDURE (this: TablesOfContents) Format* (): WdTocFormat, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Format;

    PROCEDURE (this: TablesOfContents) PUTFormat* (p1: WdTocFormat), NEW;
    BEGIN
        CtlC.PutInt(this, 2, p1)
    END PUTFormat;

    PROCEDURE (this: TablesOfContents) Item* (Index: INTEGER): TableOfContents, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisTableOfContents(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: TablesOfContents) Add* (range: Range; (* optional *) UseHeadingStyles: CtlT.Any; UpperHeadingLevel: CtlT.Any; LowerHeadingLevel: CtlT.Any; UseFields: CtlT.Any; TableID: CtlT.Any; RightAlignPageNumbers: CtlT.Any; IncludePageNumbers: CtlT.Any; AddedStyles: CtlT.Any): TableOfContents, NEW;
        VAR arg: ARRAY 9 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.ObjVar(range, arg[8]);
        CtlC.AnyVar(UseHeadingStyles, arg[7]);
        CtlC.AnyVar(UpperHeadingLevel, arg[6]);
        CtlC.AnyVar(LowerHeadingLevel, arg[5]);
        CtlC.AnyVar(UseFields, arg[4]);
        CtlC.AnyVar(TableID, arg[3]);
        CtlC.AnyVar(RightAlignPageNumbers, arg[2]);
        CtlC.AnyVar(IncludePageNumbers, arg[1]);
        CtlC.AnyVar(AddedStyles, arg[0]);
        CtlC.CallParMethod(this, 100, arg, ret);
        RETURN ThisTableOfContents(CtlC.VarAny(ret))
    END Add;

    PROCEDURE (this: TablesOfContents) MarkEntry* (range: Range; (* optional *) Entry: CtlT.Any; EntryAutoText: CtlT.Any; TableID: CtlT.Any; Level: CtlT.Any): Field, NEW;
        VAR arg: ARRAY 5 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.ObjVar(range, arg[4]);
        CtlC.AnyVar(Entry, arg[3]);
        CtlC.AnyVar(EntryAutoText, arg[2]);
        CtlC.AnyVar(TableID, arg[1]);
        CtlC.AnyVar(Level, arg[0]);
        CtlC.CallParMethod(this, 101, arg, ret);
        RETURN ThisField(CtlC.VarAny(ret))
    END MarkEntry;


    (* ---------- TableOfContents, dual, nonextensible ---------- *)

    PROCEDURE (this: TableOfContents) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: TableOfContents) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: TableOfContents) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: TableOfContents) UseHeadingStyles* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 1)
    END UseHeadingStyles;

    PROCEDURE (this: TableOfContents) PUTUseHeadingStyles* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 1, p1)
    END PUTUseHeadingStyles;

    PROCEDURE (this: TableOfContents) UseFields* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 2)
    END UseFields;

    PROCEDURE (this: TableOfContents) PUTUseFields* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 2, p1)
    END PUTUseFields;

    PROCEDURE (this: TableOfContents) UpperHeadingLevel* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 3)
    END UpperHeadingLevel;

    PROCEDURE (this: TableOfContents) PUTUpperHeadingLevel* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 3, p1)
    END PUTUpperHeadingLevel;

    PROCEDURE (this: TableOfContents) LowerHeadingLevel* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 4)
    END LowerHeadingLevel;

    PROCEDURE (this: TableOfContents) PUTLowerHeadingLevel* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 4, p1)
    END PUTLowerHeadingLevel;

    PROCEDURE (this: TableOfContents) TableID* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 5)
    END TableID;

    PROCEDURE (this: TableOfContents) PUTTableID* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 5, p1)
    END PUTTableID;

    PROCEDURE (this: TableOfContents) HeadingStyles* (): HeadingStyles, NEW;
    BEGIN
        RETURN ThisHeadingStyles(CtlC.GetAny(this, 6))
    END HeadingStyles;

    PROCEDURE (this: TableOfContents) RightAlignPageNumbers* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 7)
    END RightAlignPageNumbers;

    PROCEDURE (this: TableOfContents) PUTRightAlignPageNumbers* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 7, p1)
    END PUTRightAlignPageNumbers;

    PROCEDURE (this: TableOfContents) IncludePageNumbers* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 8)
    END IncludePageNumbers;

    PROCEDURE (this: TableOfContents) PUTIncludePageNumbers* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 8, p1)
    END PUTIncludePageNumbers;

    PROCEDURE (this: TableOfContents) Range* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 9))
    END Range;

    PROCEDURE (this: TableOfContents) TabLeader* (): WdTabLeader, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 10)
    END TabLeader;

    PROCEDURE (this: TableOfContents) PUTTabLeader* (p1: WdTabLeader), NEW;
    BEGIN
        CtlC.PutInt(this, 10, p1)
    END PUTTabLeader;

    PROCEDURE (this: TableOfContents) Delete* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 100, NIL);
    END Delete;

    PROCEDURE (this: TableOfContents) UpdatePageNumbers* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 101, NIL);
    END UpdatePageNumbers;

    PROCEDURE (this: TableOfContents) Update* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 102, NIL);
    END Update;


    (* ---------- TablesOfAuthorities, dual, nonextensible ---------- *)

    PROCEDURE (this: TablesOfAuthorities) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: TablesOfAuthorities) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: TablesOfAuthorities) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: TablesOfAuthorities) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: TablesOfAuthorities) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Count;

    PROCEDURE (this: TablesOfAuthorities) Format* (): WdToaFormat, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Format;

    PROCEDURE (this: TablesOfAuthorities) PUTFormat* (p1: WdToaFormat), NEW;
    BEGIN
        CtlC.PutInt(this, 2, p1)
    END PUTFormat;

    PROCEDURE (this: TablesOfAuthorities) Item* (Index: INTEGER): TableOfAuthorities, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisTableOfAuthorities(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: TablesOfAuthorities) Add* (range: Range; (* optional *) Category: CtlT.Any; Bookmark: CtlT.Any; Passim: CtlT.Any; KeepEntryFormatting: CtlT.Any; Separator: CtlT.Any; IncludeSequenceName: CtlT.Any; EntrySeparator: CtlT.Any; PageRangeSeparator: CtlT.Any; IncludeCategoryHeader: CtlT.Any; PageNumberSeparator: CtlT.Any): TableOfAuthorities, NEW;
        VAR arg: ARRAY 11 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.ObjVar(range, arg[10]);
        CtlC.AnyVar(Category, arg[9]);
        CtlC.AnyVar(Bookmark, arg[8]);
        CtlC.AnyVar(Passim, arg[7]);
        CtlC.AnyVar(KeepEntryFormatting, arg[6]);
        CtlC.AnyVar(Separator, arg[5]);
        CtlC.AnyVar(IncludeSequenceName, arg[4]);
        CtlC.AnyVar(EntrySeparator, arg[3]);
        CtlC.AnyVar(PageRangeSeparator, arg[2]);
        CtlC.AnyVar(IncludeCategoryHeader, arg[1]);
        CtlC.AnyVar(PageNumberSeparator, arg[0]);
        CtlC.CallParMethod(this, 100, arg, ret);
        RETURN ThisTableOfAuthorities(CtlC.VarAny(ret))
    END Add;

    PROCEDURE (this: TablesOfAuthorities) NextCitation* (ShortCitation: ARRAY OF CHAR), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.StrVar(ShortCitation, arg[0]);
        CtlC.CallParMethod(this, 103, arg, NIL);
    END NextCitation;

    PROCEDURE (this: TablesOfAuthorities) MarkCitation* (range: Range; ShortCitation: ARRAY OF CHAR; (* optional *) LongCitation: CtlT.Any; LongCitationAutoText: CtlT.Any; Category: CtlT.Any): Field, NEW;
        VAR arg: ARRAY 5 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.ObjVar(range, arg[4]);
        CtlC.StrVar(ShortCitation, arg[3]);
        CtlC.AnyVar(LongCitation, arg[2]);
        CtlC.AnyVar(LongCitationAutoText, arg[1]);
        CtlC.AnyVar(Category, arg[0]);
        CtlC.CallParMethod(this, 101, arg, ret);
        RETURN ThisField(CtlC.VarAny(ret))
    END MarkCitation;

    PROCEDURE (this: TablesOfAuthorities) MarkAllCitations* (ShortCitation: ARRAY OF CHAR; (* optional *) LongCitation: CtlT.Any; LongCitationAutoText: CtlT.Any; Category: CtlT.Any), NEW;
        VAR arg: ARRAY 4 OF CtlT.Variant;
    BEGIN
        CtlC.StrVar(ShortCitation, arg[3]);
        CtlC.AnyVar(LongCitation, arg[2]);
        CtlC.AnyVar(LongCitationAutoText, arg[1]);
        CtlC.AnyVar(Category, arg[0]);
        CtlC.CallParMethod(this, 102, arg, NIL);
    END MarkAllCitations;


    (* ---------- TableOfAuthorities, dual, nonextensible ---------- *)

    PROCEDURE (this: TableOfAuthorities) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: TableOfAuthorities) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: TableOfAuthorities) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: TableOfAuthorities) Passim* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 1)
    END Passim;

    PROCEDURE (this: TableOfAuthorities) PUTPassim* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 1, p1)
    END PUTPassim;

    PROCEDURE (this: TableOfAuthorities) KeepEntryFormatting* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 2)
    END KeepEntryFormatting;

    PROCEDURE (this: TableOfAuthorities) PUTKeepEntryFormatting* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 2, p1)
    END PUTKeepEntryFormatting;

    PROCEDURE (this: TableOfAuthorities) Category* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 3)
    END Category;

    PROCEDURE (this: TableOfAuthorities) PUTCategory* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 3, p1)
    END PUTCategory;

    PROCEDURE (this: TableOfAuthorities) Bookmark* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 4)
    END Bookmark;

    PROCEDURE (this: TableOfAuthorities) PUTBookmark* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 4, p1)
    END PUTBookmark;

    PROCEDURE (this: TableOfAuthorities) Separator* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 5)
    END Separator;

    PROCEDURE (this: TableOfAuthorities) PUTSeparator* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 5, p1)
    END PUTSeparator;

    PROCEDURE (this: TableOfAuthorities) IncludeSequenceName* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 6)
    END IncludeSequenceName;

    PROCEDURE (this: TableOfAuthorities) PUTIncludeSequenceName* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 6, p1)
    END PUTIncludeSequenceName;

    PROCEDURE (this: TableOfAuthorities) EntrySeparator* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 7)
    END EntrySeparator;

    PROCEDURE (this: TableOfAuthorities) PUTEntrySeparator* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 7, p1)
    END PUTEntrySeparator;

    PROCEDURE (this: TableOfAuthorities) PageRangeSeparator* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 8)
    END PageRangeSeparator;

    PROCEDURE (this: TableOfAuthorities) PUTPageRangeSeparator* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 8, p1)
    END PUTPageRangeSeparator;

    PROCEDURE (this: TableOfAuthorities) IncludeCategoryHeader* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 9)
    END IncludeCategoryHeader;

    PROCEDURE (this: TableOfAuthorities) PUTIncludeCategoryHeader* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 9, p1)
    END PUTIncludeCategoryHeader;

    PROCEDURE (this: TableOfAuthorities) PageNumberSeparator* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 10)
    END PageNumberSeparator;

    PROCEDURE (this: TableOfAuthorities) PUTPageNumberSeparator* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 10, p1)
    END PUTPageNumberSeparator;

    PROCEDURE (this: TableOfAuthorities) Range* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 11))
    END Range;

    PROCEDURE (this: TableOfAuthorities) TabLeader* (): WdTabLeader, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 12)
    END TabLeader;

    PROCEDURE (this: TableOfAuthorities) PUTTabLeader* (p1: WdTabLeader), NEW;
    BEGIN
        CtlC.PutInt(this, 12, p1)
    END PUTTabLeader;

    PROCEDURE (this: TableOfAuthorities) Delete* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 100, NIL);
    END Delete;

    PROCEDURE (this: TableOfAuthorities) Update* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 101, NIL);
    END Update;


    (* ---------- Dialogs, dual, nonextensible ---------- *)

    PROCEDURE (this: Dialogs) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Dialogs) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Dialogs) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Dialogs) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: Dialogs) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Count;

    PROCEDURE (this: Dialogs) Item* (Index: WdWordDialog): Dialog, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisDialog(CtlC.VarAny(ret))
    END Item;


    (* ---------- Dialog, dual ---------- *)

    PROCEDURE (this: Dialog) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 32003))
    END Application;

    PROCEDURE (this: Dialog) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 32004)
    END Creator;

    PROCEDURE (this: Dialog) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 32005)
    END Parent;

    PROCEDURE (this: Dialog) DefaultTab* (): WdWordDialogTab, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 32002)
    END DefaultTab;

    PROCEDURE (this: Dialog) PUTDefaultTab* (p1: WdWordDialogTab), NEW;
    BEGIN
        CtlC.PutInt(this, 32002, p1)
    END PUTDefaultTab;

    PROCEDURE (this: Dialog) Type* (): WdWordDialog, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 0)
    END Type;

    PROCEDURE (this: Dialog) Show* ((* optional *) TimeOut: CtlT.Any): INTEGER, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(TimeOut, arg[0]);
        CtlC.CallParMethod(this, 336, arg, ret);
        RETURN CtlC.VarInt(ret)
    END Show;

    PROCEDURE (this: Dialog) Display* ((* optional *) TimeOut: CtlT.Any): INTEGER, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(TimeOut, arg[0]);
        CtlC.CallParMethod(this, 338, arg, ret);
        RETURN CtlC.VarInt(ret)
    END Display;

    PROCEDURE (this: Dialog) Execute* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 32001, NIL);
    END Execute;

    PROCEDURE (this: Dialog) Update* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 302, NIL);
    END Update;


    (* ---------- PageSetup, dual, nonextensible ---------- *)

    PROCEDURE (this: PageSetup) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: PageSetup) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: PageSetup) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: PageSetup) TopMargin* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 100)
    END TopMargin;

    PROCEDURE (this: PageSetup) PUTTopMargin* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 100, p1)
    END PUTTopMargin;

    PROCEDURE (this: PageSetup) BottomMargin* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 101)
    END BottomMargin;

    PROCEDURE (this: PageSetup) PUTBottomMargin* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 101, p1)
    END PUTBottomMargin;

    PROCEDURE (this: PageSetup) LeftMargin* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 102)
    END LeftMargin;

    PROCEDURE (this: PageSetup) PUTLeftMargin* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 102, p1)
    END PUTLeftMargin;

    PROCEDURE (this: PageSetup) RightMargin* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 103)
    END RightMargin;

    PROCEDURE (this: PageSetup) PUTRightMargin* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 103, p1)
    END PUTRightMargin;

    PROCEDURE (this: PageSetup) Gutter* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 104)
    END Gutter;

    PROCEDURE (this: PageSetup) PUTGutter* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 104, p1)
    END PUTGutter;

    PROCEDURE (this: PageSetup) PageWidth* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 105)
    END PageWidth;

    PROCEDURE (this: PageSetup) PUTPageWidth* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 105, p1)
    END PUTPageWidth;

    PROCEDURE (this: PageSetup) PageHeight* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 106)
    END PageHeight;

    PROCEDURE (this: PageSetup) PUTPageHeight* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 106, p1)
    END PUTPageHeight;

    PROCEDURE (this: PageSetup) Orientation* (): WdOrientation, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 107)
    END Orientation;

    PROCEDURE (this: PageSetup) PUTOrientation* (p1: WdOrientation), NEW;
    BEGIN
        CtlC.PutInt(this, 107, p1)
    END PUTOrientation;

    PROCEDURE (this: PageSetup) FirstPageTray* (): WdPaperTray, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 108)
    END FirstPageTray;

    PROCEDURE (this: PageSetup) PUTFirstPageTray* (p1: WdPaperTray), NEW;
    BEGIN
        CtlC.PutInt(this, 108, p1)
    END PUTFirstPageTray;

    PROCEDURE (this: PageSetup) OtherPagesTray* (): WdPaperTray, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 109)
    END OtherPagesTray;

    PROCEDURE (this: PageSetup) PUTOtherPagesTray* (p1: WdPaperTray), NEW;
    BEGIN
        CtlC.PutInt(this, 109, p1)
    END PUTOtherPagesTray;

    PROCEDURE (this: PageSetup) VerticalAlignment* (): WdVerticalAlignment, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 110)
    END VerticalAlignment;

    PROCEDURE (this: PageSetup) PUTVerticalAlignment* (p1: WdVerticalAlignment), NEW;
    BEGIN
        CtlC.PutInt(this, 110, p1)
    END PUTVerticalAlignment;

    PROCEDURE (this: PageSetup) MirrorMargins* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 111)
    END MirrorMargins;

    PROCEDURE (this: PageSetup) PUTMirrorMargins* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 111, p1)
    END PUTMirrorMargins;

    PROCEDURE (this: PageSetup) HeaderDistance* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 112)
    END HeaderDistance;

    PROCEDURE (this: PageSetup) PUTHeaderDistance* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 112, p1)
    END PUTHeaderDistance;

    PROCEDURE (this: PageSetup) FooterDistance* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 113)
    END FooterDistance;

    PROCEDURE (this: PageSetup) PUTFooterDistance* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 113, p1)
    END PUTFooterDistance;

    PROCEDURE (this: PageSetup) SectionStart* (): WdSectionStart, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 114)
    END SectionStart;

    PROCEDURE (this: PageSetup) PUTSectionStart* (p1: WdSectionStart), NEW;
    BEGIN
        CtlC.PutInt(this, 114, p1)
    END PUTSectionStart;

    PROCEDURE (this: PageSetup) OddAndEvenPagesHeaderFooter* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 115)
    END OddAndEvenPagesHeaderFooter;

    PROCEDURE (this: PageSetup) PUTOddAndEvenPagesHeaderFooter* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 115, p1)
    END PUTOddAndEvenPagesHeaderFooter;

    PROCEDURE (this: PageSetup) DifferentFirstPageHeaderFooter* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 116)
    END DifferentFirstPageHeaderFooter;

    PROCEDURE (this: PageSetup) PUTDifferentFirstPageHeaderFooter* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 116, p1)
    END PUTDifferentFirstPageHeaderFooter;

    PROCEDURE (this: PageSetup) SuppressEndnotes* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 117)
    END SuppressEndnotes;

    PROCEDURE (this: PageSetup) PUTSuppressEndnotes* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 117, p1)
    END PUTSuppressEndnotes;

    PROCEDURE (this: PageSetup) LineNumbering* (): LineNumbering, NEW;
    BEGIN
        RETURN ThisLineNumbering(CtlC.GetAny(this, 118))
    END LineNumbering;

    PROCEDURE (this: PageSetup) PUTLineNumbering* (p1: LineNumbering), NEW;
    BEGIN
        CtlC.PutObj(this, 118, p1)
    END PUTLineNumbering;

    PROCEDURE (this: PageSetup) TextColumns* (): TextColumns, NEW;
    BEGIN
        RETURN ThisTextColumns(CtlC.GetAny(this, 119))
    END TextColumns;

    PROCEDURE (this: PageSetup) PUTTextColumns* (p1: TextColumns), NEW;
    BEGIN
        CtlC.PutObj(this, 119, p1)
    END PUTTextColumns;

    PROCEDURE (this: PageSetup) PaperSize* (): WdPaperSize, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 120)
    END PaperSize;

    PROCEDURE (this: PageSetup) PUTPaperSize* (p1: WdPaperSize), NEW;
    BEGIN
        CtlC.PutInt(this, 120, p1)
    END PUTPaperSize;

    PROCEDURE (this: PageSetup) TwoPagesOnOne* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 121)
    END TwoPagesOnOne;

    PROCEDURE (this: PageSetup) PUTTwoPagesOnOne* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 121, p1)
    END PUTTwoPagesOnOne;

    PROCEDURE (this: PageSetup) GutterOnTop* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 122)
    END GutterOnTop;

    PROCEDURE (this: PageSetup) PUTGutterOnTop* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 122, p1)
    END PUTGutterOnTop;

    PROCEDURE (this: PageSetup) CharsLine* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 123)
    END CharsLine;

    PROCEDURE (this: PageSetup) PUTCharsLine* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 123, p1)
    END PUTCharsLine;

    PROCEDURE (this: PageSetup) LinesPage* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 124)
    END LinesPage;

    PROCEDURE (this: PageSetup) PUTLinesPage* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 124, p1)
    END PUTLinesPage;

    PROCEDURE (this: PageSetup) ShowGrid* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 128)
    END ShowGrid;

    PROCEDURE (this: PageSetup) PUTShowGrid* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 128, p1)
    END PUTShowGrid;

    PROCEDURE (this: PageSetup) TogglePortrait* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 201, NIL);
    END TogglePortrait;

    PROCEDURE (this: PageSetup) SetAsTemplateDefault* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 202, NIL);
    END SetAsTemplateDefault;


    (* ---------- LineNumbering, dual, nonextensible ---------- *)

    PROCEDURE (this: LineNumbering) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: LineNumbering) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: LineNumbering) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: LineNumbering) RestartMode* (): WdNumberingRule, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 100)
    END RestartMode;

    PROCEDURE (this: LineNumbering) PUTRestartMode* (p1: WdNumberingRule), NEW;
    BEGIN
        CtlC.PutInt(this, 100, p1)
    END PUTRestartMode;

    PROCEDURE (this: LineNumbering) StartingNumber* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 101)
    END StartingNumber;

    PROCEDURE (this: LineNumbering) PUTStartingNumber* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 101, p1)
    END PUTStartingNumber;

    PROCEDURE (this: LineNumbering) DistanceFromText* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 102)
    END DistanceFromText;

    PROCEDURE (this: LineNumbering) PUTDistanceFromText* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 102, p1)
    END PUTDistanceFromText;

    PROCEDURE (this: LineNumbering) CountBy* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 103)
    END CountBy;

    PROCEDURE (this: LineNumbering) PUTCountBy* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 103, p1)
    END PUTCountBy;

    PROCEDURE (this: LineNumbering) Active* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 104)
    END Active;

    PROCEDURE (this: LineNumbering) PUTActive* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 104, p1)
    END PUTActive;


    (* ---------- TextColumns, dual, nonextensible ---------- *)

    PROCEDURE (this: TextColumns) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: TextColumns) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Count;

    PROCEDURE (this: TextColumns) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: TextColumns) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: TextColumns) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: TextColumns) EvenlySpaced* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 100)
    END EvenlySpaced;

    PROCEDURE (this: TextColumns) PUTEvenlySpaced* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 100, p1)
    END PUTEvenlySpaced;

    PROCEDURE (this: TextColumns) LineBetween* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 101)
    END LineBetween;

    PROCEDURE (this: TextColumns) PUTLineBetween* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 101, p1)
    END PUTLineBetween;

    PROCEDURE (this: TextColumns) Width* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 102)
    END Width;

    PROCEDURE (this: TextColumns) PUTWidth* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 102, p1)
    END PUTWidth;

    PROCEDURE (this: TextColumns) Spacing* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 103)
    END Spacing;

    PROCEDURE (this: TextColumns) PUTSpacing* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 103, p1)
    END PUTSpacing;

    PROCEDURE (this: TextColumns) Item* (Index: INTEGER): TextColumn, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisTextColumn(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: TextColumns) Add* ((* optional *) Width: CtlT.Any; Spacing: CtlT.Any; EvenlySpaced: CtlT.Any): TextColumn, NEW;
        VAR arg: ARRAY 3 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Width, arg[2]);
        CtlC.AnyVar(Spacing, arg[1]);
        CtlC.AnyVar(EvenlySpaced, arg[0]);
        CtlC.CallParMethod(this, 201, arg, ret);
        RETURN ThisTextColumn(CtlC.VarAny(ret))
    END Add;

    PROCEDURE (this: TextColumns) SetCount* (NumColumns: INTEGER), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(NumColumns, arg[0]);
        CtlC.CallParMethod(this, 202, arg, NIL);
    END SetCount;


    (* ---------- TextColumn, dual, nonextensible ---------- *)

    PROCEDURE (this: TextColumn) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: TextColumn) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: TextColumn) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: TextColumn) Width* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 100)
    END Width;

    PROCEDURE (this: TextColumn) PUTWidth* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 100, p1)
    END PUTWidth;

    PROCEDURE (this: TextColumn) SpaceAfter* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 101)
    END SpaceAfter;

    PROCEDURE (this: TextColumn) PUTSpaceAfter* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 101, p1)
    END PUTSpaceAfter;


    (* ---------- Selection, dual, nonextensible ---------- *)

    PROCEDURE (this: Selection) Text* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 0)
    END Text;

    PROCEDURE (this: Selection) PUTText* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 0, p1)
    END PUTText;

    PROCEDURE (this: Selection) FormattedText* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 2))
    END FormattedText;

    PROCEDURE (this: Selection) PUTFormattedText* (p1: Range), NEW;
    BEGIN
        CtlC.PutObj(this, 2, p1)
    END PUTFormattedText;

    PROCEDURE (this: Selection) Start* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 3)
    END Start;

    PROCEDURE (this: Selection) PUTStart* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 3, p1)
    END PUTStart;

    PROCEDURE (this: Selection) End* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 4)
    END End;

    PROCEDURE (this: Selection) PUTEnd* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 4, p1)
    END PUTEnd;

    PROCEDURE (this: Selection) Font* (): Font, NEW;
    BEGIN
        RETURN This_Font(CtlC.GetAny(this, 5))
    END Font;

    PROCEDURE (this: Selection) PUTFont* (p1: Font), NEW;
    BEGIN
        CtlC.PutObj(this, 5, p1)
    END PUTFont;

    PROCEDURE (this: Selection) Type* (): WdSelectionType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 6)
    END Type;

    PROCEDURE (this: Selection) StoryType* (): WdStoryType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 7)
    END StoryType;

    PROCEDURE (this: Selection) Style* (): CtlT.Any, NEW;
    BEGIN
        RETURN CtlC.GetAny(this, 8)
    END Style;

    PROCEDURE (this: Selection) PUTStyle* (p1: CtlT.Any), NEW;
    BEGIN
        CtlC.PutAny(this, 8, p1)
    END PUTStyle;

    PROCEDURE (this: Selection) Tables* (): Tables, NEW;
    BEGIN
        RETURN ThisTables(CtlC.GetAny(this, 50))
    END Tables;

    PROCEDURE (this: Selection) Words* (): Words, NEW;
    BEGIN
        RETURN ThisWords(CtlC.GetAny(this, 51))
    END Words;

    PROCEDURE (this: Selection) Sentences* (): Sentences, NEW;
    BEGIN
        RETURN ThisSentences(CtlC.GetAny(this, 52))
    END Sentences;

    PROCEDURE (this: Selection) Characters* (): Characters, NEW;
    BEGIN
        RETURN ThisCharacters(CtlC.GetAny(this, 53))
    END Characters;

    PROCEDURE (this: Selection) Footnotes* (): Footnotes, NEW;
    BEGIN
        RETURN ThisFootnotes(CtlC.GetAny(this, 54))
    END Footnotes;

    PROCEDURE (this: Selection) Endnotes* (): Endnotes, NEW;
    BEGIN
        RETURN ThisEndnotes(CtlC.GetAny(this, 55))
    END Endnotes;

    PROCEDURE (this: Selection) Comments* (): Comments, NEW;
    BEGIN
        RETURN ThisComments(CtlC.GetAny(this, 56))
    END Comments;

    PROCEDURE (this: Selection) Cells* (): Cells, NEW;
    BEGIN
        RETURN ThisCells(CtlC.GetAny(this, 57))
    END Cells;

    PROCEDURE (this: Selection) Sections* (): Sections, NEW;
    BEGIN
        RETURN ThisSections(CtlC.GetAny(this, 58))
    END Sections;

    PROCEDURE (this: Selection) Paragraphs* (): Paragraphs, NEW;
    BEGIN
        RETURN ThisParagraphs(CtlC.GetAny(this, 59))
    END Paragraphs;

    PROCEDURE (this: Selection) Borders* (): Borders, NEW;
    BEGIN
        RETURN ThisBorders(CtlC.GetAny(this, 1100))
    END Borders;

    PROCEDURE (this: Selection) PUTBorders* (p1: Borders), NEW;
    BEGIN
        CtlC.PutObj(this, 1100, p1)
    END PUTBorders;

    PROCEDURE (this: Selection) Shading* (): Shading, NEW;
    BEGIN
        RETURN ThisShading(CtlC.GetAny(this, 61))
    END Shading;

    PROCEDURE (this: Selection) Fields* (): Fields, NEW;
    BEGIN
        RETURN ThisFields(CtlC.GetAny(this, 64))
    END Fields;

    PROCEDURE (this: Selection) FormFields* (): FormFields, NEW;
    BEGIN
        RETURN ThisFormFields(CtlC.GetAny(this, 65))
    END FormFields;

    PROCEDURE (this: Selection) Frames* (): Frames, NEW;
    BEGIN
        RETURN ThisFrames(CtlC.GetAny(this, 66))
    END Frames;

    PROCEDURE (this: Selection) ParagraphFormat* (): ParagraphFormat, NEW;
    BEGIN
        RETURN This_ParagraphFormat(CtlC.GetAny(this, 1102))
    END ParagraphFormat;

    PROCEDURE (this: Selection) PUTParagraphFormat* (p1: ParagraphFormat), NEW;
    BEGIN
        CtlC.PutObj(this, 1102, p1)
    END PUTParagraphFormat;

    PROCEDURE (this: Selection) PageSetup* (): PageSetup, NEW;
    BEGIN
        RETURN ThisPageSetup(CtlC.GetAny(this, 1101))
    END PageSetup;

    PROCEDURE (this: Selection) PUTPageSetup* (p1: PageSetup), NEW;
    BEGIN
        CtlC.PutObj(this, 1101, p1)
    END PUTPageSetup;

    PROCEDURE (this: Selection) Bookmarks* (): Bookmarks, NEW;
    BEGIN
        RETURN ThisBookmarks(CtlC.GetAny(this, 75))
    END Bookmarks;

    PROCEDURE (this: Selection) StoryLength* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 152)
    END StoryLength;

    PROCEDURE (this: Selection) LanguageID* (): WdLanguageID, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 153)
    END LanguageID;

    PROCEDURE (this: Selection) PUTLanguageID* (p1: WdLanguageID), NEW;
    BEGIN
        CtlC.PutInt(this, 153, p1)
    END PUTLanguageID;

    PROCEDURE (this: Selection) LanguageIDFarEast* (): WdLanguageID, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 154)
    END LanguageIDFarEast;

    PROCEDURE (this: Selection) PUTLanguageIDFarEast* (p1: WdLanguageID), NEW;
    BEGIN
        CtlC.PutInt(this, 154, p1)
    END PUTLanguageIDFarEast;

    PROCEDURE (this: Selection) LanguageIDOther* (): WdLanguageID, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 155)
    END LanguageIDOther;

    PROCEDURE (this: Selection) PUTLanguageIDOther* (p1: WdLanguageID), NEW;
    BEGIN
        CtlC.PutInt(this, 155, p1)
    END PUTLanguageIDOther;

    PROCEDURE (this: Selection) Hyperlinks* (): Hyperlinks, NEW;
    BEGIN
        RETURN ThisHyperlinks(CtlC.GetAny(this, 156))
    END Hyperlinks;

    PROCEDURE (this: Selection) Columns* (): Columns, NEW;
    BEGIN
        RETURN ThisColumns(CtlC.GetAny(this, 302))
    END Columns;

    PROCEDURE (this: Selection) Rows* (): Rows, NEW;
    BEGIN
        RETURN ThisRows(CtlC.GetAny(this, 303))
    END Rows;

    PROCEDURE (this: Selection) HeaderFooter* (): HeaderFooter, NEW;
    BEGIN
        RETURN ThisHeaderFooter(CtlC.GetAny(this, 306))
    END HeaderFooter;

    PROCEDURE (this: Selection) IsEndOfRowMark* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 307)
    END IsEndOfRowMark;

    PROCEDURE (this: Selection) BookmarkID* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 308)
    END BookmarkID;

    PROCEDURE (this: Selection) PreviousBookmarkID* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 309)
    END PreviousBookmarkID;

    PROCEDURE (this: Selection) Find* (): Find, NEW;
    BEGIN
        RETURN ThisFind(CtlC.GetAny(this, 262))
    END Find;

    PROCEDURE (this: Selection) Range* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 400))
    END Range;

    PROCEDURE (this: Selection) Information* (Type: WdInformation): CtlT.Any, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Type, arg[0]);
        CtlC.CallGetMethod(this, 401, arg, ret);
        RETURN CtlC.VarAny(ret)
    END Information;

    PROCEDURE (this: Selection) Flags* (): WdSelectionFlags, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 402)
    END Flags;

    PROCEDURE (this: Selection) PUTFlags* (p1: WdSelectionFlags), NEW;
    BEGIN
        CtlC.PutInt(this, 402, p1)
    END PUTFlags;

    PROCEDURE (this: Selection) Active* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 403)
    END Active;

    PROCEDURE (this: Selection) StartIsActive* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 404)
    END StartIsActive;

    PROCEDURE (this: Selection) PUTStartIsActive* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 404, p1)
    END PUTStartIsActive;

    PROCEDURE (this: Selection) IPAtEndOfLine* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 405)
    END IPAtEndOfLine;

    PROCEDURE (this: Selection) ExtendMode* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 406)
    END ExtendMode;

    PROCEDURE (this: Selection) PUTExtendMode* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 406, p1)
    END PUTExtendMode;

    PROCEDURE (this: Selection) ColumnSelectMode* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 407)
    END ColumnSelectMode;

    PROCEDURE (this: Selection) PUTColumnSelectMode* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 407, p1)
    END PUTColumnSelectMode;

    PROCEDURE (this: Selection) Orientation* (): WdTextOrientation, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 410)
    END Orientation;

    PROCEDURE (this: Selection) PUTOrientation* (p1: WdTextOrientation), NEW;
    BEGIN
        CtlC.PutInt(this, 410, p1)
    END PUTOrientation;

    PROCEDURE (this: Selection) InlineShapes* (): InlineShapes, NEW;
    BEGIN
        RETURN ThisInlineShapes(CtlC.GetAny(this, 411))
    END InlineShapes;

    PROCEDURE (this: Selection) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Selection) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Selection) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Selection) Document* (): Document, NEW;
    BEGIN
        RETURN This_Document(CtlC.GetAny(this, 1003))
    END Document;

    PROCEDURE (this: Selection) ShapeRange* (): ShapeRange, NEW;
    BEGIN
        RETURN ThisShapeRange(CtlC.GetAny(this, 1004))
    END ShapeRange;

    PROCEDURE (this: Selection) Select* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 65535, NIL);
    END Select;

    PROCEDURE (this: Selection) SetRange* (Start: INTEGER; End: INTEGER), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(Start, arg[1]);
        CtlC.IntVar(End, arg[0]);
        CtlC.CallParMethod(this, 100, arg, NIL);
    END SetRange;

    PROCEDURE (this: Selection) Collapse* ((* optional *) Direction: CtlT.Any), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Direction, arg[0]);
        CtlC.CallParMethod(this, 101, arg, NIL);
    END Collapse;

    PROCEDURE (this: Selection) InsertBefore* (Text: ARRAY OF CHAR), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.StrVar(Text, arg[0]);
        CtlC.CallParMethod(this, 102, arg, NIL);
    END InsertBefore;

    PROCEDURE (this: Selection) InsertAfter* (Text: ARRAY OF CHAR), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.StrVar(Text, arg[0]);
        CtlC.CallParMethod(this, 104, arg, NIL);
    END InsertAfter;

    PROCEDURE (this: Selection) Next* ((* optional *) Unit: CtlT.Any; Count: CtlT.Any): Range, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Unit, arg[1]);
        CtlC.AnyVar(Count, arg[0]);
        CtlC.CallParMethod(this, 105, arg, ret);
        RETURN ThisRange(CtlC.VarAny(ret))
    END Next;

    PROCEDURE (this: Selection) Previous* ((* optional *) Unit: CtlT.Any; Count: CtlT.Any): Range, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Unit, arg[1]);
        CtlC.AnyVar(Count, arg[0]);
        CtlC.CallParMethod(this, 106, arg, ret);
        RETURN ThisRange(CtlC.VarAny(ret))
    END Previous;

    PROCEDURE (this: Selection) StartOf* ((* optional *) Unit: CtlT.Any; Extend: CtlT.Any): INTEGER, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Unit, arg[1]);
        CtlC.AnyVar(Extend, arg[0]);
        CtlC.CallParMethod(this, 107, arg, ret);
        RETURN CtlC.VarInt(ret)
    END StartOf;

    PROCEDURE (this: Selection) EndOf* ((* optional *) Unit: CtlT.Any; Extend: CtlT.Any): INTEGER, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Unit, arg[1]);
        CtlC.AnyVar(Extend, arg[0]);
        CtlC.CallParMethod(this, 108, arg, ret);
        RETURN CtlC.VarInt(ret)
    END EndOf;

    PROCEDURE (this: Selection) Move* ((* optional *) Unit: CtlT.Any; Count: CtlT.Any): INTEGER, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Unit, arg[1]);
        CtlC.AnyVar(Count, arg[0]);
        CtlC.CallParMethod(this, 109, arg, ret);
        RETURN CtlC.VarInt(ret)
    END Move;

    PROCEDURE (this: Selection) MoveStart* ((* optional *) Unit: CtlT.Any; Count: CtlT.Any): INTEGER, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Unit, arg[1]);
        CtlC.AnyVar(Count, arg[0]);
        CtlC.CallParMethod(this, 110, arg, ret);
        RETURN CtlC.VarInt(ret)
    END MoveStart;

    PROCEDURE (this: Selection) MoveEnd* ((* optional *) Unit: CtlT.Any; Count: CtlT.Any): INTEGER, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Unit, arg[1]);
        CtlC.AnyVar(Count, arg[0]);
        CtlC.CallParMethod(this, 111, arg, ret);
        RETURN CtlC.VarInt(ret)
    END MoveEnd;

    PROCEDURE (this: Selection) MoveWhile* (Cset: CtlT.Any; (* optional *) Count: CtlT.Any): INTEGER, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Cset, arg[1]);
        CtlC.AnyVar(Count, arg[0]);
        CtlC.CallParMethod(this, 112, arg, ret);
        RETURN CtlC.VarInt(ret)
    END MoveWhile;

    PROCEDURE (this: Selection) MoveStartWhile* (Cset: CtlT.Any; (* optional *) Count: CtlT.Any): INTEGER, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Cset, arg[1]);
        CtlC.AnyVar(Count, arg[0]);
        CtlC.CallParMethod(this, 113, arg, ret);
        RETURN CtlC.VarInt(ret)
    END MoveStartWhile;

    PROCEDURE (this: Selection) MoveEndWhile* (Cset: CtlT.Any; (* optional *) Count: CtlT.Any): INTEGER, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Cset, arg[1]);
        CtlC.AnyVar(Count, arg[0]);
        CtlC.CallParMethod(this, 114, arg, ret);
        RETURN CtlC.VarInt(ret)
    END MoveEndWhile;

    PROCEDURE (this: Selection) MoveUntil* (Cset: CtlT.Any; (* optional *) Count: CtlT.Any): INTEGER, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Cset, arg[1]);
        CtlC.AnyVar(Count, arg[0]);
        CtlC.CallParMethod(this, 115, arg, ret);
        RETURN CtlC.VarInt(ret)
    END MoveUntil;

    PROCEDURE (this: Selection) MoveStartUntil* (Cset: CtlT.Any; (* optional *) Count: CtlT.Any): INTEGER, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Cset, arg[1]);
        CtlC.AnyVar(Count, arg[0]);
        CtlC.CallParMethod(this, 116, arg, ret);
        RETURN CtlC.VarInt(ret)
    END MoveStartUntil;

    PROCEDURE (this: Selection) MoveEndUntil* (Cset: CtlT.Any; (* optional *) Count: CtlT.Any): INTEGER, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Cset, arg[1]);
        CtlC.AnyVar(Count, arg[0]);
        CtlC.CallParMethod(this, 117, arg, ret);
        RETURN CtlC.VarInt(ret)
    END MoveEndUntil;

    PROCEDURE (this: Selection) Cut* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 119, NIL);
    END Cut;

    PROCEDURE (this: Selection) Copy* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 120, NIL);
    END Copy;

    PROCEDURE (this: Selection) Paste* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 121, NIL);
    END Paste;

    PROCEDURE (this: Selection) InsertBreak* ((* optional *) Type: CtlT.Any), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Type, arg[0]);
        CtlC.CallParMethod(this, 122, arg, NIL);
    END InsertBreak;

    PROCEDURE (this: Selection) InsertFile* (FileName: ARRAY OF CHAR; (* optional *) Range: CtlT.Any; ConfirmConversions: CtlT.Any; Link: CtlT.Any; Attachment: CtlT.Any), NEW;
        VAR arg: ARRAY 5 OF CtlT.Variant;
    BEGIN
        CtlC.StrVar(FileName, arg[4]);
        CtlC.AnyVar(Range, arg[3]);
        CtlC.AnyVar(ConfirmConversions, arg[2]);
        CtlC.AnyVar(Link, arg[1]);
        CtlC.AnyVar(Attachment, arg[0]);
        CtlC.CallParMethod(this, 123, arg, NIL);
    END InsertFile;

    PROCEDURE (this: Selection) InStory* (range: Range): BOOLEAN, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.ObjVar(range, arg[0]);
        CtlC.CallParMethod(this, 125, arg, ret);
        RETURN CtlC.VarBool(ret)
    END InStory;

    PROCEDURE (this: Selection) InRange* (range: Range): BOOLEAN, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.ObjVar(range, arg[0]);
        CtlC.CallParMethod(this, 126, arg, ret);
        RETURN CtlC.VarBool(ret)
    END InRange;

    PROCEDURE (this: Selection) Delete* ((* optional *) Unit: CtlT.Any; Count: CtlT.Any): INTEGER, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Unit, arg[1]);
        CtlC.AnyVar(Count, arg[0]);
        CtlC.CallParMethod(this, 127, arg, ret);
        RETURN CtlC.VarInt(ret)
    END Delete;

    PROCEDURE (this: Selection) Expand* ((* optional *) Unit: CtlT.Any): INTEGER, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Unit, arg[0]);
        CtlC.CallParMethod(this, 129, arg, ret);
        RETURN CtlC.VarInt(ret)
    END Expand;

    PROCEDURE (this: Selection) InsertParagraph* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 160, NIL);
    END InsertParagraph;

    PROCEDURE (this: Selection) InsertParagraphAfter* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 161, NIL);
    END InsertParagraphAfter;

    PROCEDURE (this: Selection) ConvertToTable* ((* optional *) Separator: CtlT.Any; NumRows: CtlT.Any; NumColumns: CtlT.Any; InitialColumnWidth: CtlT.Any; Format: CtlT.Any; ApplyBorders: CtlT.Any; ApplyShading: CtlT.Any; ApplyFont: CtlT.Any; ApplyColor: CtlT.Any; ApplyHeadingRows: CtlT.Any; ApplyLastRow: CtlT.Any; ApplyFirstColumn: CtlT.Any; ApplyLastColumn: CtlT.Any; AutoFit: CtlT.Any): Table, NEW;
        VAR arg: ARRAY 14 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Separator, arg[13]);
        CtlC.AnyVar(NumRows, arg[12]);
        CtlC.AnyVar(NumColumns, arg[11]);
        CtlC.AnyVar(InitialColumnWidth, arg[10]);
        CtlC.AnyVar(Format, arg[9]);
        CtlC.AnyVar(ApplyBorders, arg[8]);
        CtlC.AnyVar(ApplyShading, arg[7]);
        CtlC.AnyVar(ApplyFont, arg[6]);
        CtlC.AnyVar(ApplyColor, arg[5]);
        CtlC.AnyVar(ApplyHeadingRows, arg[4]);
        CtlC.AnyVar(ApplyLastRow, arg[3]);
        CtlC.AnyVar(ApplyFirstColumn, arg[2]);
        CtlC.AnyVar(ApplyLastColumn, arg[1]);
        CtlC.AnyVar(AutoFit, arg[0]);
        CtlC.CallParMethod(this, 162, arg, ret);
        RETURN ThisTable(CtlC.VarAny(ret))
    END ConvertToTable;

    PROCEDURE (this: Selection) InsertDateTime* ((* optional *) DateTimeFormat: CtlT.Any; InsertAsField: CtlT.Any; InsertAsFullWidth: CtlT.Any), NEW;
        VAR arg: ARRAY 3 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(DateTimeFormat, arg[2]);
        CtlC.AnyVar(InsertAsField, arg[1]);
        CtlC.AnyVar(InsertAsFullWidth, arg[0]);
        CtlC.CallParMethod(this, 163, arg, NIL);
    END InsertDateTime;

    PROCEDURE (this: Selection) InsertSymbol* (CharacterNumber: INTEGER; (* optional *) Font: CtlT.Any; Unicode: CtlT.Any; Bias: CtlT.Any), NEW;
        VAR arg: ARRAY 4 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(CharacterNumber, arg[3]);
        CtlC.AnyVar(Font, arg[2]);
        CtlC.AnyVar(Unicode, arg[1]);
        CtlC.AnyVar(Bias, arg[0]);
        CtlC.CallParMethod(this, 164, arg, NIL);
    END InsertSymbol;

    PROCEDURE (this: Selection) InsertCrossReference* (ReferenceType: CtlT.Any; ReferenceKind: WdReferenceKind; ReferenceItem: CtlT.Any; (* optional *) InsertAsHyperlink: CtlT.Any; IncludePosition: CtlT.Any), NEW;
        VAR arg: ARRAY 5 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(ReferenceType, arg[4]);
        CtlC.IntVar(ReferenceKind, arg[3]);
        CtlC.AnyVar(ReferenceItem, arg[2]);
        CtlC.AnyVar(InsertAsHyperlink, arg[1]);
        CtlC.AnyVar(IncludePosition, arg[0]);
        CtlC.CallParMethod(this, 165, arg, NIL);
    END InsertCrossReference;

    PROCEDURE (this: Selection) InsertCaption* (Label: CtlT.Any; (* optional *) Title: CtlT.Any; TitleAutoText: CtlT.Any; Position: CtlT.Any), NEW;
        VAR arg: ARRAY 4 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Label, arg[3]);
        CtlC.AnyVar(Title, arg[2]);
        CtlC.AnyVar(TitleAutoText, arg[1]);
        CtlC.AnyVar(Position, arg[0]);
        CtlC.CallParMethod(this, 166, arg, NIL);
    END InsertCaption;

    PROCEDURE (this: Selection) CopyAsPicture* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 167, NIL);
    END CopyAsPicture;

    PROCEDURE (this: Selection) Sort* ((* optional *) ExcludeHeader: CtlT.Any; FieldNumber: CtlT.Any; SortFieldType: CtlT.Any; SortOrder: CtlT.Any; FieldNumber2: CtlT.Any; SortFieldType2: CtlT.Any; SortOrder2: CtlT.Any; FieldNumber3: CtlT.Any; SortFieldType3: CtlT.Any; SortOrder3: CtlT.Any; SortColumn: CtlT.Any; Separator: CtlT.Any; CaseSensitive: CtlT.Any; LanguageID: CtlT.Any), NEW;
        VAR arg: ARRAY 14 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(ExcludeHeader, arg[13]);
        CtlC.AnyVar(FieldNumber, arg[12]);
        CtlC.AnyVar(SortFieldType, arg[11]);
        CtlC.AnyVar(SortOrder, arg[10]);
        CtlC.AnyVar(FieldNumber2, arg[9]);
        CtlC.AnyVar(SortFieldType2, arg[8]);
        CtlC.AnyVar(SortOrder2, arg[7]);
        CtlC.AnyVar(FieldNumber3, arg[6]);
        CtlC.AnyVar(SortFieldType3, arg[5]);
        CtlC.AnyVar(SortOrder3, arg[4]);
        CtlC.AnyVar(SortColumn, arg[3]);
        CtlC.AnyVar(Separator, arg[2]);
        CtlC.AnyVar(CaseSensitive, arg[1]);
        CtlC.AnyVar(LanguageID, arg[0]);
        CtlC.CallParMethod(this, 168, arg, NIL);
    END Sort;

    PROCEDURE (this: Selection) SortAscending* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 169, NIL);
    END SortAscending;

    PROCEDURE (this: Selection) SortDescending* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 170, NIL);
    END SortDescending;

    PROCEDURE (this: Selection) IsEqual* (range: Range): BOOLEAN, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.ObjVar(range, arg[0]);
        CtlC.CallParMethod(this, 171, arg, ret);
        RETURN CtlC.VarBool(ret)
    END IsEqual;

    PROCEDURE (this: Selection) Calculate* (): SHORTREAL, NEW;
        VAR ret: CtlT.Variant;
    BEGIN
        CtlC.CallMethod(this, 172, ret);
        RETURN CtlC.VarSReal(ret)
    END Calculate;

    PROCEDURE (this: Selection) GoTo* ((* optional *) What: CtlT.Any; Which: CtlT.Any; Count: CtlT.Any; Name: CtlT.Any): Range, NEW;
        VAR arg: ARRAY 4 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(What, arg[3]);
        CtlC.AnyVar(Which, arg[2]);
        CtlC.AnyVar(Count, arg[1]);
        CtlC.AnyVar(Name, arg[0]);
        CtlC.CallParMethod(this, 173, arg, ret);
        RETURN ThisRange(CtlC.VarAny(ret))
    END GoTo;

    PROCEDURE (this: Selection) GoToNext* (What: WdGoToItem): Range, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(What, arg[0]);
        CtlC.CallParMethod(this, 174, arg, ret);
        RETURN ThisRange(CtlC.VarAny(ret))
    END GoToNext;

    PROCEDURE (this: Selection) GoToPrevious* (What: WdGoToItem): Range, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(What, arg[0]);
        CtlC.CallParMethod(this, 175, arg, ret);
        RETURN ThisRange(CtlC.VarAny(ret))
    END GoToPrevious;

    PROCEDURE (this: Selection) PasteSpecial* ((* optional *) IconIndex: CtlT.Any; Link: CtlT.Any; Placement: CtlT.Any; DisplayAsIcon: CtlT.Any; DataType: CtlT.Any; IconFileName: CtlT.Any; IconLabel: CtlT.Any), NEW;
        VAR arg: ARRAY 7 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(IconIndex, arg[6]);
        CtlC.AnyVar(Link, arg[5]);
        CtlC.AnyVar(Placement, arg[4]);
        CtlC.AnyVar(DisplayAsIcon, arg[3]);
        CtlC.AnyVar(DataType, arg[2]);
        CtlC.AnyVar(IconFileName, arg[1]);
        CtlC.AnyVar(IconLabel, arg[0]);
        CtlC.CallParMethod(this, 176, arg, NIL);
    END PasteSpecial;

    PROCEDURE (this: Selection) PreviousField* (): Field, NEW;
        VAR ret: CtlT.Variant;
    BEGIN
        CtlC.CallMethod(this, 177, ret);
        RETURN ThisField(CtlC.VarAny(ret))
    END PreviousField;

    PROCEDURE (this: Selection) NextField* (): Field, NEW;
        VAR ret: CtlT.Variant;
    BEGIN
        CtlC.CallMethod(this, 178, ret);
        RETURN ThisField(CtlC.VarAny(ret))
    END NextField;

    PROCEDURE (this: Selection) InsertParagraphBefore* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 212, NIL);
    END InsertParagraphBefore;

    PROCEDURE (this: Selection) InsertCells* ((* optional *) ShiftCells: CtlT.Any), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(ShiftCells, arg[0]);
        CtlC.CallParMethod(this, 214, arg, NIL);
    END InsertCells;

    PROCEDURE (this: Selection) Extend* ((* optional *) Character: CtlT.Any), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Character, arg[0]);
        CtlC.CallParMethod(this, 300, arg, NIL);
    END Extend;

    PROCEDURE (this: Selection) Shrink* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 301, NIL);
    END Shrink;

    PROCEDURE (this: Selection) MoveLeft* ((* optional *) Unit: CtlT.Any; Count: CtlT.Any; Extend: CtlT.Any): INTEGER, NEW;
        VAR arg: ARRAY 3 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Unit, arg[2]);
        CtlC.AnyVar(Count, arg[1]);
        CtlC.AnyVar(Extend, arg[0]);
        CtlC.CallParMethod(this, 500, arg, ret);
        RETURN CtlC.VarInt(ret)
    END MoveLeft;

    PROCEDURE (this: Selection) MoveRight* ((* optional *) Unit: CtlT.Any; Count: CtlT.Any; Extend: CtlT.Any): INTEGER, NEW;
        VAR arg: ARRAY 3 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Unit, arg[2]);
        CtlC.AnyVar(Count, arg[1]);
        CtlC.AnyVar(Extend, arg[0]);
        CtlC.CallParMethod(this, 501, arg, ret);
        RETURN CtlC.VarInt(ret)
    END MoveRight;

    PROCEDURE (this: Selection) MoveUp* ((* optional *) Unit: CtlT.Any; Count: CtlT.Any; Extend: CtlT.Any): INTEGER, NEW;
        VAR arg: ARRAY 3 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Unit, arg[2]);
        CtlC.AnyVar(Count, arg[1]);
        CtlC.AnyVar(Extend, arg[0]);
        CtlC.CallParMethod(this, 502, arg, ret);
        RETURN CtlC.VarInt(ret)
    END MoveUp;

    PROCEDURE (this: Selection) MoveDown* ((* optional *) Unit: CtlT.Any; Count: CtlT.Any; Extend: CtlT.Any): INTEGER, NEW;
        VAR arg: ARRAY 3 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Unit, arg[2]);
        CtlC.AnyVar(Count, arg[1]);
        CtlC.AnyVar(Extend, arg[0]);
        CtlC.CallParMethod(this, 503, arg, ret);
        RETURN CtlC.VarInt(ret)
    END MoveDown;

    PROCEDURE (this: Selection) HomeKey* ((* optional *) Unit: CtlT.Any; Extend: CtlT.Any): INTEGER, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Unit, arg[1]);
        CtlC.AnyVar(Extend, arg[0]);
        CtlC.CallParMethod(this, 504, arg, ret);
        RETURN CtlC.VarInt(ret)
    END HomeKey;

    PROCEDURE (this: Selection) EndKey* ((* optional *) Unit: CtlT.Any; Extend: CtlT.Any): INTEGER, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Unit, arg[1]);
        CtlC.AnyVar(Extend, arg[0]);
        CtlC.CallParMethod(this, 505, arg, ret);
        RETURN CtlC.VarInt(ret)
    END EndKey;

    PROCEDURE (this: Selection) EscapeKey* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 506, NIL);
    END EscapeKey;

    PROCEDURE (this: Selection) TypeText* (Text: ARRAY OF CHAR), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.StrVar(Text, arg[0]);
        CtlC.CallParMethod(this, 507, arg, NIL);
    END TypeText;

    PROCEDURE (this: Selection) CopyFormat* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 509, NIL);
    END CopyFormat;

    PROCEDURE (this: Selection) PasteFormat* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 510, NIL);
    END PasteFormat;

    PROCEDURE (this: Selection) TypeParagraph* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 512, NIL);
    END TypeParagraph;

    PROCEDURE (this: Selection) TypeBackspace* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 513, NIL);
    END TypeBackspace;

    PROCEDURE (this: Selection) NextSubdocument* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 514, NIL);
    END NextSubdocument;

    PROCEDURE (this: Selection) PreviousSubdocument* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 515, NIL);
    END PreviousSubdocument;

    PROCEDURE (this: Selection) SelectColumn* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 516, NIL);
    END SelectColumn;

    PROCEDURE (this: Selection) SelectCurrentFont* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 517, NIL);
    END SelectCurrentFont;

    PROCEDURE (this: Selection) SelectCurrentAlignment* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 518, NIL);
    END SelectCurrentAlignment;

    PROCEDURE (this: Selection) SelectCurrentSpacing* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 519, NIL);
    END SelectCurrentSpacing;

    PROCEDURE (this: Selection) SelectCurrentIndent* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 520, NIL);
    END SelectCurrentIndent;

    PROCEDURE (this: Selection) SelectCurrentTabs* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 521, NIL);
    END SelectCurrentTabs;

    PROCEDURE (this: Selection) SelectCurrentColor* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 522, NIL);
    END SelectCurrentColor;

    PROCEDURE (this: Selection) CreateTextbox* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 523, NIL);
    END CreateTextbox;

    PROCEDURE (this: Selection) WholeStory* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 524, NIL);
    END WholeStory;

    PROCEDURE (this: Selection) SelectRow* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 525, NIL);
    END SelectRow;

    PROCEDURE (this: Selection) SplitTable* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 526, NIL);
    END SplitTable;

    PROCEDURE (this: Selection) InsertRows* ((* optional *) NumRows: CtlT.Any), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(NumRows, arg[0]);
        CtlC.CallParMethod(this, 528, arg, NIL);
    END InsertRows;

    PROCEDURE (this: Selection) InsertColumns* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 529, NIL);
    END InsertColumns;

    PROCEDURE (this: Selection) InsertFormula* ((* optional *) Formula: CtlT.Any; NumberFormat: CtlT.Any), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Formula, arg[1]);
        CtlC.AnyVar(NumberFormat, arg[0]);
        CtlC.CallParMethod(this, 530, arg, NIL);
    END InsertFormula;

    PROCEDURE (this: Selection) NextRevision* ((* optional *) Wrap: CtlT.Any): Revision, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Wrap, arg[0]);
        CtlC.CallParMethod(this, 531, arg, ret);
        RETURN ThisRevision(CtlC.VarAny(ret))
    END NextRevision;

    PROCEDURE (this: Selection) PreviousRevision* ((* optional *) Wrap: CtlT.Any): Revision, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Wrap, arg[0]);
        CtlC.CallParMethod(this, 532, arg, ret);
        RETURN ThisRevision(CtlC.VarAny(ret))
    END PreviousRevision;


    (* ---------- TablesOfAuthoritiesCategories, dual, nonextensible ---------- *)

    PROCEDURE (this: TablesOfAuthoritiesCategories) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: TablesOfAuthoritiesCategories) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: TablesOfAuthoritiesCategories) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: TablesOfAuthoritiesCategories) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: TablesOfAuthoritiesCategories) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Count;

    PROCEDURE (this: TablesOfAuthoritiesCategories) Item* (Index: CtlT.Any): TableOfAuthoritiesCategory, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisTableOfAuthoritiesCategory(CtlC.VarAny(ret))
    END Item;


    (* ---------- TableOfAuthoritiesCategory, dual, nonextensible ---------- *)

    PROCEDURE (this: TableOfAuthoritiesCategory) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: TableOfAuthoritiesCategory) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: TableOfAuthoritiesCategory) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: TableOfAuthoritiesCategory) Name* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 0)
    END Name;

    PROCEDURE (this: TableOfAuthoritiesCategory) PUTName* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 0, p1)
    END PUTName;

    PROCEDURE (this: TableOfAuthoritiesCategory) Index* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Index;


    (* ---------- CaptionLabels, dual, nonextensible ---------- *)

    PROCEDURE (this: CaptionLabels) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: CaptionLabels) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: CaptionLabels) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: CaptionLabels) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: CaptionLabels) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Count;

    PROCEDURE (this: CaptionLabels) Item* (Index: CtlT.Any): CaptionLabel, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisCaptionLabel(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: CaptionLabels) Add* (Name: ARRAY OF CHAR): CaptionLabel, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.StrVar(Name, arg[0]);
        CtlC.CallParMethod(this, 100, arg, ret);
        RETURN ThisCaptionLabel(CtlC.VarAny(ret))
    END Add;


    (* ---------- CaptionLabel, dual, nonextensible ---------- *)

    PROCEDURE (this: CaptionLabel) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: CaptionLabel) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: CaptionLabel) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: CaptionLabel) Name* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 0)
    END Name;

    PROCEDURE (this: CaptionLabel) BuiltIn* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 1)
    END BuiltIn;

    PROCEDURE (this: CaptionLabel) ID* (): WdCaptionLabelID, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END ID;

    PROCEDURE (this: CaptionLabel) IncludeChapterNumber* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 3)
    END IncludeChapterNumber;

    PROCEDURE (this: CaptionLabel) PUTIncludeChapterNumber* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 3, p1)
    END PUTIncludeChapterNumber;

    PROCEDURE (this: CaptionLabel) NumberStyle* (): WdCaptionNumberStyle, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 4)
    END NumberStyle;

    PROCEDURE (this: CaptionLabel) PUTNumberStyle* (p1: WdCaptionNumberStyle), NEW;
    BEGIN
        CtlC.PutInt(this, 4, p1)
    END PUTNumberStyle;

    PROCEDURE (this: CaptionLabel) ChapterStyleLevel* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 5)
    END ChapterStyleLevel;

    PROCEDURE (this: CaptionLabel) PUTChapterStyleLevel* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 5, p1)
    END PUTChapterStyleLevel;

    PROCEDURE (this: CaptionLabel) Separator* (): WdSeparatorType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 6)
    END Separator;

    PROCEDURE (this: CaptionLabel) PUTSeparator* (p1: WdSeparatorType), NEW;
    BEGIN
        CtlC.PutInt(this, 6, p1)
    END PUTSeparator;

    PROCEDURE (this: CaptionLabel) Position* (): WdCaptionPosition, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 7)
    END Position;

    PROCEDURE (this: CaptionLabel) PUTPosition* (p1: WdCaptionPosition), NEW;
    BEGIN
        CtlC.PutInt(this, 7, p1)
    END PUTPosition;

    PROCEDURE (this: CaptionLabel) Delete* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 100, NIL);
    END Delete;


    (* ---------- AutoCaptions, dual, nonextensible ---------- *)

    PROCEDURE (this: AutoCaptions) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: AutoCaptions) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: AutoCaptions) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: AutoCaptions) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: AutoCaptions) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Count;

    PROCEDURE (this: AutoCaptions) Item* (Index: CtlT.Any): AutoCaption, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisAutoCaption(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: AutoCaptions) CancelAutoInsert* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 100, NIL);
    END CancelAutoInsert;


    (* ---------- AutoCaption, dual, nonextensible ---------- *)

    PROCEDURE (this: AutoCaption) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: AutoCaption) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: AutoCaption) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: AutoCaption) Name* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 0)
    END Name;

    PROCEDURE (this: AutoCaption) AutoInsert* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 1)
    END AutoInsert;

    PROCEDURE (this: AutoCaption) PUTAutoInsert* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 1, p1)
    END PUTAutoInsert;

    PROCEDURE (this: AutoCaption) Index* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Index;

    PROCEDURE (this: AutoCaption) CaptionLabel* (): CtlT.Any, NEW;
    BEGIN
        RETURN CtlC.GetAny(this, 3)
    END CaptionLabel;

    PROCEDURE (this: AutoCaption) PUTCaptionLabel* (p1: CtlT.Any), NEW;
    BEGIN
        CtlC.PutAny(this, 3, p1)
    END PUTCaptionLabel;


    (* ---------- Indexes, dual, nonextensible ---------- *)

    PROCEDURE (this: Indexes) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Indexes) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Indexes) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Indexes) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: Indexes) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Count;

    PROCEDURE (this: Indexes) Format* (): WdIndexFormat, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Format;

    PROCEDURE (this: Indexes) PUTFormat* (p1: WdIndexFormat), NEW;
    BEGIN
        CtlC.PutInt(this, 2, p1)
    END PUTFormat;

    PROCEDURE (this: Indexes) Item* (index: INTEGER): Index, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisIndex(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: Indexes) Add* (range: Range; (* optional *) HeadingSeparator: CtlT.Any; RightAlignPageNumbers: CtlT.Any; Type: CtlT.Any; NumberOfColumns: CtlT.Any; AccentedLetters: CtlT.Any): Index, NEW;
        VAR arg: ARRAY 6 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.ObjVar(range, arg[5]);
        CtlC.AnyVar(HeadingSeparator, arg[4]);
        CtlC.AnyVar(RightAlignPageNumbers, arg[3]);
        CtlC.AnyVar(Type, arg[2]);
        CtlC.AnyVar(NumberOfColumns, arg[1]);
        CtlC.AnyVar(AccentedLetters, arg[0]);
        CtlC.CallParMethod(this, 100, arg, ret);
        RETURN ThisIndex(CtlC.VarAny(ret))
    END Add;

    PROCEDURE (this: Indexes) MarkEntry* (range: Range; (* optional *) Entry: CtlT.Any; EntryAutoText: CtlT.Any; CrossReference: CtlT.Any; CrossReferenceAutoText: CtlT.Any; BookmarkName: CtlT.Any; Bold: CtlT.Any; Italic: CtlT.Any; Reading: CtlT.Any): Field, NEW;
        VAR arg: ARRAY 9 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.ObjVar(range, arg[8]);
        CtlC.AnyVar(Entry, arg[7]);
        CtlC.AnyVar(EntryAutoText, arg[6]);
        CtlC.AnyVar(CrossReference, arg[5]);
        CtlC.AnyVar(CrossReferenceAutoText, arg[4]);
        CtlC.AnyVar(BookmarkName, arg[3]);
        CtlC.AnyVar(Bold, arg[2]);
        CtlC.AnyVar(Italic, arg[1]);
        CtlC.AnyVar(Reading, arg[0]);
        CtlC.CallParMethod(this, 101, arg, ret);
        RETURN ThisField(CtlC.VarAny(ret))
    END MarkEntry;

    PROCEDURE (this: Indexes) MarkAllEntries* (range: Range; (* optional *) Entry: CtlT.Any; EntryAutoText: CtlT.Any; CrossReference: CtlT.Any; CrossReferenceAutoText: CtlT.Any; BookmarkName: CtlT.Any; Bold: CtlT.Any; Italic: CtlT.Any), NEW;
        VAR arg: ARRAY 8 OF CtlT.Variant;
    BEGIN
        CtlC.ObjVar(range, arg[7]);
        CtlC.AnyVar(Entry, arg[6]);
        CtlC.AnyVar(EntryAutoText, arg[5]);
        CtlC.AnyVar(CrossReference, arg[4]);
        CtlC.AnyVar(CrossReferenceAutoText, arg[3]);
        CtlC.AnyVar(BookmarkName, arg[2]);
        CtlC.AnyVar(Bold, arg[1]);
        CtlC.AnyVar(Italic, arg[0]);
        CtlC.CallParMethod(this, 102, arg, NIL);
    END MarkAllEntries;

    PROCEDURE (this: Indexes) AutoMarkEntries* (ConcordanceFileName: ARRAY OF CHAR), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.StrVar(ConcordanceFileName, arg[0]);
        CtlC.CallParMethod(this, 103, arg, NIL);
    END AutoMarkEntries;


    (* ---------- Index, dual, nonextensible ---------- *)

    PROCEDURE (this: Index) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Index) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Index) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Index) HeadingSeparator* (): WdHeadingSeparator, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END HeadingSeparator;

    PROCEDURE (this: Index) PUTHeadingSeparator* (p1: WdHeadingSeparator), NEW;
    BEGIN
        CtlC.PutInt(this, 1, p1)
    END PUTHeadingSeparator;

    PROCEDURE (this: Index) RightAlignPageNumbers* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 2)
    END RightAlignPageNumbers;

    PROCEDURE (this: Index) PUTRightAlignPageNumbers* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 2, p1)
    END PUTRightAlignPageNumbers;

    PROCEDURE (this: Index) Type* (): WdIndexType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 3)
    END Type;

    PROCEDURE (this: Index) PUTType* (p1: WdIndexType), NEW;
    BEGIN
        CtlC.PutInt(this, 3, p1)
    END PUTType;

    PROCEDURE (this: Index) NumberOfColumns* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 4)
    END NumberOfColumns;

    PROCEDURE (this: Index) PUTNumberOfColumns* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 4, p1)
    END PUTNumberOfColumns;

    PROCEDURE (this: Index) Range* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 5))
    END Range;

    PROCEDURE (this: Index) TabLeader* (): WdTabLeader, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 6)
    END TabLeader;

    PROCEDURE (this: Index) PUTTabLeader* (p1: WdTabLeader), NEW;
    BEGIN
        CtlC.PutInt(this, 6, p1)
    END PUTTabLeader;

    PROCEDURE (this: Index) AccentedLetters* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 7)
    END AccentedLetters;

    PROCEDURE (this: Index) PUTAccentedLetters* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 7, p1)
    END PUTAccentedLetters;

    PROCEDURE (this: Index) SortBy* (): WdIndexSortBy, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 8)
    END SortBy;

    PROCEDURE (this: Index) PUTSortBy* (p1: WdIndexSortBy), NEW;
    BEGIN
        CtlC.PutInt(this, 8, p1)
    END PUTSortBy;

    PROCEDURE (this: Index) Filter* (): WdIndexFilter, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 9)
    END Filter;

    PROCEDURE (this: Index) PUTFilter* (p1: WdIndexFilter), NEW;
    BEGIN
        CtlC.PutInt(this, 9, p1)
    END PUTFilter;

    PROCEDURE (this: Index) Delete* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 100, NIL);
    END Delete;

    PROCEDURE (this: Index) Update* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 102, NIL);
    END Update;


    (* ---------- AddIn, dual, nonextensible ---------- *)

    PROCEDURE (this: AddIn) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: AddIn) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: AddIn) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: AddIn) Name* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 0)
    END Name;

    PROCEDURE (this: AddIn) Index* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Index;

    PROCEDURE (this: AddIn) Path* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 3)
    END Path;

    PROCEDURE (this: AddIn) Installed* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 4)
    END Installed;

    PROCEDURE (this: AddIn) PUTInstalled* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 4, p1)
    END PUTInstalled;

    PROCEDURE (this: AddIn) Compiled* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 5)
    END Compiled;

    PROCEDURE (this: AddIn) Autoload* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 6)
    END Autoload;

    PROCEDURE (this: AddIn) Delete* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 101, NIL);
    END Delete;


    (* ---------- AddIns, dual, nonextensible ---------- *)

    PROCEDURE (this: AddIns) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: AddIns) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: AddIns) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: AddIns) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: AddIns) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Count;

    PROCEDURE (this: AddIns) Item* (Index: CtlT.Any): AddIn, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisAddIn(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: AddIns) Add* (FileName: ARRAY OF CHAR; (* optional *) Install: CtlT.Any): AddIn, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.StrVar(FileName, arg[1]);
        CtlC.AnyVar(Install, arg[0]);
        CtlC.CallParMethod(this, 2, arg, ret);
        RETURN ThisAddIn(CtlC.VarAny(ret))
    END Add;

    PROCEDURE (this: AddIns) Unload* (RemoveFromList: BOOLEAN), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.BoolVar(RemoveFromList, arg[0]);
        CtlC.CallParMethod(this, 3, arg, NIL);
    END Unload;


    (* ---------- Revisions, dual, nonextensible ---------- *)

    PROCEDURE (this: Revisions) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Revisions) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Revisions) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Revisions) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: Revisions) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 5)
    END Count;

    PROCEDURE (this: Revisions) Item* (Index: INTEGER): Revision, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisRevision(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: Revisions) AcceptAll* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 101, NIL);
    END AcceptAll;

    PROCEDURE (this: Revisions) RejectAll* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 102, NIL);
    END RejectAll;


    (* ---------- Revision, dual, nonextensible ---------- *)

    PROCEDURE (this: Revision) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Revision) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Revision) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Revision) Author* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 1)
    END Author;

    PROCEDURE (this: Revision) Date* (): CtlT.OleDate;
    BEGIN
        RETURN CtlC.GetDate(this, 2)
    END Date;

    PROCEDURE (this: Revision) Range* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 3))
    END Range;

    PROCEDURE (this: Revision) Type* (): WdRevisionType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 4)
    END Type;

    PROCEDURE (this: Revision) Index* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 5)
    END Index;

    PROCEDURE (this: Revision) Accept* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 101, NIL);
    END Accept;

    PROCEDURE (this: Revision) Reject* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 102, NIL);
    END Reject;


    (* ---------- Task, dual, nonextensible ---------- *)

    PROCEDURE (this: Task) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Task) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Task) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Task) Name* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 0)
    END Name;

    PROCEDURE (this: Task) Left* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Left;

    PROCEDURE (this: Task) PUTLeft* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 1, p1)
    END PUTLeft;

    PROCEDURE (this: Task) Top* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Top;

    PROCEDURE (this: Task) PUTTop* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 2, p1)
    END PUTTop;

    PROCEDURE (this: Task) Width* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 3)
    END Width;

    PROCEDURE (this: Task) PUTWidth* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 3, p1)
    END PUTWidth;

    PROCEDURE (this: Task) Height* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 4)
    END Height;

    PROCEDURE (this: Task) PUTHeight* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 4, p1)
    END PUTHeight;

    PROCEDURE (this: Task) WindowState* (): WdWindowState, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 5)
    END WindowState;

    PROCEDURE (this: Task) PUTWindowState* (p1: WdWindowState), NEW;
    BEGIN
        CtlC.PutInt(this, 5, p1)
    END PUTWindowState;

    PROCEDURE (this: Task) Visible* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 6)
    END Visible;

    PROCEDURE (this: Task) PUTVisible* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 6, p1)
    END PUTVisible;

    PROCEDURE (this: Task) Activate* ((* optional *) Wait: CtlT.Any), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Wait, arg[0]);
        CtlC.CallParMethod(this, 10, arg, NIL);
    END Activate;

    PROCEDURE (this: Task) Close* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 11, NIL);
    END Close;

    PROCEDURE (this: Task) Move* (Left: INTEGER; Top: INTEGER), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(Left, arg[1]);
        CtlC.IntVar(Top, arg[0]);
        CtlC.CallParMethod(this, 12, arg, NIL);
    END Move;

    PROCEDURE (this: Task) Resize* (Width: INTEGER; Height: INTEGER), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(Width, arg[1]);
        CtlC.IntVar(Height, arg[0]);
        CtlC.CallParMethod(this, 13, arg, NIL);
    END Resize;

    PROCEDURE (this: Task) SendWindowMessage* (Message: INTEGER; wParam: INTEGER; lParam: INTEGER), NEW;
        VAR arg: ARRAY 3 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(Message, arg[2]);
        CtlC.IntVar(wParam, arg[1]);
        CtlC.IntVar(lParam, arg[0]);
        CtlC.CallParMethod(this, 14, arg, NIL);
    END SendWindowMessage;


    (* ---------- Tasks, dual, nonextensible ---------- *)

    PROCEDURE (this: Tasks) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Tasks) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Tasks) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Tasks) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: Tasks) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Count;

    PROCEDURE (this: Tasks) Item* (Index: CtlT.Any): Task, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisTask(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: Tasks) Exists* (Name: ARRAY OF CHAR): BOOLEAN, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.StrVar(Name, arg[0]);
        CtlC.CallParMethod(this, 2, arg, ret);
        RETURN CtlC.VarBool(ret)
    END Exists;

    PROCEDURE (this: Tasks) ExitWindows* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 3, NIL);
    END ExitWindows;


    (* ---------- HeadersFooters, dual, nonextensible ---------- *)

    PROCEDURE (this: HeadersFooters) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: HeadersFooters) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: HeadersFooters) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: HeadersFooters) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: HeadersFooters) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Count;

    PROCEDURE (this: HeadersFooters) Item* (Index: WdHeaderFooterIndex): HeaderFooter, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisHeaderFooter(CtlC.VarAny(ret))
    END Item;


    (* ---------- HeaderFooter, dual, nonextensible ---------- *)

    PROCEDURE (this: HeaderFooter) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: HeaderFooter) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: HeaderFooter) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: HeaderFooter) Range* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 0))
    END Range;

    PROCEDURE (this: HeaderFooter) Index* (): WdHeaderFooterIndex, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Index;

    PROCEDURE (this: HeaderFooter) IsHeader* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 3)
    END IsHeader;

    PROCEDURE (this: HeaderFooter) Exists* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 4)
    END Exists;

    PROCEDURE (this: HeaderFooter) PUTExists* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 4, p1)
    END PUTExists;

    PROCEDURE (this: HeaderFooter) PageNumbers* (): PageNumbers, NEW;
    BEGIN
        RETURN ThisPageNumbers(CtlC.GetAny(this, 5))
    END PageNumbers;

    PROCEDURE (this: HeaderFooter) LinkToPrevious* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 6)
    END LinkToPrevious;

    PROCEDURE (this: HeaderFooter) PUTLinkToPrevious* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 6, p1)
    END PUTLinkToPrevious;

    PROCEDURE (this: HeaderFooter) Shapes* (): Shapes, NEW;
    BEGIN
        RETURN ThisShapes(CtlC.GetAny(this, 7))
    END Shapes;


    (* ---------- PageNumbers, dual, nonextensible ---------- *)

    PROCEDURE (this: PageNumbers) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: PageNumbers) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: PageNumbers) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: PageNumbers) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: PageNumbers) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Count;

    PROCEDURE (this: PageNumbers) NumberStyle* (): WdPageNumberStyle, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END NumberStyle;

    PROCEDURE (this: PageNumbers) PUTNumberStyle* (p1: WdPageNumberStyle), NEW;
    BEGIN
        CtlC.PutInt(this, 2, p1)
    END PUTNumberStyle;

    PROCEDURE (this: PageNumbers) IncludeChapterNumber* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 3)
    END IncludeChapterNumber;

    PROCEDURE (this: PageNumbers) PUTIncludeChapterNumber* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 3, p1)
    END PUTIncludeChapterNumber;

    PROCEDURE (this: PageNumbers) HeadingLevelForChapter* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 4)
    END HeadingLevelForChapter;

    PROCEDURE (this: PageNumbers) PUTHeadingLevelForChapter* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 4, p1)
    END PUTHeadingLevelForChapter;

    PROCEDURE (this: PageNumbers) ChapterPageSeparator* (): WdSeparatorType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 5)
    END ChapterPageSeparator;

    PROCEDURE (this: PageNumbers) PUTChapterPageSeparator* (p1: WdSeparatorType), NEW;
    BEGIN
        CtlC.PutInt(this, 5, p1)
    END PUTChapterPageSeparator;

    PROCEDURE (this: PageNumbers) RestartNumberingAtSection* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 6)
    END RestartNumberingAtSection;

    PROCEDURE (this: PageNumbers) PUTRestartNumberingAtSection* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 6, p1)
    END PUTRestartNumberingAtSection;

    PROCEDURE (this: PageNumbers) StartingNumber* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 7)
    END StartingNumber;

    PROCEDURE (this: PageNumbers) PUTStartingNumber* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 7, p1)
    END PUTStartingNumber;

    PROCEDURE (this: PageNumbers) ShowFirstPageNumber* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 8)
    END ShowFirstPageNumber;

    PROCEDURE (this: PageNumbers) PUTShowFirstPageNumber* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 8, p1)
    END PUTShowFirstPageNumber;

    PROCEDURE (this: PageNumbers) Item* (Index: INTEGER): PageNumber, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisPageNumber(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: PageNumbers) Add* ((* optional *) PageNumberAlignment: CtlT.Any; FirstPage: CtlT.Any): PageNumber, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(PageNumberAlignment, arg[1]);
        CtlC.AnyVar(FirstPage, arg[0]);
        CtlC.CallParMethod(this, 101, arg, ret);
        RETURN ThisPageNumber(CtlC.VarAny(ret))
    END Add;


    (* ---------- PageNumber, dual, nonextensible ---------- *)

    PROCEDURE (this: PageNumber) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: PageNumber) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: PageNumber) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: PageNumber) Index* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Index;

    PROCEDURE (this: PageNumber) Alignment* (): WdPageNumberAlignment, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 3)
    END Alignment;

    PROCEDURE (this: PageNumber) PUTAlignment* (p1: WdPageNumberAlignment), NEW;
    BEGIN
        CtlC.PutInt(this, 3, p1)
    END PUTAlignment;

    PROCEDURE (this: PageNumber) Select* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 65535, NIL);
    END Select;

    PROCEDURE (this: PageNumber) Copy* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 101, NIL);
    END Copy;

    PROCEDURE (this: PageNumber) Cut* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 102, NIL);
    END Cut;

    PROCEDURE (this: PageNumber) Delete* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 103, NIL);
    END Delete;


    (* ---------- Subdocuments, dual, nonextensible ---------- *)

    PROCEDURE (this: Subdocuments) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Subdocuments) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Subdocuments) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Subdocuments) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Count;

    PROCEDURE (this: Subdocuments) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: Subdocuments) Expanded* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 2)
    END Expanded;

    PROCEDURE (this: Subdocuments) PUTExpanded* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 2, p1)
    END PUTExpanded;

    PROCEDURE (this: Subdocuments) Item* (Index: INTEGER): Subdocument, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisSubdocument(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: Subdocuments) AddFromFile* (Name: CtlT.Any; (* optional *) ConfirmConversions: CtlT.Any; ReadOnly: CtlT.Any; PasswordDocument: CtlT.Any; PasswordTemplate: CtlT.Any; Revert: CtlT.Any; WritePasswordDocument: CtlT.Any; WritePasswordTemplate: CtlT.Any): Subdocument, NEW;
        VAR arg: ARRAY 8 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Name, arg[7]);
        CtlC.AnyVar(ConfirmConversions, arg[6]);
        CtlC.AnyVar(ReadOnly, arg[5]);
        CtlC.AnyVar(PasswordDocument, arg[4]);
        CtlC.AnyVar(PasswordTemplate, arg[3]);
        CtlC.AnyVar(Revert, arg[2]);
        CtlC.AnyVar(WritePasswordDocument, arg[1]);
        CtlC.AnyVar(WritePasswordTemplate, arg[0]);
        CtlC.CallParMethod(this, 100, arg, ret);
        RETURN ThisSubdocument(CtlC.VarAny(ret))
    END AddFromFile;

    PROCEDURE (this: Subdocuments) AddFromRange* (range: Range): Subdocument, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.ObjVar(range, arg[0]);
        CtlC.CallParMethod(this, 101, arg, ret);
        RETURN ThisSubdocument(CtlC.VarAny(ret))
    END AddFromRange;

    PROCEDURE (this: Subdocuments) Merge* ((* optional *) FirstSubdocument: CtlT.Any; LastSubdocument: CtlT.Any), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(FirstSubdocument, arg[1]);
        CtlC.AnyVar(LastSubdocument, arg[0]);
        CtlC.CallParMethod(this, 102, arg, NIL);
    END Merge;

    PROCEDURE (this: Subdocuments) Delete* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 103, NIL);
    END Delete;

    PROCEDURE (this: Subdocuments) Select* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 104, NIL);
    END Select;


    (* ---------- Subdocument, dual, nonextensible ---------- *)

    PROCEDURE (this: Subdocument) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Subdocument) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Subdocument) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Subdocument) Locked* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 1)
    END Locked;

    PROCEDURE (this: Subdocument) PUTLocked* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 1, p1)
    END PUTLocked;

    PROCEDURE (this: Subdocument) Range* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 2))
    END Range;

    PROCEDURE (this: Subdocument) Name* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 3)
    END Name;

    PROCEDURE (this: Subdocument) Path* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 4)
    END Path;

    PROCEDURE (this: Subdocument) HasFile* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 5)
    END HasFile;

    PROCEDURE (this: Subdocument) Level* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 6)
    END Level;

    PROCEDURE (this: Subdocument) Delete* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 100, NIL);
    END Delete;

    PROCEDURE (this: Subdocument) Split* (range: Range), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.ObjVar(range, arg[0]);
        CtlC.CallParMethod(this, 101, arg, NIL);
    END Split;

    PROCEDURE (this: Subdocument) Open* (): Document, NEW;
        VAR ret: CtlT.Variant;
    BEGIN
        CtlC.CallMethod(this, 102, ret);
        RETURN This_Document(CtlC.VarAny(ret))
    END Open;


    (* ---------- HeadingStyles, dual, nonextensible ---------- *)

    PROCEDURE (this: HeadingStyles) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: HeadingStyles) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: HeadingStyles) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: HeadingStyles) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: HeadingStyles) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Count;

    PROCEDURE (this: HeadingStyles) Item* (Index: INTEGER): HeadingStyle, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisHeadingStyle(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: HeadingStyles) Add* (Style: CtlT.Any; Level: SHORTINT): HeadingStyle, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Style, arg[1]);
        CtlC.SIntVar(Level, arg[0]);
        CtlC.CallParMethod(this, 100, arg, ret);
        RETURN ThisHeadingStyle(CtlC.VarAny(ret))
    END Add;


    (* ---------- HeadingStyle, dual, nonextensible ---------- *)

    PROCEDURE (this: HeadingStyle) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: HeadingStyle) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: HeadingStyle) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: HeadingStyle) Style* (): CtlT.Any, NEW;
    BEGIN
        RETURN CtlC.GetAny(this, 0)
    END Style;

    PROCEDURE (this: HeadingStyle) PUTStyle* (p1: CtlT.Any), NEW;
    BEGIN
        CtlC.PutAny(this, 0, p1)
    END PUTStyle;

    PROCEDURE (this: HeadingStyle) Level* (): SHORTINT, NEW;
    BEGIN
        RETURN CtlC.GetSInt(this, 2)
    END Level;

    PROCEDURE (this: HeadingStyle) PUTLevel* (p1: SHORTINT), NEW;
    BEGIN
        CtlC.PutSInt(this, 2, p1)
    END PUTLevel;

    PROCEDURE (this: HeadingStyle) Delete* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 100, NIL);
    END Delete;


    (* ---------- StoryRanges, dual, nonextensible ---------- *)

    PROCEDURE (this: StoryRanges) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: StoryRanges) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Count;

    PROCEDURE (this: StoryRanges) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: StoryRanges) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: StoryRanges) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: StoryRanges) Item* (Index: WdStoryType): Range, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisRange(CtlC.VarAny(ret))
    END Item;


    (* ---------- ListLevel, dual, nonextensible ---------- *)

    PROCEDURE (this: ListLevel) Index* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Index;

    PROCEDURE (this: ListLevel) NumberFormat* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 2)
    END NumberFormat;

    PROCEDURE (this: ListLevel) PUTNumberFormat* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 2, p1)
    END PUTNumberFormat;

    PROCEDURE (this: ListLevel) TrailingCharacter* (): WdTrailingCharacter, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 3)
    END TrailingCharacter;

    PROCEDURE (this: ListLevel) PUTTrailingCharacter* (p1: WdTrailingCharacter), NEW;
    BEGIN
        CtlC.PutInt(this, 3, p1)
    END PUTTrailingCharacter;

    PROCEDURE (this: ListLevel) NumberStyle* (): WdListNumberStyle, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 4)
    END NumberStyle;

    PROCEDURE (this: ListLevel) PUTNumberStyle* (p1: WdListNumberStyle), NEW;
    BEGIN
        CtlC.PutInt(this, 4, p1)
    END PUTNumberStyle;

    PROCEDURE (this: ListLevel) NumberPosition* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 5)
    END NumberPosition;

    PROCEDURE (this: ListLevel) PUTNumberPosition* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 5, p1)
    END PUTNumberPosition;

    PROCEDURE (this: ListLevel) Alignment* (): WdListLevelAlignment, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 6)
    END Alignment;

    PROCEDURE (this: ListLevel) PUTAlignment* (p1: WdListLevelAlignment), NEW;
    BEGIN
        CtlC.PutInt(this, 6, p1)
    END PUTAlignment;

    PROCEDURE (this: ListLevel) TextPosition* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 7)
    END TextPosition;

    PROCEDURE (this: ListLevel) PUTTextPosition* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 7, p1)
    END PUTTextPosition;

    PROCEDURE (this: ListLevel) TabPosition* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 8)
    END TabPosition;

    PROCEDURE (this: ListLevel) PUTTabPosition* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 8, p1)
    END PUTTabPosition;

    PROCEDURE (this: ListLevel) ResetOnHigher* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 9)
    END ResetOnHigher;

    PROCEDURE (this: ListLevel) PUTResetOnHigher* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 9, p1)
    END PUTResetOnHigher;

    PROCEDURE (this: ListLevel) StartAt* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 10)
    END StartAt;

    PROCEDURE (this: ListLevel) PUTStartAt* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 10, p1)
    END PUTStartAt;

    PROCEDURE (this: ListLevel) LinkedStyle* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 11)
    END LinkedStyle;

    PROCEDURE (this: ListLevel) PUTLinkedStyle* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 11, p1)
    END PUTLinkedStyle;

    PROCEDURE (this: ListLevel) Font* (): Font, NEW;
    BEGIN
        RETURN This_Font(CtlC.GetAny(this, 12))
    END Font;

    PROCEDURE (this: ListLevel) PUTFont* (p1: Font), NEW;
    BEGIN
        CtlC.PutObj(this, 12, p1)
    END PUTFont;

    PROCEDURE (this: ListLevel) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: ListLevel) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: ListLevel) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;


    (* ---------- ListLevels, dual, nonextensible ---------- *)

    PROCEDURE (this: ListLevels) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: ListLevels) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Count;

    PROCEDURE (this: ListLevels) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: ListLevels) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: ListLevels) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: ListLevels) Item* (Index: INTEGER): ListLevel, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisListLevel(CtlC.VarAny(ret))
    END Item;


    (* ---------- ListTemplate, dual, nonextensible ---------- *)

    PROCEDURE (this: ListTemplate) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: ListTemplate) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: ListTemplate) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: ListTemplate) OutlineNumbered* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 1)
    END OutlineNumbered;

    PROCEDURE (this: ListTemplate) PUTOutlineNumbered* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 1, p1)
    END PUTOutlineNumbered;

    PROCEDURE (this: ListTemplate) Name* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 3)
    END Name;

    PROCEDURE (this: ListTemplate) PUTName* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 3, p1)
    END PUTName;

    PROCEDURE (this: ListTemplate) ListLevels* (): ListLevels, NEW;
    BEGIN
        RETURN ThisListLevels(CtlC.GetAny(this, 2))
    END ListLevels;

    PROCEDURE (this: ListTemplate) Convert* ((* optional *) Level: CtlT.Any): ListTemplate, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Level, arg[0]);
        CtlC.CallParMethod(this, 101, arg, ret);
        RETURN ThisListTemplate(CtlC.VarAny(ret))
    END Convert;


    (* ---------- ListTemplates, dual, nonextensible ---------- *)

    PROCEDURE (this: ListTemplates) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: ListTemplates) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Count;

    PROCEDURE (this: ListTemplates) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: ListTemplates) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: ListTemplates) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: ListTemplates) Item* (Index: CtlT.Any): ListTemplate, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisListTemplate(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: ListTemplates) Add* ((* optional *) OutlineNumbered: CtlT.Any; Name: CtlT.Any): ListTemplate, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(OutlineNumbered, arg[1]);
        CtlC.AnyVar(Name, arg[0]);
        CtlC.CallParMethod(this, 100, arg, ret);
        RETURN ThisListTemplate(CtlC.VarAny(ret))
    END Add;


    (* ---------- ListParagraphs, dual, nonextensible ---------- *)

    PROCEDURE (this: ListParagraphs) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: ListParagraphs) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Count;

    PROCEDURE (this: ListParagraphs) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: ListParagraphs) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: ListParagraphs) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: ListParagraphs) Item* (Index: INTEGER): Paragraph, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisParagraph(CtlC.VarAny(ret))
    END Item;


    (* ---------- List, dual, nonextensible ---------- *)

    PROCEDURE (this: List) Range* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 1))
    END Range;

    PROCEDURE (this: List) ListParagraphs* (): ListParagraphs, NEW;
    BEGIN
        RETURN ThisListParagraphs(CtlC.GetAny(this, 2))
    END ListParagraphs;

    PROCEDURE (this: List) SingleListTemplate* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 3)
    END SingleListTemplate;

    PROCEDURE (this: List) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: List) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: List) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: List) ConvertNumbersToText* ((* optional *) NumberType: CtlT.Any), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(NumberType, arg[0]);
        CtlC.CallParMethod(this, 101, arg, NIL);
    END ConvertNumbersToText;

    PROCEDURE (this: List) RemoveNumbers* ((* optional *) NumberType: CtlT.Any), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(NumberType, arg[0]);
        CtlC.CallParMethod(this, 102, arg, NIL);
    END RemoveNumbers;

    PROCEDURE (this: List) CountNumberedItems* ((* optional *) NumberType: CtlT.Any; Level: CtlT.Any): INTEGER, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(NumberType, arg[1]);
        CtlC.AnyVar(Level, arg[0]);
        CtlC.CallParMethod(this, 103, arg, ret);
        RETURN CtlC.VarInt(ret)
    END CountNumberedItems;

    PROCEDURE (this: List) ApplyListTemplate* (listTemplate: ListTemplate; (* optional *) ContinuePreviousList: CtlT.Any), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.ObjVar(listTemplate, arg[1]);
        CtlC.AnyVar(ContinuePreviousList, arg[0]);
        CtlC.CallParMethod(this, 104, arg, NIL);
    END ApplyListTemplate;

    PROCEDURE (this: List) CanContinuePreviousList* (listTemplate: ListTemplate): WdContinue, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.ObjVar(listTemplate, arg[0]);
        CtlC.CallParMethod(this, 105, arg, ret);
        RETURN CtlC.VarInt(ret)
    END CanContinuePreviousList;


    (* ---------- Lists, dual, nonextensible ---------- *)

    PROCEDURE (this: Lists) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: Lists) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Count;

    PROCEDURE (this: Lists) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Lists) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Lists) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Lists) Item* (Index: INTEGER): List, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisList(CtlC.VarAny(ret))
    END Item;


    (* ---------- ListGallery, dual, nonextensible ---------- *)

    PROCEDURE (this: ListGallery) ListTemplates* (): ListTemplates, NEW;
    BEGIN
        RETURN ThisListTemplates(CtlC.GetAny(this, 1))
    END ListTemplates;

    PROCEDURE (this: ListGallery) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: ListGallery) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: ListGallery) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: ListGallery) Modified* (Index: INTEGER): BOOLEAN, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallGetMethod(this, 101, arg, ret);
        RETURN CtlC.VarBool(ret)
    END Modified;

    PROCEDURE (this: ListGallery) Reset* (Index: INTEGER), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 100, arg, NIL);
    END Reset;


    (* ---------- ListGalleries, dual, nonextensible ---------- *)

    PROCEDURE (this: ListGalleries) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: ListGalleries) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Count;

    PROCEDURE (this: ListGalleries) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: ListGalleries) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: ListGalleries) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: ListGalleries) Item* (Index: WdListGalleryType): ListGallery, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisListGallery(CtlC.VarAny(ret))
    END Item;


    (* ---------- KeyBindings, dual, nonextensible ---------- *)

    PROCEDURE (this: KeyBindings) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: KeyBindings) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: KeyBindings) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: KeyBindings) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: KeyBindings) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Count;

    PROCEDURE (this: KeyBindings) Context* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 10)
    END Context;

    PROCEDURE (this: KeyBindings) Item* (Index: INTEGER): KeyBinding, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisKeyBinding(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: KeyBindings) Add* (KeyCategory: WdKeyCategory; Command: ARRAY OF CHAR; KeyCode: INTEGER; (* optional *) KeyCode2: CtlT.Any; CommandParameter: CtlT.Any): KeyBinding, NEW;
        VAR arg: ARRAY 5 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(KeyCategory, arg[4]);
        CtlC.StrVar(Command, arg[3]);
        CtlC.IntVar(KeyCode, arg[2]);
        CtlC.AnyVar(KeyCode2, arg[1]);
        CtlC.AnyVar(CommandParameter, arg[0]);
        CtlC.CallParMethod(this, 101, arg, ret);
        RETURN ThisKeyBinding(CtlC.VarAny(ret))
    END Add;

    PROCEDURE (this: KeyBindings) ClearAll* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 102, NIL);
    END ClearAll;

    PROCEDURE (this: KeyBindings) Key* (KeyCode: INTEGER; (* optional *) KeyCode2: CtlT.Any): KeyBinding, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(KeyCode, arg[1]);
        CtlC.AnyVar(KeyCode2, arg[0]);
        CtlC.CallParMethod(this, 110, arg, ret);
        RETURN ThisKeyBinding(CtlC.VarAny(ret))
    END Key;


    (* ---------- KeysBoundTo, dual, nonextensible ---------- *)

    PROCEDURE (this: KeysBoundTo) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: KeysBoundTo) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: KeysBoundTo) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: KeysBoundTo) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: KeysBoundTo) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Count;

    PROCEDURE (this: KeysBoundTo) KeyCategory* (): WdKeyCategory, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 3)
    END KeyCategory;

    PROCEDURE (this: KeysBoundTo) Command* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 4)
    END Command;

    PROCEDURE (this: KeysBoundTo) CommandParameter* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 5)
    END CommandParameter;

    PROCEDURE (this: KeysBoundTo) Context* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 10)
    END Context;

    PROCEDURE (this: KeysBoundTo) Item* (Index: INTEGER): KeyBinding, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisKeyBinding(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: KeysBoundTo) Key* (KeyCode: INTEGER; (* optional *) KeyCode2: CtlT.Any): KeyBinding, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(KeyCode, arg[1]);
        CtlC.AnyVar(KeyCode2, arg[0]);
        CtlC.CallParMethod(this, 1, arg, ret);
        RETURN ThisKeyBinding(CtlC.VarAny(ret))
    END Key;


    (* ---------- KeyBinding, dual, nonextensible ---------- *)

    PROCEDURE (this: KeyBinding) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: KeyBinding) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: KeyBinding) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: KeyBinding) Command* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 1)
    END Command;

    PROCEDURE (this: KeyBinding) KeyString* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 2)
    END KeyString;

    PROCEDURE (this: KeyBinding) Protected* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 3)
    END Protected;

    PROCEDURE (this: KeyBinding) KeyCategory* (): WdKeyCategory, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 4)
    END KeyCategory;

    PROCEDURE (this: KeyBinding) KeyCode* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 6)
    END KeyCode;

    PROCEDURE (this: KeyBinding) KeyCode2* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 7)
    END KeyCode2;

    PROCEDURE (this: KeyBinding) CommandParameter* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 8)
    END CommandParameter;

    PROCEDURE (this: KeyBinding) Context* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 10)
    END Context;

    PROCEDURE (this: KeyBinding) Clear* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 101, NIL);
    END Clear;

    PROCEDURE (this: KeyBinding) Disable* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 102, NIL);
    END Disable;

    PROCEDURE (this: KeyBinding) Execute* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 103, NIL);
    END Execute;

    PROCEDURE (this: KeyBinding) Rebind* (KeyCategory: WdKeyCategory; Command: ARRAY OF CHAR; (* optional *) CommandParameter: CtlT.Any), NEW;
        VAR arg: ARRAY 3 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(KeyCategory, arg[2]);
        CtlC.StrVar(Command, arg[1]);
        CtlC.AnyVar(CommandParameter, arg[0]);
        CtlC.CallParMethod(this, 104, arg, NIL);
    END Rebind;


    (* ---------- FileConverter, dual, nonextensible ---------- *)

    PROCEDURE (this: FileConverter) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: FileConverter) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: FileConverter) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: FileConverter) FormatName* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 0)
    END FormatName;

    PROCEDURE (this: FileConverter) ClassName* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 1)
    END ClassName;

    PROCEDURE (this: FileConverter) SaveFormat* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END SaveFormat;

    PROCEDURE (this: FileConverter) OpenFormat* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 3)
    END OpenFormat;

    PROCEDURE (this: FileConverter) CanSave* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 4)
    END CanSave;

    PROCEDURE (this: FileConverter) CanOpen* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 5)
    END CanOpen;

    PROCEDURE (this: FileConverter) Path* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 6)
    END Path;

    PROCEDURE (this: FileConverter) Name* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 7)
    END Name;

    PROCEDURE (this: FileConverter) Extensions* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 8)
    END Extensions;


    (* ---------- FileConverters, dual, nonextensible ---------- *)

    PROCEDURE (this: FileConverters) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: FileConverters) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: FileConverters) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: FileConverters) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Count;

    PROCEDURE (this: FileConverters) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: FileConverters) ConvertMacWordChevrons* (): WdChevronConvertRule, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END ConvertMacWordChevrons;

    PROCEDURE (this: FileConverters) PUTConvertMacWordChevrons* (p1: WdChevronConvertRule), NEW;
    BEGIN
        CtlC.PutInt(this, 2, p1)
    END PUTConvertMacWordChevrons;

    PROCEDURE (this: FileConverters) Item* (Index: CtlT.Any): FileConverter, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisFileConverter(CtlC.VarAny(ret))
    END Item;


    (* ---------- SynonymInfo, dual, nonextensible ---------- *)

    PROCEDURE (this: SynonymInfo) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: SynonymInfo) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: SynonymInfo) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: SynonymInfo) Word* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 1)
    END Word;

    PROCEDURE (this: SynonymInfo) Found* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 2)
    END Found;

    PROCEDURE (this: SynonymInfo) MeaningCount* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 3)
    END MeaningCount;

    PROCEDURE (this: SynonymInfo) MeaningList* (): CtlT.Any, NEW;
    BEGIN
        RETURN CtlC.GetAny(this, 4)
    END MeaningList;

    PROCEDURE (this: SynonymInfo) PartOfSpeechList* (): CtlT.Any, NEW;
    BEGIN
        RETURN CtlC.GetAny(this, 5)
    END PartOfSpeechList;

    PROCEDURE (this: SynonymInfo) SynonymList* (Meaning: CtlT.Any): CtlT.Any, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Meaning, arg[0]);
        CtlC.CallGetMethod(this, 7, arg, ret);
        RETURN CtlC.VarAny(ret)
    END SynonymList;

    PROCEDURE (this: SynonymInfo) AntonymList* (): CtlT.Any, NEW;
    BEGIN
        RETURN CtlC.GetAny(this, 8)
    END AntonymList;

    PROCEDURE (this: SynonymInfo) RelatedExpressionList* (): CtlT.Any, NEW;
    BEGIN
        RETURN CtlC.GetAny(this, 9)
    END RelatedExpressionList;

    PROCEDURE (this: SynonymInfo) RelatedWordList* (): CtlT.Any, NEW;
    BEGIN
        RETURN CtlC.GetAny(this, 10)
    END RelatedWordList;


    (* ---------- Hyperlinks, dual, nonextensible ---------- *)

    PROCEDURE (this: Hyperlinks) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Hyperlinks) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Hyperlinks) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Hyperlinks) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Count;

    PROCEDURE (this: Hyperlinks) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: Hyperlinks) Item* (Index: CtlT.Any): Hyperlink, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisHyperlink(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: Hyperlinks) Add* (Anchor: CtlT.Object; (* optional *) Address: CtlT.Any; SubAddress: CtlT.Any): Hyperlink, NEW;
        VAR arg: ARRAY 3 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.ObjVar(Anchor, arg[2]);
        CtlC.AnyVar(Address, arg[1]);
        CtlC.AnyVar(SubAddress, arg[0]);
        CtlC.CallParMethod(this, 100, arg, ret);
        RETURN ThisHyperlink(CtlC.VarAny(ret))
    END Add;


    (* ---------- Hyperlink, dual, nonextensible ---------- *)

    PROCEDURE (this: Hyperlink) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Hyperlink) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Hyperlink) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Hyperlink) Name* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 1003)
    END Name;

    PROCEDURE (this: Hyperlink) Address* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 1004)
    END Address;

    PROCEDURE (this: Hyperlink) Type* (): CtlOffice.MsoHyperlinkType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1005)
    END Type;

    PROCEDURE (this: Hyperlink) Range* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 1006))
    END Range;

    PROCEDURE (this: Hyperlink) Shape* (): Shape, NEW;
    BEGIN
        RETURN ThisShape(CtlC.GetAny(this, 1007))
    END Shape;

    PROCEDURE (this: Hyperlink) SubAddress* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 1008)
    END SubAddress;

    PROCEDURE (this: Hyperlink) ExtraInfoRequired* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 1009)
    END ExtraInfoRequired;

    PROCEDURE (this: Hyperlink) Delete* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 103, NIL);
    END Delete;

    PROCEDURE (this: Hyperlink) Follow* ((* optional *) NewWindow: CtlT.Any; AddHistory: CtlT.Any; ExtraInfo: CtlT.Any; Method: CtlT.Any; HeaderInfo: CtlT.Any), NEW;
        VAR arg: ARRAY 5 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(NewWindow, arg[4]);
        CtlC.AnyVar(AddHistory, arg[3]);
        CtlC.AnyVar(ExtraInfo, arg[2]);
        CtlC.AnyVar(Method, arg[1]);
        CtlC.AnyVar(HeaderInfo, arg[0]);
        CtlC.CallParMethod(this, 104, arg, NIL);
    END Follow;

    PROCEDURE (this: Hyperlink) AddToFavorites* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 105, NIL);
    END AddToFavorites;


    (* ---------- Shapes, dual, nonextensible ---------- *)

    PROCEDURE (this: Shapes) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 8000))
    END Application;

    PROCEDURE (this: Shapes) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 8001)
    END Creator;

    PROCEDURE (this: Shapes) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1)
    END Parent;

    PROCEDURE (this: Shapes) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Count;

    PROCEDURE (this: Shapes) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: Shapes) Item* (Index: CtlT.Any): Shape, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisShape(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: Shapes) AddCallout* (Type: CtlOffice.MsoCalloutType; Left: SHORTREAL; Top: SHORTREAL; Width: SHORTREAL; Height: SHORTREAL; (* optional *) Anchor: CtlT.Any): Shape, NEW;
        VAR arg: ARRAY 6 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Type, arg[5]);
        CtlC.SRealVar(Left, arg[4]);
        CtlC.SRealVar(Top, arg[3]);
        CtlC.SRealVar(Width, arg[2]);
        CtlC.SRealVar(Height, arg[1]);
        CtlC.AnyVar(Anchor, arg[0]);
        CtlC.CallParMethod(this, 10, arg, ret);
        RETURN ThisShape(CtlC.VarAny(ret))
    END AddCallout;

    PROCEDURE (this: Shapes) AddConnector* (Type: CtlOffice.MsoConnectorType; BeginX: SHORTREAL; BeginY: SHORTREAL; EndX: SHORTREAL; EndY: SHORTREAL): Shape, NEW;
        VAR arg: ARRAY 5 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Type, arg[4]);
        CtlC.SRealVar(BeginX, arg[3]);
        CtlC.SRealVar(BeginY, arg[2]);
        CtlC.SRealVar(EndX, arg[1]);
        CtlC.SRealVar(EndY, arg[0]);
        CtlC.CallParMethod(this, 11, arg, ret);
        RETURN ThisShape(CtlC.VarAny(ret))
    END AddConnector;

    PROCEDURE (this: Shapes) AddCurve* (SafeArrayOfPoints: CtlT.Any; (* optional *) Anchor: CtlT.Any): Shape, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(SafeArrayOfPoints, arg[1]);
        CtlC.AnyVar(Anchor, arg[0]);
        CtlC.CallParMethod(this, 12, arg, ret);
        RETURN ThisShape(CtlC.VarAny(ret))
    END AddCurve;

    PROCEDURE (this: Shapes) AddLabel* (Orientation: CtlOffice.MsoTextOrientation; Left: SHORTREAL; Top: SHORTREAL; Width: SHORTREAL; Height: SHORTREAL; (* optional *) Anchor: CtlT.Any): Shape, NEW;
        VAR arg: ARRAY 6 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Orientation, arg[5]);
        CtlC.SRealVar(Left, arg[4]);
        CtlC.SRealVar(Top, arg[3]);
        CtlC.SRealVar(Width, arg[2]);
        CtlC.SRealVar(Height, arg[1]);
        CtlC.AnyVar(Anchor, arg[0]);
        CtlC.CallParMethod(this, 13, arg, ret);
        RETURN ThisShape(CtlC.VarAny(ret))
    END AddLabel;

    PROCEDURE (this: Shapes) AddLine* (BeginX: SHORTREAL; BeginY: SHORTREAL; EndX: SHORTREAL; EndY: SHORTREAL; (* optional *) Anchor: CtlT.Any): Shape, NEW;
        VAR arg: ARRAY 5 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.SRealVar(BeginX, arg[4]);
        CtlC.SRealVar(BeginY, arg[3]);
        CtlC.SRealVar(EndX, arg[2]);
        CtlC.SRealVar(EndY, arg[1]);
        CtlC.AnyVar(Anchor, arg[0]);
        CtlC.CallParMethod(this, 14, arg, ret);
        RETURN ThisShape(CtlC.VarAny(ret))
    END AddLine;

    PROCEDURE (this: Shapes) AddPicture* (FileName: ARRAY OF CHAR; (* optional *) LinkToFile: CtlT.Any; SaveWithDocument: CtlT.Any; Left: CtlT.Any; Top: CtlT.Any; Width: CtlT.Any; Height: CtlT.Any; Anchor: CtlT.Any): Shape, NEW;
        VAR arg: ARRAY 8 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.StrVar(FileName, arg[7]);
        CtlC.AnyVar(LinkToFile, arg[6]);
        CtlC.AnyVar(SaveWithDocument, arg[5]);
        CtlC.AnyVar(Left, arg[4]);
        CtlC.AnyVar(Top, arg[3]);
        CtlC.AnyVar(Width, arg[2]);
        CtlC.AnyVar(Height, arg[1]);
        CtlC.AnyVar(Anchor, arg[0]);
        CtlC.CallParMethod(this, 15, arg, ret);
        RETURN ThisShape(CtlC.VarAny(ret))
    END AddPicture;

    PROCEDURE (this: Shapes) AddPolyline* (SafeArrayOfPoints: CtlT.Any; (* optional *) Anchor: CtlT.Any): Shape, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(SafeArrayOfPoints, arg[1]);
        CtlC.AnyVar(Anchor, arg[0]);
        CtlC.CallParMethod(this, 16, arg, ret);
        RETURN ThisShape(CtlC.VarAny(ret))
    END AddPolyline;

    PROCEDURE (this: Shapes) AddShape* (Type: INTEGER; Left: SHORTREAL; Top: SHORTREAL; Width: SHORTREAL; Height: SHORTREAL; (* optional *) Anchor: CtlT.Any): Shape, NEW;
        VAR arg: ARRAY 6 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Type, arg[5]);
        CtlC.SRealVar(Left, arg[4]);
        CtlC.SRealVar(Top, arg[3]);
        CtlC.SRealVar(Width, arg[2]);
        CtlC.SRealVar(Height, arg[1]);
        CtlC.AnyVar(Anchor, arg[0]);
        CtlC.CallParMethod(this, 17, arg, ret);
        RETURN ThisShape(CtlC.VarAny(ret))
    END AddShape;

    PROCEDURE (this: Shapes) AddTextEffect* (PresetTextEffect: CtlOffice.MsoPresetTextEffect; Text: ARRAY OF CHAR; FontName: ARRAY OF CHAR; FontSize: SHORTREAL; FontBold: CtlOffice.MsoTriState; FontItalic: CtlOffice.MsoTriState; Left: SHORTREAL; Top: SHORTREAL; (* optional *) Anchor: CtlT.Any): Shape, NEW;
        VAR arg: ARRAY 9 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(PresetTextEffect, arg[8]);
        CtlC.StrVar(Text, arg[7]);
        CtlC.StrVar(FontName, arg[6]);
        CtlC.SRealVar(FontSize, arg[5]);
        CtlC.IntVar(FontBold, arg[4]);
        CtlC.IntVar(FontItalic, arg[3]);
        CtlC.SRealVar(Left, arg[2]);
        CtlC.SRealVar(Top, arg[1]);
        CtlC.AnyVar(Anchor, arg[0]);
        CtlC.CallParMethod(this, 18, arg, ret);
        RETURN ThisShape(CtlC.VarAny(ret))
    END AddTextEffect;

    PROCEDURE (this: Shapes) AddTextbox* (Orientation: CtlOffice.MsoTextOrientation; Left: SHORTREAL; Top: SHORTREAL; Width: SHORTREAL; Height: SHORTREAL; (* optional *) Anchor: CtlT.Any): Shape, NEW;
        VAR arg: ARRAY 6 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Orientation, arg[5]);
        CtlC.SRealVar(Left, arg[4]);
        CtlC.SRealVar(Top, arg[3]);
        CtlC.SRealVar(Width, arg[2]);
        CtlC.SRealVar(Height, arg[1]);
        CtlC.AnyVar(Anchor, arg[0]);
        CtlC.CallParMethod(this, 19, arg, ret);
        RETURN ThisShape(CtlC.VarAny(ret))
    END AddTextbox;

    PROCEDURE (this: Shapes) BuildFreeform* (EditingType: CtlOffice.MsoEditingType; X1: SHORTREAL; Y1: SHORTREAL): FreeformBuilder, NEW;
        VAR arg: ARRAY 3 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(EditingType, arg[2]);
        CtlC.SRealVar(X1, arg[1]);
        CtlC.SRealVar(Y1, arg[0]);
        CtlC.CallParMethod(this, 20, arg, ret);
        RETURN ThisFreeformBuilder(CtlC.VarAny(ret))
    END BuildFreeform;

    PROCEDURE (this: Shapes) Range* (Index: CtlT.Any): ShapeRange, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Index, arg[0]);
        CtlC.CallParMethod(this, 21, arg, ret);
        RETURN ThisShapeRange(CtlC.VarAny(ret))
    END Range;

    PROCEDURE (this: Shapes) SelectAll* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 22, NIL);
    END SelectAll;

    PROCEDURE (this: Shapes) AddOLEObject* ((* optional *) ClassType: CtlT.Any; FileName: CtlT.Any; LinkToFile: CtlT.Any; DisplayAsIcon: CtlT.Any; IconFileName: CtlT.Any; IconIndex: CtlT.Any; IconLabel: CtlT.Any; Left: CtlT.Any; Top: CtlT.Any; Width: CtlT.Any; Height: CtlT.Any; Anchor: CtlT.Any): Shape, NEW;
        VAR arg: ARRAY 12 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(ClassType, arg[11]);
        CtlC.AnyVar(FileName, arg[10]);
        CtlC.AnyVar(LinkToFile, arg[9]);
        CtlC.AnyVar(DisplayAsIcon, arg[8]);
        CtlC.AnyVar(IconFileName, arg[7]);
        CtlC.AnyVar(IconIndex, arg[6]);
        CtlC.AnyVar(IconLabel, arg[5]);
        CtlC.AnyVar(Left, arg[4]);
        CtlC.AnyVar(Top, arg[3]);
        CtlC.AnyVar(Width, arg[2]);
        CtlC.AnyVar(Height, arg[1]);
        CtlC.AnyVar(Anchor, arg[0]);
        CtlC.CallParMethod(this, 24, arg, ret);
        RETURN ThisShape(CtlC.VarAny(ret))
    END AddOLEObject;

    PROCEDURE (this: Shapes) AddOLEControl* ((* optional *) ClassType: CtlT.Any; Left: CtlT.Any; Top: CtlT.Any; Width: CtlT.Any; Height: CtlT.Any; Anchor: CtlT.Any): Shape, NEW;
        VAR arg: ARRAY 6 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(ClassType, arg[5]);
        CtlC.AnyVar(Left, arg[4]);
        CtlC.AnyVar(Top, arg[3]);
        CtlC.AnyVar(Width, arg[2]);
        CtlC.AnyVar(Height, arg[1]);
        CtlC.AnyVar(Anchor, arg[0]);
        CtlC.CallParMethod(this, 102, arg, ret);
        RETURN ThisShape(CtlC.VarAny(ret))
    END AddOLEControl;


    (* ---------- ShapeRange, dual, nonextensible ---------- *)

    PROCEDURE (this: ShapeRange) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 8000))
    END Application;

    PROCEDURE (this: ShapeRange) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 8001)
    END Creator;

    PROCEDURE (this: ShapeRange) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1)
    END Parent;

    PROCEDURE (this: ShapeRange) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Count;

    PROCEDURE (this: ShapeRange) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: ShapeRange) Adjustments* (): Adjustments, NEW;
    BEGIN
        RETURN ThisAdjustments(CtlC.GetAny(this, 100))
    END Adjustments;

    PROCEDURE (this: ShapeRange) AutoShapeType* (): CtlOffice.MsoAutoShapeType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 101)
    END AutoShapeType;

    PROCEDURE (this: ShapeRange) PUTAutoShapeType* (p1: CtlOffice.MsoAutoShapeType), NEW;
    BEGIN
        CtlC.PutInt(this, 101, p1)
    END PUTAutoShapeType;

    PROCEDURE (this: ShapeRange) Callout* (): CalloutFormat, NEW;
    BEGIN
        RETURN ThisCalloutFormat(CtlC.GetAny(this, 103))
    END Callout;

    PROCEDURE (this: ShapeRange) ConnectionSiteCount* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 104)
    END ConnectionSiteCount;

    PROCEDURE (this: ShapeRange) Connector* (): CtlOffice.MsoTriState, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 105)
    END Connector;

    PROCEDURE (this: ShapeRange) ConnectorFormat* (): ConnectorFormat, NEW;
    BEGIN
        RETURN ThisConnectorFormat(CtlC.GetAny(this, 106))
    END ConnectorFormat;

    PROCEDURE (this: ShapeRange) Fill* (): FillFormat, NEW;
    BEGIN
        RETURN ThisFillFormat(CtlC.GetAny(this, 107))
    END Fill;

    PROCEDURE (this: ShapeRange) GroupItems* (): GroupShapes, NEW;
    BEGIN
        RETURN ThisGroupShapes(CtlC.GetAny(this, 108))
    END GroupItems;

    PROCEDURE (this: ShapeRange) Height* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 109)
    END Height;

    PROCEDURE (this: ShapeRange) PUTHeight* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 109, p1)
    END PUTHeight;

    PROCEDURE (this: ShapeRange) HorizontalFlip* (): CtlOffice.MsoTriState, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 110)
    END HorizontalFlip;

    PROCEDURE (this: ShapeRange) Left* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 111)
    END Left;

    PROCEDURE (this: ShapeRange) PUTLeft* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 111, p1)
    END PUTLeft;

    PROCEDURE (this: ShapeRange) Line* (): LineFormat, NEW;
    BEGIN
        RETURN ThisLineFormat(CtlC.GetAny(this, 112))
    END Line;

    PROCEDURE (this: ShapeRange) LockAspectRatio* (): CtlOffice.MsoTriState, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 113)
    END LockAspectRatio;

    PROCEDURE (this: ShapeRange) PUTLockAspectRatio* (p1: CtlOffice.MsoTriState), NEW;
    BEGIN
        CtlC.PutInt(this, 113, p1)
    END PUTLockAspectRatio;

    PROCEDURE (this: ShapeRange) Name* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 115)
    END Name;

    PROCEDURE (this: ShapeRange) PUTName* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 115, p1)
    END PUTName;

    PROCEDURE (this: ShapeRange) Nodes* (): ShapeNodes, NEW;
    BEGIN
        RETURN ThisShapeNodes(CtlC.GetAny(this, 116))
    END Nodes;

    PROCEDURE (this: ShapeRange) Rotation* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 117)
    END Rotation;

    PROCEDURE (this: ShapeRange) PUTRotation* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 117, p1)
    END PUTRotation;

    PROCEDURE (this: ShapeRange) PictureFormat* (): PictureFormat, NEW;
    BEGIN
        RETURN ThisPictureFormat(CtlC.GetAny(this, 118))
    END PictureFormat;

    PROCEDURE (this: ShapeRange) Shadow* (): ShadowFormat, NEW;
    BEGIN
        RETURN ThisShadowFormat(CtlC.GetAny(this, 119))
    END Shadow;

    PROCEDURE (this: ShapeRange) TextEffect* (): TextEffectFormat, NEW;
    BEGIN
        RETURN ThisTextEffectFormat(CtlC.GetAny(this, 120))
    END TextEffect;

    PROCEDURE (this: ShapeRange) TextFrame* (): TextFrame, NEW;
    BEGIN
        RETURN ThisTextFrame(CtlC.GetAny(this, 121))
    END TextFrame;

    PROCEDURE (this: ShapeRange) ThreeD* (): ThreeDFormat, NEW;
    BEGIN
        RETURN ThisThreeDFormat(CtlC.GetAny(this, 122))
    END ThreeD;

    PROCEDURE (this: ShapeRange) Top* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 123)
    END Top;

    PROCEDURE (this: ShapeRange) PUTTop* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 123, p1)
    END PUTTop;

    PROCEDURE (this: ShapeRange) Type* (): CtlOffice.MsoShapeType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 124)
    END Type;

    PROCEDURE (this: ShapeRange) VerticalFlip* (): CtlOffice.MsoTriState, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 125)
    END VerticalFlip;

    PROCEDURE (this: ShapeRange) Vertices* (): CtlT.Any, NEW;
    BEGIN
        RETURN CtlC.GetAny(this, 126)
    END Vertices;

    PROCEDURE (this: ShapeRange) Visible* (): CtlOffice.MsoTriState, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 127)
    END Visible;

    PROCEDURE (this: ShapeRange) PUTVisible* (p1: CtlOffice.MsoTriState), NEW;
    BEGIN
        CtlC.PutInt(this, 127, p1)
    END PUTVisible;

    PROCEDURE (this: ShapeRange) Width* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 128)
    END Width;

    PROCEDURE (this: ShapeRange) PUTWidth* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 128, p1)
    END PUTWidth;

    PROCEDURE (this: ShapeRange) ZOrderPosition* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 129)
    END ZOrderPosition;

    PROCEDURE (this: ShapeRange) Hyperlink* (): Hyperlink, NEW;
    BEGIN
        RETURN ThisHyperlink(CtlC.GetAny(this, 1001))
    END Hyperlink;

    PROCEDURE (this: ShapeRange) RelativeHorizontalPosition* (): WdRelativeHorizontalPosition, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 300)
    END RelativeHorizontalPosition;

    PROCEDURE (this: ShapeRange) PUTRelativeHorizontalPosition* (p1: WdRelativeHorizontalPosition), NEW;
    BEGIN
        CtlC.PutInt(this, 300, p1)
    END PUTRelativeHorizontalPosition;

    PROCEDURE (this: ShapeRange) RelativeVerticalPosition* (): WdRelativeVerticalPosition, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 301)
    END RelativeVerticalPosition;

    PROCEDURE (this: ShapeRange) PUTRelativeVerticalPosition* (p1: WdRelativeVerticalPosition), NEW;
    BEGIN
        CtlC.PutInt(this, 301, p1)
    END PUTRelativeVerticalPosition;

    PROCEDURE (this: ShapeRange) LockAnchor* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 302)
    END LockAnchor;

    PROCEDURE (this: ShapeRange) PUTLockAnchor* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 302, p1)
    END PUTLockAnchor;

    PROCEDURE (this: ShapeRange) WrapFormat* (): WrapFormat, NEW;
    BEGIN
        RETURN ThisWrapFormat(CtlC.GetAny(this, 303))
    END WrapFormat;

    PROCEDURE (this: ShapeRange) Anchor* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 304))
    END Anchor;

    PROCEDURE (this: ShapeRange) Item* (Index: CtlT.Any): Shape, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisShape(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: ShapeRange) Align* (Align: CtlOffice.MsoAlignCmd; RelativeTo: INTEGER), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(Align, arg[1]);
        CtlC.IntVar(RelativeTo, arg[0]);
        CtlC.CallParMethod(this, 10, arg, NIL);
    END Align;

    PROCEDURE (this: ShapeRange) Apply* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 11, NIL);
    END Apply;

    PROCEDURE (this: ShapeRange) Delete* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 12, NIL);
    END Delete;

    PROCEDURE (this: ShapeRange) Distribute* (Distribute: CtlOffice.MsoDistributeCmd; RelativeTo: INTEGER), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(Distribute, arg[1]);
        CtlC.IntVar(RelativeTo, arg[0]);
        CtlC.CallParMethod(this, 13, arg, NIL);
    END Distribute;

    PROCEDURE (this: ShapeRange) Duplicate* (): ShapeRange, NEW;
        VAR ret: CtlT.Variant;
    BEGIN
        CtlC.CallMethod(this, 14, ret);
        RETURN ThisShapeRange(CtlC.VarAny(ret))
    END Duplicate;

    PROCEDURE (this: ShapeRange) Flip* (FlipCmd: CtlOffice.MsoFlipCmd), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(FlipCmd, arg[0]);
        CtlC.CallParMethod(this, 15, arg, NIL);
    END Flip;

    PROCEDURE (this: ShapeRange) IncrementLeft* (Increment: SHORTREAL), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.SRealVar(Increment, arg[0]);
        CtlC.CallParMethod(this, 16, arg, NIL);
    END IncrementLeft;

    PROCEDURE (this: ShapeRange) IncrementRotation* (Increment: SHORTREAL), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.SRealVar(Increment, arg[0]);
        CtlC.CallParMethod(this, 17, arg, NIL);
    END IncrementRotation;

    PROCEDURE (this: ShapeRange) IncrementTop* (Increment: SHORTREAL), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.SRealVar(Increment, arg[0]);
        CtlC.CallParMethod(this, 18, arg, NIL);
    END IncrementTop;

    PROCEDURE (this: ShapeRange) Group* (): Shape, NEW;
        VAR ret: CtlT.Variant;
    BEGIN
        CtlC.CallMethod(this, 19, ret);
        RETURN ThisShape(CtlC.VarAny(ret))
    END Group;

    PROCEDURE (this: ShapeRange) PickUp* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 20, NIL);
    END PickUp;

    PROCEDURE (this: ShapeRange) Regroup* (): Shape, NEW;
        VAR ret: CtlT.Variant;
    BEGIN
        CtlC.CallMethod(this, 21, ret);
        RETURN ThisShape(CtlC.VarAny(ret))
    END Regroup;

    PROCEDURE (this: ShapeRange) RerouteConnections* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 22, NIL);
    END RerouteConnections;

    PROCEDURE (this: ShapeRange) ScaleHeight* (Factor: SHORTREAL; RelativeToOriginalSize: CtlOffice.MsoTriState; Scale: CtlOffice.MsoScaleFrom), NEW;
        VAR arg: ARRAY 3 OF CtlT.Variant;
    BEGIN
        CtlC.SRealVar(Factor, arg[2]);
        CtlC.IntVar(RelativeToOriginalSize, arg[1]);
        CtlC.IntVar(Scale, arg[0]);
        CtlC.CallParMethod(this, 23, arg, NIL);
    END ScaleHeight;

    PROCEDURE (this: ShapeRange) ScaleWidth* (Factor: SHORTREAL; RelativeToOriginalSize: CtlOffice.MsoTriState; Scale: CtlOffice.MsoScaleFrom), NEW;
        VAR arg: ARRAY 3 OF CtlT.Variant;
    BEGIN
        CtlC.SRealVar(Factor, arg[2]);
        CtlC.IntVar(RelativeToOriginalSize, arg[1]);
        CtlC.IntVar(Scale, arg[0]);
        CtlC.CallParMethod(this, 24, arg, NIL);
    END ScaleWidth;

    PROCEDURE (this: ShapeRange) Select* ((* optional *) Replace: CtlT.Any), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Replace, arg[0]);
        CtlC.CallParMethod(this, 25, arg, NIL);
    END Select;

    PROCEDURE (this: ShapeRange) SetShapesDefaultProperties* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 26, NIL);
    END SetShapesDefaultProperties;

    PROCEDURE (this: ShapeRange) Ungroup* (): ShapeRange, NEW;
        VAR ret: CtlT.Variant;
    BEGIN
        CtlC.CallMethod(this, 27, ret);
        RETURN ThisShapeRange(CtlC.VarAny(ret))
    END Ungroup;

    PROCEDURE (this: ShapeRange) ZOrder* (ZOrderCmd: CtlOffice.MsoZOrderCmd), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(ZOrderCmd, arg[0]);
        CtlC.CallParMethod(this, 28, arg, NIL);
    END ZOrder;

    PROCEDURE (this: ShapeRange) ConvertToFrame* (): Frame, NEW;
        VAR ret: CtlT.Variant;
    BEGIN
        CtlC.CallMethod(this, 29, ret);
        RETURN ThisFrame(CtlC.VarAny(ret))
    END ConvertToFrame;

    PROCEDURE (this: ShapeRange) ConvertToInlineShape* (): InlineShape, NEW;
        VAR ret: CtlT.Variant;
    BEGIN
        CtlC.CallMethod(this, 30, ret);
        RETURN ThisInlineShape(CtlC.VarAny(ret))
    END ConvertToInlineShape;

    PROCEDURE (this: ShapeRange) Activate* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 50, NIL);
    END Activate;


    (* ---------- GroupShapes, dual, nonextensible ---------- *)

    PROCEDURE (this: GroupShapes) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 8000))
    END Application;

    PROCEDURE (this: GroupShapes) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 8001)
    END Creator;

    PROCEDURE (this: GroupShapes) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1)
    END Parent;

    PROCEDURE (this: GroupShapes) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Count;

    PROCEDURE (this: GroupShapes) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: GroupShapes) Item* (Index: CtlT.Any): Shape, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisShape(CtlC.VarAny(ret))
    END Item;


    (* ---------- Shape, dual, nonextensible ---------- *)

    PROCEDURE (this: Shape) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 8000))
    END Application;

    PROCEDURE (this: Shape) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 8001)
    END Creator;

    PROCEDURE (this: Shape) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1)
    END Parent;

    PROCEDURE (this: Shape) Adjustments* (): Adjustments, NEW;
    BEGIN
        RETURN ThisAdjustments(CtlC.GetAny(this, 100))
    END Adjustments;

    PROCEDURE (this: Shape) AutoShapeType* (): CtlOffice.MsoAutoShapeType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 101)
    END AutoShapeType;

    PROCEDURE (this: Shape) PUTAutoShapeType* (p1: CtlOffice.MsoAutoShapeType), NEW;
    BEGIN
        CtlC.PutInt(this, 101, p1)
    END PUTAutoShapeType;

    PROCEDURE (this: Shape) Callout* (): CalloutFormat, NEW;
    BEGIN
        RETURN ThisCalloutFormat(CtlC.GetAny(this, 103))
    END Callout;

    PROCEDURE (this: Shape) ConnectionSiteCount* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 104)
    END ConnectionSiteCount;

    PROCEDURE (this: Shape) Connector* (): CtlOffice.MsoTriState, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 105)
    END Connector;

    PROCEDURE (this: Shape) ConnectorFormat* (): ConnectorFormat, NEW;
    BEGIN
        RETURN ThisConnectorFormat(CtlC.GetAny(this, 106))
    END ConnectorFormat;

    PROCEDURE (this: Shape) Fill* (): FillFormat, NEW;
    BEGIN
        RETURN ThisFillFormat(CtlC.GetAny(this, 107))
    END Fill;

    PROCEDURE (this: Shape) GroupItems* (): GroupShapes, NEW;
    BEGIN
        RETURN ThisGroupShapes(CtlC.GetAny(this, 108))
    END GroupItems;

    PROCEDURE (this: Shape) Height* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 109)
    END Height;

    PROCEDURE (this: Shape) PUTHeight* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 109, p1)
    END PUTHeight;

    PROCEDURE (this: Shape) HorizontalFlip* (): CtlOffice.MsoTriState, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 110)
    END HorizontalFlip;

    PROCEDURE (this: Shape) Left* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 111)
    END Left;

    PROCEDURE (this: Shape) PUTLeft* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 111, p1)
    END PUTLeft;

    PROCEDURE (this: Shape) Line* (): LineFormat, NEW;
    BEGIN
        RETURN ThisLineFormat(CtlC.GetAny(this, 112))
    END Line;

    PROCEDURE (this: Shape) LockAspectRatio* (): CtlOffice.MsoTriState, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 113)
    END LockAspectRatio;

    PROCEDURE (this: Shape) PUTLockAspectRatio* (p1: CtlOffice.MsoTriState), NEW;
    BEGIN
        CtlC.PutInt(this, 113, p1)
    END PUTLockAspectRatio;

    PROCEDURE (this: Shape) Name* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 115)
    END Name;

    PROCEDURE (this: Shape) PUTName* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 115, p1)
    END PUTName;

    PROCEDURE (this: Shape) Nodes* (): ShapeNodes, NEW;
    BEGIN
        RETURN ThisShapeNodes(CtlC.GetAny(this, 116))
    END Nodes;

    PROCEDURE (this: Shape) Rotation* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 117)
    END Rotation;

    PROCEDURE (this: Shape) PUTRotation* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 117, p1)
    END PUTRotation;

    PROCEDURE (this: Shape) PictureFormat* (): PictureFormat, NEW;
    BEGIN
        RETURN ThisPictureFormat(CtlC.GetAny(this, 118))
    END PictureFormat;

    PROCEDURE (this: Shape) Shadow* (): ShadowFormat, NEW;
    BEGIN
        RETURN ThisShadowFormat(CtlC.GetAny(this, 119))
    END Shadow;

    PROCEDURE (this: Shape) TextEffect* (): TextEffectFormat, NEW;
    BEGIN
        RETURN ThisTextEffectFormat(CtlC.GetAny(this, 120))
    END TextEffect;

    PROCEDURE (this: Shape) TextFrame* (): TextFrame, NEW;
    BEGIN
        RETURN ThisTextFrame(CtlC.GetAny(this, 121))
    END TextFrame;

    PROCEDURE (this: Shape) ThreeD* (): ThreeDFormat, NEW;
    BEGIN
        RETURN ThisThreeDFormat(CtlC.GetAny(this, 122))
    END ThreeD;

    PROCEDURE (this: Shape) Top* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 123)
    END Top;

    PROCEDURE (this: Shape) PUTTop* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 123, p1)
    END PUTTop;

    PROCEDURE (this: Shape) Type* (): CtlOffice.MsoShapeType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 124)
    END Type;

    PROCEDURE (this: Shape) VerticalFlip* (): CtlOffice.MsoTriState, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 125)
    END VerticalFlip;

    PROCEDURE (this: Shape) Vertices* (): CtlT.Any, NEW;
    BEGIN
        RETURN CtlC.GetAny(this, 126)
    END Vertices;

    PROCEDURE (this: Shape) Visible* (): CtlOffice.MsoTriState, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 127)
    END Visible;

    PROCEDURE (this: Shape) PUTVisible* (p1: CtlOffice.MsoTriState), NEW;
    BEGIN
        CtlC.PutInt(this, 127, p1)
    END PUTVisible;

    PROCEDURE (this: Shape) Width* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 128)
    END Width;

    PROCEDURE (this: Shape) PUTWidth* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 128, p1)
    END PUTWidth;

    PROCEDURE (this: Shape) ZOrderPosition* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 129)
    END ZOrderPosition;

    PROCEDURE (this: Shape) Hyperlink* (): Hyperlink, NEW;
    BEGIN
        RETURN ThisHyperlink(CtlC.GetAny(this, 1001))
    END Hyperlink;

    PROCEDURE (this: Shape) RelativeHorizontalPosition* (): WdRelativeHorizontalPosition, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 300)
    END RelativeHorizontalPosition;

    PROCEDURE (this: Shape) PUTRelativeHorizontalPosition* (p1: WdRelativeHorizontalPosition), NEW;
    BEGIN
        CtlC.PutInt(this, 300, p1)
    END PUTRelativeHorizontalPosition;

    PROCEDURE (this: Shape) RelativeVerticalPosition* (): WdRelativeVerticalPosition, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 301)
    END RelativeVerticalPosition;

    PROCEDURE (this: Shape) PUTRelativeVerticalPosition* (p1: WdRelativeVerticalPosition), NEW;
    BEGIN
        CtlC.PutInt(this, 301, p1)
    END PUTRelativeVerticalPosition;

    PROCEDURE (this: Shape) LockAnchor* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 302)
    END LockAnchor;

    PROCEDURE (this: Shape) PUTLockAnchor* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 302, p1)
    END PUTLockAnchor;

    PROCEDURE (this: Shape) WrapFormat* (): WrapFormat, NEW;
    BEGIN
        RETURN ThisWrapFormat(CtlC.GetAny(this, 303))
    END WrapFormat;

    PROCEDURE (this: Shape) OLEFormat* (): OLEFormat, NEW;
    BEGIN
        RETURN ThisOLEFormat(CtlC.GetAny(this, 500))
    END OLEFormat;

    PROCEDURE (this: Shape) Anchor* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 501))
    END Anchor;

    PROCEDURE (this: Shape) LinkFormat* (): LinkFormat, NEW;
    BEGIN
        RETURN ThisLinkFormat(CtlC.GetAny(this, 502))
    END LinkFormat;

    PROCEDURE (this: Shape) Apply* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 10, NIL);
    END Apply;

    PROCEDURE (this: Shape) Delete* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 11, NIL);
    END Delete;

    PROCEDURE (this: Shape) Duplicate* (): Shape, NEW;
        VAR ret: CtlT.Variant;
    BEGIN
        CtlC.CallMethod(this, 12, ret);
        RETURN ThisShape(CtlC.VarAny(ret))
    END Duplicate;

    PROCEDURE (this: Shape) Flip* (FlipCmd: CtlOffice.MsoFlipCmd), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(FlipCmd, arg[0]);
        CtlC.CallParMethod(this, 13, arg, NIL);
    END Flip;

    PROCEDURE (this: Shape) IncrementLeft* (Increment: SHORTREAL), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.SRealVar(Increment, arg[0]);
        CtlC.CallParMethod(this, 14, arg, NIL);
    END IncrementLeft;

    PROCEDURE (this: Shape) IncrementRotation* (Increment: SHORTREAL), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.SRealVar(Increment, arg[0]);
        CtlC.CallParMethod(this, 15, arg, NIL);
    END IncrementRotation;

    PROCEDURE (this: Shape) IncrementTop* (Increment: SHORTREAL), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.SRealVar(Increment, arg[0]);
        CtlC.CallParMethod(this, 16, arg, NIL);
    END IncrementTop;

    PROCEDURE (this: Shape) PickUp* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 17, NIL);
    END PickUp;

    PROCEDURE (this: Shape) RerouteConnections* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 18, NIL);
    END RerouteConnections;

    PROCEDURE (this: Shape) ScaleHeight* (Factor: SHORTREAL; RelativeToOriginalSize: CtlOffice.MsoTriState; Scale: CtlOffice.MsoScaleFrom), NEW;
        VAR arg: ARRAY 3 OF CtlT.Variant;
    BEGIN
        CtlC.SRealVar(Factor, arg[2]);
        CtlC.IntVar(RelativeToOriginalSize, arg[1]);
        CtlC.IntVar(Scale, arg[0]);
        CtlC.CallParMethod(this, 19, arg, NIL);
    END ScaleHeight;

    PROCEDURE (this: Shape) ScaleWidth* (Factor: SHORTREAL; RelativeToOriginalSize: CtlOffice.MsoTriState; Scale: CtlOffice.MsoScaleFrom), NEW;
        VAR arg: ARRAY 3 OF CtlT.Variant;
    BEGIN
        CtlC.SRealVar(Factor, arg[2]);
        CtlC.IntVar(RelativeToOriginalSize, arg[1]);
        CtlC.IntVar(Scale, arg[0]);
        CtlC.CallParMethod(this, 20, arg, NIL);
    END ScaleWidth;

    PROCEDURE (this: Shape) Select* ((* optional *) Replace: CtlT.Any), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Replace, arg[0]);
        CtlC.CallParMethod(this, 21, arg, NIL);
    END Select;

    PROCEDURE (this: Shape) SetShapesDefaultProperties* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 22, NIL);
    END SetShapesDefaultProperties;

    PROCEDURE (this: Shape) Ungroup* (): ShapeRange, NEW;
        VAR ret: CtlT.Variant;
    BEGIN
        CtlC.CallMethod(this, 23, ret);
        RETURN ThisShapeRange(CtlC.VarAny(ret))
    END Ungroup;

    PROCEDURE (this: Shape) ZOrder* (ZOrderCmd: CtlOffice.MsoZOrderCmd), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(ZOrderCmd, arg[0]);
        CtlC.CallParMethod(this, 24, arg, NIL);
    END ZOrder;

    PROCEDURE (this: Shape) ConvertToInlineShape* (): InlineShape, NEW;
        VAR ret: CtlT.Variant;
    BEGIN
        CtlC.CallMethod(this, 25, ret);
        RETURN ThisInlineShape(CtlC.VarAny(ret))
    END ConvertToInlineShape;

    PROCEDURE (this: Shape) ConvertToFrame* (): Frame, NEW;
        VAR ret: CtlT.Variant;
    BEGIN
        CtlC.CallMethod(this, 29, ret);
        RETURN ThisFrame(CtlC.VarAny(ret))
    END ConvertToFrame;

    PROCEDURE (this: Shape) Activate* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 50, NIL);
    END Activate;


    (* ---------- TextFrame, dual, nonextensible ---------- *)

    PROCEDURE (this: TextFrame) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 8000))
    END Application;

    PROCEDURE (this: TextFrame) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 8001)
    END Creator;

    PROCEDURE (this: TextFrame) Parent* (): Shape, NEW;
    BEGIN
        RETURN ThisShape(CtlC.GetAny(this, 1))
    END Parent;

    PROCEDURE (this: TextFrame) MarginBottom* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 100)
    END MarginBottom;

    PROCEDURE (this: TextFrame) PUTMarginBottom* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 100, p1)
    END PUTMarginBottom;

    PROCEDURE (this: TextFrame) MarginLeft* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 101)
    END MarginLeft;

    PROCEDURE (this: TextFrame) PUTMarginLeft* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 101, p1)
    END PUTMarginLeft;

    PROCEDURE (this: TextFrame) MarginRight* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 102)
    END MarginRight;

    PROCEDURE (this: TextFrame) PUTMarginRight* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 102, p1)
    END PUTMarginRight;

    PROCEDURE (this: TextFrame) MarginTop* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 103)
    END MarginTop;

    PROCEDURE (this: TextFrame) PUTMarginTop* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 103, p1)
    END PUTMarginTop;

    PROCEDURE (this: TextFrame) Orientation* (): CtlOffice.MsoTextOrientation, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 104)
    END Orientation;

    PROCEDURE (this: TextFrame) PUTOrientation* (p1: CtlOffice.MsoTextOrientation), NEW;
    BEGIN
        CtlC.PutInt(this, 104, p1)
    END PUTOrientation;

    PROCEDURE (this: TextFrame) TextRange* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 1001))
    END TextRange;

    PROCEDURE (this: TextFrame) ContainingRange* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 1002))
    END ContainingRange;

    PROCEDURE (this: TextFrame) Next* (): TextFrame, NEW;
    BEGIN
        RETURN ThisTextFrame(CtlC.GetAny(this, 5001))
    END Next;

    PROCEDURE (this: TextFrame) PUTNext* (p1: TextFrame), NEW;
    BEGIN
        CtlC.PutObj(this, 5001, p1)
    END PUTNext;

    PROCEDURE (this: TextFrame) Previous* (): TextFrame, NEW;
    BEGIN
        RETURN ThisTextFrame(CtlC.GetAny(this, 5002))
    END Previous;

    PROCEDURE (this: TextFrame) PUTPrevious* (p1: TextFrame), NEW;
    BEGIN
        CtlC.PutObj(this, 5002, p1)
    END PUTPrevious;

    PROCEDURE (this: TextFrame) Overflowing* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 5003)
    END Overflowing;

    PROCEDURE (this: TextFrame) HasText* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 5008)
    END HasText;

    PROCEDURE (this: TextFrame) BreakForwardLink* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 5004, NIL);
    END BreakForwardLink;

    PROCEDURE (this: TextFrame) ValidLinkTarget* (TargetTextFrame: TextFrame): BOOLEAN, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.ObjVar(TargetTextFrame, arg[0]);
        CtlC.CallParMethod(this, 5006, arg, ret);
        RETURN CtlC.VarBool(ret)
    END ValidLinkTarget;


    (* ---------- _LetterContent, hidden, dual, nonextensible ---------- *)

    PROCEDURE (this: _LetterContent) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: _LetterContent) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: _LetterContent) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: _LetterContent) Duplicate* (): LetterContent, NEW;
    BEGIN
        RETURN This_LetterContent(CtlC.GetAny(this, 10))
    END Duplicate;

    PROCEDURE (this: _LetterContent) DateFormat* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 101)
    END DateFormat;

    PROCEDURE (this: _LetterContent) PUTDateFormat* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 101, p1)
    END PUTDateFormat;

    PROCEDURE (this: _LetterContent) IncludeHeaderFooter* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 102)
    END IncludeHeaderFooter;

    PROCEDURE (this: _LetterContent) PUTIncludeHeaderFooter* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 102, p1)
    END PUTIncludeHeaderFooter;

    PROCEDURE (this: _LetterContent) PageDesign* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 103)
    END PageDesign;

    PROCEDURE (this: _LetterContent) PUTPageDesign* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 103, p1)
    END PUTPageDesign;

    PROCEDURE (this: _LetterContent) LetterStyle* (): WdLetterStyle, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 104)
    END LetterStyle;

    PROCEDURE (this: _LetterContent) PUTLetterStyle* (p1: WdLetterStyle), NEW;
    BEGIN
        CtlC.PutInt(this, 104, p1)
    END PUTLetterStyle;

    PROCEDURE (this: _LetterContent) Letterhead* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 105)
    END Letterhead;

    PROCEDURE (this: _LetterContent) PUTLetterhead* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 105, p1)
    END PUTLetterhead;

    PROCEDURE (this: _LetterContent) LetterheadLocation* (): WdLetterheadLocation, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 106)
    END LetterheadLocation;

    PROCEDURE (this: _LetterContent) PUTLetterheadLocation* (p1: WdLetterheadLocation), NEW;
    BEGIN
        CtlC.PutInt(this, 106, p1)
    END PUTLetterheadLocation;

    PROCEDURE (this: _LetterContent) LetterheadSize* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 107)
    END LetterheadSize;

    PROCEDURE (this: _LetterContent) PUTLetterheadSize* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 107, p1)
    END PUTLetterheadSize;

    PROCEDURE (this: _LetterContent) RecipientName* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 108)
    END RecipientName;

    PROCEDURE (this: _LetterContent) PUTRecipientName* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 108, p1)
    END PUTRecipientName;

    PROCEDURE (this: _LetterContent) RecipientAddress* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 109)
    END RecipientAddress;

    PROCEDURE (this: _LetterContent) PUTRecipientAddress* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 109, p1)
    END PUTRecipientAddress;

    PROCEDURE (this: _LetterContent) Salutation* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 110)
    END Salutation;

    PROCEDURE (this: _LetterContent) PUTSalutation* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 110, p1)
    END PUTSalutation;

    PROCEDURE (this: _LetterContent) SalutationType* (): WdSalutationType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 111)
    END SalutationType;

    PROCEDURE (this: _LetterContent) PUTSalutationType* (p1: WdSalutationType), NEW;
    BEGIN
        CtlC.PutInt(this, 111, p1)
    END PUTSalutationType;

    PROCEDURE (this: _LetterContent) RecipientReference* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 112)
    END RecipientReference;

    PROCEDURE (this: _LetterContent) PUTRecipientReference* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 112, p1)
    END PUTRecipientReference;

    PROCEDURE (this: _LetterContent) MailingInstructions* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 114)
    END MailingInstructions;

    PROCEDURE (this: _LetterContent) PUTMailingInstructions* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 114, p1)
    END PUTMailingInstructions;

    PROCEDURE (this: _LetterContent) AttentionLine* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 115)
    END AttentionLine;

    PROCEDURE (this: _LetterContent) PUTAttentionLine* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 115, p1)
    END PUTAttentionLine;

    PROCEDURE (this: _LetterContent) Subject* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 116)
    END Subject;

    PROCEDURE (this: _LetterContent) PUTSubject* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 116, p1)
    END PUTSubject;

    PROCEDURE (this: _LetterContent) EnclosureNumber* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 117)
    END EnclosureNumber;

    PROCEDURE (this: _LetterContent) PUTEnclosureNumber* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 117, p1)
    END PUTEnclosureNumber;

    PROCEDURE (this: _LetterContent) CCList* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 118)
    END CCList;

    PROCEDURE (this: _LetterContent) PUTCCList* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 118, p1)
    END PUTCCList;

    PROCEDURE (this: _LetterContent) ReturnAddress* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 119)
    END ReturnAddress;

    PROCEDURE (this: _LetterContent) PUTReturnAddress* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 119, p1)
    END PUTReturnAddress;

    PROCEDURE (this: _LetterContent) SenderName* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 120)
    END SenderName;

    PROCEDURE (this: _LetterContent) PUTSenderName* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 120, p1)
    END PUTSenderName;

    PROCEDURE (this: _LetterContent) Closing* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 121)
    END Closing;

    PROCEDURE (this: _LetterContent) PUTClosing* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 121, p1)
    END PUTClosing;

    PROCEDURE (this: _LetterContent) SenderCompany* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 122)
    END SenderCompany;

    PROCEDURE (this: _LetterContent) PUTSenderCompany* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 122, p1)
    END PUTSenderCompany;

    PROCEDURE (this: _LetterContent) SenderJobTitle* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 123)
    END SenderJobTitle;

    PROCEDURE (this: _LetterContent) PUTSenderJobTitle* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 123, p1)
    END PUTSenderJobTitle;

    PROCEDURE (this: _LetterContent) SenderInitials* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 124)
    END SenderInitials;

    PROCEDURE (this: _LetterContent) PUTSenderInitials* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 124, p1)
    END PUTSenderInitials;

    PROCEDURE (this: _LetterContent) InfoBlock* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 125)
    END InfoBlock;

    PROCEDURE (this: _LetterContent) PUTInfoBlock* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 125, p1)
    END PUTInfoBlock;

    PROCEDURE (this: _LetterContent) RecipientCode* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 126)
    END RecipientCode;

    PROCEDURE (this: _LetterContent) PUTRecipientCode* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 126, p1)
    END PUTRecipientCode;

    PROCEDURE (this: _LetterContent) RecipientGender* (): WdSalutationGender, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 127)
    END RecipientGender;

    PROCEDURE (this: _LetterContent) PUTRecipientGender* (p1: WdSalutationGender), NEW;
    BEGIN
        CtlC.PutInt(this, 127, p1)
    END PUTRecipientGender;

    PROCEDURE (this: _LetterContent) ReturnAddressShortForm* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 128)
    END ReturnAddressShortForm;

    PROCEDURE (this: _LetterContent) PUTReturnAddressShortForm* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 128, p1)
    END PUTReturnAddressShortForm;

    PROCEDURE (this: _LetterContent) SenderCity* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 129)
    END SenderCity;

    PROCEDURE (this: _LetterContent) PUTSenderCity* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 129, p1)
    END PUTSenderCity;

    PROCEDURE (this: _LetterContent) SenderCode* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 130)
    END SenderCode;

    PROCEDURE (this: _LetterContent) PUTSenderCode* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 130, p1)
    END PUTSenderCode;

    PROCEDURE (this: _LetterContent) SenderGender* (): WdSalutationGender, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 131)
    END SenderGender;

    PROCEDURE (this: _LetterContent) PUTSenderGender* (p1: WdSalutationGender), NEW;
    BEGIN
        CtlC.PutInt(this, 131, p1)
    END PUTSenderGender;

    PROCEDURE (this: _LetterContent) SenderReference* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 132)
    END SenderReference;

    PROCEDURE (this: _LetterContent) PUTSenderReference* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 132, p1)
    END PUTSenderReference;


    (* ---------- View, dual, nonextensible ---------- *)

    PROCEDURE (this: View) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: View) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: View) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: View) Type* (): WdViewType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 0)
    END Type;

    PROCEDURE (this: View) PUTType* (p1: WdViewType), NEW;
    BEGIN
        CtlC.PutInt(this, 0, p1)
    END PUTType;

    PROCEDURE (this: View) FullScreen* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 1)
    END FullScreen;

    PROCEDURE (this: View) PUTFullScreen* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 1, p1)
    END PUTFullScreen;

    PROCEDURE (this: View) Draft* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 2)
    END Draft;

    PROCEDURE (this: View) PUTDraft* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 2, p1)
    END PUTDraft;

    PROCEDURE (this: View) ShowAll* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 3)
    END ShowAll;

    PROCEDURE (this: View) PUTShowAll* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 3, p1)
    END PUTShowAll;

    PROCEDURE (this: View) ShowFieldCodes* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 4)
    END ShowFieldCodes;

    PROCEDURE (this: View) PUTShowFieldCodes* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 4, p1)
    END PUTShowFieldCodes;

    PROCEDURE (this: View) MailMergeDataView* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 5)
    END MailMergeDataView;

    PROCEDURE (this: View) PUTMailMergeDataView* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 5, p1)
    END PUTMailMergeDataView;

    PROCEDURE (this: View) Magnifier* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 7)
    END Magnifier;

    PROCEDURE (this: View) PUTMagnifier* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 7, p1)
    END PUTMagnifier;

    PROCEDURE (this: View) ShowFirstLineOnly* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 8)
    END ShowFirstLineOnly;

    PROCEDURE (this: View) PUTShowFirstLineOnly* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 8, p1)
    END PUTShowFirstLineOnly;

    PROCEDURE (this: View) ShowFormat* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 9)
    END ShowFormat;

    PROCEDURE (this: View) PUTShowFormat* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 9, p1)
    END PUTShowFormat;

    PROCEDURE (this: View) Zoom* (): Zoom, NEW;
    BEGIN
        RETURN ThisZoom(CtlC.GetAny(this, 10))
    END Zoom;

    PROCEDURE (this: View) ShowObjectAnchors* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 11)
    END ShowObjectAnchors;

    PROCEDURE (this: View) PUTShowObjectAnchors* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 11, p1)
    END PUTShowObjectAnchors;

    PROCEDURE (this: View) ShowTextBoundaries* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 12)
    END ShowTextBoundaries;

    PROCEDURE (this: View) PUTShowTextBoundaries* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 12, p1)
    END PUTShowTextBoundaries;

    PROCEDURE (this: View) ShowHighlight* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 13)
    END ShowHighlight;

    PROCEDURE (this: View) PUTShowHighlight* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 13, p1)
    END PUTShowHighlight;

    PROCEDURE (this: View) ShowDrawings* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 14)
    END ShowDrawings;

    PROCEDURE (this: View) PUTShowDrawings* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 14, p1)
    END PUTShowDrawings;

    PROCEDURE (this: View) ShowTabs* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 15)
    END ShowTabs;

    PROCEDURE (this: View) PUTShowTabs* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 15, p1)
    END PUTShowTabs;

    PROCEDURE (this: View) ShowSpaces* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 16)
    END ShowSpaces;

    PROCEDURE (this: View) PUTShowSpaces* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 16, p1)
    END PUTShowSpaces;

    PROCEDURE (this: View) ShowParagraphs* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 17)
    END ShowParagraphs;

    PROCEDURE (this: View) PUTShowParagraphs* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 17, p1)
    END PUTShowParagraphs;

    PROCEDURE (this: View) ShowHyphens* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 18)
    END ShowHyphens;

    PROCEDURE (this: View) PUTShowHyphens* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 18, p1)
    END PUTShowHyphens;

    PROCEDURE (this: View) ShowHiddenText* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 19)
    END ShowHiddenText;

    PROCEDURE (this: View) PUTShowHiddenText* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 19, p1)
    END PUTShowHiddenText;

    PROCEDURE (this: View) WrapToWindow* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 20)
    END WrapToWindow;

    PROCEDURE (this: View) PUTWrapToWindow* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 20, p1)
    END PUTWrapToWindow;

    PROCEDURE (this: View) ShowPicturePlaceHolders* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 21)
    END ShowPicturePlaceHolders;

    PROCEDURE (this: View) PUTShowPicturePlaceHolders* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 21, p1)
    END PUTShowPicturePlaceHolders;

    PROCEDURE (this: View) ShowBookmarks* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 22)
    END ShowBookmarks;

    PROCEDURE (this: View) PUTShowBookmarks* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 22, p1)
    END PUTShowBookmarks;

    PROCEDURE (this: View) FieldShading* (): WdFieldShading, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 23)
    END FieldShading;

    PROCEDURE (this: View) PUTFieldShading* (p1: WdFieldShading), NEW;
    BEGIN
        CtlC.PutInt(this, 23, p1)
    END PUTFieldShading;

    PROCEDURE (this: View) ShowAnimation* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 24)
    END ShowAnimation;

    PROCEDURE (this: View) PUTShowAnimation* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 24, p1)
    END PUTShowAnimation;

    PROCEDURE (this: View) TableGridlines* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 25)
    END TableGridlines;

    PROCEDURE (this: View) PUTTableGridlines* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 25, p1)
    END PUTTableGridlines;

    PROCEDURE (this: View) EnlargeFontsLessThan* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 26)
    END EnlargeFontsLessThan;

    PROCEDURE (this: View) PUTEnlargeFontsLessThan* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 26, p1)
    END PUTEnlargeFontsLessThan;

    PROCEDURE (this: View) ShowMainTextLayer* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 27)
    END ShowMainTextLayer;

    PROCEDURE (this: View) PUTShowMainTextLayer* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 27, p1)
    END PUTShowMainTextLayer;

    PROCEDURE (this: View) SeekView* (): WdSeekView, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 28)
    END SeekView;

    PROCEDURE (this: View) PUTSeekView* (p1: WdSeekView), NEW;
    BEGIN
        CtlC.PutInt(this, 28, p1)
    END PUTSeekView;

    PROCEDURE (this: View) SplitSpecial* (): WdSpecialPane, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 29)
    END SplitSpecial;

    PROCEDURE (this: View) PUTSplitSpecial* (p1: WdSpecialPane), NEW;
    BEGIN
        CtlC.PutInt(this, 29, p1)
    END PUTSplitSpecial;

    PROCEDURE (this: View) BrowseToWindow* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 30)
    END BrowseToWindow;

    PROCEDURE (this: View) PUTBrowseToWindow* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 30, p1)
    END PUTBrowseToWindow;

    PROCEDURE (this: View) ShowOptionalBreaks* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 31)
    END ShowOptionalBreaks;

    PROCEDURE (this: View) PUTShowOptionalBreaks* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 31, p1)
    END PUTShowOptionalBreaks;

    PROCEDURE (this: View) CollapseOutline* ((* optional *) Range: CtlT.Any), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Range, arg[0]);
        CtlC.CallParMethod(this, 101, arg, NIL);
    END CollapseOutline;

    PROCEDURE (this: View) ExpandOutline* ((* optional *) Range: CtlT.Any), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Range, arg[0]);
        CtlC.CallParMethod(this, 102, arg, NIL);
    END ExpandOutline;

    PROCEDURE (this: View) ShowAllHeadings* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 103, NIL);
    END ShowAllHeadings;

    PROCEDURE (this: View) ShowHeading* (Level: INTEGER), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(Level, arg[0]);
        CtlC.CallParMethod(this, 104, arg, NIL);
    END ShowHeading;

    PROCEDURE (this: View) PreviousHeaderFooter* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 105, NIL);
    END PreviousHeaderFooter;

    PROCEDURE (this: View) NextHeaderFooter* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 106, NIL);
    END NextHeaderFooter;


    (* ---------- Zoom, dual, nonextensible ---------- *)

    PROCEDURE (this: Zoom) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Zoom) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Zoom) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Zoom) Percentage* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 0)
    END Percentage;

    PROCEDURE (this: Zoom) PUTPercentage* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 0, p1)
    END PUTPercentage;

    PROCEDURE (this: Zoom) PageFit* (): WdPageFit, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END PageFit;

    PROCEDURE (this: Zoom) PUTPageFit* (p1: WdPageFit), NEW;
    BEGIN
        CtlC.PutInt(this, 1, p1)
    END PUTPageFit;

    PROCEDURE (this: Zoom) PageRows* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END PageRows;

    PROCEDURE (this: Zoom) PUTPageRows* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 2, p1)
    END PUTPageRows;

    PROCEDURE (this: Zoom) PageColumns* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 3)
    END PageColumns;

    PROCEDURE (this: Zoom) PUTPageColumns* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 3, p1)
    END PUTPageColumns;


    (* ---------- Zooms, dual, nonextensible ---------- *)

    PROCEDURE (this: Zooms) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Zooms) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Zooms) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Zooms) Item* (Index: WdViewType): Zoom, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisZoom(CtlC.VarAny(ret))
    END Item;


    (* ---------- InlineShape, dual, nonextensible ---------- *)

    PROCEDURE (this: InlineShape) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: InlineShape) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: InlineShape) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: InlineShape) Borders* (): Borders, NEW;
    BEGIN
        RETURN ThisBorders(CtlC.GetAny(this, 1100))
    END Borders;

    PROCEDURE (this: InlineShape) PUTBorders* (p1: Borders), NEW;
    BEGIN
        CtlC.PutObj(this, 1100, p1)
    END PUTBorders;

    PROCEDURE (this: InlineShape) Range* (): Range, NEW;
    BEGIN
        RETURN ThisRange(CtlC.GetAny(this, 2))
    END Range;

    PROCEDURE (this: InlineShape) LinkFormat* (): LinkFormat, NEW;
    BEGIN
        RETURN ThisLinkFormat(CtlC.GetAny(this, 3))
    END LinkFormat;

    PROCEDURE (this: InlineShape) Field* (): Field, NEW;
    BEGIN
        RETURN ThisField(CtlC.GetAny(this, 4))
    END Field;

    PROCEDURE (this: InlineShape) OLEFormat* (): OLEFormat, NEW;
    BEGIN
        RETURN ThisOLEFormat(CtlC.GetAny(this, 5))
    END OLEFormat;

    PROCEDURE (this: InlineShape) Type* (): WdInlineShapeType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 6)
    END Type;

    PROCEDURE (this: InlineShape) Hyperlink* (): Hyperlink, NEW;
    BEGIN
        RETURN ThisHyperlink(CtlC.GetAny(this, 7))
    END Hyperlink;

    PROCEDURE (this: InlineShape) Height* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 8)
    END Height;

    PROCEDURE (this: InlineShape) PUTHeight* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 8, p1)
    END PUTHeight;

    PROCEDURE (this: InlineShape) Width* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 9)
    END Width;

    PROCEDURE (this: InlineShape) PUTWidth* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 9, p1)
    END PUTWidth;

    PROCEDURE (this: InlineShape) ScaleHeight* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 10)
    END ScaleHeight;

    PROCEDURE (this: InlineShape) PUTScaleHeight* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 10, p1)
    END PUTScaleHeight;

    PROCEDURE (this: InlineShape) ScaleWidth* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 11)
    END ScaleWidth;

    PROCEDURE (this: InlineShape) PUTScaleWidth* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 11, p1)
    END PUTScaleWidth;

    PROCEDURE (this: InlineShape) LockAspectRatio* (): CtlOffice.MsoTriState, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 12)
    END LockAspectRatio;

    PROCEDURE (this: InlineShape) PUTLockAspectRatio* (p1: CtlOffice.MsoTriState), NEW;
    BEGIN
        CtlC.PutInt(this, 12, p1)
    END PUTLockAspectRatio;

    PROCEDURE (this: InlineShape) Line* (): LineFormat, NEW;
    BEGIN
        RETURN ThisLineFormat(CtlC.GetAny(this, 112))
    END Line;

    PROCEDURE (this: InlineShape) Fill* (): FillFormat, NEW;
    BEGIN
        RETURN ThisFillFormat(CtlC.GetAny(this, 107))
    END Fill;

    PROCEDURE (this: InlineShape) PictureFormat* (): PictureFormat, NEW;
    BEGIN
        RETURN ThisPictureFormat(CtlC.GetAny(this, 118))
    END PictureFormat;

    PROCEDURE (this: InlineShape) PUTPictureFormat* (p1: PictureFormat), NEW;
    BEGIN
        CtlC.PutObj(this, 118, p1)
    END PUTPictureFormat;

    PROCEDURE (this: InlineShape) Activate* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 100, NIL);
    END Activate;

    PROCEDURE (this: InlineShape) Reset* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 101, NIL);
    END Reset;

    PROCEDURE (this: InlineShape) Delete* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 102, NIL);
    END Delete;

    PROCEDURE (this: InlineShape) Select* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 65535, NIL);
    END Select;

    PROCEDURE (this: InlineShape) ConvertToShape* (): Shape, NEW;
        VAR ret: CtlT.Variant;
    BEGIN
        CtlC.CallMethod(this, 104, ret);
        RETURN ThisShape(CtlC.VarAny(ret))
    END ConvertToShape;


    (* ---------- InlineShapes, dual, nonextensible ---------- *)

    PROCEDURE (this: InlineShapes) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: InlineShapes) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: InlineShapes) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: InlineShapes) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Count;

    PROCEDURE (this: InlineShapes) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: InlineShapes) Item* (Index: INTEGER): InlineShape, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisInlineShape(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: InlineShapes) AddPicture* (FileName: ARRAY OF CHAR; (* optional *) LinkToFile: CtlT.Any; SaveWithDocument: CtlT.Any; Range: CtlT.Any): InlineShape, NEW;
        VAR arg: ARRAY 4 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.StrVar(FileName, arg[3]);
        CtlC.AnyVar(LinkToFile, arg[2]);
        CtlC.AnyVar(SaveWithDocument, arg[1]);
        CtlC.AnyVar(Range, arg[0]);
        CtlC.CallParMethod(this, 100, arg, ret);
        RETURN ThisInlineShape(CtlC.VarAny(ret))
    END AddPicture;

    PROCEDURE (this: InlineShapes) AddOLEObject* ((* optional *) ClassType: CtlT.Any; FileName: CtlT.Any; LinkToFile: CtlT.Any; DisplayAsIcon: CtlT.Any; IconFileName: CtlT.Any; IconIndex: CtlT.Any; IconLabel: CtlT.Any; Range: CtlT.Any): InlineShape, NEW;
        VAR arg: ARRAY 8 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(ClassType, arg[7]);
        CtlC.AnyVar(FileName, arg[6]);
        CtlC.AnyVar(LinkToFile, arg[5]);
        CtlC.AnyVar(DisplayAsIcon, arg[4]);
        CtlC.AnyVar(IconFileName, arg[3]);
        CtlC.AnyVar(IconIndex, arg[2]);
        CtlC.AnyVar(IconLabel, arg[1]);
        CtlC.AnyVar(Range, arg[0]);
        CtlC.CallParMethod(this, 24, arg, ret);
        RETURN ThisInlineShape(CtlC.VarAny(ret))
    END AddOLEObject;

    PROCEDURE (this: InlineShapes) AddOLEControl* ((* optional *) ClassType: CtlT.Any; Range: CtlT.Any): InlineShape, NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(ClassType, arg[1]);
        CtlC.AnyVar(Range, arg[0]);
        CtlC.CallParMethod(this, 102, arg, ret);
        RETURN ThisInlineShape(CtlC.VarAny(ret))
    END AddOLEControl;

    PROCEDURE (this: InlineShapes) New* (range: Range): InlineShape, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.ObjVar(range, arg[0]);
        CtlC.CallParMethod(this, 200, arg, ret);
        RETURN ThisInlineShape(CtlC.VarAny(ret))
    END New;


    (* ---------- SpellingSuggestions, dual, nonextensible ---------- *)

    PROCEDURE (this: SpellingSuggestions) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: SpellingSuggestions) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: SpellingSuggestions) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: SpellingSuggestions) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: SpellingSuggestions) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Count;

    PROCEDURE (this: SpellingSuggestions) SpellingErrorType* (): WdSpellingErrorType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END SpellingErrorType;

    PROCEDURE (this: SpellingSuggestions) Item* (Index: INTEGER): SpellingSuggestion, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisSpellingSuggestion(CtlC.VarAny(ret))
    END Item;


    (* ---------- SpellingSuggestion, dual, nonextensible ---------- *)

    PROCEDURE (this: SpellingSuggestion) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: SpellingSuggestion) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: SpellingSuggestion) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: SpellingSuggestion) Name* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 0)
    END Name;


    (* ---------- Dictionaries, dual, nonextensible ---------- *)

    PROCEDURE (this: Dictionaries) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Dictionaries) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Dictionaries) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Dictionaries) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: Dictionaries) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Count;

    PROCEDURE (this: Dictionaries) Maximum* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Maximum;

    PROCEDURE (this: Dictionaries) ActiveCustomDictionary* (): Dictionary, NEW;
    BEGIN
        RETURN ThisDictionary(CtlC.GetAny(this, 3))
    END ActiveCustomDictionary;

    PROCEDURE (this: Dictionaries) PUTActiveCustomDictionary* (p1: Dictionary), NEW;
    BEGIN
        CtlC.PutObj(this, 3, p1)
    END PUTActiveCustomDictionary;

    PROCEDURE (this: Dictionaries) Item* (Index: CtlT.Any): Dictionary, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisDictionary(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: Dictionaries) Add* (FileName: ARRAY OF CHAR): Dictionary, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.StrVar(FileName, arg[0]);
        CtlC.CallParMethod(this, 101, arg, ret);
        RETURN ThisDictionary(CtlC.VarAny(ret))
    END Add;

    PROCEDURE (this: Dictionaries) ClearAll* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 102, NIL);
    END ClearAll;


    (* ---------- HangulHanjaConversionDictionaries, hidden, dual, nonextensible ---------- *)

    PROCEDURE (this: HangulHanjaConversionDictionaries) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: HangulHanjaConversionDictionaries) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: HangulHanjaConversionDictionaries) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: HangulHanjaConversionDictionaries) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: HangulHanjaConversionDictionaries) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Count;

    PROCEDURE (this: HangulHanjaConversionDictionaries) Maximum* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Maximum;

    PROCEDURE (this: HangulHanjaConversionDictionaries) ActiveCustomDictionary* (): Dictionary, NEW;
    BEGIN
        RETURN ThisDictionary(CtlC.GetAny(this, 3))
    END ActiveCustomDictionary;

    PROCEDURE (this: HangulHanjaConversionDictionaries) PUTActiveCustomDictionary* (p1: Dictionary), NEW;
    BEGIN
        CtlC.PutObj(this, 3, p1)
    END PUTActiveCustomDictionary;

    PROCEDURE (this: HangulHanjaConversionDictionaries) BuiltinDictionary* (): Dictionary, NEW;
    BEGIN
        RETURN ThisDictionary(CtlC.GetAny(this, 4))
    END BuiltinDictionary;

    PROCEDURE (this: HangulHanjaConversionDictionaries) Item* (Index: CtlT.Any): Dictionary, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisDictionary(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: HangulHanjaConversionDictionaries) Add* (FileName: ARRAY OF CHAR): Dictionary, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.StrVar(FileName, arg[0]);
        CtlC.CallParMethod(this, 101, arg, ret);
        RETURN ThisDictionary(CtlC.VarAny(ret))
    END Add;

    PROCEDURE (this: HangulHanjaConversionDictionaries) ClearAll* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 102, NIL);
    END ClearAll;


    (* ---------- Dictionary, dual, nonextensible ---------- *)

    PROCEDURE (this: Dictionary) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Dictionary) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Dictionary) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Dictionary) Name* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 0)
    END Name;

    PROCEDURE (this: Dictionary) Path* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 1)
    END Path;

    PROCEDURE (this: Dictionary) LanguageID* (): WdLanguageID, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END LanguageID;

    PROCEDURE (this: Dictionary) PUTLanguageID* (p1: WdLanguageID), NEW;
    BEGIN
        CtlC.PutInt(this, 2, p1)
    END PUTLanguageID;

    PROCEDURE (this: Dictionary) ReadOnly* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 3)
    END ReadOnly;

    PROCEDURE (this: Dictionary) Type* (): WdDictionaryType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 4)
    END Type;

    PROCEDURE (this: Dictionary) LanguageSpecific* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 5)
    END LanguageSpecific;

    PROCEDURE (this: Dictionary) PUTLanguageSpecific* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 5, p1)
    END PUTLanguageSpecific;

    PROCEDURE (this: Dictionary) Delete* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 101, NIL);
    END Delete;


    (* ---------- ReadabilityStatistics, dual, nonextensible ---------- *)

    PROCEDURE (this: ReadabilityStatistics) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: ReadabilityStatistics) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: ReadabilityStatistics) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: ReadabilityStatistics) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: ReadabilityStatistics) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Count;

    PROCEDURE (this: ReadabilityStatistics) Item* (Index: CtlT.Any): ReadabilityStatistic, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisReadabilityStatistic(CtlC.VarAny(ret))
    END Item;


    (* ---------- ReadabilityStatistic, dual, nonextensible ---------- *)

    PROCEDURE (this: ReadabilityStatistic) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: ReadabilityStatistic) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: ReadabilityStatistic) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: ReadabilityStatistic) Name* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 0)
    END Name;

    PROCEDURE (this: ReadabilityStatistic) Value* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 1)
    END Value;


    (* ---------- Versions, dual, nonextensible ---------- *)

    PROCEDURE (this: Versions) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Versions) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Versions) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Versions) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: Versions) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Count;

    PROCEDURE (this: Versions) AutoVersion* (): WdAutoVersions, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 3)
    END AutoVersion;

    PROCEDURE (this: Versions) PUTAutoVersion* (p1: WdAutoVersions), NEW;
    BEGIN
        CtlC.PutInt(this, 3, p1)
    END PUTAutoVersion;

    PROCEDURE (this: Versions) Item* (Index: INTEGER): Version, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisVersion(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: Versions) Save* ((* optional *) Comment: CtlT.Any), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Comment, arg[0]);
        CtlC.CallParMethod(this, 11, arg, NIL);
    END Save;


    (* ---------- Version, dual, nonextensible ---------- *)

    PROCEDURE (this: Version) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Version) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Version) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Version) SavedBy* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 1003)
    END SavedBy;

    PROCEDURE (this: Version) Comment* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 1004)
    END Comment;

    PROCEDURE (this: Version) Date* (): CtlT.OleDate;
    BEGIN
        RETURN CtlC.GetDate(this, 1005)
    END Date;

    PROCEDURE (this: Version) Index* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Index;

    PROCEDURE (this: Version) Open* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 101, NIL);
    END Open;

    PROCEDURE (this: Version) Delete* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 102, NIL);
    END Delete;


    (* ---------- Options, dual, nonextensible ---------- *)

    PROCEDURE (this: Options) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Options) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Options) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Options) AllowAccentedUppercase* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 1)
    END AllowAccentedUppercase;

    PROCEDURE (this: Options) PUTAllowAccentedUppercase* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 1, p1)
    END PUTAllowAccentedUppercase;

    PROCEDURE (this: Options) WPHelp* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 17)
    END WPHelp;

    PROCEDURE (this: Options) PUTWPHelp* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 17, p1)
    END PUTWPHelp;

    PROCEDURE (this: Options) WPDocNavKeys* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 18)
    END WPDocNavKeys;

    PROCEDURE (this: Options) PUTWPDocNavKeys* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 18, p1)
    END PUTWPDocNavKeys;

    PROCEDURE (this: Options) Pagination* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 19)
    END Pagination;

    PROCEDURE (this: Options) PUTPagination* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 19, p1)
    END PUTPagination;

    PROCEDURE (this: Options) BlueScreen* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 20)
    END BlueScreen;

    PROCEDURE (this: Options) PUTBlueScreen* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 20, p1)
    END PUTBlueScreen;

    PROCEDURE (this: Options) EnableSound* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 21)
    END EnableSound;

    PROCEDURE (this: Options) PUTEnableSound* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 21, p1)
    END PUTEnableSound;

    PROCEDURE (this: Options) ConfirmConversions* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 22)
    END ConfirmConversions;

    PROCEDURE (this: Options) PUTConfirmConversions* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 22, p1)
    END PUTConfirmConversions;

    PROCEDURE (this: Options) UpdateLinksAtOpen* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 23)
    END UpdateLinksAtOpen;

    PROCEDURE (this: Options) PUTUpdateLinksAtOpen* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 23, p1)
    END PUTUpdateLinksAtOpen;

    PROCEDURE (this: Options) SendMailAttach* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 24)
    END SendMailAttach;

    PROCEDURE (this: Options) PUTSendMailAttach* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 24, p1)
    END PUTSendMailAttach;

    PROCEDURE (this: Options) MeasurementUnit* (): WdMeasurementUnits, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 26)
    END MeasurementUnit;

    PROCEDURE (this: Options) PUTMeasurementUnit* (p1: WdMeasurementUnits), NEW;
    BEGIN
        CtlC.PutInt(this, 26, p1)
    END PUTMeasurementUnit;

    PROCEDURE (this: Options) ButtonFieldClicks* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 27)
    END ButtonFieldClicks;

    PROCEDURE (this: Options) PUTButtonFieldClicks* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 27, p1)
    END PUTButtonFieldClicks;

    PROCEDURE (this: Options) ShortMenuNames* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 28)
    END ShortMenuNames;

    PROCEDURE (this: Options) PUTShortMenuNames* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 28, p1)
    END PUTShortMenuNames;

    PROCEDURE (this: Options) RTFInClipboard* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 29)
    END RTFInClipboard;

    PROCEDURE (this: Options) PUTRTFInClipboard* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 29, p1)
    END PUTRTFInClipboard;

    PROCEDURE (this: Options) UpdateFieldsAtPrint* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 30)
    END UpdateFieldsAtPrint;

    PROCEDURE (this: Options) PUTUpdateFieldsAtPrint* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 30, p1)
    END PUTUpdateFieldsAtPrint;

    PROCEDURE (this: Options) PrintProperties* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 31)
    END PrintProperties;

    PROCEDURE (this: Options) PUTPrintProperties* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 31, p1)
    END PUTPrintProperties;

    PROCEDURE (this: Options) PrintFieldCodes* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 32)
    END PrintFieldCodes;

    PROCEDURE (this: Options) PUTPrintFieldCodes* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 32, p1)
    END PUTPrintFieldCodes;

    PROCEDURE (this: Options) PrintComments* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 33)
    END PrintComments;

    PROCEDURE (this: Options) PUTPrintComments* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 33, p1)
    END PUTPrintComments;

    PROCEDURE (this: Options) PrintHiddenText* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 34)
    END PrintHiddenText;

    PROCEDURE (this: Options) PUTPrintHiddenText* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 34, p1)
    END PUTPrintHiddenText;

    PROCEDURE (this: Options) EnvelopeFeederInstalled* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 35)
    END EnvelopeFeederInstalled;

    PROCEDURE (this: Options) UpdateLinksAtPrint* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 36)
    END UpdateLinksAtPrint;

    PROCEDURE (this: Options) PUTUpdateLinksAtPrint* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 36, p1)
    END PUTUpdateLinksAtPrint;

    PROCEDURE (this: Options) PrintBackground* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 37)
    END PrintBackground;

    PROCEDURE (this: Options) PUTPrintBackground* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 37, p1)
    END PUTPrintBackground;

    PROCEDURE (this: Options) PrintDrawingObjects* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 38)
    END PrintDrawingObjects;

    PROCEDURE (this: Options) PUTPrintDrawingObjects* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 38, p1)
    END PUTPrintDrawingObjects;

    PROCEDURE (this: Options) DefaultTray* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 39)
    END DefaultTray;

    PROCEDURE (this: Options) PUTDefaultTray* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 39, p1)
    END PUTDefaultTray;

    PROCEDURE (this: Options) DefaultTrayID* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 40)
    END DefaultTrayID;

    PROCEDURE (this: Options) PUTDefaultTrayID* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 40, p1)
    END PUTDefaultTrayID;

    PROCEDURE (this: Options) CreateBackup* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 41)
    END CreateBackup;

    PROCEDURE (this: Options) PUTCreateBackup* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 41, p1)
    END PUTCreateBackup;

    PROCEDURE (this: Options) AllowFastSave* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 42)
    END AllowFastSave;

    PROCEDURE (this: Options) PUTAllowFastSave* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 42, p1)
    END PUTAllowFastSave;

    PROCEDURE (this: Options) SavePropertiesPrompt* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 43)
    END SavePropertiesPrompt;

    PROCEDURE (this: Options) PUTSavePropertiesPrompt* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 43, p1)
    END PUTSavePropertiesPrompt;

    PROCEDURE (this: Options) SaveNormalPrompt* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 44)
    END SaveNormalPrompt;

    PROCEDURE (this: Options) PUTSaveNormalPrompt* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 44, p1)
    END PUTSaveNormalPrompt;

    PROCEDURE (this: Options) SaveInterval* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 45)
    END SaveInterval;

    PROCEDURE (this: Options) PUTSaveInterval* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 45, p1)
    END PUTSaveInterval;

    PROCEDURE (this: Options) BackgroundSave* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 46)
    END BackgroundSave;

    PROCEDURE (this: Options) PUTBackgroundSave* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 46, p1)
    END PUTBackgroundSave;

    PROCEDURE (this: Options) InsertedTextMark* (): WdInsertedTextMark, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 57)
    END InsertedTextMark;

    PROCEDURE (this: Options) PUTInsertedTextMark* (p1: WdInsertedTextMark), NEW;
    BEGIN
        CtlC.PutInt(this, 57, p1)
    END PUTInsertedTextMark;

    PROCEDURE (this: Options) DeletedTextMark* (): WdDeletedTextMark, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 58)
    END DeletedTextMark;

    PROCEDURE (this: Options) PUTDeletedTextMark* (p1: WdDeletedTextMark), NEW;
    BEGIN
        CtlC.PutInt(this, 58, p1)
    END PUTDeletedTextMark;

    PROCEDURE (this: Options) RevisedLinesMark* (): WdRevisedLinesMark, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 59)
    END RevisedLinesMark;

    PROCEDURE (this: Options) PUTRevisedLinesMark* (p1: WdRevisedLinesMark), NEW;
    BEGIN
        CtlC.PutInt(this, 59, p1)
    END PUTRevisedLinesMark;

    PROCEDURE (this: Options) InsertedTextColor* (): WdColorIndex, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 60)
    END InsertedTextColor;

    PROCEDURE (this: Options) PUTInsertedTextColor* (p1: WdColorIndex), NEW;
    BEGIN
        CtlC.PutInt(this, 60, p1)
    END PUTInsertedTextColor;

    PROCEDURE (this: Options) DeletedTextColor* (): WdColorIndex, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 61)
    END DeletedTextColor;

    PROCEDURE (this: Options) PUTDeletedTextColor* (p1: WdColorIndex), NEW;
    BEGIN
        CtlC.PutInt(this, 61, p1)
    END PUTDeletedTextColor;

    PROCEDURE (this: Options) RevisedLinesColor* (): WdColorIndex, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 62)
    END RevisedLinesColor;

    PROCEDURE (this: Options) PUTRevisedLinesColor* (p1: WdColorIndex), NEW;
    BEGIN
        CtlC.PutInt(this, 62, p1)
    END PUTRevisedLinesColor;

    PROCEDURE (this: Options) DefaultFilePath* (Path: WdDefaultFilePath): CtlT.Strg, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Path, arg[0]);
        CtlC.CallGetMethod(this, 65, arg, ret);
        RETURN CtlC.VarStr(ret)
    END DefaultFilePath;

    PROCEDURE (this: Options) PUTDefaultFilePath* (Path: WdDefaultFilePath; p2: ARRAY OF CHAR), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(Path, arg[1]);
        CtlC.StrVar(p2, arg[0]);
        CtlC.CallPutMethod(this, 65, arg, NIL);
    END PUTDefaultFilePath;

    PROCEDURE (this: Options) Overtype* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 66)
    END Overtype;

    PROCEDURE (this: Options) PUTOvertype* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 66, p1)
    END PUTOvertype;

    PROCEDURE (this: Options) ReplaceSelection* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 67)
    END ReplaceSelection;

    PROCEDURE (this: Options) PUTReplaceSelection* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 67, p1)
    END PUTReplaceSelection;

    PROCEDURE (this: Options) AllowDragAndDrop* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 68)
    END AllowDragAndDrop;

    PROCEDURE (this: Options) PUTAllowDragAndDrop* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 68, p1)
    END PUTAllowDragAndDrop;

    PROCEDURE (this: Options) AutoWordSelection* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 69)
    END AutoWordSelection;

    PROCEDURE (this: Options) PUTAutoWordSelection* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 69, p1)
    END PUTAutoWordSelection;

    PROCEDURE (this: Options) INSKeyForPaste* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 70)
    END INSKeyForPaste;

    PROCEDURE (this: Options) PUTINSKeyForPaste* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 70, p1)
    END PUTINSKeyForPaste;

    PROCEDURE (this: Options) SmartCutPaste* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 71)
    END SmartCutPaste;

    PROCEDURE (this: Options) PUTSmartCutPaste* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 71, p1)
    END PUTSmartCutPaste;

    PROCEDURE (this: Options) TabIndentKey* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 72)
    END TabIndentKey;

    PROCEDURE (this: Options) PUTTabIndentKey* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 72, p1)
    END PUTTabIndentKey;

    PROCEDURE (this: Options) PictureEditor* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 73)
    END PictureEditor;

    PROCEDURE (this: Options) PUTPictureEditor* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 73, p1)
    END PUTPictureEditor;

    PROCEDURE (this: Options) AnimateScreenMovements* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 74)
    END AnimateScreenMovements;

    PROCEDURE (this: Options) PUTAnimateScreenMovements* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 74, p1)
    END PUTAnimateScreenMovements;

    PROCEDURE (this: Options) VirusProtection* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 75)
    END VirusProtection;

    PROCEDURE (this: Options) PUTVirusProtection* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 75, p1)
    END PUTVirusProtection;

    PROCEDURE (this: Options) RevisedPropertiesMark* (): WdRevisedPropertiesMark, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 76)
    END RevisedPropertiesMark;

    PROCEDURE (this: Options) PUTRevisedPropertiesMark* (p1: WdRevisedPropertiesMark), NEW;
    BEGIN
        CtlC.PutInt(this, 76, p1)
    END PUTRevisedPropertiesMark;

    PROCEDURE (this: Options) RevisedPropertiesColor* (): WdColorIndex, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 77)
    END RevisedPropertiesColor;

    PROCEDURE (this: Options) PUTRevisedPropertiesColor* (p1: WdColorIndex), NEW;
    BEGIN
        CtlC.PutInt(this, 77, p1)
    END PUTRevisedPropertiesColor;

    PROCEDURE (this: Options) SnapToGrid* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 79)
    END SnapToGrid;

    PROCEDURE (this: Options) PUTSnapToGrid* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 79, p1)
    END PUTSnapToGrid;

    PROCEDURE (this: Options) SnapToShapes* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 80)
    END SnapToShapes;

    PROCEDURE (this: Options) PUTSnapToShapes* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 80, p1)
    END PUTSnapToShapes;

    PROCEDURE (this: Options) GridDistanceHorizontal* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 81)
    END GridDistanceHorizontal;

    PROCEDURE (this: Options) PUTGridDistanceHorizontal* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 81, p1)
    END PUTGridDistanceHorizontal;

    PROCEDURE (this: Options) GridDistanceVertical* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 82)
    END GridDistanceVertical;

    PROCEDURE (this: Options) PUTGridDistanceVertical* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 82, p1)
    END PUTGridDistanceVertical;

    PROCEDURE (this: Options) GridOriginHorizontal* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 83)
    END GridOriginHorizontal;

    PROCEDURE (this: Options) PUTGridOriginHorizontal* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 83, p1)
    END PUTGridOriginHorizontal;

    PROCEDURE (this: Options) GridOriginVertical* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 84)
    END GridOriginVertical;

    PROCEDURE (this: Options) PUTGridOriginVertical* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 84, p1)
    END PUTGridOriginVertical;

    PROCEDURE (this: Options) InlineConversion* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 86)
    END InlineConversion;

    PROCEDURE (this: Options) PUTInlineConversion* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 86, p1)
    END PUTInlineConversion;

    PROCEDURE (this: Options) IMEAutomaticControl* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 87)
    END IMEAutomaticControl;

    PROCEDURE (this: Options) PUTIMEAutomaticControl* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 87, p1)
    END PUTIMEAutomaticControl;

    PROCEDURE (this: Options) AutoFormatApplyHeadings* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 250)
    END AutoFormatApplyHeadings;

    PROCEDURE (this: Options) PUTAutoFormatApplyHeadings* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 250, p1)
    END PUTAutoFormatApplyHeadings;

    PROCEDURE (this: Options) AutoFormatApplyLists* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 251)
    END AutoFormatApplyLists;

    PROCEDURE (this: Options) PUTAutoFormatApplyLists* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 251, p1)
    END PUTAutoFormatApplyLists;

    PROCEDURE (this: Options) AutoFormatApplyBulletedLists* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 252)
    END AutoFormatApplyBulletedLists;

    PROCEDURE (this: Options) PUTAutoFormatApplyBulletedLists* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 252, p1)
    END PUTAutoFormatApplyBulletedLists;

    PROCEDURE (this: Options) AutoFormatApplyOtherParas* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 253)
    END AutoFormatApplyOtherParas;

    PROCEDURE (this: Options) PUTAutoFormatApplyOtherParas* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 253, p1)
    END PUTAutoFormatApplyOtherParas;

    PROCEDURE (this: Options) AutoFormatReplaceQuotes* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 254)
    END AutoFormatReplaceQuotes;

    PROCEDURE (this: Options) PUTAutoFormatReplaceQuotes* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 254, p1)
    END PUTAutoFormatReplaceQuotes;

    PROCEDURE (this: Options) AutoFormatReplaceSymbols* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 255)
    END AutoFormatReplaceSymbols;

    PROCEDURE (this: Options) PUTAutoFormatReplaceSymbols* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 255, p1)
    END PUTAutoFormatReplaceSymbols;

    PROCEDURE (this: Options) AutoFormatReplaceOrdinals* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 256)
    END AutoFormatReplaceOrdinals;

    PROCEDURE (this: Options) PUTAutoFormatReplaceOrdinals* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 256, p1)
    END PUTAutoFormatReplaceOrdinals;

    PROCEDURE (this: Options) AutoFormatReplaceFractions* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 257)
    END AutoFormatReplaceFractions;

    PROCEDURE (this: Options) PUTAutoFormatReplaceFractions* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 257, p1)
    END PUTAutoFormatReplaceFractions;

    PROCEDURE (this: Options) AutoFormatReplacePlainTextEmphasis* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 258)
    END AutoFormatReplacePlainTextEmphasis;

    PROCEDURE (this: Options) PUTAutoFormatReplacePlainTextEmphasis* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 258, p1)
    END PUTAutoFormatReplacePlainTextEmphasis;

    PROCEDURE (this: Options) AutoFormatPreserveStyles* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 259)
    END AutoFormatPreserveStyles;

    PROCEDURE (this: Options) PUTAutoFormatPreserveStyles* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 259, p1)
    END PUTAutoFormatPreserveStyles;

    PROCEDURE (this: Options) AutoFormatAsYouTypeApplyHeadings* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 260)
    END AutoFormatAsYouTypeApplyHeadings;

    PROCEDURE (this: Options) PUTAutoFormatAsYouTypeApplyHeadings* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 260, p1)
    END PUTAutoFormatAsYouTypeApplyHeadings;

    PROCEDURE (this: Options) AutoFormatAsYouTypeApplyBorders* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 261)
    END AutoFormatAsYouTypeApplyBorders;

    PROCEDURE (this: Options) PUTAutoFormatAsYouTypeApplyBorders* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 261, p1)
    END PUTAutoFormatAsYouTypeApplyBorders;

    PROCEDURE (this: Options) AutoFormatAsYouTypeApplyBulletedLists* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 262)
    END AutoFormatAsYouTypeApplyBulletedLists;

    PROCEDURE (this: Options) PUTAutoFormatAsYouTypeApplyBulletedLists* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 262, p1)
    END PUTAutoFormatAsYouTypeApplyBulletedLists;

    PROCEDURE (this: Options) AutoFormatAsYouTypeApplyNumberedLists* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 263)
    END AutoFormatAsYouTypeApplyNumberedLists;

    PROCEDURE (this: Options) PUTAutoFormatAsYouTypeApplyNumberedLists* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 263, p1)
    END PUTAutoFormatAsYouTypeApplyNumberedLists;

    PROCEDURE (this: Options) AutoFormatAsYouTypeReplaceQuotes* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 264)
    END AutoFormatAsYouTypeReplaceQuotes;

    PROCEDURE (this: Options) PUTAutoFormatAsYouTypeReplaceQuotes* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 264, p1)
    END PUTAutoFormatAsYouTypeReplaceQuotes;

    PROCEDURE (this: Options) AutoFormatAsYouTypeReplaceSymbols* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 265)
    END AutoFormatAsYouTypeReplaceSymbols;

    PROCEDURE (this: Options) PUTAutoFormatAsYouTypeReplaceSymbols* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 265, p1)
    END PUTAutoFormatAsYouTypeReplaceSymbols;

    PROCEDURE (this: Options) AutoFormatAsYouTypeReplaceOrdinals* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 266)
    END AutoFormatAsYouTypeReplaceOrdinals;

    PROCEDURE (this: Options) PUTAutoFormatAsYouTypeReplaceOrdinals* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 266, p1)
    END PUTAutoFormatAsYouTypeReplaceOrdinals;

    PROCEDURE (this: Options) AutoFormatAsYouTypeReplaceFractions* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 267)
    END AutoFormatAsYouTypeReplaceFractions;

    PROCEDURE (this: Options) PUTAutoFormatAsYouTypeReplaceFractions* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 267, p1)
    END PUTAutoFormatAsYouTypeReplaceFractions;

    PROCEDURE (this: Options) AutoFormatAsYouTypeReplacePlainTextEmphasis* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 268)
    END AutoFormatAsYouTypeReplacePlainTextEmphasis;

    PROCEDURE (this: Options) PUTAutoFormatAsYouTypeReplacePlainTextEmphasis* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 268, p1)
    END PUTAutoFormatAsYouTypeReplacePlainTextEmphasis;

    PROCEDURE (this: Options) AutoFormatAsYouTypeFormatListItemBeginning* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 269)
    END AutoFormatAsYouTypeFormatListItemBeginning;

    PROCEDURE (this: Options) PUTAutoFormatAsYouTypeFormatListItemBeginning* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 269, p1)
    END PUTAutoFormatAsYouTypeFormatListItemBeginning;

    PROCEDURE (this: Options) AutoFormatAsYouTypeDefineStyles* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 270)
    END AutoFormatAsYouTypeDefineStyles;

    PROCEDURE (this: Options) PUTAutoFormatAsYouTypeDefineStyles* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 270, p1)
    END PUTAutoFormatAsYouTypeDefineStyles;

    PROCEDURE (this: Options) AutoFormatPlainTextWordMail* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 271)
    END AutoFormatPlainTextWordMail;

    PROCEDURE (this: Options) PUTAutoFormatPlainTextWordMail* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 271, p1)
    END PUTAutoFormatPlainTextWordMail;

    PROCEDURE (this: Options) AutoFormatAsYouTypeReplaceHyperlinks* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 272)
    END AutoFormatAsYouTypeReplaceHyperlinks;

    PROCEDURE (this: Options) PUTAutoFormatAsYouTypeReplaceHyperlinks* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 272, p1)
    END PUTAutoFormatAsYouTypeReplaceHyperlinks;

    PROCEDURE (this: Options) AutoFormatReplaceHyperlinks* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 273)
    END AutoFormatReplaceHyperlinks;

    PROCEDURE (this: Options) PUTAutoFormatReplaceHyperlinks* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 273, p1)
    END PUTAutoFormatReplaceHyperlinks;

    PROCEDURE (this: Options) DefaultHighlightColorIndex* (): WdColorIndex, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 274)
    END DefaultHighlightColorIndex;

    PROCEDURE (this: Options) PUTDefaultHighlightColorIndex* (p1: WdColorIndex), NEW;
    BEGIN
        CtlC.PutInt(this, 274, p1)
    END PUTDefaultHighlightColorIndex;

    PROCEDURE (this: Options) DefaultBorderLineStyle* (): WdLineStyle, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 275)
    END DefaultBorderLineStyle;

    PROCEDURE (this: Options) PUTDefaultBorderLineStyle* (p1: WdLineStyle), NEW;
    BEGIN
        CtlC.PutInt(this, 275, p1)
    END PUTDefaultBorderLineStyle;

    PROCEDURE (this: Options) CheckSpellingAsYouType* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 276)
    END CheckSpellingAsYouType;

    PROCEDURE (this: Options) PUTCheckSpellingAsYouType* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 276, p1)
    END PUTCheckSpellingAsYouType;

    PROCEDURE (this: Options) CheckGrammarAsYouType* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 277)
    END CheckGrammarAsYouType;

    PROCEDURE (this: Options) PUTCheckGrammarAsYouType* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 277, p1)
    END PUTCheckGrammarAsYouType;

    PROCEDURE (this: Options) IgnoreInternetAndFileAddresses* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 278)
    END IgnoreInternetAndFileAddresses;

    PROCEDURE (this: Options) PUTIgnoreInternetAndFileAddresses* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 278, p1)
    END PUTIgnoreInternetAndFileAddresses;

    PROCEDURE (this: Options) ShowReadabilityStatistics* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 279)
    END ShowReadabilityStatistics;

    PROCEDURE (this: Options) PUTShowReadabilityStatistics* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 279, p1)
    END PUTShowReadabilityStatistics;

    PROCEDURE (this: Options) IgnoreUppercase* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 280)
    END IgnoreUppercase;

    PROCEDURE (this: Options) PUTIgnoreUppercase* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 280, p1)
    END PUTIgnoreUppercase;

    PROCEDURE (this: Options) IgnoreMixedDigits* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 281)
    END IgnoreMixedDigits;

    PROCEDURE (this: Options) PUTIgnoreMixedDigits* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 281, p1)
    END PUTIgnoreMixedDigits;

    PROCEDURE (this: Options) SuggestFromMainDictionaryOnly* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 282)
    END SuggestFromMainDictionaryOnly;

    PROCEDURE (this: Options) PUTSuggestFromMainDictionaryOnly* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 282, p1)
    END PUTSuggestFromMainDictionaryOnly;

    PROCEDURE (this: Options) SuggestSpellingCorrections* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 283)
    END SuggestSpellingCorrections;

    PROCEDURE (this: Options) PUTSuggestSpellingCorrections* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 283, p1)
    END PUTSuggestSpellingCorrections;

    PROCEDURE (this: Options) DefaultBorderLineWidth* (): WdLineWidth, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 284)
    END DefaultBorderLineWidth;

    PROCEDURE (this: Options) PUTDefaultBorderLineWidth* (p1: WdLineWidth), NEW;
    BEGIN
        CtlC.PutInt(this, 284, p1)
    END PUTDefaultBorderLineWidth;

    PROCEDURE (this: Options) CheckGrammarWithSpelling* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 285)
    END CheckGrammarWithSpelling;

    PROCEDURE (this: Options) PUTCheckGrammarWithSpelling* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 285, p1)
    END PUTCheckGrammarWithSpelling;

    PROCEDURE (this: Options) DefaultOpenFormat* (): WdOpenFormat, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 286)
    END DefaultOpenFormat;

    PROCEDURE (this: Options) PUTDefaultOpenFormat* (p1: WdOpenFormat), NEW;
    BEGIN
        CtlC.PutInt(this, 286, p1)
    END PUTDefaultOpenFormat;

    PROCEDURE (this: Options) PrintDraft* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 287)
    END PrintDraft;

    PROCEDURE (this: Options) PUTPrintDraft* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 287, p1)
    END PUTPrintDraft;

    PROCEDURE (this: Options) PrintReverse* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 288)
    END PrintReverse;

    PROCEDURE (this: Options) PUTPrintReverse* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 288, p1)
    END PUTPrintReverse;

    PROCEDURE (this: Options) MapPaperSize* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 289)
    END MapPaperSize;

    PROCEDURE (this: Options) PUTMapPaperSize* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 289, p1)
    END PUTMapPaperSize;

    PROCEDURE (this: Options) AutoFormatAsYouTypeApplyTables* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 290)
    END AutoFormatAsYouTypeApplyTables;

    PROCEDURE (this: Options) PUTAutoFormatAsYouTypeApplyTables* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 290, p1)
    END PUTAutoFormatAsYouTypeApplyTables;

    PROCEDURE (this: Options) AutoFormatApplyFirstIndents* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 291)
    END AutoFormatApplyFirstIndents;

    PROCEDURE (this: Options) PUTAutoFormatApplyFirstIndents* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 291, p1)
    END PUTAutoFormatApplyFirstIndents;

    PROCEDURE (this: Options) AutoFormatMatchParentheses* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 294)
    END AutoFormatMatchParentheses;

    PROCEDURE (this: Options) PUTAutoFormatMatchParentheses* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 294, p1)
    END PUTAutoFormatMatchParentheses;

    PROCEDURE (this: Options) AutoFormatReplaceFarEastDashes* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 295)
    END AutoFormatReplaceFarEastDashes;

    PROCEDURE (this: Options) PUTAutoFormatReplaceFarEastDashes* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 295, p1)
    END PUTAutoFormatReplaceFarEastDashes;

    PROCEDURE (this: Options) AutoFormatDeleteAutoSpaces* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 296)
    END AutoFormatDeleteAutoSpaces;

    PROCEDURE (this: Options) PUTAutoFormatDeleteAutoSpaces* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 296, p1)
    END PUTAutoFormatDeleteAutoSpaces;

    PROCEDURE (this: Options) AutoFormatAsYouTypeApplyFirstIndents* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 297)
    END AutoFormatAsYouTypeApplyFirstIndents;

    PROCEDURE (this: Options) PUTAutoFormatAsYouTypeApplyFirstIndents* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 297, p1)
    END PUTAutoFormatAsYouTypeApplyFirstIndents;

    PROCEDURE (this: Options) AutoFormatAsYouTypeApplyDates* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 298)
    END AutoFormatAsYouTypeApplyDates;

    PROCEDURE (this: Options) PUTAutoFormatAsYouTypeApplyDates* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 298, p1)
    END PUTAutoFormatAsYouTypeApplyDates;

    PROCEDURE (this: Options) AutoFormatAsYouTypeApplyClosings* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 299)
    END AutoFormatAsYouTypeApplyClosings;

    PROCEDURE (this: Options) PUTAutoFormatAsYouTypeApplyClosings* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 299, p1)
    END PUTAutoFormatAsYouTypeApplyClosings;

    PROCEDURE (this: Options) AutoFormatAsYouTypeMatchParentheses* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 300)
    END AutoFormatAsYouTypeMatchParentheses;

    PROCEDURE (this: Options) PUTAutoFormatAsYouTypeMatchParentheses* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 300, p1)
    END PUTAutoFormatAsYouTypeMatchParentheses;

    PROCEDURE (this: Options) AutoFormatAsYouTypeReplaceFarEastDashes* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 301)
    END AutoFormatAsYouTypeReplaceFarEastDashes;

    PROCEDURE (this: Options) PUTAutoFormatAsYouTypeReplaceFarEastDashes* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 301, p1)
    END PUTAutoFormatAsYouTypeReplaceFarEastDashes;

    PROCEDURE (this: Options) AutoFormatAsYouTypeDeleteAutoSpaces* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 302)
    END AutoFormatAsYouTypeDeleteAutoSpaces;

    PROCEDURE (this: Options) PUTAutoFormatAsYouTypeDeleteAutoSpaces* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 302, p1)
    END PUTAutoFormatAsYouTypeDeleteAutoSpaces;

    PROCEDURE (this: Options) AutoFormatAsYouTypeInsertClosings* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 303)
    END AutoFormatAsYouTypeInsertClosings;

    PROCEDURE (this: Options) PUTAutoFormatAsYouTypeInsertClosings* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 303, p1)
    END PUTAutoFormatAsYouTypeInsertClosings;

    PROCEDURE (this: Options) AutoFormatAsYouTypeAutoLetterWizard* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 304)
    END AutoFormatAsYouTypeAutoLetterWizard;

    PROCEDURE (this: Options) PUTAutoFormatAsYouTypeAutoLetterWizard* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 304, p1)
    END PUTAutoFormatAsYouTypeAutoLetterWizard;

    PROCEDURE (this: Options) AutoFormatAsYouTypeInsertOvers* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 305)
    END AutoFormatAsYouTypeInsertOvers;

    PROCEDURE (this: Options) PUTAutoFormatAsYouTypeInsertOvers* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 305, p1)
    END PUTAutoFormatAsYouTypeInsertOvers;

    PROCEDURE (this: Options) DisplayGridLines* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 306)
    END DisplayGridLines;

    PROCEDURE (this: Options) PUTDisplayGridLines* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 306, p1)
    END PUTDisplayGridLines;

    PROCEDURE (this: Options) MatchFuzzyCase* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 309)
    END MatchFuzzyCase;

    PROCEDURE (this: Options) PUTMatchFuzzyCase* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 309, p1)
    END PUTMatchFuzzyCase;

    PROCEDURE (this: Options) MatchFuzzyByte* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 310)
    END MatchFuzzyByte;

    PROCEDURE (this: Options) PUTMatchFuzzyByte* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 310, p1)
    END PUTMatchFuzzyByte;

    PROCEDURE (this: Options) MatchFuzzyHiragana* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 311)
    END MatchFuzzyHiragana;

    PROCEDURE (this: Options) PUTMatchFuzzyHiragana* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 311, p1)
    END PUTMatchFuzzyHiragana;

    PROCEDURE (this: Options) MatchFuzzySmallKana* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 312)
    END MatchFuzzySmallKana;

    PROCEDURE (this: Options) PUTMatchFuzzySmallKana* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 312, p1)
    END PUTMatchFuzzySmallKana;

    PROCEDURE (this: Options) MatchFuzzyDash* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 313)
    END MatchFuzzyDash;

    PROCEDURE (this: Options) PUTMatchFuzzyDash* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 313, p1)
    END PUTMatchFuzzyDash;

    PROCEDURE (this: Options) MatchFuzzyIterationMark* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 314)
    END MatchFuzzyIterationMark;

    PROCEDURE (this: Options) PUTMatchFuzzyIterationMark* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 314, p1)
    END PUTMatchFuzzyIterationMark;

    PROCEDURE (this: Options) MatchFuzzyKanji* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 315)
    END MatchFuzzyKanji;

    PROCEDURE (this: Options) PUTMatchFuzzyKanji* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 315, p1)
    END PUTMatchFuzzyKanji;

    PROCEDURE (this: Options) MatchFuzzyOldKana* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 316)
    END MatchFuzzyOldKana;

    PROCEDURE (this: Options) PUTMatchFuzzyOldKana* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 316, p1)
    END PUTMatchFuzzyOldKana;

    PROCEDURE (this: Options) MatchFuzzyProlongedSoundMark* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 317)
    END MatchFuzzyProlongedSoundMark;

    PROCEDURE (this: Options) PUTMatchFuzzyProlongedSoundMark* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 317, p1)
    END PUTMatchFuzzyProlongedSoundMark;

    PROCEDURE (this: Options) MatchFuzzyDZ* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 318)
    END MatchFuzzyDZ;

    PROCEDURE (this: Options) PUTMatchFuzzyDZ* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 318, p1)
    END PUTMatchFuzzyDZ;

    PROCEDURE (this: Options) MatchFuzzyBV* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 319)
    END MatchFuzzyBV;

    PROCEDURE (this: Options) PUTMatchFuzzyBV* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 319, p1)
    END PUTMatchFuzzyBV;

    PROCEDURE (this: Options) MatchFuzzyTC* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 320)
    END MatchFuzzyTC;

    PROCEDURE (this: Options) PUTMatchFuzzyTC* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 320, p1)
    END PUTMatchFuzzyTC;

    PROCEDURE (this: Options) MatchFuzzyHF* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 321)
    END MatchFuzzyHF;

    PROCEDURE (this: Options) PUTMatchFuzzyHF* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 321, p1)
    END PUTMatchFuzzyHF;

    PROCEDURE (this: Options) MatchFuzzyZJ* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 322)
    END MatchFuzzyZJ;

    PROCEDURE (this: Options) PUTMatchFuzzyZJ* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 322, p1)
    END PUTMatchFuzzyZJ;

    PROCEDURE (this: Options) MatchFuzzyAY* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 323)
    END MatchFuzzyAY;

    PROCEDURE (this: Options) PUTMatchFuzzyAY* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 323, p1)
    END PUTMatchFuzzyAY;

    PROCEDURE (this: Options) MatchFuzzyKiKu* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 324)
    END MatchFuzzyKiKu;

    PROCEDURE (this: Options) PUTMatchFuzzyKiKu* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 324, p1)
    END PUTMatchFuzzyKiKu;

    PROCEDURE (this: Options) MatchFuzzyPunctuation* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 325)
    END MatchFuzzyPunctuation;

    PROCEDURE (this: Options) PUTMatchFuzzyPunctuation* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 325, p1)
    END PUTMatchFuzzyPunctuation;

    PROCEDURE (this: Options) MatchFuzzySpace* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 326)
    END MatchFuzzySpace;

    PROCEDURE (this: Options) PUTMatchFuzzySpace* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 326, p1)
    END PUTMatchFuzzySpace;

    PROCEDURE (this: Options) ApplyFarEastFontsToAscii* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 327)
    END ApplyFarEastFontsToAscii;

    PROCEDURE (this: Options) PUTApplyFarEastFontsToAscii* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 327, p1)
    END PUTApplyFarEastFontsToAscii;

    PROCEDURE (this: Options) ConvertHighAnsiToFarEast* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 328)
    END ConvertHighAnsiToFarEast;

    PROCEDURE (this: Options) PUTConvertHighAnsiToFarEast* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 328, p1)
    END PUTConvertHighAnsiToFarEast;

    PROCEDURE (this: Options) PrintOddPagesInAscendingOrder* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 330)
    END PrintOddPagesInAscendingOrder;

    PROCEDURE (this: Options) PUTPrintOddPagesInAscendingOrder* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 330, p1)
    END PUTPrintOddPagesInAscendingOrder;

    PROCEDURE (this: Options) PrintEvenPagesInAscendingOrder* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 331)
    END PrintEvenPagesInAscendingOrder;

    PROCEDURE (this: Options) PUTPrintEvenPagesInAscendingOrder* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 331, p1)
    END PUTPrintEvenPagesInAscendingOrder;

    PROCEDURE (this: Options) DefaultBorderColorIndex* (): WdColorIndex, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 337)
    END DefaultBorderColorIndex;

    PROCEDURE (this: Options) PUTDefaultBorderColorIndex* (p1: WdColorIndex), NEW;
    BEGIN
        CtlC.PutInt(this, 337, p1)
    END PUTDefaultBorderColorIndex;

    PROCEDURE (this: Options) EnableMisusedWordsDictionary* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 338)
    END EnableMisusedWordsDictionary;

    PROCEDURE (this: Options) PUTEnableMisusedWordsDictionary* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 338, p1)
    END PUTEnableMisusedWordsDictionary;

    PROCEDURE (this: Options) AllowCombinedAuxiliaryForms* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 339)
    END AllowCombinedAuxiliaryForms;

    PROCEDURE (this: Options) PUTAllowCombinedAuxiliaryForms* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 339, p1)
    END PUTAllowCombinedAuxiliaryForms;

    PROCEDURE (this: Options) HangulHanjaFastConversion* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 340)
    END HangulHanjaFastConversion;

    PROCEDURE (this: Options) PUTHangulHanjaFastConversion* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 340, p1)
    END PUTHangulHanjaFastConversion;

    PROCEDURE (this: Options) CheckHangulEndings* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 341)
    END CheckHangulEndings;

    PROCEDURE (this: Options) PUTCheckHangulEndings* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 341, p1)
    END PUTCheckHangulEndings;

    PROCEDURE (this: Options) EnableHangulHanjaRecentOrdering* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 342)
    END EnableHangulHanjaRecentOrdering;

    PROCEDURE (this: Options) PUTEnableHangulHanjaRecentOrdering* (p1: BOOLEAN), NEW;
    BEGIN
        CtlC.PutBool(this, 342, p1)
    END PUTEnableHangulHanjaRecentOrdering;

    PROCEDURE (this: Options) MultipleWordConversionsMode* (): WdMultipleWordConversionsMode, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 343)
    END MultipleWordConversionsMode;

    PROCEDURE (this: Options) PUTMultipleWordConversionsMode* (p1: WdMultipleWordConversionsMode), NEW;
    BEGIN
        CtlC.PutInt(this, 343, p1)
    END PUTMultipleWordConversionsMode;

    PROCEDURE (this: Options) SetWPHelpOptions* ((* optional *) CommandKeyHelp: CtlT.Any; DocNavigationKeys: CtlT.Any; MouseSimulation: CtlT.Any; DemoGuidance: CtlT.Any; DemoSpeed: CtlT.Any; HelpType: CtlT.Any), NEW;
        VAR arg: ARRAY 6 OF CtlT.Variant;
    BEGIN
        CtlC.AnyVar(CommandKeyHelp, arg[5]);
        CtlC.AnyVar(DocNavigationKeys, arg[4]);
        CtlC.AnyVar(MouseSimulation, arg[3]);
        CtlC.AnyVar(DemoGuidance, arg[2]);
        CtlC.AnyVar(DemoSpeed, arg[1]);
        CtlC.AnyVar(HelpType, arg[0]);
        CtlC.CallParMethod(this, 333, arg, NIL);
    END SetWPHelpOptions;


    (* ---------- MailMessage, dual, nonextensible ---------- *)

    PROCEDURE (this: MailMessage) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: MailMessage) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: MailMessage) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: MailMessage) CheckName* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 334, NIL);
    END CheckName;

    PROCEDURE (this: MailMessage) Delete* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 335, NIL);
    END Delete;

    PROCEDURE (this: MailMessage) DisplayMoveDialog* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 336, NIL);
    END DisplayMoveDialog;

    PROCEDURE (this: MailMessage) DisplayProperties* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 337, NIL);
    END DisplayProperties;

    PROCEDURE (this: MailMessage) DisplaySelectNamesDialog* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 338, NIL);
    END DisplaySelectNamesDialog;

    PROCEDURE (this: MailMessage) Forward* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 339, NIL);
    END Forward;

    PROCEDURE (this: MailMessage) GoToNext* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 340, NIL);
    END GoToNext;

    PROCEDURE (this: MailMessage) GoToPrevious* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 341, NIL);
    END GoToPrevious;

    PROCEDURE (this: MailMessage) Reply* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 342, NIL);
    END Reply;

    PROCEDURE (this: MailMessage) ReplyAll* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 343, NIL);
    END ReplyAll;

    PROCEDURE (this: MailMessage) ToggleHeader* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 344, NIL);
    END ToggleHeader;


    (* ---------- ProofreadingErrors, dual, nonextensible ---------- *)

    PROCEDURE (this: ProofreadingErrors) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: ProofreadingErrors) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: ProofreadingErrors) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: ProofreadingErrors) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: ProofreadingErrors) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Count;

    PROCEDURE (this: ProofreadingErrors) Type* (): WdProofreadingErrorType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Type;

    PROCEDURE (this: ProofreadingErrors) Item* (Index: INTEGER): Range, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisRange(CtlC.VarAny(ret))
    END Item;


    (* ---------- Mailer, dual, nonextensible ---------- *)

    PROCEDURE (this: Mailer) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Mailer) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Mailer) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: Mailer) BCCRecipients* (): CtlT.Any, NEW;
    BEGIN
        RETURN CtlC.GetAny(this, 100)
    END BCCRecipients;

    PROCEDURE (this: Mailer) PUTBCCRecipients* (p1: CtlT.Any), NEW;
    BEGIN
        CtlC.PutAny(this, 100, p1)
    END PUTBCCRecipients;

    PROCEDURE (this: Mailer) CCRecipients* (): CtlT.Any, NEW;
    BEGIN
        RETURN CtlC.GetAny(this, 101)
    END CCRecipients;

    PROCEDURE (this: Mailer) PUTCCRecipients* (p1: CtlT.Any), NEW;
    BEGIN
        CtlC.PutAny(this, 101, p1)
    END PUTCCRecipients;

    PROCEDURE (this: Mailer) Recipients* (): CtlT.Any, NEW;
    BEGIN
        RETURN CtlC.GetAny(this, 102)
    END Recipients;

    PROCEDURE (this: Mailer) PUTRecipients* (p1: CtlT.Any), NEW;
    BEGIN
        CtlC.PutAny(this, 102, p1)
    END PUTRecipients;

    PROCEDURE (this: Mailer) Enclosures* (): CtlT.Any, NEW;
    BEGIN
        RETURN CtlC.GetAny(this, 103)
    END Enclosures;

    PROCEDURE (this: Mailer) PUTEnclosures* (p1: CtlT.Any), NEW;
    BEGIN
        CtlC.PutAny(this, 103, p1)
    END PUTEnclosures;

    PROCEDURE (this: Mailer) Sender* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 104)
    END Sender;

    PROCEDURE (this: Mailer) SendDateTime* (): CtlT.OleDate, NEW;
    BEGIN
        RETURN CtlC.GetDate(this, 105)
    END SendDateTime;

    PROCEDURE (this: Mailer) Received* (): BOOLEAN, NEW;
    BEGIN
        RETURN CtlC.GetBool(this, 106)
    END Received;

    PROCEDURE (this: Mailer) Subject* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 107)
    END Subject;

    PROCEDURE (this: Mailer) PUTSubject* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 107, p1)
    END PUTSubject;


    (* ---------- WrapFormat, dual, nonextensible ---------- *)

    PROCEDURE (this: WrapFormat) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: WrapFormat) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: WrapFormat) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: WrapFormat) Type* (): WdWrapType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 100)
    END Type;

    PROCEDURE (this: WrapFormat) PUTType* (p1: WdWrapType), NEW;
    BEGIN
        CtlC.PutInt(this, 100, p1)
    END PUTType;

    PROCEDURE (this: WrapFormat) Side* (): WdWrapSideType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 101)
    END Side;

    PROCEDURE (this: WrapFormat) PUTSide* (p1: WdWrapSideType), NEW;
    BEGIN
        CtlC.PutInt(this, 101, p1)
    END PUTSide;

    PROCEDURE (this: WrapFormat) DistanceTop* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 102)
    END DistanceTop;

    PROCEDURE (this: WrapFormat) PUTDistanceTop* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 102, p1)
    END PUTDistanceTop;

    PROCEDURE (this: WrapFormat) DistanceBottom* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 103)
    END DistanceBottom;

    PROCEDURE (this: WrapFormat) PUTDistanceBottom* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 103, p1)
    END PUTDistanceBottom;

    PROCEDURE (this: WrapFormat) DistanceLeft* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 104)
    END DistanceLeft;

    PROCEDURE (this: WrapFormat) PUTDistanceLeft* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 104, p1)
    END PUTDistanceLeft;

    PROCEDURE (this: WrapFormat) DistanceRight* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 105)
    END DistanceRight;

    PROCEDURE (this: WrapFormat) PUTDistanceRight* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 105, p1)
    END PUTDistanceRight;


    (* ---------- HangulAndAlphabetExceptions, hidden, dual, nonextensible ---------- *)

    PROCEDURE (this: HangulAndAlphabetExceptions) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: HangulAndAlphabetExceptions) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: HangulAndAlphabetExceptions) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: HangulAndAlphabetExceptions) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: HangulAndAlphabetExceptions) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Count;

    PROCEDURE (this: HangulAndAlphabetExceptions) Item* (Index: CtlT.Any): HangulAndAlphabetException, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisHangulAndAlphabetException(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: HangulAndAlphabetExceptions) Add* (Name: ARRAY OF CHAR): HangulAndAlphabetException, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.StrVar(Name, arg[0]);
        CtlC.CallParMethod(this, 101, arg, ret);
        RETURN ThisHangulAndAlphabetException(CtlC.VarAny(ret))
    END Add;


    (* ---------- HangulAndAlphabetException, hidden, dual, nonextensible ---------- *)

    PROCEDURE (this: HangulAndAlphabetException) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: HangulAndAlphabetException) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: HangulAndAlphabetException) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1002)
    END Parent;

    PROCEDURE (this: HangulAndAlphabetException) Index* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1)
    END Index;

    PROCEDURE (this: HangulAndAlphabetException) Name* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 2)
    END Name;

    PROCEDURE (this: HangulAndAlphabetException) Delete* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 101, NIL);
    END Delete;


    (* ---------- Adjustments, dual, nonextensible ---------- *)

    PROCEDURE (this: Adjustments) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: Adjustments) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: Adjustments) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1)
    END Parent;

    PROCEDURE (this: Adjustments) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Count;

    PROCEDURE (this: Adjustments) Item* (Index: INTEGER): SHORTREAL, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallGetMethod(this, 0, arg, ret);
        RETURN CtlC.VarSReal(ret)
    END Item;

    PROCEDURE (this: Adjustments) PUTItem* (Index: INTEGER; p2: SHORTREAL), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[1]);
        CtlC.SRealVar(p2, arg[0]);
        CtlC.CallPutMethod(this, 0, arg, NIL);
    END PUTItem;


    (* ---------- CalloutFormat, dual, nonextensible ---------- *)

    PROCEDURE (this: CalloutFormat) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: CalloutFormat) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: CalloutFormat) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1)
    END Parent;

    PROCEDURE (this: CalloutFormat) Accent* (): CtlOffice.MsoTriState, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 100)
    END Accent;

    PROCEDURE (this: CalloutFormat) PUTAccent* (p1: CtlOffice.MsoTriState), NEW;
    BEGIN
        CtlC.PutInt(this, 100, p1)
    END PUTAccent;

    PROCEDURE (this: CalloutFormat) Angle* (): CtlOffice.MsoCalloutAngleType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 101)
    END Angle;

    PROCEDURE (this: CalloutFormat) PUTAngle* (p1: CtlOffice.MsoCalloutAngleType), NEW;
    BEGIN
        CtlC.PutInt(this, 101, p1)
    END PUTAngle;

    PROCEDURE (this: CalloutFormat) AutoAttach* (): CtlOffice.MsoTriState, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 102)
    END AutoAttach;

    PROCEDURE (this: CalloutFormat) PUTAutoAttach* (p1: CtlOffice.MsoTriState), NEW;
    BEGIN
        CtlC.PutInt(this, 102, p1)
    END PUTAutoAttach;

    PROCEDURE (this: CalloutFormat) AutoLength* (): CtlOffice.MsoTriState, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 103)
    END AutoLength;

    PROCEDURE (this: CalloutFormat) Border* (): CtlOffice.MsoTriState, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 104)
    END Border;

    PROCEDURE (this: CalloutFormat) PUTBorder* (p1: CtlOffice.MsoTriState), NEW;
    BEGIN
        CtlC.PutInt(this, 104, p1)
    END PUTBorder;

    PROCEDURE (this: CalloutFormat) Drop* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 105)
    END Drop;

    PROCEDURE (this: CalloutFormat) DropType* (): CtlOffice.MsoCalloutDropType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 106)
    END DropType;

    PROCEDURE (this: CalloutFormat) Gap* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 107)
    END Gap;

    PROCEDURE (this: CalloutFormat) PUTGap* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 107, p1)
    END PUTGap;

    PROCEDURE (this: CalloutFormat) Length* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 108)
    END Length;

    PROCEDURE (this: CalloutFormat) Type* (): CtlOffice.MsoCalloutType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 109)
    END Type;

    PROCEDURE (this: CalloutFormat) PUTType* (p1: CtlOffice.MsoCalloutType), NEW;
    BEGIN
        CtlC.PutInt(this, 109, p1)
    END PUTType;

    PROCEDURE (this: CalloutFormat) AutomaticLength* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 10, NIL);
    END AutomaticLength;

    PROCEDURE (this: CalloutFormat) CustomDrop* (Drop: SHORTREAL), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.SRealVar(Drop, arg[0]);
        CtlC.CallParMethod(this, 11, arg, NIL);
    END CustomDrop;

    PROCEDURE (this: CalloutFormat) CustomLength* (Length: SHORTREAL), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.SRealVar(Length, arg[0]);
        CtlC.CallParMethod(this, 12, arg, NIL);
    END CustomLength;

    PROCEDURE (this: CalloutFormat) PresetDrop* (DropType: CtlOffice.MsoCalloutDropType), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(DropType, arg[0]);
        CtlC.CallParMethod(this, 13, arg, NIL);
    END PresetDrop;


    (* ---------- ColorFormat, dual, nonextensible ---------- *)

    PROCEDURE (this: ColorFormat) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: ColorFormat) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: ColorFormat) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1)
    END Parent;

    PROCEDURE (this: ColorFormat) RGB* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 0)
    END RGB;

    PROCEDURE (this: ColorFormat) PUTRGB* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 0, p1)
    END PUTRGB;

    PROCEDURE (this: ColorFormat) SchemeColor* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 100)
    END SchemeColor;

    PROCEDURE (this: ColorFormat) PUTSchemeColor* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 100, p1)
    END PUTSchemeColor;

    PROCEDURE (this: ColorFormat) Type* (): CtlOffice.MsoColorType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 101)
    END Type;


    (* ---------- ConnectorFormat, hidden, dual, nonextensible ---------- *)

    PROCEDURE (this: ConnectorFormat) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: ConnectorFormat) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: ConnectorFormat) BeginConnected* (): CtlOffice.MsoTriState, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 100)
    END BeginConnected;

    PROCEDURE (this: ConnectorFormat) BeginConnectedShape* (): Shape, NEW;
    BEGIN
        RETURN ThisShape(CtlC.GetAny(this, 101))
    END BeginConnectedShape;

    PROCEDURE (this: ConnectorFormat) BeginConnectionSite* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 102)
    END BeginConnectionSite;

    PROCEDURE (this: ConnectorFormat) EndConnected* (): CtlOffice.MsoTriState, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 103)
    END EndConnected;

    PROCEDURE (this: ConnectorFormat) EndConnectedShape* (): Shape, NEW;
    BEGIN
        RETURN ThisShape(CtlC.GetAny(this, 104))
    END EndConnectedShape;

    PROCEDURE (this: ConnectorFormat) EndConnectionSite* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 105)
    END EndConnectionSite;

    PROCEDURE (this: ConnectorFormat) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1)
    END Parent;

    PROCEDURE (this: ConnectorFormat) Type* (): CtlOffice.MsoConnectorType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 106)
    END Type;

    PROCEDURE (this: ConnectorFormat) PUTType* (p1: CtlOffice.MsoConnectorType), NEW;
    BEGIN
        CtlC.PutInt(this, 106, p1)
    END PUTType;

    PROCEDURE (this: ConnectorFormat) BeginConnect* (ConnectedShape: Shape; ConnectionSite: INTEGER), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.ObjVar(ConnectedShape, arg[1]);
        CtlC.IntVar(ConnectionSite, arg[0]);
        CtlC.CallParMethod(this, 10, arg, NIL);
    END BeginConnect;

    PROCEDURE (this: ConnectorFormat) BeginDisconnect* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 11, NIL);
    END BeginDisconnect;

    PROCEDURE (this: ConnectorFormat) EndConnect* (ConnectedShape: Shape; ConnectionSite: INTEGER), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.ObjVar(ConnectedShape, arg[1]);
        CtlC.IntVar(ConnectionSite, arg[0]);
        CtlC.CallParMethod(this, 12, arg, NIL);
    END EndConnect;

    PROCEDURE (this: ConnectorFormat) EndDisconnect* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 13, NIL);
    END EndDisconnect;


    (* ---------- FillFormat, dual, nonextensible ---------- *)

    PROCEDURE (this: FillFormat) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: FillFormat) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: FillFormat) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1)
    END Parent;

    PROCEDURE (this: FillFormat) BackColor* (): ColorFormat, NEW;
    BEGIN
        RETURN ThisColorFormat(CtlC.GetAny(this, 100))
    END BackColor;

    PROCEDURE (this: FillFormat) ForeColor* (): ColorFormat, NEW;
    BEGIN
        RETURN ThisColorFormat(CtlC.GetAny(this, 101))
    END ForeColor;

    PROCEDURE (this: FillFormat) GradientColorType* (): CtlOffice.MsoGradientColorType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 102)
    END GradientColorType;

    PROCEDURE (this: FillFormat) GradientDegree* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 103)
    END GradientDegree;

    PROCEDURE (this: FillFormat) GradientStyle* (): CtlOffice.MsoGradientStyle, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 104)
    END GradientStyle;

    PROCEDURE (this: FillFormat) GradientVariant* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 105)
    END GradientVariant;

    PROCEDURE (this: FillFormat) Pattern* (): CtlOffice.MsoPatternType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 106)
    END Pattern;

    PROCEDURE (this: FillFormat) PresetGradientType* (): CtlOffice.MsoPresetGradientType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 107)
    END PresetGradientType;

    PROCEDURE (this: FillFormat) PresetTexture* (): CtlOffice.MsoPresetTexture, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 108)
    END PresetTexture;

    PROCEDURE (this: FillFormat) TextureName* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 109)
    END TextureName;

    PROCEDURE (this: FillFormat) TextureType* (): CtlOffice.MsoTextureType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 110)
    END TextureType;

    PROCEDURE (this: FillFormat) Transparency* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 111)
    END Transparency;

    PROCEDURE (this: FillFormat) PUTTransparency* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 111, p1)
    END PUTTransparency;

    PROCEDURE (this: FillFormat) Type* (): CtlOffice.MsoFillType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 112)
    END Type;

    PROCEDURE (this: FillFormat) Visible* (): CtlOffice.MsoTriState, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 113)
    END Visible;

    PROCEDURE (this: FillFormat) PUTVisible* (p1: CtlOffice.MsoTriState), NEW;
    BEGIN
        CtlC.PutInt(this, 113, p1)
    END PUTVisible;

    PROCEDURE (this: FillFormat) Background* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 10, NIL);
    END Background;

    PROCEDURE (this: FillFormat) OneColorGradient* (Style: CtlOffice.MsoGradientStyle; Variant: INTEGER; Degree: SHORTREAL), NEW;
        VAR arg: ARRAY 3 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(Style, arg[2]);
        CtlC.IntVar(Variant, arg[1]);
        CtlC.SRealVar(Degree, arg[0]);
        CtlC.CallParMethod(this, 11, arg, NIL);
    END OneColorGradient;

    PROCEDURE (this: FillFormat) Patterned* (Pattern: CtlOffice.MsoPatternType), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(Pattern, arg[0]);
        CtlC.CallParMethod(this, 12, arg, NIL);
    END Patterned;

    PROCEDURE (this: FillFormat) PresetGradient* (Style: CtlOffice.MsoGradientStyle; Variant: INTEGER; PresetGradientType: CtlOffice.MsoPresetGradientType), NEW;
        VAR arg: ARRAY 3 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(Style, arg[2]);
        CtlC.IntVar(Variant, arg[1]);
        CtlC.IntVar(PresetGradientType, arg[0]);
        CtlC.CallParMethod(this, 13, arg, NIL);
    END PresetGradient;

    PROCEDURE (this: FillFormat) PresetTextured* (PresetTexture: CtlOffice.MsoPresetTexture), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(PresetTexture, arg[0]);
        CtlC.CallParMethod(this, 14, arg, NIL);
    END PresetTextured;

    PROCEDURE (this: FillFormat) Solid* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 15, NIL);
    END Solid;

    PROCEDURE (this: FillFormat) TwoColorGradient* (Style: CtlOffice.MsoGradientStyle; Variant: INTEGER), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(Style, arg[1]);
        CtlC.IntVar(Variant, arg[0]);
        CtlC.CallParMethod(this, 16, arg, NIL);
    END TwoColorGradient;

    PROCEDURE (this: FillFormat) UserPicture* (PictureFile: ARRAY OF CHAR), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.StrVar(PictureFile, arg[0]);
        CtlC.CallParMethod(this, 17, arg, NIL);
    END UserPicture;

    PROCEDURE (this: FillFormat) UserTextured* (TextureFile: ARRAY OF CHAR), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.StrVar(TextureFile, arg[0]);
        CtlC.CallParMethod(this, 18, arg, NIL);
    END UserTextured;


    (* ---------- FreeformBuilder, dual, nonextensible ---------- *)

    PROCEDURE (this: FreeformBuilder) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: FreeformBuilder) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: FreeformBuilder) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1)
    END Parent;

    PROCEDURE (this: FreeformBuilder) AddNodes* (SegmentType: CtlOffice.MsoSegmentType; EditingType: CtlOffice.MsoEditingType; X1: SHORTREAL; Y1: SHORTREAL; X2: SHORTREAL; Y2: SHORTREAL; X3: SHORTREAL; Y3: SHORTREAL), NEW;
        VAR arg: ARRAY 8 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(SegmentType, arg[7]);
        CtlC.IntVar(EditingType, arg[6]);
        CtlC.SRealVar(X1, arg[5]);
        CtlC.SRealVar(Y1, arg[4]);
        CtlC.SRealVar(X2, arg[3]);
        CtlC.SRealVar(Y2, arg[2]);
        CtlC.SRealVar(X3, arg[1]);
        CtlC.SRealVar(Y3, arg[0]);
        CtlC.CallParMethod(this, 10, arg, NIL);
    END AddNodes;

    PROCEDURE (this: FreeformBuilder) ConvertToShape* ((* optional *) Anchor: CtlT.Any): Shape, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Anchor, arg[0]);
        CtlC.CallParMethod(this, 11, arg, ret);
        RETURN ThisShape(CtlC.VarAny(ret))
    END ConvertToShape;


    (* ---------- LineFormat, dual, nonextensible ---------- *)

    PROCEDURE (this: LineFormat) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: LineFormat) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: LineFormat) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1)
    END Parent;

    PROCEDURE (this: LineFormat) BackColor* (): ColorFormat, NEW;
    BEGIN
        RETURN ThisColorFormat(CtlC.GetAny(this, 100))
    END BackColor;

    PROCEDURE (this: LineFormat) BeginArrowheadLength* (): CtlOffice.MsoArrowheadLength, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 101)
    END BeginArrowheadLength;

    PROCEDURE (this: LineFormat) PUTBeginArrowheadLength* (p1: CtlOffice.MsoArrowheadLength), NEW;
    BEGIN
        CtlC.PutInt(this, 101, p1)
    END PUTBeginArrowheadLength;

    PROCEDURE (this: LineFormat) BeginArrowheadStyle* (): CtlOffice.MsoArrowheadStyle, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 102)
    END BeginArrowheadStyle;

    PROCEDURE (this: LineFormat) PUTBeginArrowheadStyle* (p1: CtlOffice.MsoArrowheadStyle), NEW;
    BEGIN
        CtlC.PutInt(this, 102, p1)
    END PUTBeginArrowheadStyle;

    PROCEDURE (this: LineFormat) BeginArrowheadWidth* (): CtlOffice.MsoArrowheadWidth, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 103)
    END BeginArrowheadWidth;

    PROCEDURE (this: LineFormat) PUTBeginArrowheadWidth* (p1: CtlOffice.MsoArrowheadWidth), NEW;
    BEGIN
        CtlC.PutInt(this, 103, p1)
    END PUTBeginArrowheadWidth;

    PROCEDURE (this: LineFormat) DashStyle* (): CtlOffice.MsoLineDashStyle, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 104)
    END DashStyle;

    PROCEDURE (this: LineFormat) PUTDashStyle* (p1: CtlOffice.MsoLineDashStyle), NEW;
    BEGIN
        CtlC.PutInt(this, 104, p1)
    END PUTDashStyle;

    PROCEDURE (this: LineFormat) EndArrowheadLength* (): CtlOffice.MsoArrowheadLength, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 105)
    END EndArrowheadLength;

    PROCEDURE (this: LineFormat) PUTEndArrowheadLength* (p1: CtlOffice.MsoArrowheadLength), NEW;
    BEGIN
        CtlC.PutInt(this, 105, p1)
    END PUTEndArrowheadLength;

    PROCEDURE (this: LineFormat) EndArrowheadStyle* (): CtlOffice.MsoArrowheadStyle, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 106)
    END EndArrowheadStyle;

    PROCEDURE (this: LineFormat) PUTEndArrowheadStyle* (p1: CtlOffice.MsoArrowheadStyle), NEW;
    BEGIN
        CtlC.PutInt(this, 106, p1)
    END PUTEndArrowheadStyle;

    PROCEDURE (this: LineFormat) EndArrowheadWidth* (): CtlOffice.MsoArrowheadWidth, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 107)
    END EndArrowheadWidth;

    PROCEDURE (this: LineFormat) PUTEndArrowheadWidth* (p1: CtlOffice.MsoArrowheadWidth), NEW;
    BEGIN
        CtlC.PutInt(this, 107, p1)
    END PUTEndArrowheadWidth;

    PROCEDURE (this: LineFormat) ForeColor* (): ColorFormat, NEW;
    BEGIN
        RETURN ThisColorFormat(CtlC.GetAny(this, 108))
    END ForeColor;

    PROCEDURE (this: LineFormat) Pattern* (): CtlOffice.MsoPatternType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 109)
    END Pattern;

    PROCEDURE (this: LineFormat) PUTPattern* (p1: CtlOffice.MsoPatternType), NEW;
    BEGIN
        CtlC.PutInt(this, 109, p1)
    END PUTPattern;

    PROCEDURE (this: LineFormat) Style* (): CtlOffice.MsoLineStyle, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 110)
    END Style;

    PROCEDURE (this: LineFormat) PUTStyle* (p1: CtlOffice.MsoLineStyle), NEW;
    BEGIN
        CtlC.PutInt(this, 110, p1)
    END PUTStyle;

    PROCEDURE (this: LineFormat) Transparency* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 111)
    END Transparency;

    PROCEDURE (this: LineFormat) PUTTransparency* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 111, p1)
    END PUTTransparency;

    PROCEDURE (this: LineFormat) Visible* (): CtlOffice.MsoTriState, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 112)
    END Visible;

    PROCEDURE (this: LineFormat) PUTVisible* (p1: CtlOffice.MsoTriState), NEW;
    BEGIN
        CtlC.PutInt(this, 112, p1)
    END PUTVisible;

    PROCEDURE (this: LineFormat) Weight* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 113)
    END Weight;

    PROCEDURE (this: LineFormat) PUTWeight* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 113, p1)
    END PUTWeight;


    (* ---------- PictureFormat, dual, nonextensible ---------- *)

    PROCEDURE (this: PictureFormat) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: PictureFormat) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: PictureFormat) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1)
    END Parent;

    PROCEDURE (this: PictureFormat) Brightness* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 100)
    END Brightness;

    PROCEDURE (this: PictureFormat) PUTBrightness* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 100, p1)
    END PUTBrightness;

    PROCEDURE (this: PictureFormat) ColorType* (): CtlOffice.MsoPictureColorType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 101)
    END ColorType;

    PROCEDURE (this: PictureFormat) PUTColorType* (p1: CtlOffice.MsoPictureColorType), NEW;
    BEGIN
        CtlC.PutInt(this, 101, p1)
    END PUTColorType;

    PROCEDURE (this: PictureFormat) Contrast* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 102)
    END Contrast;

    PROCEDURE (this: PictureFormat) PUTContrast* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 102, p1)
    END PUTContrast;

    PROCEDURE (this: PictureFormat) CropBottom* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 103)
    END CropBottom;

    PROCEDURE (this: PictureFormat) PUTCropBottom* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 103, p1)
    END PUTCropBottom;

    PROCEDURE (this: PictureFormat) CropLeft* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 104)
    END CropLeft;

    PROCEDURE (this: PictureFormat) PUTCropLeft* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 104, p1)
    END PUTCropLeft;

    PROCEDURE (this: PictureFormat) CropRight* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 105)
    END CropRight;

    PROCEDURE (this: PictureFormat) PUTCropRight* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 105, p1)
    END PUTCropRight;

    PROCEDURE (this: PictureFormat) CropTop* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 106)
    END CropTop;

    PROCEDURE (this: PictureFormat) PUTCropTop* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 106, p1)
    END PUTCropTop;

    PROCEDURE (this: PictureFormat) TransparencyColor* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 107)
    END TransparencyColor;

    PROCEDURE (this: PictureFormat) PUTTransparencyColor* (p1: INTEGER), NEW;
    BEGIN
        CtlC.PutInt(this, 107, p1)
    END PUTTransparencyColor;

    PROCEDURE (this: PictureFormat) TransparentBackground* (): CtlOffice.MsoTriState, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 108)
    END TransparentBackground;

    PROCEDURE (this: PictureFormat) PUTTransparentBackground* (p1: CtlOffice.MsoTriState), NEW;
    BEGIN
        CtlC.PutInt(this, 108, p1)
    END PUTTransparentBackground;

    PROCEDURE (this: PictureFormat) IncrementBrightness* (Increment: SHORTREAL), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.SRealVar(Increment, arg[0]);
        CtlC.CallParMethod(this, 10, arg, NIL);
    END IncrementBrightness;

    PROCEDURE (this: PictureFormat) IncrementContrast* (Increment: SHORTREAL), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.SRealVar(Increment, arg[0]);
        CtlC.CallParMethod(this, 11, arg, NIL);
    END IncrementContrast;


    (* ---------- ShadowFormat, dual, nonextensible ---------- *)

    PROCEDURE (this: ShadowFormat) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: ShadowFormat) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: ShadowFormat) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1)
    END Parent;

    PROCEDURE (this: ShadowFormat) ForeColor* (): ColorFormat, NEW;
    BEGIN
        RETURN ThisColorFormat(CtlC.GetAny(this, 100))
    END ForeColor;

    PROCEDURE (this: ShadowFormat) Obscured* (): CtlOffice.MsoTriState, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 101)
    END Obscured;

    PROCEDURE (this: ShadowFormat) PUTObscured* (p1: CtlOffice.MsoTriState), NEW;
    BEGIN
        CtlC.PutInt(this, 101, p1)
    END PUTObscured;

    PROCEDURE (this: ShadowFormat) OffsetX* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 102)
    END OffsetX;

    PROCEDURE (this: ShadowFormat) PUTOffsetX* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 102, p1)
    END PUTOffsetX;

    PROCEDURE (this: ShadowFormat) OffsetY* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 103)
    END OffsetY;

    PROCEDURE (this: ShadowFormat) PUTOffsetY* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 103, p1)
    END PUTOffsetY;

    PROCEDURE (this: ShadowFormat) Transparency* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 104)
    END Transparency;

    PROCEDURE (this: ShadowFormat) PUTTransparency* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 104, p1)
    END PUTTransparency;

    PROCEDURE (this: ShadowFormat) Type* (): CtlOffice.MsoShadowType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 105)
    END Type;

    PROCEDURE (this: ShadowFormat) PUTType* (p1: CtlOffice.MsoShadowType), NEW;
    BEGIN
        CtlC.PutInt(this, 105, p1)
    END PUTType;

    PROCEDURE (this: ShadowFormat) Visible* (): CtlOffice.MsoTriState, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 106)
    END Visible;

    PROCEDURE (this: ShadowFormat) PUTVisible* (p1: CtlOffice.MsoTriState), NEW;
    BEGIN
        CtlC.PutInt(this, 106, p1)
    END PUTVisible;

    PROCEDURE (this: ShadowFormat) IncrementOffsetX* (Increment: SHORTREAL), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.SRealVar(Increment, arg[0]);
        CtlC.CallParMethod(this, 10, arg, NIL);
    END IncrementOffsetX;

    PROCEDURE (this: ShadowFormat) IncrementOffsetY* (Increment: SHORTREAL), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.SRealVar(Increment, arg[0]);
        CtlC.CallParMethod(this, 11, arg, NIL);
    END IncrementOffsetY;


    (* ---------- ShapeNode, dual, nonextensible ---------- *)

    PROCEDURE (this: ShapeNode) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: ShapeNode) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: ShapeNode) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1)
    END Parent;

    PROCEDURE (this: ShapeNode) EditingType* (): CtlOffice.MsoEditingType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 100)
    END EditingType;

    PROCEDURE (this: ShapeNode) Points* (): CtlT.Any, NEW;
    BEGIN
        RETURN CtlC.GetAny(this, 101)
    END Points;

    PROCEDURE (this: ShapeNode) SegmentType* (): CtlOffice.MsoSegmentType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 102)
    END SegmentType;


    (* ---------- ShapeNodes, dual, nonextensible ---------- *)

    PROCEDURE (this: ShapeNodes) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: ShapeNodes) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: ShapeNodes) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1)
    END Parent;

    PROCEDURE (this: ShapeNodes) Count* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 2)
    END Count;

    PROCEDURE (this: ShapeNodes) _NewEnum* (): CtlT.Enumerator, NEW;
    BEGIN
        RETURN CtlC.GetEnum(this, -4)
    END _NewEnum;

    PROCEDURE (this: ShapeNodes) Delete* (Index: INTEGER), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[0]);
        CtlC.CallParMethod(this, 11, arg, NIL);
    END Delete;

    PROCEDURE (this: ShapeNodes) Item* (Index: CtlT.Any): ShapeNode, NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant; ret: CtlT.Variant;
    BEGIN
        CtlC.AnyVar(Index, arg[0]);
        CtlC.CallParMethod(this, 0, arg, ret);
        RETURN ThisShapeNode(CtlC.VarAny(ret))
    END Item;

    PROCEDURE (this: ShapeNodes) SetEditingType* (Index: INTEGER; EditingType: CtlOffice.MsoEditingType), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[1]);
        CtlC.IntVar(EditingType, arg[0]);
        CtlC.CallParMethod(this, 13, arg, NIL);
    END SetEditingType;

    PROCEDURE (this: ShapeNodes) SetPosition* (Index: INTEGER; X1: SHORTREAL; Y1: SHORTREAL), NEW;
        VAR arg: ARRAY 3 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[2]);
        CtlC.SRealVar(X1, arg[1]);
        CtlC.SRealVar(Y1, arg[0]);
        CtlC.CallParMethod(this, 14, arg, NIL);
    END SetPosition;

    PROCEDURE (this: ShapeNodes) SetSegmentType* (Index: INTEGER; SegmentType: CtlOffice.MsoSegmentType), NEW;
        VAR arg: ARRAY 2 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[1]);
        CtlC.IntVar(SegmentType, arg[0]);
        CtlC.CallParMethod(this, 15, arg, NIL);
    END SetSegmentType;

    PROCEDURE (this: ShapeNodes) Insert* (Index: INTEGER; SegmentType: CtlOffice.MsoSegmentType; EditingType: CtlOffice.MsoEditingType; X1: SHORTREAL; Y1: SHORTREAL; X2: SHORTREAL; Y2: SHORTREAL; X3: SHORTREAL; Y3: SHORTREAL), NEW;
        VAR arg: ARRAY 9 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(Index, arg[8]);
        CtlC.IntVar(SegmentType, arg[7]);
        CtlC.IntVar(EditingType, arg[6]);
        CtlC.SRealVar(X1, arg[5]);
        CtlC.SRealVar(Y1, arg[4]);
        CtlC.SRealVar(X2, arg[3]);
        CtlC.SRealVar(Y2, arg[2]);
        CtlC.SRealVar(X3, arg[1]);
        CtlC.SRealVar(Y3, arg[0]);
        CtlC.CallParMethod(this, 12, arg, NIL);
    END Insert;


    (* ---------- TextEffectFormat, dual, nonextensible ---------- *)

    PROCEDURE (this: TextEffectFormat) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: TextEffectFormat) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: TextEffectFormat) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1)
    END Parent;

    PROCEDURE (this: TextEffectFormat) Alignment* (): CtlOffice.MsoTextEffectAlignment, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 100)
    END Alignment;

    PROCEDURE (this: TextEffectFormat) PUTAlignment* (p1: CtlOffice.MsoTextEffectAlignment), NEW;
    BEGIN
        CtlC.PutInt(this, 100, p1)
    END PUTAlignment;

    PROCEDURE (this: TextEffectFormat) FontBold* (): CtlOffice.MsoTriState, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 101)
    END FontBold;

    PROCEDURE (this: TextEffectFormat) PUTFontBold* (p1: CtlOffice.MsoTriState), NEW;
    BEGIN
        CtlC.PutInt(this, 101, p1)
    END PUTFontBold;

    PROCEDURE (this: TextEffectFormat) FontItalic* (): CtlOffice.MsoTriState, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 102)
    END FontItalic;

    PROCEDURE (this: TextEffectFormat) PUTFontItalic* (p1: CtlOffice.MsoTriState), NEW;
    BEGIN
        CtlC.PutInt(this, 102, p1)
    END PUTFontItalic;

    PROCEDURE (this: TextEffectFormat) FontName* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 103)
    END FontName;

    PROCEDURE (this: TextEffectFormat) PUTFontName* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 103, p1)
    END PUTFontName;

    PROCEDURE (this: TextEffectFormat) FontSize* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 104)
    END FontSize;

    PROCEDURE (this: TextEffectFormat) PUTFontSize* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 104, p1)
    END PUTFontSize;

    PROCEDURE (this: TextEffectFormat) KernedPairs* (): CtlOffice.MsoTriState, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 105)
    END KernedPairs;

    PROCEDURE (this: TextEffectFormat) PUTKernedPairs* (p1: CtlOffice.MsoTriState), NEW;
    BEGIN
        CtlC.PutInt(this, 105, p1)
    END PUTKernedPairs;

    PROCEDURE (this: TextEffectFormat) NormalizedHeight* (): CtlOffice.MsoTriState, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 106)
    END NormalizedHeight;

    PROCEDURE (this: TextEffectFormat) PUTNormalizedHeight* (p1: CtlOffice.MsoTriState), NEW;
    BEGIN
        CtlC.PutInt(this, 106, p1)
    END PUTNormalizedHeight;

    PROCEDURE (this: TextEffectFormat) PresetShape* (): CtlOffice.MsoPresetTextEffectShape, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 107)
    END PresetShape;

    PROCEDURE (this: TextEffectFormat) PUTPresetShape* (p1: CtlOffice.MsoPresetTextEffectShape), NEW;
    BEGIN
        CtlC.PutInt(this, 107, p1)
    END PUTPresetShape;

    PROCEDURE (this: TextEffectFormat) PresetTextEffect* (): CtlOffice.MsoPresetTextEffect, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 108)
    END PresetTextEffect;

    PROCEDURE (this: TextEffectFormat) PUTPresetTextEffect* (p1: CtlOffice.MsoPresetTextEffect), NEW;
    BEGIN
        CtlC.PutInt(this, 108, p1)
    END PUTPresetTextEffect;

    PROCEDURE (this: TextEffectFormat) RotatedChars* (): CtlOffice.MsoTriState, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 109)
    END RotatedChars;

    PROCEDURE (this: TextEffectFormat) PUTRotatedChars* (p1: CtlOffice.MsoTriState), NEW;
    BEGIN
        CtlC.PutInt(this, 109, p1)
    END PUTRotatedChars;

    PROCEDURE (this: TextEffectFormat) Text* (): CtlT.Strg, NEW;
    BEGIN
        RETURN CtlC.GetStr(this, 110)
    END Text;

    PROCEDURE (this: TextEffectFormat) PUTText* (p1: ARRAY OF CHAR), NEW;
    BEGIN
        CtlC.PutStr(this, 110, p1)
    END PUTText;

    PROCEDURE (this: TextEffectFormat) Tracking* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 111)
    END Tracking;

    PROCEDURE (this: TextEffectFormat) PUTTracking* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 111, p1)
    END PUTTracking;

    PROCEDURE (this: TextEffectFormat) ToggleVerticalText* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 10, NIL);
    END ToggleVerticalText;


    (* ---------- ThreeDFormat, dual, nonextensible ---------- *)

    PROCEDURE (this: ThreeDFormat) Application* (): Application, NEW;
    BEGIN
        RETURN This_Application(CtlC.GetAny(this, 1000))
    END Application;

    PROCEDURE (this: ThreeDFormat) Creator* (): INTEGER, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 1001)
    END Creator;

    PROCEDURE (this: ThreeDFormat) Parent* (): CtlT.Object, NEW;
    BEGIN
        RETURN CtlC.GetObj(this, 1)
    END Parent;

    PROCEDURE (this: ThreeDFormat) Depth* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 100)
    END Depth;

    PROCEDURE (this: ThreeDFormat) PUTDepth* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 100, p1)
    END PUTDepth;

    PROCEDURE (this: ThreeDFormat) ExtrusionColor* (): ColorFormat, NEW;
    BEGIN
        RETURN ThisColorFormat(CtlC.GetAny(this, 101))
    END ExtrusionColor;

    PROCEDURE (this: ThreeDFormat) ExtrusionColorType* (): CtlOffice.MsoExtrusionColorType, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 102)
    END ExtrusionColorType;

    PROCEDURE (this: ThreeDFormat) PUTExtrusionColorType* (p1: CtlOffice.MsoExtrusionColorType), NEW;
    BEGIN
        CtlC.PutInt(this, 102, p1)
    END PUTExtrusionColorType;

    PROCEDURE (this: ThreeDFormat) Perspective* (): CtlOffice.MsoTriState, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 103)
    END Perspective;

    PROCEDURE (this: ThreeDFormat) PUTPerspective* (p1: CtlOffice.MsoTriState), NEW;
    BEGIN
        CtlC.PutInt(this, 103, p1)
    END PUTPerspective;

    PROCEDURE (this: ThreeDFormat) PresetExtrusionDirection* (): CtlOffice.MsoPresetExtrusionDirection, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 104)
    END PresetExtrusionDirection;

    PROCEDURE (this: ThreeDFormat) PresetLightingDirection* (): CtlOffice.MsoPresetLightingDirection, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 105)
    END PresetLightingDirection;

    PROCEDURE (this: ThreeDFormat) PUTPresetLightingDirection* (p1: CtlOffice.MsoPresetLightingDirection), NEW;
    BEGIN
        CtlC.PutInt(this, 105, p1)
    END PUTPresetLightingDirection;

    PROCEDURE (this: ThreeDFormat) PresetLightingSoftness* (): CtlOffice.MsoPresetLightingSoftness, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 106)
    END PresetLightingSoftness;

    PROCEDURE (this: ThreeDFormat) PUTPresetLightingSoftness* (p1: CtlOffice.MsoPresetLightingSoftness), NEW;
    BEGIN
        CtlC.PutInt(this, 106, p1)
    END PUTPresetLightingSoftness;

    PROCEDURE (this: ThreeDFormat) PresetMaterial* (): CtlOffice.MsoPresetMaterial, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 107)
    END PresetMaterial;

    PROCEDURE (this: ThreeDFormat) PUTPresetMaterial* (p1: CtlOffice.MsoPresetMaterial), NEW;
    BEGIN
        CtlC.PutInt(this, 107, p1)
    END PUTPresetMaterial;

    PROCEDURE (this: ThreeDFormat) PresetThreeDFormat* (): CtlOffice.MsoPresetThreeDFormat, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 108)
    END PresetThreeDFormat;

    PROCEDURE (this: ThreeDFormat) RotationX* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 109)
    END RotationX;

    PROCEDURE (this: ThreeDFormat) PUTRotationX* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 109, p1)
    END PUTRotationX;

    PROCEDURE (this: ThreeDFormat) RotationY* (): SHORTREAL, NEW;
    BEGIN
        RETURN CtlC.GetSReal(this, 110)
    END RotationY;

    PROCEDURE (this: ThreeDFormat) PUTRotationY* (p1: SHORTREAL), NEW;
    BEGIN
        CtlC.PutSReal(this, 110, p1)
    END PUTRotationY;

    PROCEDURE (this: ThreeDFormat) Visible* (): CtlOffice.MsoTriState, NEW;
    BEGIN
        RETURN CtlC.GetInt(this, 111)
    END Visible;

    PROCEDURE (this: ThreeDFormat) PUTVisible* (p1: CtlOffice.MsoTriState), NEW;
    BEGIN
        CtlC.PutInt(this, 111, p1)
    END PUTVisible;

    PROCEDURE (this: ThreeDFormat) IncrementRotationX* (Increment: SHORTREAL), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.SRealVar(Increment, arg[0]);
        CtlC.CallParMethod(this, 10, arg, NIL);
    END IncrementRotationX;

    PROCEDURE (this: ThreeDFormat) IncrementRotationY* (Increment: SHORTREAL), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.SRealVar(Increment, arg[0]);
        CtlC.CallParMethod(this, 11, arg, NIL);
    END IncrementRotationY;

    PROCEDURE (this: ThreeDFormat) ResetRotation* (), NEW;
    BEGIN
        CtlC.CallMethod(this, 12, NIL);
    END ResetRotation;

    PROCEDURE (this: ThreeDFormat) SetExtrusionDirection* (PresetExtrusionDirection: CtlOffice.MsoPresetExtrusionDirection), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(PresetExtrusionDirection, arg[0]);
        CtlC.CallParMethod(this, 14, arg, NIL);
    END SetExtrusionDirection;

    PROCEDURE (this: ThreeDFormat) SetThreeDFormat* (PresetThreeDFormat: CtlOffice.MsoPresetThreeDFormat), NEW;
        VAR arg: ARRAY 1 OF CtlT.Variant;
    BEGIN
        CtlC.IntVar(PresetThreeDFormat, arg[0]);
        CtlC.CallParMethod(this, 13, arg, NIL);
    END SetThreeDFormat;


    (* ---------- ApplicationEvents, hidden ---------- *)

    PROCEDURE (this: ApplicationEvents) Quit* (), NEW, ABSTRACT;

    PROCEDURE (this: ApplicationEvents) DocumentChange* (), NEW, ABSTRACT;

    PROCEDURE (this: ApplicationEvents) Invoke* (id, n: INTEGER; VAR par: CtlT.ParList; VAR ret: CtlT.Variant);
    BEGIN
        CASE id OF
        | 2: ASSERT(n = 0, 11); this.Quit()
        | 3: ASSERT(n = 0, 11); this.DocumentChange()
        END
    END Invoke;

    PROCEDURE (this: ApplicationEvents) GetIID* (OUT iid: CtlT.GUID);
    BEGIN
        iid := "{000209F7-0000-0000-C000-000000000046}"
    END GetIID;


    (* ---------- DocumentEvents, hidden ---------- *)

    PROCEDURE (this: DocumentEvents) New* (), NEW, ABSTRACT;

    PROCEDURE (this: DocumentEvents) Open* (), NEW, ABSTRACT;

    PROCEDURE (this: DocumentEvents) Close* (), NEW, ABSTRACT;

    PROCEDURE (this: DocumentEvents) Invoke* (id, n: INTEGER; VAR par: CtlT.ParList; VAR ret: CtlT.Variant);
    BEGIN
        CASE id OF
        | 4: ASSERT(n = 0, 11); this.New()
        | 5: ASSERT(n = 0, 11); this.Open()
        | 6: ASSERT(n = 0, 11); this.Close()
        END
    END Invoke;

    PROCEDURE (this: DocumentEvents) GetIID* (OUT iid: CtlT.GUID);
    BEGIN
        iid := "{000209F6-0000-0000-C000-000000000046}"
    END GetIID;


    (* ---------- OCXEvents, hidden ---------- *)

    PROCEDURE (this: OCXEvents) GotFocus* (), NEW, ABSTRACT;

    PROCEDURE (this: OCXEvents) LostFocus* (), NEW, ABSTRACT;

    PROCEDURE (this: OCXEvents) Invoke* (id, n: INTEGER; VAR par: CtlT.ParList; VAR ret: CtlT.Variant);
    BEGIN
        CASE id OF
        | -2147417888: ASSERT(n = 0, 11); this.GotFocus()
        | -2147417887: ASSERT(n = 0, 11); this.LostFocus()
        END
    END Invoke;

    PROCEDURE (this: OCXEvents) GetIID* (OUT iid: CtlT.GUID);
    BEGIN
        iid := "{000209F3-0000-0000-C000-000000000046}"
    END GetIID;


    PROCEDURE NewGlobal* (): _Global;
    BEGIN
        RETURN This_Global(CtlC.NewObj("{000209F0-0000-0000-C000-000000000046}"))
    END NewGlobal;

    PROCEDURE NewApplication* (): _Application;
    BEGIN
        RETURN This_Application(CtlC.NewObj("{000209FF-0000-0000-C000-000000000046}"))
    END NewApplication;

    PROCEDURE NewDocument* (): _Document;
    BEGIN
        RETURN This_Document(CtlC.NewObj("{00020906-0000-0000-C000-000000000046}"))
    END NewDocument;

    PROCEDURE NewFont* (): _Font;
    BEGIN
        RETURN This_Font(CtlC.NewObj("{000209F5-0000-0000-C000-000000000046}"))
    END NewFont;

    PROCEDURE NewParagraphFormat* (): _ParagraphFormat;
    BEGIN
        RETURN This_ParagraphFormat(CtlC.NewObj("{000209F4-0000-0000-C000-000000000046}"))
    END NewParagraphFormat;

    PROCEDURE NewOLEControl* (): _OLEControl;
    BEGIN
        RETURN This_OLEControl(CtlC.NewObj("{000209F2-0000-0000-C000-000000000046}"))
    END NewOLEControl;

    PROCEDURE NewLetterContent* (): _LetterContent;
    BEGIN
        RETURN This_LetterContent(CtlC.NewObj("{000209F1-0000-0000-C000-000000000046}"))
    END NewLetterContent;

END CtlWord8.
