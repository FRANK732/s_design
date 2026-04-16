import 'package:flutter/material.dart';

import 'Langs/english.dart';
import 's_localizations_delegate.dart';

/// Defines the localized strings for the sDesign component library.
abstract class SLocalizations {
  const SLocalizations(
      this.localeName);

  /// The locale for which these strings are localized.
  final String
      localeName;

  /// Returns the localized resources object for the closest [SLocalizations]
  /// ancestor of the given context.
  ///
  /// If no ancestor is found, it falls back to a default English implementation.
  static SLocalizations
      ofContext(BuildContext context) {
    return Localizations.of<SLocalizations>(context, SLocalizations) ??
        const SLocalizationsEn();
  }

  /// A delegate that provides [SLocalizations].
  ///
  /// Include this in your `MaterialApp.localizationsDelegates` to support sDesign localization.
  static const LocalizationsDelegate<SLocalizations>
      delegate =
      SLocalizationsDelegate();

  // General / Common Strings
  String
      get ok;
  String
      get cancel;
  String
      get done;
  String
      get close;
  String
      get search;
  String
      get searchPlaceholder;
  String
      get selectPlaceholder;
  String
      get noData;
  String
      get loading;

  // Date & Time Picker Strings
  String
      get selectDate;
  String
      get selectTime;
  String
      get startDate;
  String
      get endDate;
  String
      get startTime;
  String
      get endTime;
  String
      get hour;
  String
      get minute;
  String
      get second;

  // Pagination Strings
  String
      get previousPage;
  String
      get nextPage;
  String
      get page;
  String
      get of;

  // Category Strings for Example/Gallery
  String
      get home;
  String
      get inputs;
  String
      get display;
  String
      get feedback;
  String
      get layout;

  // App Shell & Gallery Strings
  String
      get galleryTitle;
  String
      get themeSwitchLight;
  String
      get themeSwitchDark;
  String
      get languageSwitch;
  String
      get sidebarHeader;
  String
      get searchComponents;
  String
      get langEn;
  String
      get langFr;
  String
      get langAr;
  String
      get langZh;

  // Component Names
  String
      get compButton;
  String
      get compCheckbox;
  String
      get compSwitch;
  String
      get compInput;
  String
      get compDropdown;
  String
      get compSelect;
  String
      get compRate;
  String
      get compDatePicker;
  String
      get compTimePicker;
  String
      get compAvatar;
  String
      get compSlider;
  String
      get compSteps;
  String
      get compQRCode;
  String
      get compTooltip;
  String
      get compAlert;
  String
      get compDialog;
  String
      get compToast;
  String
      get compSonner;
  String
      get compFloatingPanel;
  String
      get compProgress;
  String
      get compProgressLine;
  String
      get compCard;
  String
      get compListTile;
  String
      get compTabs;
  String
      get compPagination;
  String
      get compScaffold;
  String
      get compScaffoldSlivers;
  String
      get compBottomNav;
  String
      get compCardBasic;

  // Home / Landing Page Strings
  String
      get heroTagline;
  String
      get heroTaglineDate;
  String
      get heroTaglineDesc;
  String
      get heroTitle;
  String
      get heroDescription;
  String
      get heroGetStarted;
  String
      get heroBrowse;

  String
      get featuresTitle;
  String
      get featCustomTitle;
  String
      get featCustomDesc;
  String
      get featDarkTitle;
  String
      get featDarkDesc;
  String
      get featLocTitle;
  String
      get featLocDesc;
  String
      get featAnimTitle;
  String
      get featAnimDesc;

  String
      get showcaseTitle;
  String
      get showcaseNotifyBtn;
  String
      get showcaseNotifySuccess;
  String
      get showcaseEmailLabel;
  String
      get showcaseEmailHint;
  String
      get showcaseDateHint;
  String
      get showcaseDeleteBtn;

  String
      get footerIntegrate;
  String
      get footerBuiltBy;
  String
      get footerLicense;

  // Recurring Demo Labels
  String
      get demoWhenToUse;
  String
      get demoShowCode;
  String
      get demoHideCode;
  String
      get demoVariants;
  String
      get demoSizes;
  String
      get demoStates;
  String
      get demoBasicUsage;
  String
      get demoLoadingState;
  String
      get demoWithIcons;
  String
      get demoDisabled;
  String
      get demoFullWidth;
  String
      get demoUndo;
  String
      get demoDelete;
  String
      get demoCancel;
  String
      get demoSave;
  String
      get demoHideSeconds;
  String
      get demoStatus;

  // SButton Page
  String
      get buttonDesc;
  String
      get buttonTip1;
  String
      get buttonTip2;
  String
      get buttonTip3;
  String
      get buttonTip4;
  String
      get buttonLabelDefault;
  String
      get buttonLabelOutline;
  String
      get buttonLabelSecondary;
  String
      get buttonLabelGhost;
  String
      get buttonLabelDestructive;
  String
      get buttonLabelLink;
  String
      get buttonLabelLarge;
  String
      get buttonLabelSmall;
  String
      get buttonLabelDownload;
  String
      get buttonLabelNext;
  String
      get buttonLabelProcessing;
  String
      get buttonLabelClickToLoad;
  String
      get buttonLabelDisabled;
  String
      get buttonLabelDisabledOutline;
  String
      get buttonLabelFullWidth;

  // SCheckbox Page
  String
      get checkboxDesc;
  String
      get checkboxTip1;
  String
      get checkboxTip2;
  String
      get checkboxTip3;
  String
      get checkboxLabelAgreed;
  String
      get checkboxLabelPleaseAgree;
  String
      get checkboxSectionIndeterminate;
  String
      get checkboxLabelSelectAll;
  String
      get checkboxLabelOption;
  String
      get checkboxLabelCheckedDisabled;
  String
      get checkboxLabelUncheckedDisabled;

  // SSwitch Page
  String
      get switchDesc;
  String
      get switchTip1;
  String
      get switchTip2;
  String
      get switchTip3;
  String
      get switchSectionBasic;
  String
      get switchStatusEnabled;
  String
      get switchStatusDisabled;
  String
      get switchSectionSettings;
  String
      get switchLabelWifi;
  String
      get switchLabelBluetooth;
  String
      get switchLabelNotifications;
  String
      get switchLabelEnabledDisabled;
  String
      get switchLabelDisabledOff;

  // SInput Page
  String
      get inputDesc;
  String
      get inputTip1;
  String
      get inputTip2;
  String
      get inputTip3;
  String
      get inputLabelSearch;
  String
      get inputLabelPassword;
  String
      get inputLabelAmount;
  String
      get inputLabelEmailError;
  String
      get inputLabelPasswordWarning;
  String
      get inputLabelLarge;
  String
      get inputLabelMiddle;
  String
      get inputLabelSmall;
  String
      get inputLabelDisabled;
  String
      get inputLabelReadOnly;
  String
      get inputLabelTypeClear;
  String
      get inputLabelMessage;
  String
      get inputSectionPrefixSuffix;
  String
      get inputSectionValidation;
  String
      get inputSectionDisabled;
  String
      get inputSectionClear;
  String
      get inputSectionTextArea;

  // SSelect Page
  String
      get selectDescExtended; // Already have selectPlaceholder, using selectDescExtended for the demo
  String
      get selectTip1;
  String
      get selectTip2;
  String
      get selectTip3;
  String
      get selectLabelPickFruit;
  String
      get selectLabelSearchFruit;
  String
      get selectLabelPickMultiple;
  String
      get selectLabelApple;
  String
      get selectLabelBanana;
  String
      get selectLabelCherry;
  String
      get selectLabelDate;
  String
      get selectLabelElderberry;
  String
      get selectLabelDurian;
  String
      get selectLabelFig;
  String
      get selectLabelGrape;
  String
      get selectLabelTech;
  String
      get selectTip4;
  String
      get selectLabelSearchSelect;
  String
      get selectSectionWithSearch;
  String
      get selectSectionSingle;
  String
      get selectSectionMulti;

  // SRate Page
  String
      get rateDesc;
  String
      get rateTip1;
  String
      get rateTip2;
  String
      get rateTip3;
  String rateLabelCurrent(
      num value);
  String
      get rateLabel10Scale;
  String
      get rateSectionBasic;
  String
      get rateSectionHalf;
  String
      get rateSectionReadOnly;
  String
      get rateSectionCustomCount;
  String
      get rateDescBasic;
  String
      get rateDescHalf;
  String
      get rateDescReadOnly;
  String
      get rateDescCustomCount;

  // SDatePicker Page
  String
      get datePickerTitle;
  String
      get datePickerSectionBasic;
  String
      get datePickerSectionDisabled;
  String
      get datePickerSectionRange;
  String
      get datePickerSectionMonth;
  String
      get datePickerSectionYear;
  String
      get datePickerSectionPresetsDate;
  String
      get datePickerSectionPresetsRange;
  String
      get datePickerSectionCustom;
  String
      get datePickerLabelToday;
  String
      get datePickerLabelTomorrow;
  String
      get datePickerLabelNextWeek;
  String
      get datePickerLabelThisWeek;
  String
      get datePickerLabelLast7Days;
  String
      get datePickerLabelNext30Days;
  String
      get datePickerLabelCustomTheme;

  // STimePicker Page
  String
      get timePickerTitle;
  String
      get timePickerDescBasic;
  String
      get timePickerDesc12Hour;
  String
      get timePickerDescDisabled;
  String
      get timePickerDescSize;
  String
      get timePickerDescHideSeconds;
  String
      get timePickerDescInterval;
  String
      get timePickerDescAddon;
  String
      get timePickerLabelCustomFooter;
  String
      get timePickerDescStatus;
  String
      get timePickerDescSuffixPrefix;
  String
      get timePickerDescVariants;
  String
      get timePickerLabelOutlined;
  String
      get timePickerLabelOutlinedStart;
  String
      get timePickerLabelOutlinedEnd;
  String
      get timePickerLabelFilled;
  String
      get timePickerLabelFilledStart;
  String
      get timePickerLabelFilledEnd;
  String
      get timePickerLabelBorderless;
  String
      get timePickerLabelBorderlessStart;
  String
      get timePickerLabelBorderlessEnd;
  String
      get timePickerLabelUnderlined;
  String
      get timePickerLabelUnderlinedStart;
  String
      get timePickerLabelUnderlinedEnd;
  String
      get timePickerDescControlled;
  String timePickerLabelState(
      String
          value);
  String
      get timePickerDescNeedConfirm;
  String
      get timePickerDescChangeOnScroll;
  String
      get timePickerDescShowNowFalse;
  String
      get timePickerDescRange;
  String
      get timePickerHeader12Hour;
  String
      get timePickerHeaderInterval;
  String
      get timePickerHeaderAddon;
  String
      get timePickerHeaderVariants;
  String
      get timePickerHeaderControlled;
  String
      get timePickerHeaderNeedConfirm;
  String
      get timePickerHeaderChangeOnScroll;
  String
      get timePickerHeaderShowNowFalse;
  String
      get timePickerHeaderRange;
  String timePickerMsgTime(
      String
          time);
  String timePickerMsgConfirmed(
      String
          time);
  String timePickerMsgScroll(
      String
          time);
  String timePickerMsgRange(
      String
          start,
      String
          end);

  // SAvatar Page
  String
      get avatarTitle;
  String
      get avatarSectionBasic;
  String
      get avatarSectionType;
  String
      get avatarSectionAutoset;
  String
      get avatarSectionFallback;
  String
      get avatarSectionBadge;
  String
      get avatarSectionGroup;
  String
      get avatarBtnChangeUser;
  String
      get avatarBtnChangeGap;

  // SSlider Page
  String
      get sliderDesc;
  String
      get sliderTip1;
  String
      get sliderTip2;
  String
      get sliderTip3;
  String
      get sliderSectionBasic;
  String
      get sliderSectionRange;
  String
      get sliderSectionStepped;
  String
      get sliderSectionMarks;
  String sliderLabelValue(
      num value);
  String sliderLabelRange(
      num start,
      num end);
  String sliderLabelStep(
      num step,
      num max);

  // SSteps Page
  String
      get stepsDesc;
  String
      get stepsTip1;
  String
      get stepsTip2;
  String
      get stepsTip3;
  String
      get stepsSectionHorizontal;
  String
      get stepsSectionVertical;
  String
      get stepsSectionError;
  String
      get stepsSectionClickable;
  String
      get stepsBtnPrevious;
  String
      get stepsBtnNext;
  String
      get stepsLabelOrderPlaced;
  String
      get stepsDescOrderReceived;
  String
      get stepsLabelProcessing;
  String
      get stepsDescPrepared;
  String
      get stepsLabelShipped;
  String
      get stepsDescOnWay;
  String
      get stepsLabelDelivered;
  String
      get stepsDescEnjoy;
  String
      get stepsLabelStep1;
  String
      get stepsDescCreateAccount;
  String
      get stepsLabelStep2;
  String
      get stepsDescSetProfile;
  String
      get stepsLabelStep3;
  String
      get stepsDescExplore;
  String
      get stepsLabelPlaced;

  // SQRCode Page
  String
      get qrcodeDesc;
  String
      get qrcodeTip1;
  String
      get qrcodeTip2;
  String
      get qrcodeTip3;
  String
      get qrcodeSectionBasic;
  String
      get qrcodeSectionColor;
  String
      get qrcodeSectionIcon;
  String
      get qrcodeSectionExpired;
  String
      get qrcodeSectionScanned;

  // SAlert Page
  String
      get alertTitle;
  String
      get alertSectionDescription;
  String
      get alertSectionIcon;
  String
      get alertSectionClosable;
  String
      get alertSectionAction;
  String
      get alertSectionBanner;
  String
      get alertSectionCustomIcon;
  String
      get alertSectionSmoothClose;
  String
      get alertSectionCustomizability;
  String
      get alertWarningTitle;
  String
      get alertSuccessTitle;
  String
      get alertInfoTitle;
  String
      get alertErrorTitle;
  String
      get alertSuccessText;
  String
      get alertInfoText;
  String
      get alertWarningText;
  String
      get alertErrorText;
  String
      get alertSuccessDesc;
  String
      get alertInfoDesc;
  String
      get alertWarningDesc;
  String
      get alertErrorDesc;
  String
      get alertSuccessTips;
  String
      get alertInfoNotes;
  String
      get alertWarning;
  String
      get alertError;
  String
      get alertDetailedSuccess;
  String
      get alertAdditionalInfo;
  String
      get alertWarningNotice;
  String
      get alertErrorMessage;
  String
      get alertClosedWarning;
  String
      get alertClosedSuccess;
  String
      get alertClosedInfo;
  String
      get alertClosedError;
  String
      get alertBtnUndo;
  String
      get alertBtnDetail;
  String
      get alertBtnDone;
  String
      get alertBtnAccept;
  String
      get alertBtnDecline;
  String
      get alertClosedMsg;
  String
      get alertBtnReshow;
  String
      get alertCustomTitle;
  String
      get alertCustomDesc;
  String
      get alertConstrainedTitle;
  String
      get alertConstrainedDesc;
  String
      get alertBtnLearnMore;

  // SDialog Page
  String
      get dialogDesc;
  String
      get dialogTip1;
  String
      get dialogTip2;
  String
      get dialogTip3;
  String
      get dialogSectionConfirm;
  String
      get dialogSectionContent;
  String
      get dialogSectionInfo;
  String
      get dialogTitleDelete;
  String
      get dialogDescDelete;
  String
      get dialogBtnOpenConfirm;
  String
      get dialogTitleEditProfile;
  String
      get dialogLabelFullName;
  String
      get dialogLabelEmail;
  String
      get dialogBtnOpenForm;
  String
      get dialogTitleInfo;
  String
      get dialogDescSession;
  String
      get dialogBtnGotIt;
  String
      get dialogBtnOpenInfo;

  // SToast Page
  String
      get toastDesc;
  String
      get toastTip1;
  String
      get toastTip2;
  String
      get toastSectionDefault;
  String
      get toastSectionTitle;
  String
      get toastSectionDestructive;
  String
      get toastSectionRecommendation;
  String
      get toastLabelMessage;
  String
      get toastBtnShow;
  String
      get toastLabelSuccess;
  String
      get toastLabelSaved;
  String
      get toastBtnShowWithTitle;
  String
      get toastLabelError;
  String
      get toastLabelWrong;
  String
      get toastBtnShowError;
  String
      get toastRecommendationText;

  // SSonner Page
  String
      get sonnerDesc;
  String
      get sonnerTip1;
  String
      get sonnerTip2;
  String
      get sonnerTip3;
  String
      get sonnerSectionVariants;
  String
      get sonnerSectionConfig;
  String
      get sonnerSectionAction;
  String
      get sonnerSectionPosition;
  String
      get sonnerSectionReplace;
  String
      get sonnerSectionShadow;
  String
      get sonnerLabelSuccess;
  String
      get sonnerLabelError;
  String
      get sonnerLabelWarning;
  String
      get sonnerLabelInfo;
  String
      get sonnerLabelMsgSaved;
  String
      get sonnerLabelMsgUploaded;
  String
      get sonnerLabelTitleUpload;
  String
      get sonnerBtnShowWithTitle;
  String
      get sonnerLabelMsgArchived;
  String
      get sonnerBtnShowWithAction;
  String
      get sonnerLabelMsgTop;
  String
      get sonnerBtnShowAtTop;
  String
      get sonnerLabelMsgReplaced;
  String
      get sonnerBtnShowReplace;
  String
      get sonnerLabelMsgNoShadow;
  String
      get sonnerBtnShowFlat;
  String sonnerLabelNotify(
      String
          variant);

  // SFloatingPanel Page
  String
      get floatingTitle;
  String
      get floatingLabelActionCompleted;
  String
      get floatingBtnOk;
  String
      get floatingTitleAdvanced;
  String
      get floatingLabelUsername;
  String
      get floatingLabelPassword;
  String
      get floatingBtnCancel;
  String
      get floatingBtnSave;
  String
      get floatingMsgSettingsSaved;
  String
      get floatingTitleSpecialOffer;
  String
      get floatingDescSpecialOffer;
  String
      get floatingBtnMaybeLater;
  String
      get floatingBtnClaimOffer;
  String
      get floatingMsgOfferClaimed;
  String
      get floatingBtnShowSimple;
  String
      get floatingBtnShowAdvanced;
  String
      get floatingBtnShowCustom;

  // SProgress Page
  String
      get progressDesc;
  String
      get progressTip1;
  String
      get progressTip2;
  String
      get progressTip3;
  String
      get progressSectionLine;
  String
      get progressSectionCircle;
  String
      get progressSectionStatus;
  String
      get progressSectionDashboard;
  String
      get progressBtnDecrease;
  String
      get progressBtnIncrease;

  // SCard Page
  String
      get cardDesc;
  String
      get cardTip1;
  String
      get cardTip2;
  String
      get cardTip3;
  String
      get cardSectionBasic;
  String
      get cardSectionHeader;
  String
      get cardSectionInteractivity;
  String
      get cardSectionVariants;
  String
      get cardSectionGrid;
  String
      get cardLabelTitle;
  String
      get cardLabelBasicBody;
  String
      get cardLabelStats;
  String
      get cardLabelUsers;
  String
      get cardLabelRevenue;
  String
      get cardLabelOrders;
  String
      get cardLabelClickMe;
  String
      get cardLabelClickableBody;
  String
      get cardLabelElevated;
  String
      get cardLabelOutlined;
  String
      get cardLabelFilled;
  String
      get cardLabelShadow;
  String
      get cardLabelBorder;
  String
      get cardLabelSurface;
  String cardLabelItem(
      int index);

  // SListTile Page
  String
      get listTileDesc;
  String
      get listTileTip1;
  String
      get listTileTip2;
  String
      get listTileTip3;
  String
      get listTileSectionBasic;
  String
      get listTileSectionGrouped;
  String
      get listTileSectionSelectable;
  String
      get listTileLabelName;
  String
      get listTileLabelRole;
  String
      get listTileLabelNotifications;
  String
      get listTileLabelPrivacy;
  String
      get listTileLabelLanguage;
  String
      get listTileLabelInbox;
  String
      get listTileLabelSent;
  String
      get listTileLabelDrafts;
  String
      get listTileLabelSpam;

  // STabs Page
  String
      get tabsDesc;
  String
      get tabsTip1;
  String
      get tabsTip2;
  String
      get tabsTip3;
  String
      get tabsSectionBasic;
  String
      get tabsSectionIcons;
  String
      get tabsSectionCard;
  String
      get tabsLabelOverview;
  String
      get tabsLabelDetails;
  String
      get tabsLabelReviews;
  String
      get tabsContentOverview;
  String
      get tabsContentDetails;
  String
      get tabsContentReviews;
  String
      get tabsLabelHome;
  String
      get tabsLabelSearch;
  String
      get tabsLabelProfile;
  String
      get tabsLabelCardA;
  String
      get tabsLabelCardB;
  String
      get tabsLabelCardC;
  String
      get tabsContentCardA;
  String
      get tabsContentCardB;
  String
      get tabsContentCardC;

  // Showcase extra strings
  String
      get tabsTitleShowcase;
  String
      get tabsControlLabelType;
  String
      get tabsControlLabelPosition;
  String
      get tabsControlLabelSize;
  String
      get tabsControlLabelCentered;
  String
      get tabsControlLabelMany;
  String tabsLabelTab(
      int index);
  String
      get tabsLabelShort;
  String
      get tabsLabelMedium;

  // STooltip Page
  String
      get tooltipDesc;
  String
      get tooltipLabelHover;
  String
      get tooltipLabelClick;
  String
      get tooltipLabelLongPress;
  String
      get tooltipSectionPlacement;
  String
      get tooltipSectionTrigger;
  String
      get tooltipSectionColors;
  String
      get tabsLabelCard;
  String
      get tabsLabelDisabled;
  String
      get tabsContentShort;
  String
      get tabsContentMedium;
  String
      get tabsContentPadding;
  String
      get tabsLabelNestedCard;
  String
      get tabsLabelComposition;
  String
      get tabsLabelDisabledContent;
  String tabsLabelListItem(
      int index);
  String tabsLabelInTab(
      int index);
  String
      get tabsTooltipExtra;

  // SPagination Page
  String
      get paginationTitle;
  String
      get paginationHeader1;
  String
      get paginationDesc1;
  String
      get paginationHeader2;
  String
      get paginationDesc2;
  String
      get paginationHeader3;
  String
      get paginationDesc3;
  String
      get paginationHeader4;
  String
      get paginationDesc4;
  String
      get paginationHeader5;
  String
      get paginationDesc5;
  String
      get paginationHeader5b;
  String
      get paginationDesc5b;
  String
      get paginationHeader6;
  String
      get paginationDesc6;
  String
      get paginationHeader7;
  String
      get paginationDesc7;
  String
      get paginationHeader8;
  String
      get paginationDesc8;
  String
      get paginationHeader9;
  String
      get paginationDesc9;
  String
      get paginationHeader10;
  String
      get paginationDesc10;
  String
      get paginationHeader11;
  String
      get paginationDesc11;
  String
      get paginationHeader12;
  String
      get paginationDesc12;
  String paginationLabelTotal(
      int total);
  String paginationLabelRange(
      int first,
      int last,
      int total);
  String paginationLabelState(
      int page);
  String
      get paginationLabelPrevious;
  String
      get paginationLabelNext;

  // SScaffold Page
  String
      get scaffoldTitle;
  String
      get scaffoldDesc;
  String
      get scaffoldStickyHeader;
  String scaffoldLabelHItem(
      int index);
  String scaffoldLabelItem(
      int index);
  String scaffoldLabelSubtitle(
      int index);
  String
      get scaffoldLabelFAB;

  // BottomNavigation Page
  String
      get navTitle;
  String
      get navLabelHome;
  String
      get navLabelLikes;
  String
      get navLabelSearch;
  String
      get navLabelProfile;

  // SInputField Page
  String
      get inputTitleShowcase;
  String
      get inputSectionDefault;
  String
      get inputSectionPassword;
  String
      get inputSectionIcons;
  String
      get inputSectionDatePicker;
  String
      get inputSectionCustom;
  String
      get inputSectionCard;
  String
      get inputSectionRealWorld;
  String
      get inputHintNumber;
  String
      get inputHintPassword;
  String
      get inputHintSearch;
  String
      get inputHintDate;
  String
      get inputHintEmail;
  String
      get inputHintCustom;
  String
      get inputHintCard;
  String
      get inputLabelCard;
  String
      get inputHelperCard;
  String
      get inputBtnSubmit;
  String
      get inputLabelPrice;
  String
      get inputHintPrice;
  String
      get inputHelperPrice;
  String
      get inputLabelStatus;
  String
      get inputHintStatus;
  String
      get inputHelperStatus;
  String
      get inputLabelApiKey;
  String
      get inputErrorApiKey;
  String
      get inputErrorEmpty;
  String
      get inputErrorNumber;
}
