import 'package:flutter/material.dart';

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

/// Default English implementation of [SLocalizations].
class SLocalizationsEn
    extends SLocalizations {
  const SLocalizationsEn()
      : super('en');

  @override
  String get ok =>
      'OK';
  @override
  String get cancel =>
      'Cancel';
  @override
  String get done =>
      'Done';
  @override
  String get close =>
      'Close';
  @override
  String get search =>
      'Search';
  @override
  String get searchPlaceholder =>
      'Search...';
  @override
  String get selectPlaceholder =>
      'Select';
  @override
  String get noData =>
      'No data';
  @override
  String get loading =>
      'Loading...';

  @override
  String get selectDate =>
      'Select date';
  @override
  String get selectTime =>
      'Select time';
  @override
  String get startDate =>
      'Start date';
  @override
  String get endDate =>
      'End date';
  @override
  String get startTime =>
      'Start time';
  @override
  String get endTime =>
      'End time';
  @override
  String get hour =>
      'Hour';
  @override
  String get minute =>
      'Minute';
  @override
  String get second =>
      'Second';

  @override
  String get previousPage =>
      'Previous page';
  @override
  String get nextPage =>
      'Next page';
  @override
  String get page =>
      'Page';
  @override
  String get of =>
      'of';

  @override
  String get home =>
      'Home';
  @override
  String get inputs =>
      'Inputs';
  @override
  String get display =>
      'Display';
  @override
  String get feedback =>
      'Feedback';
  @override
  String get layout =>
      'Layout';

  @override
  String get galleryTitle =>
      'SDesign Gallery';
  @override
  String get themeSwitchLight =>
      'Switch to light mode';
  @override
  String get themeSwitchDark =>
      'Switch to dark mode';
  @override
  String get languageSwitch =>
      'Change language';
  @override
  String get sidebarHeader =>
      'SDesign';
  @override
  String get searchComponents =>
      'Search components...';
  @override
  String get langEn =>
      'English';
  @override
  String get langFr =>
      'Français';
  @override
  String get langAr =>
      'العربية';
  @override
  String get langZh =>
      '中文';

  @override
  String get compButton =>
      'SButton';
  @override
  String get compCheckbox =>
      'SCheckbox';
  @override
  String get compSwitch =>
      'SSwitch';
  @override
  String get compInput =>
      'SInput';
  @override
  String get compDropdown =>
      'SDropdown';
  @override
  String get compSelect =>
      'SSelect';
  @override
  String get compRate =>
      'SRate';
  @override
  String get compDatePicker =>
      'SDatePicker';
  @override
  String get compTimePicker =>
      'STimePicker';
  @override
  String get compAvatar =>
      'SAvatar';
  @override
  String get compSlider =>
      'SSlider';
  @override
  String get compSteps =>
      'SSteps';
  @override
  String get compQRCode =>
      'SQRCode';
  @override
  String get compAlert =>
      'SAlert';
  @override
  String get compDialog =>
      'SDialog';
  @override
  String get compToast =>
      'SToast';
  @override
  String get compSonner =>
      'SSonner';
  @override
  String get compFloatingPanel =>
      'SFloatingPanel';
  @override
  String get compProgress =>
      'SProgress';
  @override
  String get compProgressLine =>
      'SProgress.line';
  @override
  String get compCard =>
      'SCard';
  @override
  String get compListTile =>
      'SListTile';
  @override
  String get compTabs =>
      'STabs';
  @override
  String get compPagination =>
      'SPagination';
  @override
  String get compScaffold =>
      'SScaffold';
  @override
  String get compScaffoldSlivers =>
      'SScaffold Slivers';
  @override
  String get compBottomNav =>
      'SBottom Navigation';
  @override
  String get compCardBasic =>
      'SCard (Basic)';

  // Home / Landing Page Strings
  @override
  String get heroTagline =>
      'sDesign v2.0.0 is out!';
  @override
  String get heroTitle =>
      'Craft Stunning UIs\nWith Minimal Code';
  @override
  String get heroDescription =>
      'A robust, highly customizable Flutter component library '
      "inspired by the world's best design systems. Built for mobile, web, and desktop.";
  @override
  String get heroGetStarted =>
      'Get Started';
  @override
  String get heroBrowse =>
      'Browse Components';

  @override
  String get featuresTitle =>
      'Why choose sDesign?';
  @override
  String get featCustomTitle =>
      'Limitless Customization';
  @override
  String get featCustomDesc =>
      'Every token is exposed. Seamlessly inject your brand colors into all components instantly using SThemeData.';
  @override
  String get featDarkTitle =>
      'Flawless Dark Mode';
  @override
  String get featDarkDesc =>
      'Intelligent color tokens ensure your UI looks premium and perfectly balanced in both light and dark modes out of the box.';
  @override
  String get featLocTitle =>
      'Native Localization';
  @override
  String get featLocDesc =>
      "Speaks your users' languages natively. Built-in support for multiple languages including RTL without extra fuss.";
  @override
  String get featAnimTitle =>
      'Micro-Interactions';
  @override
  String get featAnimDesc =>
      'Delightful spring physics, smooth hover states, and gorgeous transitions make your app feel incredibly responsive.';

  @override
  String get showcaseTitle =>
      'Interactive Live Preview';
  @override
  String get showcaseNotifyBtn =>
      'Show Notification';
  @override
  String get showcaseNotifySuccess =>
      'Perfect! You triggered a success toast.';
  @override
  String get showcaseEmailLabel =>
      'Email Address';
  @override
  String get showcaseEmailHint =>
      'you@example.com';
  @override
  String get showcaseDateHint =>
      'Select Date';
  @override
  String get showcaseDeleteBtn =>
      'Delete Account';

  @override
  String get footerIntegrate =>
      'Minutes to integrate';
  @override
  String get footerBuiltBy =>
      'Built with passion by ';
  @override
  String get footerLicense =>
      '. Licensed under MIT.';

  @override
  String get demoWhenToUse =>
      'When to use';
  @override
  String get demoShowCode =>
      'Show code';
  @override
  String get demoHideCode =>
      'Hide code';
  @override
  String get demoVariants =>
      'Variants';
  @override
  String get demoSizes =>
      'Sizes';
  @override
  String get demoStates =>
      'States';
  @override
  String get demoBasicUsage =>
      'Basic Usage';
  @override
  String get demoLoadingState =>
      'Loading State';
  @override
  String get demoWithIcons =>
      'With Icons';
  @override
  String get demoDisabled =>
      'Disabled';
  @override
  String get demoFullWidth =>
      'Full Width';
  @override
  String get demoUndo =>
      'Undo';
  @override
  String get demoDelete =>
      'Delete';
  @override
  String get demoCancel =>
      'Cancel';
  @override
  String get demoSave =>
      'Save';
  @override
  String get demoHideSeconds =>
      'Hide Seconds';
  @override
  String get demoStatus =>
      'Status';

  @override
  String get buttonDesc =>
      'A versatile button component supporting multiple variants, sizes, states, and icons. SButton follows modern design principles — every interaction has a clear visual response.';
  @override
  String get buttonTip1 =>
      'Use the default variant for primary actions (e.g. Submit, Save).';
  @override
  String get buttonTip2 =>
      'Use outline buttons for secondary actions or alternatives.';
  @override
  String get buttonTip3 =>
      'Use destructive buttons for delete/irreversible actions.';
  @override
  String get buttonTip4 =>
      'Use ghost or link buttons for low-emphasis inline actions.';
  @override
  String get buttonLabelDefault =>
      'Default';
  @override
  String get buttonLabelOutline =>
      'Outline';
  @override
  String get buttonLabelSecondary =>
      'Secondary';
  @override
  String get buttonLabelGhost =>
      'Ghost';
  @override
  String get buttonLabelDestructive =>
      'Destructive';
  @override
  String get buttonLabelLink =>
      'Link';
  @override
  String get buttonLabelLarge =>
      'Large';
  @override
  String get buttonLabelSmall =>
      'Small';
  @override
  String get buttonLabelDownload =>
      'Download';
  @override
  String get buttonLabelNext =>
      'Next';
  @override
  String get buttonLabelProcessing =>
      'Processing...';
  @override
  String get buttonLabelClickToLoad =>
      'Click to load';
  @override
  String get buttonLabelDisabled =>
      'Disabled';
  @override
  String get buttonLabelDisabledOutline =>
      'Disabled Outline';
  @override
  String get buttonLabelFullWidth =>
      'Full Width Button';

  @override
  String get checkboxDesc =>
      'A checkbox component for selecting one or multiple options. Supports checked, unchecked, and indeterminate states.';
  @override
  String get checkboxTip1 =>
      'When the user needs to select one or more items from a list.';
  @override
  String get checkboxTip2 =>
      'To toggle a boolean setting on or off.';
  @override
  String get checkboxTip3 =>
      'As part of a form where multi-selection is required.';
  @override
  String get checkboxLabelAgreed =>
      'Agreed';
  @override
  String get checkboxLabelPleaseAgree =>
      'Please agree';
  @override
  String get checkboxSectionIndeterminate =>
      'Indeterminate / Select All';
  @override
  String get checkboxLabelSelectAll =>
      'Select all';
  @override
  String get checkboxLabelOption =>
      'Option';
  @override
  String get checkboxLabelCheckedDisabled =>
      'Checked & Disabled';
  @override
  String get checkboxLabelUncheckedDisabled =>
      'Unchecked & Disabled';

  @override
  String get switchDesc =>
      'A toggle switch component for binary on/off states. SSwitch visually communicates state more clearly than a checkbox in settings-style UIs.';
  @override
  String get switchTip1 =>
      'To toggle a single setting or feature immediately (no confirmation needed).';
  @override
  String get switchTip2 =>
      'In settings screens where compact space and clear on/off state matter.';
  @override
  String get switchTip3 =>
      'When the effect of toggling is immediately reflected in the UI.';
  @override
  String get switchSectionBasic =>
      'Basic Toggle';
  @override
  String get switchStatusEnabled =>
      'Enabled';
  @override
  String get switchStatusDisabled =>
      'Disabled';
  @override
  String get switchSectionSettings =>
      'Settings List Pattern';
  @override
  String get switchLabelWifi =>
      'Wi-Fi';
  @override
  String get switchLabelBluetooth =>
      'Bluetooth';
  @override
  String get switchLabelNotifications =>
      'Notifications';
  @override
  String get switchLabelEnabledDisabled =>
      'Enabled & Disabled';
  @override
  String get switchLabelDisabledOff =>
      'Disabled & Off';

  @override
  String get inputDesc =>
      'A text input field with support for prefix/suffix icons, addon before/after, validation states (error, warning), clear button, and multiple sizes.';
  @override
  String get inputTip1 =>
      'When collecting text data from the user in a form.';
  @override
  String get inputTip2 =>
      'For search fields, filters, and data-entry screens.';
  @override
  String get inputTip3 =>
      'When you need built-in validation feedback (error, warning states).';
  @override
  String get inputLabelSearch =>
      'Search...';
  @override
  String get inputLabelPassword =>
      'Enter password';
  @override
  String get inputLabelAmount =>
      'amount';
  @override
  String get inputLabelEmailError =>
      'Valid email required';
  @override
  String get inputLabelPasswordWarning =>
      'Password should be stronger';
  @override
  String get inputLabelLarge =>
      'Large input';
  @override
  String get inputLabelMiddle =>
      'Middle input (default)';
  @override
  String get inputLabelSmall =>
      'Small input';
  @override
  String get inputLabelDisabled =>
      'Disabled';
  @override
  String get inputLabelReadOnly =>
      'Cannot be changed';
  @override
  String get inputLabelTypeClear =>
      'Type something then clear it';
  @override
  String get inputLabelMessage =>
      'Write your message...';
  @override
  String get inputSectionPrefixSuffix =>
      'With Prefix and Suffix Widgets';
  @override
  String get inputSectionValidation =>
      'Validation States';
  @override
  String get inputSectionDisabled =>
      'Disabled and ReadOnly';
  @override
  String get inputSectionClear =>
      'Allow Clear';
  @override
  String get inputSectionTextArea =>
      'Text Area';

  @override
  String get selectDescExtended =>
      'A powerful select dropdown component supporting single selection, multi-select, tags mode, search/filter, grouped items, and custom icons.';
  @override
  String get selectTip1 =>
      'Replacing native <select> elements with richer UX.';
  @override
  String get selectTip2 =>
      'Selecting one or multiple items from a long list.';
  @override
  String get selectTip3 =>
      'When you need searchable dropdowns for form inputs.';
  @override
  String get selectLabelPickFruit =>
      'Select a fruit';
  @override
  String get selectLabelSearchFruit =>
      'Search a fruit...';
  @override
  String get selectLabelPickMultiple =>
      'Pick multiple fruits';
  @override
  String get selectLabelApple =>
      'Apple';
  @override
  String get selectLabelBanana =>
      'Banana';
  @override
  String get selectLabelCherry =>
      'Cherry';
  @override
  String get selectLabelDate =>
      'Date';
  @override
  String get selectLabelElderberry =>
      'Elderberry';
  @override
  String get selectLabelDurian =>
      'Durian';
  @override
  String get selectLabelFig =>
      'Fig';
  @override
  String get selectLabelGrape =>
      'Grape';
  @override
  String get selectLabelTech =>
      'Technology';
  @override
  String get selectTip4 =>
      'When the dropdown list is long (10+ options) and filtering is helpful.';
  @override
  String get selectLabelSearchSelect =>
      'Search and select...';
  @override
  String get selectSectionWithSearch =>
      'With Search';
  @override
  String get selectSectionSingle =>
      'Single Select';
  @override
  String get selectSectionMulti =>
      'Multi-Select';

  @override
  String get rateDesc =>
      'A star rating component that lets users provide feedback on a numeric scale. Supports full stars, half stars, custom icons, and read-only display.';
  @override
  String get rateTip1 =>
      'For product, service, or content rating interfaces.';
  @override
  String get rateTip2 =>
      'To collect qualitative feedback on a scale.';
  @override
  String get rateTip3 =>
      'To display an aggregate rating in a read-only mode.';
  @override
  String rateLabelCurrent(num value) =>
      'Current: $value stars';
  @override
  String get rateLabel10Scale =>
      '10-star scale';
  @override
  String get rateSectionBasic =>
      'Basic Rating';
  @override
  String get rateSectionHalf =>
      'Half Stars';
  @override
  String get rateSectionReadOnly =>
      'Read-Only Display';
  @override
  String get rateSectionCustomCount =>
      'Custom Star Count';
  @override
  String get rateDescBasic =>
      'Full star rating with 5 stars by default.';
  @override
  String get rateDescHalf =>
      'Enable `allowHalf: true` for 0.5 precision.';
  @override
  String get rateDescReadOnly =>
      'Pass `disabled: true` to render a non-interactive rating display.';
  @override
  String get rateDescCustomCount =>
      'Change the total number of stars with `count`.';

  @override
  String get datePickerTitle =>
      'SDatePicker Showcase';
  @override
  String get datePickerSectionBasic =>
      'Basic DatePicker';
  @override
  String get datePickerSectionDisabled =>
      'Disabled DatePicker';
  @override
  String get datePickerSectionRange =>
      'Range Picker';
  @override
  String get datePickerSectionMonth =>
      'Month Picker';
  @override
  String get datePickerSectionYear =>
      'Year Picker';
  @override
  String get datePickerSectionPresetsDate =>
      'Presets DatePicker';
  @override
  String get datePickerSectionPresetsRange =>
      'Presets RangePicker';
  @override
  String get datePickerSectionCustom =>
      'Custom Styling';
  @override
  String get datePickerLabelToday =>
      'Today';
  @override
  String get datePickerLabelTomorrow =>
      'Tomorrow';
  @override
  String get datePickerLabelNextWeek =>
      'Next Week';
  @override
  String get datePickerLabelThisWeek =>
      'This Week';
  @override
  String get datePickerLabelLast7Days =>
      'Last 7 Days';
  @override
  String get datePickerLabelNext30Days =>
      'Next 30 Days';
  @override
  String get datePickerLabelCustomTheme =>
      'Custom Theme';

  @override
  String get timePickerTitle =>
      'STimePicker';
  @override
  String get timePickerDescBasic =>
      'Default HH:mm:ss picker. Column scrolling only previews. Value commits when you tap OK or dismiss the panel.';
  @override
  String get timePickerDesc12Hour =>
      'use12Hours adds an AM/PM column. Format controls whether seconds are shown.';
  @override
  String get timePickerDescDisabled =>
      'disabled: true grays out the field and prevents the panel opening.';
  @override
  String get timePickerDescSize =>
      'size: large (40 px) / middle (32 px, default) / small (24 px).';
  @override
  String get timePickerDescHideSeconds =>
      "format: 'HH:mm' removes the seconds column from the panel.";
  @override
  String get timePickerDescInterval =>
      'hourStep, minuteStep, secondStep filter column items.';
  @override
  String get timePickerDescAddon =>
      'renderExtraFooter adds a custom widget in the panel footer, alongside the built-in Now and OK buttons.';
  @override
  String get timePickerLabelCustomFooter =>
      '✏️ Custom footer';
  @override
  String get timePickerDescStatus =>
      'status: error (red border) or warning (yellow border).';
  @override
  String get timePickerDescSuffixPrefix =>
      'suffixIcon replaces the default clock icon; prefix adds a leading widget inside the field.';
  @override
  String get timePickerDescVariants =>
      'outlined (default) / filled / borderless / underlined.';
  @override
  String get timePickerLabelOutlined =>
      'Outlined';
  @override
  String get timePickerLabelOutlinedStart =>
      'Outlined Start';
  @override
  String get timePickerLabelOutlinedEnd =>
      'Outlined End';
  @override
  String get timePickerLabelFilled =>
      'Filled';
  @override
  String get timePickerLabelFilledStart =>
      'Filled Start';
  @override
  String get timePickerLabelFilledEnd =>
      'Filled End';
  @override
  String get timePickerLabelBorderless =>
      'Borderless';
  @override
  String get timePickerLabelBorderlessStart =>
      'Borderless Start';
  @override
  String get timePickerLabelBorderlessEnd =>
      'Borderless End';
  @override
  String get timePickerLabelUnderlined =>
      'Underlined';
  @override
  String get timePickerLabelUnderlinedStart =>
      'Underlined Start';
  @override
  String get timePickerLabelUnderlinedEnd =>
      'Underlined End';
  @override
  String get timePickerDescControlled =>
      'value + onChange give the parent full control.';
  @override
  String timePickerLabelState(String value) =>
      'State: $value';
  @override
  String get timePickerDescNeedConfirm =>
      'Value is only committed when the user taps the OK button.';
  @override
  String get timePickerDescChangeOnScroll =>
      'onChange fires live as the user snaps each column (needConfirm is false — default for changeOnScroll).';
  @override
  String get timePickerDescShowNowFalse =>
      'Hides the Now shortcut from the footer (mirroring showNow prop).';
  @override
  String get timePickerDescRange =>
      'STimeRangePicker renders two pickers side-by-side.';
  @override
  String get timePickerHeader12Hour =>
      '2. 12-Hour Clock';
  @override
  String get timePickerHeaderInterval =>
      '6. Interval Options';
  @override
  String get timePickerHeaderAddon =>
      '7. Addon — renderExtraFooter';
  @override
  String get timePickerHeaderVariants =>
      '10. Variants';
  @override
  String get timePickerHeaderControlled =>
      '11. Controlled Mode';
  @override
  String get timePickerHeaderNeedConfirm =>
      '12. needConfirm';
  @override
  String get timePickerHeaderChangeOnScroll =>
      '13. changeOnScroll';
  @override
  String get timePickerHeaderShowNowFalse =>
      '14. showNow: false';
  @override
  String get timePickerHeaderRange =>
      '14. Time Range Picker';
  @override
  String timePickerMsgTime(String time) =>
      'Time: $time';
  @override
  String timePickerMsgConfirmed(String time) =>
      'Confirmed: $time';
  @override
  String timePickerMsgScroll(String time) =>
      'Scroll→ $time';
  @override
  String timePickerMsgRange(String start,
          String end) =>
      '$start → $end';

  @override
  String get avatarTitle =>
      'SAvatar';
  @override
  String get avatarSectionBasic =>
      'Basic';
  @override
  String get avatarSectionType =>
      'Type';
  @override
  String get avatarSectionAutoset =>
      'Autoset Font Size';
  @override
  String get avatarSectionFallback =>
      'Fallback';
  @override
  String get avatarSectionBadge =>
      'With Badge';
  @override
  String get avatarSectionGroup =>
      'Avatar.Group';
  @override
  String get avatarBtnChangeUser =>
      'Change User';
  @override
  String get avatarBtnChangeGap =>
      'Change Gap';

  @override
  String get sliderDesc =>
      'A thumb-based slider for selecting a value or range on a continuous or stepped scale. Supports single and range variants, marks, vertical orientation, and custom colors.';
  @override
  String get sliderTip1 =>
      'For setting a numeric value the user can drag, like volume or brightness.';
  @override
  String get sliderTip2 =>
      'When choosing a min/max range (e.g. price filter).';
  @override
  String get sliderTip3 =>
      'For stepped increments (e.g. 0, 25, 50, 75, 100%).';
  @override
  String get sliderSectionBasic =>
      'Basic Single Slider';
  @override
  String get sliderSectionRange =>
      'Range Slider';
  @override
  String get sliderSectionStepped =>
      'Stepped (Discrete)';
  @override
  String get sliderSectionMarks =>
      'With Marks';
  @override
  String sliderLabelValue(num value) =>
      'Value: $value%';
  @override
  String sliderLabelRange(num start,
          num end) =>
      'Range: $start% – $end%';
  @override
  String sliderLabelStep(num step,
          num max) =>
      'Step: $step of $max';

  @override
  String get stepsDesc =>
      'A progress steps component that guides users through sequential processes. Supports horizontal and vertical orientations, clickable steps, and status overrides.';
  @override
  String get stepsTip1 =>
      'For multi-step wizards (checkout, onboarding, form completion).';
  @override
  String get stepsTip2 =>
      'To show progress through a sequence of tasks.';
  @override
  String get stepsTip3 =>
      'When you want users to understand where they are in a workflow.';
  @override
  String get stepsSectionHorizontal =>
      'Horizontal Steps';
  @override
  String get stepsSectionVertical =>
      'Vertical Steps';
  @override
  String get stepsSectionError =>
      'Error Status';
  @override
  String get stepsSectionClickable =>
      'Clickable Steps';
  @override
  String get stepsBtnPrevious =>
      'Previous';
  @override
  String get stepsBtnNext =>
      'Next';
  @override
  String get stepsLabelOrderPlaced =>
      'Order Placed';
  @override
  String get stepsDescOrderReceived =>
      'Your order was received';
  @override
  String get stepsLabelProcessing =>
      'Processing';
  @override
  String get stepsDescPrepared =>
      'Being prepared';
  @override
  String get stepsLabelShipped =>
      'Shipped';
  @override
  String get stepsDescOnWay =>
      'On its way';
  @override
  String get stepsLabelDelivered =>
      'Delivered';
  @override
  String get stepsDescEnjoy =>
      'Enjoy!';
  @override
  String get stepsLabelStep1 =>
      'Step 1';
  @override
  String get stepsDescCreateAccount =>
      'Create your account';
  @override
  String get stepsLabelStep2 =>
      'Step 2';
  @override
  String get stepsDescSetProfile =>
      'Set up your profile';
  @override
  String get stepsLabelStep3 =>
      'Step 3';
  @override
  String get stepsDescExplore =>
      'Explore features';
  @override
  String get stepsLabelPlaced =>
      'Placed';

  @override
  String get qrcodeDesc =>
      'A QR code generator component built on top of `qr_flutter`. Supports custom size, colors, icons, bordered style, and status overlays (expired, loading, scanned).';
  @override
  String get qrcodeTip1 =>
      'For displaying payment or app-sharing QR codes.';
  @override
  String get qrcodeTip2 =>
      'When you need a scannable QR that shows a loading or expired state.';
  @override
  String get qrcodeTip3 =>
      'For embedding a logo or icon inside the QR code.';
  @override
  String get qrcodeSectionBasic =>
      'Basic QR Code';
  @override
  String get qrcodeSectionColor =>
      'Custom Color';
  @override
  String get qrcodeSectionIcon =>
      'With Icon';
  @override
  String get qrcodeSectionExpired =>
      'Status: Expired';
  @override
  String get qrcodeSectionScanned =>
      'Status: Scanned';

   @override
  String get alertTitle =>
      'SAlert';
  @override
  String get alertSectionDescription =>
      'Description';
  @override
  String get alertSectionIcon =>
      'Icon';
  @override
  String get alertSectionClosable =>
      'Closable';
  @override
  String get alertSectionAction =>
      'Action';
  @override
  String get alertSectionBanner =>
      'Banner';
  @override
  String get alertSectionCustomIcon =>
      'Custom Icon';
  @override
  String get alertSectionSmoothClose =>
      'Smooth Close';
  @override
  String get alertSectionCustomizability =>
      'Customizability';
  @override
  String get alertWarningTitle =>
      'Warning Title';
  @override
  String get alertSuccessTitle =>
      'Success Title';
  @override
  String get alertInfoTitle =>
      'Info Title';
  @override
  String get alertErrorTitle =>
      'Error Title';

  @override
  String get alertSuccessText =>
      'Success Text';
  @override
  String get alertInfoText =>
      'Info Text';
  @override
  String get alertWarningText =>
      'Warning Text';
  @override
  String get alertErrorText =>
      'Error Text';
  @override
  String get alertSuccessDesc =>
      'Success Description Success Description Success Description';
  @override
  String get alertInfoDesc =>
      'Info Description Info Description Info Description Info Description';
  @override
  String get alertWarningDesc =>
      'Warning Description Warning Description Warning Description Warning Description';
  @override
  String get alertErrorDesc =>
      'Error Description Error Description Error Description Error Description';
  @override
  String get alertSuccessTips =>
      'Success Tips';
  @override
  String get alertInfoNotes =>
      'Informational Notes';
  @override
  String get alertWarning =>
      'Warning';
  @override
  String get alertError =>
      'Error';
  @override
  String get alertDetailedSuccess =>
      'Detailed description and advice about successful copywriting.';
  @override
  String get alertAdditionalInfo =>
      'Additional description and information about copywriting.';
  @override
  String get alertWarningNotice =>
      'This is a warning notice about copywriting.';
  @override
  String get alertErrorMessage =>
      'This is an error message about copywriting.';
  @override
  String get alertClosedWarning =>
      'Warning alert closed';
  @override
  String get alertClosedSuccess =>
      'Success alert closed';
  @override
  String get alertClosedInfo =>
      'Info alert closed';
  @override
  String get alertClosedError =>
      'Error alert closed';
  @override
  String get alertBtnUndo =>
      'UNDO';
  @override
  String get alertBtnDetail =>
      'Detail';
  @override
  String get alertBtnDone =>
      'Done';
  @override
  String get alertBtnAccept =>
      'Accept';
  @override
  String get alertBtnDecline =>
      'Decline';
  @override
  String get alertClosedMsg =>
      'Closed! Tap the button below to re-show.';
  @override
  String get alertBtnReshow =>
      'Re-show Alert';
  @override
  String get alertCustomTitle =>
      'Fully Custom Alert';
  @override
  String get alertCustomDesc =>
      'Purple theme with custom border, radius, and styles.';
  @override
  String get alertConstrainedTitle =>
      'Custom Size Constraint';
  @override
  String get alertConstrainedDesc =>
      'constrained to 400 px max width.';
  @override
  String get alertBtnLearnMore =>
      'Learn more';

  @override
  String get dialogDesc =>
      'A highly customizable dialog with support for multiple animations and background effects. Use SDialog.show() for a convenient static factory, or construct SDialog directly.';
  @override
  String get dialogTip1 =>
      'For confirmation prompts before irreversible actions.';
  @override
  String get dialogTip2 =>
      'To show forms or detail content that require user focus.';
  @override
  String get dialogTip3 =>
      'For alerts or informational messages that block background interaction.';
  @override
  String get dialogSectionConfirm =>
      'Confirmation Dialog';
  @override
  String get dialogSectionContent =>
      'Dialog with Content';
  @override
  String get dialogSectionInfo =>
      'Info Dialog with Icon';
  @override
  String get dialogTitleDelete =>
      'Delete Item';
  @override
  String get dialogDescDelete =>
      'This action cannot be undone. Are you sure you want to delete?';
  @override
  String get dialogBtnOpenConfirm =>
      'Open Confirmation';
  @override
  String get dialogTitleEditProfile =>
      'Edit Profile';
  @override
  String get dialogLabelFullName =>
      'Full name';
  @override
  String get dialogLabelEmail =>
      'Email address';
  @override
  String get dialogBtnOpenForm =>
      'Open Form Dialog';
  @override
  String get dialogTitleInfo =>
      'Information';
  @override
  String get dialogDescSession =>
      'Your session will expire in 5 minutes. Please save your work.';
  @override
  String get dialogBtnGotIt =>
      'Got it';
  @override
  String get dialogBtnOpenInfo =>
      'Open Info Dialog';

  @override
  String get toastDesc =>
      'A brief notification overlay that slides in from the top of the screen. ⚠️ Note: SToast is deprecated. Prefer using SSonner for all new toast notifications.\n\nSToast is still usable for backward compatibility — it supports default and destructive variants.';
  @override
  String get toastTip1 =>
      'For quick top-bar notifications shown with minimal user disruption.';
  @override
  String get toastTip2 =>
      'Use SSonner instead for new code — it supports more variants and stacking.';
  @override
  String get toastSectionDefault =>
      'Default Toast';
  @override
  String get toastSectionTitle =>
      'With Title';
  @override
  String get toastSectionDestructive =>
      'Destructive Variant';
  @override
  String get toastSectionRecommendation =>
      'Use SSonner Instead';
  @override
  String get toastLabelMessage =>
      'This is a toast message!';
  @override
  String get toastBtnShow =>
      'Show Toast';
  @override
  String get toastLabelSuccess =>
      'Success!';
  @override
  String get toastLabelSaved =>
      'Your changes have been saved.';
  @override
  String get toastBtnShowWithTitle =>
      'Show with title';
  @override
  String get toastLabelError =>
      'Error';
  @override
  String get toastLabelWrong =>
      'Something went wrong. Please try again.';
  @override
  String get toastBtnShowError =>
      'Show error toast';
  @override
  String get toastRecommendationText =>
      'SSonner supports success, error, warning, info variants and action buttons — making it the preferred toast system in SDesign.';

  @override
  String get sonnerDesc =>
      'A toast notification system inspired by the Sonner library. Shows stacked, auto-dismissing notifications. Supports success, error, warning, and info variants.';
  @override
  String get sonnerTip1 =>
      'To provide feedback on async operations (saved, deleted, error).';
  @override
  String get sonnerTip2 =>
      "For non-intrusive notifications that don't block user flow.";
  @override
  String get sonnerTip3 =>
      'When multiple sequential notifications may arrive.';
  @override
  String get sonnerSectionVariants =>
      'Variants';
  @override
  String get sonnerSectionConfig =>
      'Via SSonnerConfig';
  @override
  String get sonnerSectionAction =>
      'With Action Button';
  @override
  String get sonnerSectionPosition =>
      'Position: Top';
  @override
  String get sonnerSectionReplace =>
      'Replace Instead of Stack';
  @override
  String get sonnerSectionShadow =>
      'Flat Toast (No Shadow)';
  @override
  String get sonnerLabelSuccess =>
      'Success';
  @override
  String get sonnerLabelError =>
      'Error';
  @override
  String get sonnerLabelWarning =>
      'Warning';
  @override
  String get sonnerLabelInfo =>
      'Info';
  @override
  String get sonnerLabelMsgSaved =>
      'Changes saved!';
  @override
  String get sonnerLabelMsgUploaded =>
      'File uploaded successfully.';
  @override
  String get sonnerLabelTitleUpload =>
      'Upload complete';
  @override
  String get sonnerBtnShowWithTitle =>
      'Show with title';
  @override
  String get sonnerLabelMsgArchived =>
      'Email archived';
  @override
  String get sonnerBtnShowWithAction =>
      'Show with action';
  @override
  String get sonnerLabelMsgTop =>
      'This appears at the top';
  @override
  String get sonnerBtnShowAtTop =>
      'Show at top';
  @override
  String get sonnerLabelMsgReplaced =>
      'Replaced existing toasts!';
  @override
  String get sonnerBtnShowReplace =>
      'Show & Replace';
  @override
  String get sonnerLabelMsgNoShadow =>
      'I have no shadow!';
  @override
  String get sonnerBtnShowFlat =>
      'Show Flat Toast';
  @override
  String sonnerLabelNotify(String variant) =>
      '$variant notification';

  @override
  String get floatingTitle =>
      'Floating Panel Demo';
  @override
  String get floatingLabelActionCompleted =>
      'Action Completed!';
  @override
  String get floatingBtnOk =>
      'OK';
  @override
  String get floatingTitleAdvanced =>
      'Advanced Settings';
  @override
  String get floatingLabelUsername =>
      'Username';
  @override
  String get floatingLabelPassword =>
      'Password';
  @override
  String get floatingBtnCancel =>
      'Cancel';
  @override
  String get floatingBtnSave =>
      'Save';
  @override
  String get floatingMsgSettingsSaved =>
      'Settings saved!';
  @override
  String get floatingTitleSpecialOffer =>
      'Special Offer!';
  @override
  String get floatingDescSpecialOffer =>
      'Get 50% off your next purchase. Limited time only!';
  @override
  String get floatingBtnMaybeLater =>
      'Maybe Later';
  @override
  String get floatingBtnClaimOffer =>
      'Claim Offer';
  @override
  String get floatingMsgOfferClaimed =>
      'Offer claimed!';
  @override
  String get floatingBtnShowSimple =>
      'Show Simple Panel';
  @override
  String get floatingBtnShowAdvanced =>
      'Show Advanced Panel';
  @override
  String get floatingBtnShowCustom =>
      'Show Custom Bottom Panel';

  @override
  String get progressDesc =>
      'A progress indicator component supporting line, circle, and dashboard layouts. Takes `percent` (0–100) and an optional `status` for success/error coloring.';
  @override
  String get progressTip1 =>
      'For uploads, downloads, or task completion percentages.';
  @override
  String get progressTip2 =>
      'As a circular progress widget on dashboards.';
  @override
  String get progressTip3 =>
      'When a dashboard-style gauge is needed.';
  @override
  String get progressSectionLine =>
      'Line Progress';
  @override
  String get progressSectionCircle =>
      'Circle Progress';
  @override
  String get progressSectionStatus =>
      'Status Variants';
  @override
  String get progressSectionDashboard =>
      'Dashboard Style';
  @override
  String get progressBtnDecrease =>
      '- 10%';
  @override
  String get progressBtnIncrease =>
      '+ 10%';

  @override
  String get cardDesc =>
      'A flexible surface container that groups related content and actions. Supports hover effects, custom headers, footers, cover images, and clickable interactions.';
  @override
  String get cardTip1 =>
      'To display grouped content such as user profiles, articles, or products.';
  @override
  String get cardTip2 =>
      'As the primary surface in list or grid layouts.';
  @override
  String get cardTip3 =>
      'For dashboard widgets, statistics displays, or settings panels.';
  @override
  String get cardSectionBasic =>
      'Basic Card';
  @override
  String get cardSectionHeader =>
      'Card with Header Trailing';
  @override
  String get cardSectionInteractivity =>
      'Hoverable / Clickable';
  @override
  String get cardSectionVariants =>
      'Variants';
  @override
  String get cardSectionGrid =>
      'Card Grid';
  @override
  String get cardLabelTitle =>
      'Card Title';
  @override
  String get cardLabelBasicBody =>
      'This is a basic card. It can contain any widget — text, images, buttons, or entire layouts.';
  @override
  String get cardLabelStats =>
      'Monthly Stats';
  @override
  String get cardLabelUsers =>
      'Users';
  @override
  String get cardLabelRevenue =>
      'Revenue';
  @override
  String get cardLabelOrders =>
      'Orders';
  @override
  String get cardLabelClickMe =>
      'Click Me';
  @override
  String get cardLabelClickableBody =>
      'This card is clickable. Hover over it to see the effect.';
  @override
  String get cardLabelElevated =>
      'Elevated (default)';
  @override
  String get cardLabelOutlined =>
      'Outlined';
  @override
  String get cardLabelFilled =>
      'Filled';
  @override
  String get cardLabelShadow =>
      'Shadow card';
  @override
  String get cardLabelBorder =>
      'Border card';
  @override
  String get cardLabelSurface =>
      'Surface-fill card';
  @override
  String cardLabelItem(int index) =>
      'Item $index';

  @override
  String get listTileDesc =>
      'A list tile component for displaying rows of content with consistent leading icons, title, subtitle, and trailing widgets. Supports grouped and standalone layouts.';
  @override
  String get listTileTip1 =>
      'To build list-based navigation menus or settings screens.';
  @override
  String get listTileTip2 =>
      'To display structured data rows with consistent formatting.';
  @override
  String get listTileTip3 =>
      'When items need a leading icon and an optional trailing action.';
  @override
  String get listTileSectionBasic =>
      'Basic List Tile';
  @override
  String get listTileSectionGrouped =>
      'Grouped List';
  @override
  String get listTileSectionSelectable =>
      'Selectable Tiles';
  @override
  String get listTileLabelName =>
      'John Doe';
  @override
  String get listTileLabelRole =>
      'Software Engineer';
  @override
  String get listTileLabelNotifications =>
      'Notifications';
  @override
  String get listTileLabelPrivacy =>
      'Privacy';
  @override
  String get listTileLabelLanguage =>
      'Language';
  @override
  String get listTileLabelInbox =>
      'Inbox';
  @override
  String get listTileLabelSent =>
      'Sent';
  @override
  String get listTileLabelDrafts =>
      'Drafts';
  @override
  String get listTileLabelSpam =>
      'Spam';

  @override
  String get tabsDesc =>
      'A tab navigation component for switching between multiple views or content sections. Supports line, card and editable tab types, plus top/bottom/left/right positions.';
  @override
  String get tabsTip1 =>
      'When you need to partition content into related, peer-level sections.';
  @override
  String get tabsTip2 =>
      'For content-heavy screens like product detail pages or profile views.';
  @override
  String get tabsTip3 =>
      'When left/right sidebar navigation supplements a main view.';
  @override
  String get tabsSectionBasic =>
      'Basic Tabs';
  @override
  String get tabsSectionIcons =>
      'Tabs with Icons';
  @override
  String get tabsSectionCard =>
      'Card Type';
  @override
  String get tabsLabelOverview =>
      'Overview';
  @override
  String get tabsLabelDetails =>
      'Details';
  @override
  String get tabsLabelReviews =>
      'Reviews';
  @override
  String get tabsContentOverview =>
      'Overview content';
  @override
  String get tabsContentDetails =>
      'Details content';
  @override
  String get tabsContentReviews =>
      'Reviews content';
  @override
  String get tabsLabelHome =>
      'Home';
  @override
  String get tabsLabelSearch =>
      'Search';
  @override
  String get tabsLabelProfile =>
      'Profile';
  @override
  String get tabsLabelCardA =>
      'Card A';
  @override
  String get tabsLabelCardB =>
      'Card B';
  @override
  String get tabsLabelCardC =>
      'Card C';
  @override
  String get tabsContentCardA =>
      'Card A content';
  @override
  String get tabsContentCardB =>
      'Card B content';
  @override
  String get tabsContentCardC =>
      'Card C content';
  @override
  String get tabsTitleShowcase =>
      'Tabs Showcase';
  @override
  String get tabsControlLabelType =>
      'Type';
  @override
  String get tabsControlLabelPosition =>
      'Position';
  @override
  String get tabsControlLabelSize =>
      'Size';
  @override
  String get tabsControlLabelCentered =>
      'Centered: ';
  @override
  String get tabsControlLabelMany =>
      'Many Tabs (List): ';
  @override
  String tabsLabelTab(int index) =>
      'Tab $index';
  @override
  String get tabsLabelShort =>
      'Short';
  @override
  String get tabsLabelMedium =>
      'Medium Length';
  @override
  String get tabsLabelCard =>
      'Card Style';
  @override
  String get tabsLabelDisabled =>
      'Disabled';
  @override
  String get tabsContentShort =>
      'Short Label Tab (Edge to Edge BG)';
  @override
  String get tabsContentMedium =>
      'Medium Length Label Tab';
  @override
  String get tabsContentPadding =>
      'This tab has manual padding added.';
  @override
  String get tabsLabelNestedCard =>
      'Nested Card';
  @override
  String get tabsLabelComposition =>
      'Demonstrating composition';
  @override
  String get tabsLabelDisabledContent =>
      'Disabled Tab';
  @override
  String tabsLabelListItem(int index) =>
      'List Item $index';
  @override
  String tabsLabelInTab(int index) =>
      'in Tab $index';
  @override
  String get tabsTooltipExtra =>
      'Extra Action';

  @override
  String get paginationTitle =>
      'SPagination';
  @override
  String get paginationHeader1 =>
      '1. Basic';
  @override
  String get paginationDesc1 =>
      'Basic pagination with 50 total items.';
  @override
  String get paginationHeader2 =>
      '2. More Pages — Ellipsis';
  @override
  String get paginationDesc2 =>
      'With 500 items, ellipsis (•••) buttons appear. Tap them to jump ±5 pages.';
  @override
  String get paginationHeader3 =>
      '3. Size Changer';
  @override
  String get paginationDesc3 =>
      'showSizeChanger adds a dropdown to pick 10/20/50/100 items per page.';
  @override
  String get paginationHeader4 =>
      '4. Quick Jumper';
  @override
  String get paginationDesc4 =>
      'showQuickJumper adds a "Go to" field. Type a page number and press Enter.';
  @override
  String get paginationHeader5 =>
      '5. Size Variants — Small';
  @override
  String get paginationDesc5 =>
      'size: SPaginationSize.small produces compact 24px items.';
  @override
  String get paginationHeader5b =>
      '5b. Size Variants — Large';
  @override
  String get paginationDesc5b =>
      'size: SPaginationSize.large produces 40px items.';
  @override
  String get paginationHeader6 =>
      '6. Simple Mode';
  @override
  String get paginationDesc6 =>
      'simple: true shows current/total input instead of page buttons.';
  @override
  String get paginationHeader7 =>
      '7. Controlled Mode';
  @override
  String get paginationDesc7 =>
      'Provide current + onChange to fully control the page from parent state.';
  @override
  String get paginationHeader8 =>
      '8. showTotal';
  @override
  String get paginationDesc8 =>
      'showTotal receives (total, [first, last]) — build any label.';
  @override
  String get paginationHeader9 =>
      '9. Custom itemRender';
  @override
  String get paginationDesc9 =>
      'itemRender replaces prev / next buttons with custom widgets.';
  @override
  String get paginationHeader10 =>
      '10. Alignment';
  @override
  String get paginationDesc10 =>
      'align: start / center / end.';
  @override
  String get paginationHeader11 =>
      '11. All Features Combined';
  @override
  String get paginationDesc11 =>
      'showSizeChanger + showQuickJumper + showTotal together.';
  @override
  String get paginationHeader12 =>
      '12. Open Customizability';
  @override
  String get paginationDesc12 =>
      'Every visual token can be overridden per-instance.';
  @override
  String paginationLabelTotal(int total) =>
      'Total $total items';
  @override
  String paginationLabelRange(
          int first,
          int last,
          int total) =>
      '$first–$last of $total items';
  @override
  String paginationLabelState(int page) =>
      'State: page $page';
  @override
  String get paginationLabelPrevious =>
      '‹ Previous';
  @override
  String get paginationLabelNext =>
      'Next ›';

  @override
  String get scaffoldTitle =>
      'SScaffold Slivers Example';
  @override
  String get scaffoldDesc =>
      'This demonstrates SScaffold with CustomScrollView.';
  @override
  String get scaffoldStickyHeader =>
      'Sticky Header';
  @override
  String scaffoldLabelHItem(int index) =>
      'H-Item $index';
  @override
  String scaffoldLabelItem(int index) =>
      'Item $index';
  @override
  String scaffoldLabelSubtitle(int index) =>
      'Subtitle $index';
  @override
  String get scaffoldLabelFAB =>
      'FAB';

  @override
  String get navTitle =>
      'Animated Bottom Navigation';
  @override
  String get navLabelHome =>
      'Home';
  @override
  String get navLabelLikes =>
      'Likes';
  @override
  String get navLabelSearch =>
      'Search';
  @override
  String get navLabelProfile =>
      'Profile';

  @override
  String get inputTitleShowcase =>
      'SInputField Showcase';
  @override
  String get inputSectionDefault =>
      'Default Input Field';
  @override
  String get inputSectionPassword =>
      'Password Field';
  @override
  String get inputSectionIcons =>
      'Input with Icons';
  @override
  String get inputSectionDatePicker =>
      'Date Picker Input';
  @override
  String get inputSectionRealWorld =>
      'Real World Features';
  @override
  String get inputHintNumber =>
      'Enter number';
  @override
  String get inputHintPassword =>
      'Enter password';
  @override
  String get inputHintSearch =>
      'Search';
  @override
  String get inputHintDate =>
      'Select date';
  @override
  String get inputHintEmail =>
      'Enter your email';
  @override
  String get inputHintCustom =>
      'Custom';
  @override
  String get inputHintCard =>
      '0000 0000 0000 0000';
  @override
  String get inputLabelCard =>
      'Card Number';
  @override
  String get inputHelperCard =>
      'We do not store your card details';
  @override
  String get inputBtnSubmit =>
      'Submit';
  @override
  String get inputLabelPrice =>
      'Price';
  @override
  String get inputHintPrice =>
      '0.00';
  @override
  String get inputHelperPrice =>
      'Enter the price in USD';
  @override
  String get inputLabelStatus =>
      'Server Status';
  @override
  String get inputHintStatus =>
      'Checking...';
  @override
  String get inputHelperStatus =>
      'Validating connection...';
  @override
  String get inputLabelApiKey =>
      'API Key';
  @override
  String get inputErrorApiKey =>
      'Invalid API Key (Server Error)';
  @override
  String get inputErrorEmpty =>
      'This field cannot be empty.';
  @override
  String get inputErrorNumber =>
      'Please enter a valid number';

  @override
  String get inputSectionCard =>
      'Formatted Input (Credit Card)';

  @override
  String get inputSectionCustom =>
      'Input Customization';
}

/// French implementation of [SLocalizations].
class SLocalizationsFr
    extends SLocalizations {
  const SLocalizationsFr()
      : super('fr');

  @override
  String get ok =>
      'OK';
  @override
  String get cancel =>
      'Annuler';
  @override
  String get done =>
      'Terminé';
  @override
  String get close =>
      'Fermer';
  @override
  String get search =>
      'Rechercher';
  @override
  String get searchPlaceholder =>
      'Rechercher...';
  @override
  String get selectPlaceholder =>
      'Sélectionner';
  @override
  String get noData =>
      'Aucune donnée';
  @override
  String get loading =>
      'Chargement...';

  @override
  String get selectDate =>
      'Sélectionner une date';
  @override
  String get selectTime =>
      'Sélectionner une heure';
  @override
  String get startDate =>
      'Date de début';
  @override
  String get endDate =>
      'Date de fin';
  @override
  String get startTime =>
      'Heure de début';
  @override
  String get endTime =>
      'Heure de fin';
  @override
  String get hour =>
      'Heure';
  @override
  String get minute =>
      'Minute';
  @override
  String get second =>
      'Seconde';

  @override
  String get previousPage =>
      'Page précédente';
  @override
  String get nextPage =>
      'Page suivante';
  @override
  String get page =>
      'Page';
  @override
  String get of =>
      'sur';

  @override
  String get home =>
      'Accueil';
  @override
  String get inputs =>
      'Entrées';
  @override
  String get display =>
      'Affichage';
  @override
  String get feedback =>
      "Retour d'expérience";
  @override
  String get layout =>
      'Mise en page';

  @override
  String get galleryTitle =>
      'Galerie SDesign';
  @override
  String get themeSwitchLight =>
      'Passer en mode clair';
  @override
  String get themeSwitchDark =>
      'Passer en mode sombre';
  @override
  String get languageSwitch =>
      'Changer de langue';
  @override
  String get sidebarHeader =>
      'SDesign';
  @override
  String get searchComponents =>
      'Rechercher des composants...';
  @override
  String get langEn =>
      'Anglais';
  @override
  String get langFr =>
      'Français';
  @override
  String get langAr =>
      'Arabe';
  @override
  String get langZh =>
      'Chinois';

  @override
  String get compButton =>
      'SButton';
  @override
  String get compCheckbox =>
      'SCheckbox';
  @override
  String get compSwitch =>
      'SSwitch';
  @override
  String get compInput =>
      'SInput';
  @override
  String get compDropdown =>
      'SDropdown';
  @override
  String get compSelect =>
      'SSelect';
  @override
  String get compRate =>
      'SRate';
  @override
  String get compDatePicker =>
      'SDatePicker';
  @override
  String get compTimePicker =>
      'STimePicker';
  @override
  String get compAvatar =>
      'SAvatar';
  @override
  String get compSlider =>
      'SSlider';
  @override
  String get compSteps =>
      'SSteps';
  @override
  String get compQRCode =>
      'SQRCode';
  @override
  String get compAlert =>
      'SAlert';
  @override
  String get compDialog =>
      'SDialog';
  @override
  String get compToast =>
      'SToast';
  @override
  String get compSonner =>
      'SSonner';
  @override
  String get compFloatingPanel =>
      'SFloatingPanel';
  @override
  String get compProgress =>
      'SProgress';
  @override
  String get compProgressLine =>
      'SProgress.line';
  @override
  String get compCard =>
      'SCard';
  @override
  String get compListTile =>
      'SListTile';
  @override
  String get compTabs =>
      'STabs';
  @override
  String get compPagination =>
      'SPagination';
  @override
  String get compScaffold =>
      'SScaffold';
  @override
  String get compScaffoldSlivers =>
      'SScaffold Slivers';
  @override
  String get compBottomNav =>
      'SBottom Navigation';
  @override
  String get compCardBasic =>
      'SCard (Basic)';

  @override
  String get heroTagline =>
      'sDesign v2.0.0 est disponible !';
  @override
  String get heroTitle =>
      'Créez des interfaces époustouflantes avec un minimum de code';
  @override
  String get heroDescription =>
      'Une bibliothèque de composants Flutter robuste et hautement personnalisable '
      "inspirée des meilleurs systèmes de design au monde. Conçue pour le mobile, le web et le bureau.";
  @override
  String get heroGetStarted =>
      'Commencer';
  @override
  String get heroBrowse =>
      'Parcourir les composants';

  @override
  String get featuresTitle =>
      'Pourquoi choisir sDesign ?';
  @override
  String get featCustomTitle =>
      'Personnalisation illimitée';
  @override
  String get featCustomDesc =>
      'Chaque jeton est exposé. Injectez instantanément vos couleurs de marque dans tous les composants à l\'aide de SThemeData.';
  @override
  String get featDarkTitle =>
      'Mode sombre impeccable';
  @override
  String get featDarkDesc =>
      'Les jetons de couleur intelligents garantissent que votre interface est premium et parfaitement équilibrée dans les modes clair et sombre dès la sortie de la boîte.';
  @override
  String get featLocTitle =>
      'Localisation native';
  @override
  String get featLocDesc =>
      "Parle nativement la langue de vos utilisateurs. Prise en charge intégrée de plusieurs langues, y compris le RTL, sans tracas supplémentaire.";
  @override
  String get featAnimTitle =>
      'Micro-interactions';
  @override
  String get featAnimDesc =>
      'Physique de ressort délicieuse, états de survol fluides et transitions magnifiques rendent votre application incroyablement réactive.';

  @override
  String get showcaseTitle =>
      'Aperçu interactif en direct';
  @override
  String get showcaseNotifyBtn =>
      'Afficher la notification';
  @override
  String get showcaseNotifySuccess =>
      'Parfait ! Vous avez déclenché un toast de succès.';
  @override
  String get showcaseEmailLabel =>
      'Adresse e-mail';
  @override
  String get showcaseEmailHint =>
      'vous@exemple.com';
  @override
  String get showcaseDateHint =>
      'Choisir une date';
  @override
  String get showcaseDeleteBtn =>
      'Supprimer le compte';

  @override
  String get footerIntegrate =>
      'Quelques minutes pour intégrer';
  @override
  String get footerBuiltBy =>
      'Créé avec passion par ';
  @override
  String get footerLicense =>
      '. Sous licence MIT.';

  @override
  String get demoWhenToUse =>
      'Quand utiliser';
  @override
  String get demoShowCode =>
      'Afficher le code';
  @override
  String get demoHideCode =>
      'Masquer le code';
  @override
  String get demoVariants =>
      'Variantes';
  @override
  String get demoSizes =>
      'Tailles';
  @override
  String get demoStates =>
      'États';
  @override
  String get demoBasicUsage =>
      'Utilisation de base';
  @override
  String get demoLoadingState =>
      'État de chargement';
  @override
  String get demoWithIcons =>
      'Avec des icônes';
  @override
  String get demoDisabled =>
      'Désactivé';
  @override
  String get demoFullWidth =>
      'Pleine largeur';
  @override
  String get demoUndo =>
      'Annuler';
  @override
  String get demoDelete =>
      'Supprimer';
  @override
  String get demoCancel =>
      'Annuler';
  @override
  String get demoSave =>
      'Enregistrer';
  @override
  String get demoHideSeconds =>
      'Masquer les secondes';
  @override
  String get demoStatus =>
      'Statut';

  @override
  String get buttonDesc =>
      'Un composant bouton polyvalent prenant en charge plusieurs variantes, tailles, états et icônes. SButton suit des principes de conception modernes — chaque interaction a une réponse visuelle claire.';
  @override
  String get buttonTip1 =>
      'Utilisez la variante par défaut pour les actions primaires (ex: Envoyer, Enregistrer).';
  @override
  String get buttonTip2 =>
      'Utilisez les boutons de contour pour les actions secondaires ou alternatives.';
  @override
  String get buttonTip3 =>
      'Utilisez les boutons destructeurs pour les actions de suppression/irréversibles.';
  @override
  String get buttonTip4 =>
      "Utilisez des boutons fantômes ou des liens pour des actions en ligne à faible intensité.";
  @override
  String get buttonLabelDefault =>
      'Par défaut';
  @override
  String get buttonLabelOutline =>
      'Contour';
  @override
  String get buttonLabelSecondary =>
      'Secondaire';
  @override
  String get buttonLabelGhost =>
      'Fantôme';
  @override
  String get buttonLabelDestructive =>
      'Destructeur';
  @override
  String get buttonLabelLink =>
      'Lien';
  @override
  String get buttonLabelLarge =>
      'Grand';
  @override
  String get buttonLabelSmall =>
      'Petit';
  @override
  String get buttonLabelDownload =>
      'Télécharger';
  @override
  String get buttonLabelNext =>
      'Suivant';
  @override
  String get buttonLabelProcessing =>
      'Traitement...';
  @override
  String get buttonLabelClickToLoad =>
      'Cliquez pour charger';
  @override
  String get buttonLabelDisabled =>
      'Désactivé';
  @override
  String get buttonLabelDisabledOutline =>
      'Contour désactivé';
  @override
  String get buttonLabelFullWidth =>
      'Bouton pleine largeur';

  @override
  String get checkboxDesc =>
      'Un composant de case à cocher pour sélectionner une ou plusieurs options. Prend en charge les états coché, décoché et indéterminé.';
  @override
  String get checkboxTip1 =>
      "Lorsque l'utilisateur doit sélectionner un ou plusieurs éléments dans une liste.";
  @override
  String get checkboxTip2 =>
      'Pour activer ou désactiver un paramètre booléen.';
  @override
  String get checkboxTip3 =>
      "Dans le cadre d'un formulaire où une multi-sélection est requise.";
  @override
  String get checkboxLabelAgreed =>
      'Accepté';
  @override
  String get checkboxLabelPleaseAgree =>
      'Veuillez accepter';
  @override
  String get checkboxSectionIndeterminate =>
      'Indéterminé / Tout sélectionner';
  @override
  String get checkboxLabelSelectAll =>
      'Tout sélectionner';
  @override
  String get checkboxLabelOption =>
      'Option';
  @override
  String get checkboxLabelCheckedDisabled =>
      'Coché & Désactivé';
  @override
  String get checkboxLabelUncheckedDisabled =>
      'Décoché & Désactivé';

  @override
  String get switchDesc =>
      'Un composant de commutation pour les états binaires on/off. SSwitch communique visuellement l’état plus clairement qu’une case à cocher dans les interfaces de type paramètres.';
  @override
  String get switchTip1 =>
      'Pour activer ou désactiver un seul paramètre ou une fonctionnalité immédiatement (aucune confirmation requise).';
  @override
  String get switchTip2 =>
      'Dans les écrans de paramètres où l’espace compact et l’état marche/arrêt clair comptent.';
  @override
  String get switchTip3 =>
      "Lorsque l'effet du basculement est immédiatement reflété dans l'interface utilisateur.";
  @override
  String get switchSectionBasic =>
      'Bascule de base';
  @override
  String get switchStatusEnabled =>
      'Activé';
  @override
  String get switchStatusDisabled =>
      'Désactivé';
  @override
  String get switchSectionSettings =>
      'Modèle de liste de paramètres';
  @override
  String get switchLabelWifi =>
      'Wi-Fi';
  @override
  String get switchLabelBluetooth =>
      'Bluetooth';
  @override
  String get switchLabelNotifications =>
      'Notifications';
  @override
  String get switchLabelEnabledDisabled =>
      'Activé & Désactivé';
  @override
  String get switchLabelDisabledOff =>
      'Désactivé & Éteint';

  @override
  String get inputDesc =>
      'Un champ de saisie de texte prenant en charge les icônes de préfixe/suffixe, les modules complémentaires avant/après, les états de validation (erreur, avertissement), le bouton d’effacement et plusieurs tailles.';
  @override
  String get inputTip1 =>
      "Lors de la collecte de données textuelles de l'utilisateur dans un formulaire.";
  @override
  String get inputTip2 =>
      'Pour les champs de recherche, les filtres et les écrans de saisie de données.';
  @override
  String get inputTip3 =>
      "Lorsque vous avez besoin d'un retour de validation intégré (états d'erreur, d'avertissement).";
  @override
  String get inputLabelSearch =>
      'Rechercher...';
  @override
  String get inputLabelPassword =>
      'Entrer le mot de passe';
  @override
  String get inputLabelAmount =>
      'montant';
  @override
  String get inputLabelEmailError =>
      'Email valide requis';
  @override
  String get inputLabelPasswordWarning =>
      'Le mot de passe doit être plus fort';
  @override
  String get inputLabelLarge =>
      'Entrée large';
  @override
  String get inputLabelMiddle =>
      'Entrée moyenne (par défaut)';
  @override
  String get inputLabelSmall =>
      'Petite entrée';
  @override
  String get inputLabelDisabled =>
      'Désactivé';
  @override
  String get inputLabelReadOnly =>
      'Ne peut pas être modifié';
  @override
  String get inputLabelTypeClear =>
      'Tapez quelque chose puis effacez-le';
  @override
  String get inputLabelMessage =>
      'Écrivez votre message...';
  @override
  String get inputSectionPrefixSuffix =>
      'Avec préfixe et suffixe';
  @override
  String get inputSectionValidation =>
      'États de validation';
  @override
  String get inputSectionDisabled =>
      'Désactivé et lecture seule';
  @override
  String get inputSectionClear =>
      'Autoriser l’effacement';
  @override
  String get inputSectionTextArea =>
      'Zone de texte';

  @override
  String get selectDescExtended =>
      'Un composant de menu déroulant de sélection puissant prenant en charge la sélection simple, la multi-sélection, le mode tags, la recherche/filtre, les éléments groupés et les icônes personnalisées.';
  @override
  String get selectTip1 =>
      'Remplacement des éléments <select> natifs par une expérience utilisateur plus riche.';
  @override
  String get selectTip2 =>
      'Sélection d’un ou plusieurs éléments dans une longue liste.';
  @override
  String get selectTip3 =>
      'Lorsque vous avez besoin de menus déroulants interrogeables pour les entrées de formulaire.';
  @override
  String get selectLabelPickFruit =>
      'Sélectionner un fruit';
  @override
  String get selectLabelSearchFruit =>
      'Rechercher un fruit...';
  @override
  String get selectLabelPickMultiple =>
      'Choisir plusieurs fruits';
  @override
  String get selectLabelApple =>
      'Pomme';
  @override
  String get selectLabelBanana =>
      'Banane';
  @override
  String get selectLabelCherry =>
      'Cerise';
  @override
  String get selectLabelDate =>
      'Datte';
  @override
  String get selectLabelElderberry =>
      'Sureau';
  @override
  String get selectLabelDurian =>
      'Durian';
  @override
  String get selectLabelFig =>
      'Figue';
  @override
  String get selectLabelGrape =>
      'Raisin';
  @override
  String get selectLabelTech =>
      'Technologie';
  @override
  String get selectTip4 =>
      'Lorsque la liste déroulante est longue (10+ options) et que le filtrage est utile.';
  @override
  String get selectLabelSearchSelect =>
      'Rechercher et sélectionner...';
  @override
  String get selectSectionWithSearch =>
      'Avec recherche';
  @override
  String get selectSectionSingle =>
      'Sélection unique';
  @override
  String get selectSectionMulti =>
      'Multi-sélection';

  @override
  String get rateDesc =>
      'Un composant d’évaluation par étoiles qui permet aux utilisateurs de donner leur avis sur une échelle numérique. Prend en charge les étoiles pleines, les demi-étoiles, les icônes personnalisées et l’affichage en lecture seule.';
  @override
  String get rateTip1 =>
      'Pour les interfaces d’évaluation de produits, de services ou de contenu.';
  @override
  String get rateTip2 =>
      'Pour recueillir des commentaires qualitatifs sur une échelle.';
  @override
  String get rateTip3 =>
      'Pour afficher une note globale en mode lecture seule.';
  @override
  String rateLabelCurrent(num value) =>
      'Actuel : $value étoiles';
  @override
  String get rateLabel10Scale =>
      'Échelle de 10 étoiles';
  @override
  String get rateSectionBasic =>
      'Évaluation de base';
  @override
  String get rateSectionHalf =>
      'Demi-étoiles';
  @override
  String get rateSectionReadOnly =>
      'Affichage en lecture seule';
  @override
  String get rateSectionCustomCount =>
      'Nombre d’étoiles personnalisé';
  @override
  String get rateDescBasic =>
      'Évaluation par étoiles pleines avec 5 étoiles par défaut.';
  @override
  String get rateDescHalf =>
      'Activez `allowHalf: true` pour une précision de 0,5.';
  @override
  String get rateDescReadOnly =>
      'Passez `disabled: true` pour afficher une évaluation non interactive.';
  @override
  String get rateDescCustomCount =>
      'Modifiez le nombre total d’étoiles avec `count`.';

  @override
  String get datePickerTitle =>
      'Présentation SDatePicker';
  @override
  String get datePickerSectionBasic =>
      'Sélecteur de date de base';
  @override
  String get datePickerSectionDisabled =>
      'Sélecteur de date désactivé';
  @override
  String get datePickerSectionRange =>
      'Sélecteur de plage de dates';
  @override
  String get datePickerSectionMonth =>
      'Sélecteur de mois';
  @override
  String get datePickerSectionYear =>
      'Sélecteur d’année';
  @override
  String get datePickerSectionPresetsDate =>
      'Préréglages de date';
  @override
  String get datePickerSectionPresetsRange =>
      'Préréglages de plage';
  @override
  String get datePickerSectionCustom =>
      'Style personnalisé';
  @override
  String get datePickerLabelToday =>
      'Aujourd’hui';
  @override
  String get datePickerLabelTomorrow =>
      'Demain';
  @override
  String get datePickerLabelNextWeek =>
      'La semaine prochaine';
  @override
  String get datePickerLabelThisWeek =>
      'Cette semaine';
  @override
  String get datePickerLabelLast7Days =>
      '7 derniers jours';
  @override
  String get datePickerLabelNext30Days =>
      '30 prochains jours';
  @override
  String get datePickerLabelCustomTheme =>
      'Thème personnalisé';

  @override
  String get timePickerTitle =>
      'STimePicker';
  @override
  String get timePickerDescBasic =>
      'Sélecteur HH:mm:ss par défaut. Le défilement des colonnes n’est qu’un aperçu. La valeur est validée lorsque vous appuyez sur OK ou fermez le panneau.';
  @override
  String get timePickerDesc12Hour =>
      'use12Hours ajoute une colonne AM/PM. Le format contrôle si les secondes sont affichées.';
  @override
  String get timePickerDescDisabled =>
      'disabled: true grise le champ et empêche l’ouverture du panneau.';
  @override
  String get timePickerDescSize =>
      'size: grand (40 px) / moyen (32 px, par défaut) / petit (24 px).';
  @override
  String get timePickerDescHideSeconds =>
      "format: 'HH:mm' supprime la colonne des secondes du panneau.";
  @override
  String get timePickerDescInterval =>
      'hourStep, minuteStep, secondStep filtrent les éléments de la colonne.';
  @override
  String get timePickerDescAddon =>
      'renderExtraFooter ajoute un widget personnalisé dans le pied de page du panneau, aux côtés des boutons Maintenant et OK intégrés.';
  @override
  String get timePickerLabelCustomFooter =>
      '✏️ Pied de page personnalisé';
  @override
  String get timePickerDescStatus =>
      'status: erreur (bordure rouge) ou avertissement (bordure jaune).';
  @override
  String get timePickerDescSuffixPrefix =>
      'suffixIcon remplace l’icône d’horloge par défaut ; prefix ajoute un widget au début du champ.';
  @override
  String get timePickerDescVariants =>
      'contour (par défaut) / rempli / sans bordure / souligné.';
  @override
  String get timePickerLabelOutlined =>
      'Contour';
  @override
  String get timePickerLabelOutlinedStart =>
      'Contour début';
  @override
  String get timePickerLabelOutlinedEnd =>
      'Contour fin';
  @override
  String get timePickerLabelFilled =>
      'Rempli';
  @override
  String get timePickerLabelFilledStart =>
      'Rempli début';
  @override
  String get timePickerLabelFilledEnd =>
      'Rempli fin';
  @override
  String get timePickerLabelBorderless =>
      'Sans bordure';
  @override
  String get timePickerLabelBorderlessStart =>
      'Sans bordure début';
  @override
  String get timePickerLabelBorderlessEnd =>
      'Sans bordure fin';
  @override
  String get timePickerLabelUnderlined =>
      'Souligné';
  @override
  String get timePickerLabelUnderlinedStart =>
      'Souligné début';
  @override
  String get timePickerLabelUnderlinedEnd =>
      'Souligné fin';
  @override
  String get timePickerDescControlled =>
      'value + onChange donnent au parent le contrôle complet.';
  @override
  String timePickerLabelState(String value) =>
      'État : $value';
  @override
  String get timePickerDescNeedConfirm =>
      'La valeur n’est validée que lorsque l’utilisateur appuie sur le bouton OK.';
  @override
  String get timePickerDescChangeOnScroll =>
      'onChange se déclenche en direct lorsque l’utilisateur change de colonne (needConfirm est faux — par défaut pour changeOnScroll).';
  @override
  String get timePickerDescShowNowFalse =>
      'Masque le raccourci Maintenant du pied de page (reflétant la propriété showNow).';
  @override
  String get timePickerDescRange =>
      'STimeRangePicker affiche deux sélecteurs côte à côte.';
  @override
  String get timePickerHeader12Hour =>
      '2. Horloge 12 heures';
  @override
  String get timePickerHeaderInterval =>
      '6. Options d’intervalle';
  @override
  String get timePickerHeaderAddon =>
      '7. Addon — renderExtraFooter';
  @override
  String get timePickerHeaderVariants =>
      '10. Variantes';
  @override
  String get timePickerHeaderControlled =>
      '11. Mode contrôlé';
  @override
  String get timePickerHeaderNeedConfirm =>
      '12. needConfirm';
  @override
  String get timePickerHeaderChangeOnScroll =>
      '13. changeOnScroll';
  @override
  String get timePickerHeaderShowNowFalse =>
      '14. showNow: false';
  @override
  String get timePickerHeaderRange =>
      '14. Sélecteur de plage horaire';
  @override
  String timePickerMsgTime(String time) =>
      'Heure : $time';
  @override
  String timePickerMsgConfirmed(String time) =>
      'Confirmé : $time';
  @override
  String timePickerMsgScroll(String time) =>
      'Défilement→ $time';
  @override
  String timePickerMsgRange(String start,
          String end) =>
      '$start → $end';

  @override
  String get avatarTitle =>
      'SAvatar';
  @override
  String get avatarSectionBasic =>
      'Base';
  @override
  String get avatarSectionType =>
      'Type';
  @override
  String get avatarSectionAutoset =>
      'Taille de police automatique';
  @override
  String get avatarSectionFallback =>
      'Solution de repli';
  @override
  String get avatarSectionBadge =>
      'Avec Badge';
  @override
  String get avatarSectionGroup =>
      'Avatar.Group';
  @override
  String get avatarBtnChangeUser =>
      'Changer d’utilisateur';
  @override
  String get avatarBtnChangeGap =>
      'Changer l’espace';

  @override
  String get sliderDesc =>
      'Un curseur basé sur le pouce pour sélectionner une valeur ou une plage sur une échelle continue ou échelonnée. Prend en charge les variantes simples et de plage, les marques, l’orientation verticale et les couleurs personnalisées.';
  @override
  String get sliderTip1 =>
      'Pour définir une valeur numérique que l’utilisateur peut faire glisser, comme le volume ou la luminosité.';
  @override
  String get sliderTip2 =>
      'Lors du choix d’une plage min/max (par exemple, filtre de prix).';
  @override
  String get sliderTip3 =>
      'Pour des incréments échelonnés (par exemple, 0, 25, 50, 75, 100 %).';
  @override
  String get sliderSectionBasic =>
      'Curseur simple de base';
  @override
  String get sliderSectionRange =>
      'Curseur de plage';
  @override
  String get sliderSectionStepped =>
      'Échelonné (discret)';
  @override
  String get sliderSectionMarks =>
      'Avec marques';
  @override
  String sliderLabelValue(num value) =>
      'Valeur : $value %';
  @override
  String sliderLabelRange(num start,
          num end) =>
      'Plage : $start % – $end %';
  @override
  String sliderLabelStep(num step,
          num max) =>
      'Étape : $step sur $max';

  @override
  String get stepsDesc =>
      'Un composant d’étapes de progression qui guide les utilisateurs à travers des processus séquentiels. Prend en charge les orientations horizontales et verticales, les étapes cliquables et les surcharges de statut.';
  @override
  String get stepsTip1 =>
      'Pour les assistants multi-étapes (paiement, intégration, remplissage de formulaire).';
  @override
  String get stepsTip2 =>
      'Pour montrer la progression à travers une séquence de tâches.';
  @override
  String get stepsTip3 =>
      'Lorsque vous voulez que les utilisateurs comprennent où ils en sont dans un flux de travail.';
  @override
  String get stepsSectionHorizontal =>
      'Étapes horizontales';
  @override
  String get stepsSectionVertical =>
      'Étapes verticales';
  @override
  String get stepsSectionError =>
      'Statut d’erreur';
  @override
  String get stepsSectionClickable =>
      'Étapes cliquables';
  @override
  String get stepsBtnPrevious =>
      'Précédent';
  @override
  String get stepsBtnNext =>
      'Suivant';
  @override
  String get stepsLabelOrderPlaced =>
      'Commande passée';
  @override
  String get stepsDescOrderReceived =>
      'Votre commande a été reçue';
  @override
  String get stepsLabelProcessing =>
      'Traitement';
  @override
  String get stepsDescPrepared =>
      'En cours de préparation';
  @override
  String get stepsLabelShipped =>
      'Expédié';
  @override
  String get stepsDescOnWay =>
      'En route';
  @override
  String get stepsLabelDelivered =>
      'Livré';
  @override
  String get stepsDescEnjoy =>
      'Profitez-en !';
  @override
  String get stepsLabelStep1 =>
      'Étape 1';
  @override
  String get stepsDescCreateAccount =>
      'Créez votre compte';
  @override
  String get stepsLabelStep2 =>
      'Étape 2';
  @override
  String get stepsDescSetProfile =>
      'Configurez votre profil';
  @override
  String get stepsLabelStep3 =>
      'Étape 3';
  @override
  String get stepsDescExplore =>
      'Explorez les fonctionnalités';
  @override
  String get stepsLabelPlaced =>
      'Passée';

  @override
  String get qrcodeDesc =>
      'Un composant générateur de code QR construit au-dessus de `qr_flutter`. Prend en charge la taille personnalisée, les couleurs, les icônes, le style avec bordure et les superpositions d’état (expiré, chargement, numérisé).';
  @override
  String get qrcodeTip1 =>
      'Pour afficher des codes QR de paiement ou de partage d’application.';
  @override
  String get qrcodeTip2 =>
      'Lorsque vous avez besoin d’un QR scannable qui affiche un état de chargement ou d’expiration.';
  @override
  String get qrcodeTip3 =>
      'Pour intégrer un logo ou une icône à l’intérieur du code QR.';
  @override
  String get qrcodeSectionBasic =>
      'Code QR de base';
  @override
  String get qrcodeSectionColor =>
      'Couleur personnalisée';
  @override
  String get qrcodeSectionIcon =>
      'Avec icône';
  @override
  String get qrcodeSectionExpired =>
      'État : Expiré';
  @override
  String get qrcodeSectionScanned =>
      'État : Numérisé';

  @override
  String get alertTitle =>
      'SAlert';
  @override
  String get alertSectionDescription =>
      'Description';
  @override
  String get alertSectionIcon =>
      'Icône';
  @override
  String get alertSectionClosable =>
      'Fermable';
  @override
  String get alertSectionAction =>
      'Action';
  @override
  String get alertSectionBanner =>
      'Bannière';
  @override
  String get alertSectionCustomIcon =>
      'Icône personnalisée';
  @override
  String get alertSectionSmoothClose =>
      'Fermeture fluide';
  @override
  String get alertSectionCustomizability =>
      'Personnalisation';
  @override
  String get alertWarningTitle =>
      'Titre d\'avertissement';
  @override
  String get alertSuccessTitle =>
      'Titre de succès';
  @override
  String get alertInfoTitle =>
      'Titre d\'information';
  @override
  String get alertErrorTitle =>
      'Titre de l\'erreur';

  @override
  String get alertSuccessText =>
      'Texte de succès';
  @override
  String get alertInfoText =>
      'Texte d’info';
  @override
  String get alertWarningText =>
      'Texte d’avertissement';
  @override
  String get alertErrorText =>
      'Texte d’erreur';
  @override
  String get alertSuccessDesc =>
      'Description de succès Description de succès Description de succès';
  @override
  String get alertInfoDesc =>
      'Description d’info Description d’info Description d’info Description d’info';
  @override
  String get alertWarningDesc =>
      'Description d’avertissement Description d’avertissement Description d’avertissement Description d’avertissement';
  @override
  String get alertErrorDesc =>
      'Description d’erreur Description d’erreur Description d’erreur Description d’erreur';
  @override
  String get alertSuccessTips =>
      'Conseils de succès';
  @override
  String get alertInfoNotes =>
      'Notes informatives';
  @override
  String get alertWarning =>
      'Avertissement';
  @override
  String get alertError =>
      'Erreur';
  @override
  String get alertDetailedSuccess =>
      'Description détaillée et conseils sur le copywriting réussi.';
  @override
  String get alertAdditionalInfo =>
      'Description et informations supplémentaires sur le copywriting.';
  @override
  String get alertWarningNotice =>
      'C’est un avis d’avertissement sur le copywriting.';
  @override
  String get alertErrorMessage =>
      'C’est un message d’erreur sur le copywriting.';
  @override
  String get alertClosedWarning =>
      'Alerte d’avertissement fermée';
  @override
  String get alertClosedSuccess =>
      'Alerte de succès fermée';
  @override
  String get alertClosedInfo =>
      'Alerte d’info fermée';
  @override
  String get alertClosedError =>
      'Alerte d’erreur fermée';
  @override
  String get alertBtnUndo =>
      'ANNULER';
  @override
  String get alertBtnDetail =>
      'Détail';
  @override
  String get alertBtnDone =>
      'Terminé';
  @override
  String get alertBtnAccept =>
      'Accepter';
  @override
  String get alertBtnDecline =>
      'Refuser';
  @override
  String get alertClosedMsg =>
      'Fermé ! Appuyez sur le bouton ci-dessous pour réafficher.';
  @override
  String get alertBtnReshow =>
      'Réafficher l’alerte';
  @override
  String get alertCustomTitle =>
      'Alerte entièrement personnalisée';
  @override
  String get alertCustomDesc =>
      'Thème violet avec bordure, rayon et styles personnalisés.';
  @override
  String get alertConstrainedTitle =>
      'Contrainte de taille personnalisée';
  @override
  String get alertConstrainedDesc =>
      'contraint à 400 pixels de largeur maximale.';
  @override
  String get alertBtnLearnMore =>
      'En savoir plus';

  @override
  String get dialogDesc =>
      'Un dialogue hautement personnalisable avec prise en charge de multiples animations et effets d’arrière-plan. Utilisez SDialog.show() pour une usine statique pratique, ou construisez SDialog directement.';
  @override
  String get dialogTip1 =>
      'Pour les invites de confirmation avant des actions irréversibles.';
  @override
  String get dialogTip2 =>
      'Pour afficher des formulaires ou du contenu détaillé nécessitant l’attention de l’utilisateur.';
  @override
  String get dialogTip3 =>
      'Pour les alertes ou les messages informatifs qui bloquent l’interaction en arrière-plan.';
  @override
  String get dialogSectionConfirm =>
      'Dialogue de confirmation';
  @override
  String get dialogSectionContent =>
      'Dialogue avec contenu';
  @override
  String get dialogSectionInfo =>
      'Dialogue d’info avec icône';
  @override
  String get dialogTitleDelete =>
      'Supprimer l’élément';
  @override
  String get dialogDescDelete =>
      'Cette action ne peut pas être annulée. Êtes-vous sûr de vouloir supprimer ?';
  @override
  String get dialogBtnOpenConfirm =>
      'Ouvrir la confirmation';
  @override
  String get dialogTitleEditProfile =>
      'Modifier le profil';
  @override
  String get dialogLabelFullName =>
      'Nom complet';
  @override
  String get dialogLabelEmail =>
      'Adresse e-mail';
  @override
  String get dialogBtnOpenForm =>
      'Ouvrir le dialogue de formulaire';
  @override
  String get dialogTitleInfo =>
      'Information';
  @override
  String get dialogDescSession =>
      'Votre session expirera dans 5 minutes. Veuillez enregistrer votre travail.';
  @override
  String get dialogBtnGotIt =>
      'Compris';
  @override
  String get dialogBtnOpenInfo =>
      'Ouvrir le dialogue d’information';

  @override
  String get toastDesc =>
      'Une brève superposition de notification qui glisse depuis le haut de l’écran. ⚠️ Note : SToast est obsolète. Préférez utiliser SSonner pour toutes les nouvelles notifications de toast.\n\nSToast est toujours utilisable pour la compatibilité descendante — il prend en charge les variantes par défaut et destructives.';
  @override
  String get toastTip1 =>
      'Pour les notifications rapides de la barre supérieure affichées avec une perturbation minimale de l’utilisateur.';
  @override
  String get toastTip2 =>
      'Utilisez SSonner à la place pour le nouveau code — il prend en charge plus de variantes et l’empilement.';
  @override
  String get toastSectionDefault =>
      'Toast par défaut';
  @override
  String get toastSectionTitle =>
      'Avec titre';
  @override
  String get toastSectionDestructive =>
      'Variante destructive';
  @override
  String get toastSectionRecommendation =>
      'Utilisez SSonner à la place';
  @override
  String get toastLabelMessage =>
      'Ceci est un message de toast !';
  @override
  String get toastBtnShow =>
      'Afficher le toast';
  @override
  String get toastLabelSuccess =>
      'Succès !';
  @override
  String get toastLabelSaved =>
      'Vos modifications ont été enregistrées.';
  @override
  String get toastBtnShowWithTitle =>
      'Afficher avec titre';
  @override
  String get toastLabelError =>
      'Erreur';
  @override
  String get toastLabelWrong =>
      'Quelque chose s’est mal passé. Veuillez réessayer.';
  @override
  String get toastBtnShowError =>
      'Afficher le toast d’erreur';
  @override
  String get toastRecommendationText =>
      'SSonner prend en charge les variantes succès, erreur, avertissement, info et les boutons d’action — ce qui en fait le système de toast préféré dans SDesign.';

  @override
  String get sonnerDesc =>
      'Un système de notification de toast inspiré de la bibliothèque Sonner. Affiche des notifications empilées qui disparaissent automatiquement. Prend en charge les variantes succès, erreur, avertissement et info.';
  @override
  String get sonnerTip1 =>
      'Pour fournir des commentaires sur des opérations asynchrones (enregistré, supprimé, erreur).';
  @override
  String get sonnerTip2 =>
      'Pour les notifications non intrusives qui ne bloquent pas le flux de l’utilisateur.';
  @override
  String get sonnerTip3 =>
      'Lorsque plusieurs notifications séquentielles peuvent arriver.';
  @override
  String get sonnerSectionVariants =>
      'Variantes';
  @override
  String get sonnerSectionConfig =>
      'Via SSonnerConfig';
  @override
  String get sonnerSectionAction =>
      'Avec bouton d’action';
  @override
  String get sonnerSectionPosition =>
      'Position : Haut';
  @override
  String get sonnerSectionReplace =>
      'Remplacer au lieu d’empiler';
  @override
  String get sonnerSectionShadow =>
      'Toast plat (sans ombre)';
  @override
  String get sonnerLabelSuccess =>
      'Succès';
  @override
  String get sonnerLabelError =>
      'Erreur';
  @override
  String get sonnerLabelWarning =>
      'Avertissement';
  @override
  String get sonnerLabelInfo =>
      'Info';
  @override
  String get sonnerLabelMsgSaved =>
      'Modifications enregistrées !';
  @override
  String get sonnerLabelMsgUploaded =>
      'Fichier téléchargé avec succès.';
  @override
  String get sonnerLabelTitleUpload =>
      'Téléchargement terminé';
  @override
  String get sonnerBtnShowWithTitle =>
      'Afficher avec titre';
  @override
  String get sonnerLabelMsgArchived =>
      'E-mail archivé';
  @override
  String get sonnerBtnShowWithAction =>
      'Afficher avec action';
  @override
  String get sonnerLabelMsgTop =>
      'Ceci apparaît en haut';
  @override
  String get sonnerBtnShowAtTop =>
      'Afficher en haut';
  @override
  String get sonnerLabelMsgReplaced =>
      'Toasts existants remplacés !';
  @override
  String get sonnerBtnShowReplace =>
      'Afficher et remplacer';
  @override
  String get sonnerLabelMsgNoShadow =>
      'Je n’ai pas d’ombre !';
  @override
  String get sonnerBtnShowFlat =>
      'Afficher le toast plat';
  @override
  String sonnerLabelNotify(String variant) =>
      'Notification de $variant';

  @override
  String get floatingTitle =>
      'Démo du panneau flottant';
  @override
  String get floatingLabelActionCompleted =>
      'Action terminée !';
  @override
  String get floatingBtnOk =>
      'OK';
  @override
  String get floatingTitleAdvanced =>
      'Paramètres avancés';
  @override
  String get floatingLabelUsername =>
      'Nom d’utilisateur';
  @override
  String get floatingLabelPassword =>
      'Mot de passe';
  @override
  String get floatingBtnCancel =>
      'Annuler';
  @override
  String get floatingBtnSave =>
      'Enregistrer';
  @override
  String get floatingMsgSettingsSaved =>
      'Paramètres enregistrés !';
  @override
  String get floatingTitleSpecialOffer =>
      'Offre spéciale !';
  @override
  String get floatingDescSpecialOffer =>
      'Obtenez 50 % de réduction sur votre prochain achat. Temps limité seulement !';
  @override
  String get floatingBtnMaybeLater =>
      'Peut-être plus tard';
  @override
  String get floatingBtnClaimOffer =>
      'Réclamer l’offre';
  @override
  String get floatingMsgOfferClaimed =>
      'Offre réclamée !';
  @override
  String get floatingBtnShowSimple =>
      'Afficher le panneau simple';
  @override
  String get floatingBtnShowAdvanced =>
      'Afficher le panneau avancé';
  @override
  String get floatingBtnShowCustom =>
      'Afficher le panneau inférieur personnalisé';

  @override
  String get progressDesc =>
      'Un composant indicateur de progression prenant en charge les mises en page ligne, cercle et tableau de bord. Prend un `percent` (0–100) et un `status` facultatif pour la coloration réussite/erreur.';
  @override
  String get progressTip1 =>
      'Pour les téléchargements, les téléversements ou les pourcentages d’achèvement des tâches.';
  @override
  String get progressTip2 =>
      'Comme widget de progression circulaire sur les tableaux de bord.';
  @override
  String get progressTip3 =>
      'Lorsqu’une jauge de style tableau de bord est nécessaire.';
  @override
  String get progressSectionLine =>
      'Progression en ligne';
  @override
  String get progressSectionCircle =>
      'Progression circulaire';
  @override
  String get progressSectionStatus =>
      'Variantes d’état';
  @override
  String get progressSectionDashboard =>
      'Style tableau de bord';
  @override
  String get progressBtnDecrease =>
      '- 10 %';
  @override
  String get progressBtnIncrease =>
      '+ 10 %';

  @override
  String get cardDesc =>
      'Un conteneur de surface flexible qui regroupe le contenu et les actions connexes. Prend en charge les effets de survol, les en-têtes personnalisés, les pieds de page, les images de couverture et les interactions cliquables.';
  @override
  String get cardTip1 =>
      'Pour afficher du contenu groupé tel que des profils d’utilisateurs, des articles ou des produits.';
  @override
  String get cardTip2 =>
      'Comme surface principale dans les mises en page en liste ou en grille.';
  @override
  String get cardTip3 =>
      'Pour les widgets de tableau de bord, les affichages de statistiques ou les panneaux de configuration.';
  @override
  String get cardSectionBasic =>
      'Carte de base';
  @override
  String get cardSectionHeader =>
      'Carte avec en-tête de fin';
  @override
  String get cardSectionInteractivity =>
      'Survolable / Cliquable';
  @override
  String get cardSectionVariants =>
      'Variantes';
  @override
  String get cardSectionGrid =>
      'Grille de cartes';
  @override
  String get cardLabelTitle =>
      'Titre de la carte';
  @override
  String get cardLabelBasicBody =>
      'Ceci est une carte de base. Elle peut contenir n’importe quel widget — texte, images, boutons ou mises en page entières.';
  @override
  String get cardLabelStats =>
      'Stats mensuelles';
  @override
  String get cardLabelUsers =>
      'Utilisateurs';
  @override
  String get cardLabelRevenue =>
      'Revenu';
  @override
  String get cardLabelOrders =>
      'Commandes';
  @override
  String get cardLabelClickMe =>
      'Cliquez-moi';
  @override
  String get cardLabelClickableBody =>
      'Cette carte est cliquable. Survolez-la pour voir l’effet.';
  @override
  String get cardLabelElevated =>
      'Élevée (par défaut)';
  @override
  String get cardLabelOutlined =>
      'Contour';
  @override
  String get cardLabelFilled =>
      'Remplie';
  @override
  String get cardLabelShadow =>
      'Carte avec ombre';
  @override
  String get cardLabelBorder =>
      'Carte avec bordure';
  @override
  String get cardLabelSurface =>
      'Carte avec remplissage de surface';
  @override
  String cardLabelItem(int index) =>
      'Élément $index';

  @override
  String get listTileDesc =>
      'Un composant de vignette de liste pour afficher des lignes de contenu avec des icônes de tête, un titre, un sous-titre et des widgets de fin cohérents. Prend en charge les mises en page groupées et autonomes.';
  @override
  String get listTileTip1 =>
      'Pour créer des menus de navigation basés sur des listes ou des écrans de paramètres.';
  @override
  String get listTileTip2 =>
      'Pour afficher des lignes de données structurées avec un formatage cohérent.';
  @override
  String get listTileTip3 =>
      'Lorsque les éléments ont besoin d’une icône de tête et d’une action de fin facultative.';
  @override
  String get listTileSectionBasic =>
      'Vignette de liste de base';
  @override
  String get listTileSectionGrouped =>
      'Liste groupée';
  @override
  String get listTileSectionSelectable =>
      'Vignettes sélectionnables';
  @override
  String get listTileLabelName =>
      'Jean Dupont';
  @override
  String get listTileLabelRole =>
      'Ingénieur logiciel';
  @override
  String get listTileLabelNotifications =>
      'Notifications';
  @override
  String get listTileLabelPrivacy =>
      'Confidentialité';
  @override
  String get listTileLabelLanguage =>
      'Langue';
  @override
  String get listTileLabelInbox =>
      'Boîte de réception';
  @override
  String get listTileLabelSent =>
      'Envoyés';
  @override
  String get listTileLabelDrafts =>
      'Brouillons';
  @override
  String get listTileLabelSpam =>
      'Spam';

  @override
  String get tabsDesc =>
      'Un composant de navigation par onglets pour basculer entre plusieurs vues ou sections de contenu. Prend en charge les types d’onglets ligne, carte et modifiables, ainsi que les positions haut/bas/gauche/droite.';
  @override
  String get tabsTip1 =>
      'Lorsque vous devez partitionner le contenu en sections connexes de même niveau.';
  @override
  String get tabsTip2 =>
      'Pour les écrans riches en contenu comme les pages de détails de produits ou les vues de profil.';
  @override
  String get tabsTip3 =>
      'Lorsqu’une navigation par barre latérale gauche/droite complète une vue principale.';
  @override
  String get tabsSectionBasic =>
      'Onglets de base';
  @override
  String get tabsSectionIcons =>
      'Onglets avec icônes';
  @override
  String get tabsSectionCard =>
      'Type carte';
  @override
  String get tabsLabelOverview =>
      'Aperçu';
  @override
  String get tabsLabelDetails =>
      'Détails';
  @override
  String get tabsLabelReviews =>
      'Avis';
  @override
  String get tabsContentOverview =>
      'Contenu de l’aperçu';
  @override
  String get tabsContentDetails =>
      'Contenu des détails';
  @override
  String get tabsContentReviews =>
      'Contenu des avis';
  @override
  String get tabsLabelHome =>
      'Accueil';
  @override
  String get tabsLabelSearch =>
      'Rechercher';
  @override
  String get tabsLabelProfile =>
      'Profil';
  @override
  String get tabsLabelCardA =>
      'Carte A';
  @override
  String get tabsLabelCardB =>
      'Carte B';
  @override
  String get tabsLabelCardC =>
      'Carte C';
  @override
  String get tabsContentCardA =>
      'Contenu de la carte A';
  @override
  String get tabsContentCardB =>
      'Contenu de la carte B';
  @override
  String get tabsContentCardC =>
      'Contenu de la carte C';
  @override
  String get tabsTitleShowcase =>
      'Présentation des onglets';
  @override
  String get tabsControlLabelType =>
      'Type';
  @override
  String get tabsControlLabelPosition =>
      'Position';
  @override
  String get tabsControlLabelSize =>
      'Taille';
  @override
  String get tabsControlLabelCentered =>
      'Centré : ';
  @override
  String get tabsControlLabelMany =>
      'Nombreux onglets (Liste) : ';
  @override
  String tabsLabelTab(int index) =>
      'Onglet $index';
  @override
  String get tabsLabelShort =>
      'Court';
  @override
  String get tabsLabelMedium =>
      'Longueur moyenne';
  @override
  String get tabsLabelCard =>
      'Style carte';
  @override
  String get tabsLabelDisabled =>
      'Désactivé';
  @override
  String get tabsContentShort =>
      'Onglet à étiquette courte (fond d’un bord à l’autre)';
  @override
  String get tabsContentMedium =>
      'Onglet à étiquette de longueur moyenne';
  @override
  String get tabsContentPadding =>
      'Cet onglet a un rembourrage manuel ajouté.';
  @override
  String get tabsLabelNestedCard =>
      'Carte imbriquée';
  @override
  String get tabsLabelComposition =>
      'Démonstration de la composition';
  @override
  String get tabsLabelDisabledContent =>
      'Onglet désactivé';
  @override
  String tabsLabelListItem(int index) =>
      'Élément de liste $index';
  @override
  String tabsLabelInTab(int index) =>
      'dans l’onglet $index';
  @override
  String get tabsTooltipExtra =>
      'Action supplémentaire';

  @override
  String get paginationTitle =>
      'SPagination';
  @override
  String get paginationHeader1 =>
      '1. De base';
  @override
  String get paginationDesc1 =>
      'Pagination de base avec 50 éléments au total.';
  @override
  String get paginationHeader2 =>
      '2. Plus de pages — Ellipse';
  @override
  String get paginationDesc2 =>
      'Avec 500 éléments, les boutons d’ellipse (•••) apparaissent. Appuyez dessus pour sauter de ±5 pages.';
  @override
  String get paginationHeader3 =>
      '3. Changeur de taille';
  @override
  String get paginationDesc3 =>
      'showSizeChanger ajoute une liste déroulante pour choisir 10/20/50/100 éléments par page.';
  @override
  String get paginationHeader4 =>
      '4. Cavalier rapide';
  @override
  String get paginationDesc4 =>
      'showQuickJumper ajoute un champ "Aller à". Saisissez un numéro de page et appuyez sur Entrée.';
  @override
  String get paginationHeader5 =>
      '5. Variantes de taille — Petit';
  @override
  String get paginationDesc5 =>
      'size: SPaginationSize.small produit des éléments compacts de 24 px.';
  @override
  String get paginationHeader5b =>
      '5b. Variantes de taille — Grand';
  @override
  String get paginationDesc5b =>
      'size: SPaginationSize.large produit des éléments de 40 px.';
  @override
  String get paginationHeader6 =>
      '6. Mode simple';
  @override
  String get paginationDesc6 =>
      'simple: true affiche l’entrée actuelle/totale au lieu des boutons de page.';
  @override
  String get paginationHeader7 =>
      '7. Mode contrôlé';
  @override
  String get paginationDesc7 =>
      'Fournissez current + onChange pour contrôler entièrement la page à partir de l’état parent.';
  @override
  String get paginationHeader8 =>
      '8. showTotal';
  @override
  String get paginationDesc8 =>
      'showTotal reçoit (total, [first, last]) — créez n’importe quelle étiquette.';
  @override
  String get paginationHeader9 =>
      '9. Rendu d’élément personnalisé';
  @override
  String get paginationDesc9 =>
      'itemRender remplace les boutons préc / suiv par des widgets personnalisés.';
  @override
  String get paginationHeader10 =>
      '10. Alignement';
  @override
  String get paginationDesc10 =>
      'align: start / center / end.';
  @override
  String get paginationHeader11 =>
      '11. Toutes les fonctionnalités combinées';
  @override
  String get paginationDesc11 =>
      'showSizeChanger + showQuickJumper + showTotal ensemble.';
  @override
  String get paginationHeader12 =>
      '12. Personnalisation ouverte';
  @override
  String get paginationDesc12 =>
      'Chaque jeton visuel peut être remplacé par instance.';
  @override
  String paginationLabelTotal(int total) =>
      'Total $total éléments';
  @override
  String paginationLabelRange(
          int first,
          int last,
          int total) =>
      '$first–$last sur $total éléments';
  @override
  String paginationLabelState(int page) =>
      'État : page $page';
  @override
  String get paginationLabelPrevious =>
      '‹ Précédent';
  @override
  String get paginationLabelNext =>
      'Suivant ›';

  @override
  String get scaffoldTitle =>
      'Exemple Slivers SScaffold';
  @override
  String get scaffoldDesc =>
      'Ceci démontre SScaffold avec CustomScrollView.';
  @override
  String get scaffoldStickyHeader =>
      'En-tête collant';
  @override
  String scaffoldLabelHItem(int index) =>
      'Élément-H $index';
  @override
  String scaffoldLabelItem(int index) =>
      'Élément $index';
  @override
  String scaffoldLabelSubtitle(int index) =>
      'Sous-titre $index';
  @override
  String get scaffoldLabelFAB =>
      'Bouton';

  @override
  String get navTitle =>
      'Navigation inférieure animée';
  @override
  String get navLabelHome =>
      'Accueil';
  @override
  String get navLabelLikes =>
      'Likes';
  @override
  String get navLabelSearch =>
      'Rechercher';
  @override
  String get navLabelProfile =>
      'Profil';

  @override
  String get inputTitleShowcase =>
      'Présentation SInputField';
  @override
  String get inputSectionDefault =>
      'Champ de saisie par défaut';
  @override
  String get inputSectionPassword =>
      'Champ de mot de passe';
  @override
  String get inputSectionIcons =>
      'Entrée avec icônes';
  @override
  String get inputSectionDatePicker =>
      'Entrée du sélecteur de date';

  @override
  String get inputSectionCustom =>
      'Personnalisation de l’entrée';
  @override
  String get inputSectionCard =>
      'Entrée formatée (carte de crédit)';
  @override
  String get inputSectionRealWorld =>
      'Fonctionnalités du monde réel';
  @override
  String get inputHintNumber =>
      'Entrer le numéro';
  @override
  String get inputHintPassword =>
      'Entrer le mot de passe';
  @override
  String get inputHintSearch =>
      'Rechercher';
  @override
  String get inputHintDate =>
      'Sélectionner une date';
  @override
  String get inputHintEmail =>
      'Entrer votre e-mail';
  @override
  String get inputHintCustom =>
      'Personnalisé';
  @override
  String get inputHintCard =>
      '0000 0000 0000 0000';
  @override
  String get inputLabelCard =>
      'Numéro de carte';
  @override
  String get inputHelperCard =>
      'Nous ne stockons pas les détails de votre carte';
  @override
  String get inputBtnSubmit =>
      'Envoyer';
  @override
  String get inputLabelPrice =>
      'Prix';
  @override
  String get inputHintPrice =>
      '0.00';
  @override
  String get inputHelperPrice =>
      'Entrer le prix en USD';
  @override
  String get inputLabelStatus =>
      'Statut du serveur';
  @override
  String get inputHintStatus =>
      'Vérification...';
  @override
  String get inputHelperStatus =>
      'Validation de la connexion...';
  @override
  String get inputLabelApiKey =>
      'Clé API';
  @override
  String get inputErrorApiKey =>
      'Clé API invalide (erreur serveur)';
  @override
  String get inputErrorEmpty =>
      'Ce champ ne peut pas être vide.';
  @override
  String get inputErrorNumber =>
      'Veuillez entrer un numéro valide';
}

/// Arabic implementation of [SLocalizations].
class SLocalizationsAr
    extends SLocalizations {
  const SLocalizationsAr()
      : super('ar');

  @override
  String get ok =>
      'موافق';
  @override
  String get cancel =>
      'إلغاء';
  @override
  String get done =>
      'تم';
  @override
  String get close =>
      'إغلاق';
  @override
  String get search =>
      'بحث';
  @override
  String get searchPlaceholder =>
      'بحث...';
  @override
  String get selectPlaceholder =>
      'اختر';
  @override
  String get noData =>
      'لا توجد بيانات';
  @override
  String get loading =>
      'جار التحميل...';

  @override
  String get selectDate =>
      'اختر التاريخ';
  @override
  String get selectTime =>
      'اختر الوقت';
  @override
  String get startDate =>
      'تاريخ البدء';
  @override
  String get endDate =>
      'تاريخ الانتهاء';
  @override
  String get startTime =>
      'وقت البدء';
  @override
  String get endTime =>
      'وقت الانتهاء';
  @override
  String get hour =>
      'ساعة';
  @override
  String get minute =>
      'دقيقة';
  @override
  String get second =>
      'ثانية';

  @override
  String get previousPage =>
      'الصفحة السابقة';
  @override
  String get nextPage =>
      'الصفحة التالية';
  @override
  String get page =>
      'صفحة';
  @override
  String get of =>
      'من';

  @override
  String get home =>
      'الرئيسية';
  @override
  String get inputs =>
      'المدخلات';
  @override
  String get display =>
      'العرض';
  @override
  String get feedback =>
      'التغذية الراجعة';
  @override
  String get layout =>
      'التنسيق';

  @override
  String get galleryTitle =>
      'معرض SDesign';
  @override
  String get themeSwitchLight =>
      'التبديل إلى الوضع الفاتح';
  @override
  String get themeSwitchDark =>
      'التبديل إلى الوضع الداكن';
  @override
  String get languageSwitch =>
      'تغيير اللغة';
  @override
  String get sidebarHeader =>
      'SDesign';
  @override
  String get searchComponents =>
      'بحث عن المكونات...';
  @override
  String get langEn =>
      'الإنجليزية';
  @override
  String get langFr =>
      'الفرنسية';
  @override
  String get langAr =>
      'العربية';
  @override
  String get langZh =>
      'الصينية';

  @override
  String get compButton =>
      'SButton';
  @override
  String get compCheckbox =>
      'SCheckbox';
  @override
  String get compSwitch =>
      'SSwitch';
  @override
  String get compInput =>
      'SInput';
  @override
  String get compDropdown =>
      'SDropdown';
  @override
  String get compSelect =>
      'SSelect';
  @override
  String get compRate =>
      'SRate';
  @override
  String get compDatePicker =>
      'SDatePicker';
  @override
  String get compTimePicker =>
      'STimePicker';
  @override
  String get compAvatar =>
      'SAvatar';
  @override
  String get compSlider =>
      'SSlider';
  @override
  String get compSteps =>
      'SSteps';
  @override
  String get compQRCode =>
      'SQRCode';
  @override
  String get compAlert =>
      'SAlert';
  @override
  String get compDialog =>
      'SDialog';
  @override
  String get compToast =>
      'SToast';
  @override
  String get compSonner =>
      'SSonner';
  @override
  String get compFloatingPanel =>
      'SFloatingPanel';
  @override
  String get compProgress =>
      'SProgress';
  @override
  String get compProgressLine =>
      'SProgress.line';
  @override
  String get compCard =>
      'SCard';
  @override
  String get compListTile =>
      'SListTile';
  @override
  String get compTabs =>
      'STabs';
  @override
  String get compPagination =>
      'SPagination';
  @override
  String get compScaffold =>
      'SScaffold';
  @override
  String get compScaffoldSlivers =>
      'SScaffold Slivers';
  @override
  String get compBottomNav =>
      'SBottom Navigation';
  @override
  String get compCardBasic =>
      'SCard (Basic)';

  @override
  String get heroTagline =>
      'تم إصدار sDesign v2.0.0!';
  @override
  String get heroTitle =>
      'صمم واجهات مستخدم مذهلة بأقل قدر من الكود';
  @override
  String get heroDescription =>
      'مكتبة مكونات Flutter قوية وقابلة للتخصيص بدرجة كبيرة مستوحاة من أفضل أنظمة التصميم في العالم. مصممة للجوال والويب وسطح المكتب.';
  @override
  String get heroGetStarted =>
      'ابدأ الآن';
  @override
  String get heroBrowse =>
      'تصفح المكونات';

  @override
  String get featuresTitle =>
      'لماذا تختار sDesign؟';
  @override
  String get featCustomTitle =>
      'تخصيص بلا حدود';
  @override
  String get featCustomDesc =>
      'يتم كشف كل رمز. قم بحقن ألوان علامتك التجارية بسلاسة في جميع المكونات على الفور باستخدام SThemeData.';
  @override
  String get featDarkTitle =>
      'وضع داكن مثالي';
  @override
  String get featDarkDesc =>
      'تضمن رموز الألوان الذكية أن تبدو واجهة المستخدم الخاصة بك متميزة ومتوازنة تمامًا في كل من الوضعين الفاتح والداكن بمجرد إخراجها من الصندوق.';
  @override
  String get featLocTitle =>
      'تعريب أصلي';
  @override
  String get featLocDesc =>
      "تتحدث لغة مستخدميك بشكل طبيعي. دعم مدمج للغات متعددة بما في ذلك RTL دون عناء إضافي.";
  @override
  String get featAnimTitle =>
      'تفاعلات دقيقة';
  @override
  String get featAnimDesc =>
      'فيزياء النوابض المبهجة، وحالات التمرير السلسة، والتحولات الرائعة تجعل تطبيقك يستجيب بشكل لا يصدق.';

  @override
  String get showcaseTitle =>
      'معاينة تفاعلية مباشرة';
  @override
  String get showcaseNotifyBtn =>
      'إظهار الإشعارات';
  @override
  String get showcaseNotifySuccess =>
      'ممتاز! لقد قمت بتفعيل تنبيه نجاح.';
  @override
  String get showcaseEmailLabel =>
      'عنوان البريد الإلكتروني';
  @override
  String get showcaseEmailHint =>
      'you@example.com';
  @override
  String get showcaseDateHint =>
      'اختر التاريخ';
  @override
  String get showcaseDeleteBtn =>
      'حذف الحساب';

  @override
  String get footerIntegrate =>
      'دقائق للتكامل';
  @override
  String get footerBuiltBy =>
      'بني بشغف من قبل ';
  @override
  String get footerLicense =>
      '. مرخص بموجب MIT.';

  @override
  String get demoWhenToUse =>
      'متى يجب الاستخدام';
  @override
  String get demoShowCode =>
      'عرض الكود';
  @override
  String get demoHideCode =>
      'إخفاء الكود';
  @override
  String get demoVariants =>
      'المتغيرات';
  @override
  String get demoSizes =>
      'الأحجام';
  @override
  String get demoStates =>
      'الحالات';
  @override
  String get demoBasicUsage =>
      'الاستخدام الأساسي';
  @override
  String get demoLoadingState =>
      'حالة التحميل';
  @override
  String get demoWithIcons =>
      'مع أيقونات';
  @override
  String get demoDisabled =>
      'معطل';
  @override
  String get demoFullWidth =>
      'العرض الكامل';
  @override
  String get demoUndo =>
      'تراجع';
  @override
  String get demoDelete =>
      'حذف';
  @override
  String get demoCancel =>
      'إلغاء';
  @override
  String get demoSave =>
      'حفظ';
  @override
  String get demoHideSeconds =>
      'إخفاء الثواني';
  @override
  String get demoStatus =>
      'الحالة';

  @override
  String get buttonDesc =>
      'مكون زر متعدد الاستخدامات يدعم متغيرات وأحجام وحالات وأيقونات متعددة. يتبع SButton مبادئ التصميم الحديثة - كل تفاعل له استجابة بصرية واضحة.';
  @override
  String get buttonTip1 =>
      'استخدم الزر الافتراضي للإجراءات الأساسية (مثل إرسال، حفظ).';
  @override
  String get buttonTip2 =>
      'استخدم أزرار الإطار للإجراءات الثانوية أو البديلة.';
  @override
  String get buttonTip3 =>
      'استخدم أزرار الحذف للإجراءات غير القابلة للتراجع.';
  @override
  String get buttonTip4 =>
      'استخدم أزرار الشبح أو الروابط للإجراءات البسيطة داخل النص.';
  @override
  String get buttonLabelDefault =>
      'افتراضي';
  @override
  String get buttonLabelOutline =>
      'إطار';
  @override
  String get buttonLabelSecondary =>
      'ثانوي';
  @override
  String get buttonLabelGhost =>
      'شبح';
  @override
  String get buttonLabelDestructive =>
      'حذف';
  @override
  String get buttonLabelLink =>
      'رابط';
  @override
  String get buttonLabelLarge =>
      'كبير';
  @override
  String get buttonLabelSmall =>
      'صغير';
  @override
  String get buttonLabelDownload =>
      'تحميل';
  @override
  String get buttonLabelNext =>
      'التالي';
  @override
  String get buttonLabelProcessing =>
      'جاري المعالجة...';
  @override
  String get buttonLabelClickToLoad =>
      'انقر للتحميل';
  @override
  String get buttonLabelDisabled =>
      'معطل';
  @override
  String get buttonLabelDisabledOutline =>
      'إطار معطل';
  @override
  String get buttonLabelFullWidth =>
      'زر عرض كامل';

  @override
  String get checkboxDesc =>
      'مكون صندوق اختيار لاختيار خيار واحد أو خيارات متعددة. يدعم الحالات المختارة وغير المختارة وغير المحددة.';
  @override
  String get checkboxTip1 =>
      'عندما يحتاج المستخدم لاختيار عنصر واحد أو أكثر من قائمة.';
  @override
  String get checkboxTip2 =>
      'لتبديل إعداد منطقي (صح/خطأ).';
  @override
  String get checkboxTip3 =>
      'كجزء من نموذج يتطلب اختياراً متعدداً.';
  @override
  String get checkboxLabelAgreed =>
      'موافق';
  @override
  String get checkboxLabelPleaseAgree =>
      'يرجى الموافقة';
  @override
  String get checkboxSectionIndeterminate =>
      'غير محدد / اختيار الكل';
  @override
  String get checkboxLabelSelectAll =>
      'اختيار الكل';
  @override
  String get checkboxLabelOption =>
      'خيار';
  @override
  String get checkboxLabelCheckedDisabled =>
      'مختار ومعطل';
  @override
  String get checkboxLabelUncheckedDisabled =>
      'غير مختار ومعطل';

  @override
  String get switchDesc =>
      'مكون مفتاح تبديل لحالات التشغيل/الإيقاف الثنائية. يتواصل SSwitch بصريًا بشكل أوضح من صندوق الاختيار في واجهات مستخدم نمط الإعدادات.';
  @override
  String get switchTip1 =>
      'لتبديل إعداد واحد أو ميزة واحدة على الفور (لا حاجة للتأكيد).';
  @override
  String get switchTip2 =>
      'في شاشات الإعدادات حيث تهم المساحة المدمجة وحالة التشغيل/الإيقاف الواضحة.';
  @override
  String get switchTip3 =>
      'عندما ينعكس تأثير التبديل فوراً في واجهة المستخدم.';
  @override
  String get switchSectionBasic =>
      'تبديل أساسي';
  @override
  String get switchStatusEnabled =>
      'مفعل';
  @override
  String get switchStatusDisabled =>
      'معطل';
  @override
  String get switchSectionSettings =>
      'نمط قائمة الإعدادات';
  @override
  String get switchLabelWifi =>
      'Wi-Fi';
  @override
  String get switchLabelBluetooth =>
      'Bluetooth';
  @override
  String get switchLabelNotifications =>
      'التنبيهات';
  @override
  String get switchLabelEnabledDisabled =>
      'مفعل ومعطل';
  @override
  String get switchLabelDisabledOff =>
      'معطل ومغلق';

  @override
  String get inputDesc =>
      'حقل إدخال نصي مع دعم لأيقونات البادئة/اللاحقة، والإضافات قبل/بعد، وحالات التحقق (خطأ، تحذير)، وزر المسح، وأحجام متعددة.';
  @override
  String get inputTip1 =>
      'عند جمع بيانات نصية من المستخدم في نموذج.';
  @override
  String get inputTip2 =>
      'لحقول البحث، والفلاتر، وشاشات إدخال البيانات.';
  @override
  String get inputTip3 =>
      'عندما تحتاج إلى ملاحظات تحقق مدمجة (حالات خطأ، تحذير).';
  @override
  String get inputLabelSearch =>
      'بحث...';
  @override
  String get inputLabelPassword =>
      'أدخل كلمة المرور';
  @override
  String get inputLabelAmount =>
      'المبلغ';
  @override
  String get inputLabelEmailError =>
      'البريد الإلكتروني مطلوب';
  @override
  String get inputLabelPasswordWarning =>
      'يجب أن تكون كلمة المرور أقوى';
  @override
  String get inputLabelLarge =>
      'إدخال كبير';
  @override
  String get inputLabelMiddle =>
      'إدخال متوسط (افتراضي)';
  @override
  String get inputLabelSmall =>
      'إدخال صغير';
  @override
  String get inputLabelDisabled =>
      'معطل';
  @override
  String get inputLabelReadOnly =>
      'لا يمكن تغييره';
  @override
  String get inputLabelTypeClear =>
      'اكتب شيئاً ثم امسحه';
  @override
  String get inputLabelMessage =>
      'اكتب رسالتك...';
  @override
  String get inputSectionPrefixSuffix =>
      'مع أدوات البادئة واللاحقة';
  @override
  String get inputSectionValidation =>
      'حالات التحقق';
  @override
  String get inputSectionDisabled =>
      'معطل وللقراءة فقط';
  @override
  String get inputSectionClear =>
      'السماح بالمسح';
  @override
  String get inputSectionTextArea =>
      'منطقة نصية';

  @override
  String get selectDescExtended =>
      'مكون قائمة منسدلة قوي يدعم الاختيار الفردي، والاختيار المتعدد، ووضع العلامات، والبحث/الفلترة، والعناصر المجمعة، والأيقونات المخصصة.';
  @override
  String get selectTip1 =>
      'استبدال عناصر <select> الأصلية بتجربة مستخدم أغنى.';
  @override
  String get selectTip2 =>
      'اختيار عنصر واحد أو عناصر متعددة من قائمة طويلة.';
  @override
  String get selectTip3 =>
      'عندما تحتاج إلى قوائم منسدلة قابلة للبحث لمدخلات النموذج.';
  @override
  String get selectLabelPickFruit =>
      'اختر فاكهة';
  @override
  String get selectLabelSearchFruit =>
      'ابحث عن فاكهة...';
  @override
  String get selectLabelPickMultiple =>
      'اختر فواكه متعددة';
  @override
  String get selectLabelApple =>
      'تفاح';
  @override
  String get selectLabelBanana =>
      'موز';
  @override
  String get selectLabelCherry =>
      'كرز';
  @override
  String get selectLabelDate =>
      'تمر';
  @override
  String get selectLabelElderberry =>
      'الخمان';
  @override
  String get selectLabelDurian =>
      'دوريان';
  @override
  String get selectLabelFig =>
      'تين';
  @override
  String get selectLabelGrape =>
      'عنب';
  @override
  String get selectLabelTech =>
      'تكنولوجيا';
  @override
  String get selectTip4 =>
      'عندما تكون القائمة المنسدلة طويلة (أكثر من 10 خيارات) ويكون الفلترة مفيدة.';
  @override
  String get selectLabelSearchSelect =>
      'ابحث واختر...';
  @override
  String get selectSectionWithSearch =>
      'مع البحث';
  @override
  String get selectSectionSingle =>
      'اختيار فردي';
  @override
  String get selectSectionMulti =>
      'اختيار متعدد';

  @override
  String get rateDesc =>
      'مكون تقييم بالنجوم يتيح للمستخدمين تقديم ملاحظات على مقياس رقمي. يدعم النجوم الكاملة، ونصف النجوم، والأيقونات المخصصة، والعرض للقراءة فقط.';
  @override
  String get rateTip1 =>
      'لواجهات تقييم المنتجات أو الخدمات أو المحتوى.';
  @override
  String get rateTip2 =>
      'لجمع الملاحظات النوعية على مقياس.';
  @override
  String get rateTip3 =>
      'لعرض تقييم إجمالي في وضع القراءة فقط.';
  @override
  String rateLabelCurrent(num value) =>
      'الحالي: $value نجوم';
  @override
  String get rateLabel10Scale =>
      'مقياس 10 نجوم';
  @override
  String get rateSectionBasic =>
      'تقييم أساسي';
  @override
  String get rateSectionHalf =>
      'نصف نجوم';
  @override
  String get rateSectionReadOnly =>
      'عرض للقراءة فقط';
  @override
  String get rateSectionCustomCount =>
      'عدد نجوم مخصص';
  @override
  String get rateDescBasic =>
      'تقييم بالنجوم الكاملة مع 5 نجوم افتراضيًا.';
  @override
  String get rateDescHalf =>
      'تمكين `allowHalf: true` لدقة 0.5.';
  @override
  String get rateDescReadOnly =>
      'تمرير `disabled: true` لعرض تقييم غير تفاعلي.';
  @override
  String get rateDescCustomCount =>
      'تغيير إجمالي عدد النجوم باستخدام `count`.';

  @override
  String get datePickerTitle =>
      'عرض SDatePicker';
  @override
  String get datePickerSectionBasic =>
      'مقيّم التاريخ الأساسي';
  @override
  String get datePickerSectionDisabled =>
      'مقيّم التاريخ المعطل';
  @override
  String get datePickerSectionRange =>
      'مقيّم النطاق';
  @override
  String get datePickerSectionMonth =>
      'مقيّم الشهر';
  @override
  String get datePickerSectionYear =>
      'مقيّم السنة';
  @override
  String get datePickerSectionPresetsDate =>
      'إعدادات التاريخ المسبقة';
  @override
  String get datePickerSectionPresetsRange =>
      'إعدادات النطاق المسبقة';
  @override
  String get datePickerSectionCustom =>
      'تنسيق مخصص';
  @override
  String get datePickerLabelToday =>
      'اليوم';
  @override
  String get datePickerLabelTomorrow =>
      'غداً';
  @override
  String get datePickerLabelNextWeek =>
      'الأسبوع القادم';
  @override
  String get datePickerLabelThisWeek =>
      'هذا الأسبوع';
  @override
  String get datePickerLabelLast7Days =>
      'آخر 7 أيام';
  @override
  String get datePickerLabelNext30Days =>
      '30 يوماً القادمة';
  @override
  String get datePickerLabelCustomTheme =>
      'سمة مخصصة';

  @override
  String get timePickerTitle =>
      'STimePicker';
  @override
  String get timePickerDescBasic =>
      'مقيّم HH:mm:ss الافتراضي. تمرير الأعمدة للمعاينة فقط. يتم حفظ القيمة عند الضغط على موافق أو إغلاق اللوحة.';
  @override
  String get timePickerDesc12Hour =>
      'use12Hours يضيف عمود AM/PM. التنسيق يتحكم في ظهور الثواني.';
  @override
  String get timePickerDescDisabled =>
      'disabled: true يجعل الحقل باهتاً ويمنع فتح اللوحة.';
  @override
  String get timePickerDescSize =>
      'size: كبير (40 بكسل) / متوسط (32 بكسل، افتراضي) / صغير (24 بكسل).';
  @override
  String get timePickerDescHideSeconds =>
      "format: 'HH:mm' يزيل عمود الثواني من اللوحة.";
  @override
  String get timePickerDescInterval =>
      'hourStep, minuteStep, secondStep تقوم بفلترة عناصر الأعمدة.';
  @override
  String get timePickerDescAddon =>
      'renderExtraFooter يضيف أداة مخصصة في تذييل اللوحة، بجانب أزرار الآن وموافق المدمجة.';
  @override
  String get timePickerLabelCustomFooter =>
      '✏️ تذييل مخصص';
  @override
  String get timePickerDescStatus =>
      'status: خطأ (إطار أحمر) أو تحذير (إطار أصفر).';
  @override
  String get timePickerDescSuffixPrefix =>
      'suffixIcon يستبدل أيقونة الساعة الافتراضية؛ prefix يضيف أداة في بداية الحقل.';
  @override
  String get timePickerDescVariants =>
      'بإطار (افتراضي) / معبأ / بدون إطار / بخط سفلي.';
  @override
  String get timePickerLabelOutlined =>
      'بإطار';
  @override
  String get timePickerLabelOutlinedStart =>
      'بداية بإطار';
  @override
  String get timePickerLabelOutlinedEnd =>
      'نهاية بإطار';
  @override
  String get timePickerLabelFilled =>
      'معبأ';
  @override
  String get timePickerLabelFilledStart =>
      'بداية معبأة';
  @override
  String get timePickerLabelFilledEnd =>
      'نهاية معبأة';
  @override
  String get timePickerLabelBorderless =>
      'بدون إطار';
  @override
  String get timePickerLabelBorderlessStart =>
      'بداية بدون إطار';
  @override
  String get timePickerLabelBorderlessEnd =>
      'نهاية بدون إطار';
  @override
  String get timePickerLabelUnderlined =>
      'بخط سفلي';
  @override
  String get timePickerLabelUnderlinedStart =>
      'بداية بخط سفلي';
  @override
  String get timePickerLabelUnderlinedEnd =>
      'نهاية بخط سفلي';
  @override
  String get timePickerDescControlled =>
      'value + onChange تمنح الوالد تحكماً كاملاً.';
  @override
  String timePickerLabelState(String value) =>
      'الحالة: $value';
  @override
  String get timePickerDescNeedConfirm =>
      'يتم حفظ القيمة فقط عندما يضغط المستخدم على زر موافق.';
  @override
  String get timePickerDescChangeOnScroll =>
      'onChange تعمل مباشرة أثناء تغيير الأعمدة (needConfirm خاطئ — الافتراضي لـ changeOnScroll).';
  @override
  String get timePickerDescShowNowFalse =>
      'يخفي اختصار الآن من التذييل (يعكس خاصية showNow).';
  @override
  String get timePickerDescRange =>
      'STimeRangePicker يعرض مقيّمين جنباً إلى جنب.';
  @override
  String get timePickerHeader12Hour =>
      '2. ساعة 12 ساعة';
  @override
  String get timePickerHeaderInterval =>
      '6. خيارات الفاصل الزمني';
  @override
  String get timePickerHeaderAddon =>
      '7. إضافة — renderExtraFooter';
  @override
  String get timePickerHeaderVariants =>
      '10. المتغيرات';
  @override
  String get timePickerHeaderControlled =>
      '11. الوضع المتحكم به';
  @override
  String get timePickerHeaderNeedConfirm =>
      '12. التأكيد المطلوب';
  @override
  String get timePickerHeaderChangeOnScroll =>
      '13. التغيير عند التمرير';
  @override
  String get timePickerHeaderShowNowFalse =>
      '14. إخفاء الآن';
  @override
  String get timePickerHeaderRange =>
      '14. مقيِّم نطاق الوقت';
  @override
  String timePickerMsgTime(String time) =>
      'الوقت: $time';
  @override
  String timePickerMsgConfirmed(String time) =>
      'تم التأكيد: $time';
  @override
  String timePickerMsgScroll(String time) =>
      'تمرير→ $time';
  @override
  String timePickerMsgRange(String start,
          String end) =>
      '$start → $end';

  @override
  String get avatarTitle =>
      'SAvatar';
  @override
  String get avatarSectionBasic =>
      'أساسي';
  @override
  String get avatarSectionType =>
      'النوع';
  @override
  String get avatarSectionAutoset =>
      'تعديل تلقائي لحجم الخط';
  @override
  String get avatarSectionFallback =>
      'بديل (Fallback)';
  @override
  String get avatarSectionBadge =>
      'مع شارة (Badge)';
  @override
  String get avatarSectionGroup =>
      'مجموعة الصور (Avatar.Group)';
  @override
  String get avatarBtnChangeUser =>
      'تغيير المستخدم';
  @override
  String get avatarBtnChangeGap =>
      'تغيير الفجوة';

  @override
  String get sliderDesc =>
      'منزلق يعتمد على الإبهام لاختيار قيمة أو نطاق على مقياس مستمر أو متدرج. يدعم المتغيرات الفردية والنطاق، والعلامات، والتوجه الرأسي، والألوان المخصصة.';
  @override
  String get sliderTip1 =>
      'لضبط قيمة رقمية يمكن للمستخدم سحبها، مثل الصوت أو السطوع.';
  @override
  String get sliderTip2 =>
      'عند اختيار نطاق أدنى/أقصى (مثل فلتر السعر).';
  @override
  String get sliderTip3 =>
      'لزيادات متدرجة (مثلاً 0، 25، 50، 75، 100٪).';
  @override
  String get sliderSectionBasic =>
      'منزلق فردي أساسي';
  @override
  String get sliderSectionRange =>
      'منزلق النطاق';
  @override
  String get sliderSectionStepped =>
      'متدرج (منفصل)';
  @override
  String get sliderSectionMarks =>
      'مع علامات';
  @override
  String sliderLabelValue(num value) =>
      'القيمة: $value٪';
  @override
  String sliderLabelRange(num start,
          num end) =>
      'النطاق: $start٪ – $end٪';
  @override
  String sliderLabelStep(num step,
          num max) =>
      'الخطوة: $step من $max';

  @override
  String get stepsDesc =>
      'مكون خطوات التقدم الذي يوجه المستخدمين من خلال عمليات متسلسلة. يدعم التوجهات الأفقية والرأسية، والخطوات القابلة للنقر، وتجاوزات الحالة.';
  @override
  String get stepsTip1 =>
      'لمعالجات الخطوات المتعددة (الدفع، التهيئة، إكمال النماذج).';
  @override
  String get stepsTip2 =>
      'لإظهار التقدم من خلال سلسلة من المهام.';
  @override
  String get stepsTip3 =>
      'عندما تريد أن يفهم المستخدمون أين هم في سير العمل.';
  @override
  String get stepsSectionHorizontal =>
      'خطوات أفقية';
  @override
  String get stepsSectionVertical =>
      'خطوات رأسية';
  @override
  String get stepsSectionError =>
      'حالة الخطأ';
  @override
  String get stepsSectionClickable =>
      'خطوات قابلة للنقر';
  @override
  String get stepsBtnPrevious =>
      'السابق';
  @override
  String get stepsBtnNext =>
      'التالي';
  @override
  String get stepsLabelOrderPlaced =>
      'تم تقديم الطلب';
  @override
  String get stepsDescOrderReceived =>
      'تم استلام طلبك';
  @override
  String get stepsLabelProcessing =>
      'جاري المعالجة';
  @override
  String get stepsDescPrepared =>
      'يتم التحضير';
  @override
  String get stepsLabelShipped =>
      'تم الشحن';
  @override
  String get stepsDescOnWay =>
      'في الطريق';
  @override
  String get stepsLabelDelivered =>
      'تم التوصيل';
  @override
  String get stepsDescEnjoy =>
      'استمتع!';
  @override
  String get stepsLabelStep1 =>
      'الخطوة 1';
  @override
  String get stepsDescCreateAccount =>
      'أنشئ حسابك';
  @override
  String get stepsLabelStep2 =>
      'الخطوة 2';
  @override
  String get stepsDescSetProfile =>
      'قم بإعداد ملفك الشخصي';
  @override
  String get stepsLabelStep3 =>
      'الخطوة 3';
  @override
  String get stepsDescExplore =>
      'استكشف الميزات';
  @override
  String get stepsLabelPlaced =>
      'تم التقديم';

  @override
  String get qrcodeDesc =>
      'مكون منشئ كود QR مبني على `qr_flutter`. يدعم الحجم المخصص، والألوان، والأيقونات، والتنسيق المحدود، وتراكبات الحالة (منتهي الصلاحية، قيد التحميل، تم المسح).';
  @override
  String get qrcodeTip1 =>
      'لعرض أكواد QR للدفع أو مشاركة التطبيقات.';
  @override
  String get qrcodeTip2 =>
      'عندما تحتاج إلى كود QR قابل للمسح يظهر حالة تحميل أو انتهاء الصلاحية.';
  @override
  String get qrcodeTip3 =>
      'لدمج شعار أو أيقونة داخل كود QR.';
  @override
  String get qrcodeSectionBasic =>
      'كود QR أساسي';
  @override
  String get qrcodeSectionColor =>
      'لون مخصص';
  @override
  String get qrcodeSectionIcon =>
      'مع أيقونة';
  @override
  String get qrcodeSectionExpired =>
      'الحالة: منتهي الصلاحية';
  @override
  String get qrcodeSectionScanned =>
      'الحالة: تم المسح الضوئي';

  @override
  String get alertTitle =>
      'SAlert';
  @override
  String get alertSectionDescription =>
      'الوصف';
  @override
  String get alertSectionIcon =>
      'أيقونة';
  @override
  String get alertSectionClosable =>
      'قابل للإغلاق';
  @override
  String get alertSectionAction =>
      'إجراء';
  @override
  String get alertSectionBanner =>
      'بانر';
  @override
  String get alertSectionCustomIcon =>
      'أيقونة مخصصة';
  @override
  String get alertSectionSmoothClose =>
      'إغلاق سلس';
  @override
  String get alertSectionCustomizability =>
      'قابلية التخصيص';
  @override
  String get alertWarningTitle =>
      'عنوان التحذير';
  @override
  String get alertSuccessTitle =>
      'عنوان النجاح';
  @override
  String get alertInfoTitle =>
      'عنوان المعلومات';
  @override
  String get alertErrorTitle =>
      'عنوان الخطأ';

  @override
  String get alertSuccessText =>
      'نص النجاح';
  @override
  String get alertInfoText =>
      'نص المعلومات';
  @override
  String get alertWarningText =>
      'نص التحذير';
  @override
  String get alertErrorText =>
      'نص الخطأ';
  @override
  String get alertSuccessDesc =>
      'وصف النجاح وصف النجاح وصف النجاح';
  @override
  String get alertInfoDesc =>
      'وصف المعلومات وصف المعلومات وصف المعلومات وصف المعلومات';
  @override
  String get alertWarningDesc =>
      'وصف التحذير وصف التحذير وصف التحذير وصف التحذير';
  @override
  String get alertErrorDesc =>
      'وصف الخطأ وصف الخطأ وصف الخطأ وصف الخطأ';
  @override
  String get alertSuccessTips =>
      'نصائح النجاح';
  @override
  String get alertInfoNotes =>
      'ملاحظات إعلامية';
  @override
  String get alertWarning =>
      'تحذير';
  @override
  String get alertError =>
      'خطأ';
  @override
  String get alertDetailedSuccess =>
      'وصف مفصل ومشورة حول كتابة النصوص الناجحة.';
  @override
  String get alertAdditionalInfo =>
      'وصف إضافي ومعلومات حول كتابة النصوص.';
  @override
  String get alertWarningNotice =>
      'هذا إشعار تحذيري حول كتابة النصوص.';
  @override
  String get alertErrorMessage =>
      'هذه رسالة خطأ حول كتابة النصوص.';
  @override
  String get alertClosedWarning =>
      'تم إغلاق تنبيه التحذير';
  @override
  String get alertClosedSuccess =>
      'تم إغلاق تنبيه النجاح';
  @override
  String get alertClosedInfo =>
      'تم إغلاق تنبيه المعلومات';
  @override
  String get alertClosedError =>
      'تم إغلاق تنبيه الخطأ';
  @override
  String get alertBtnUndo =>
      'تراجع';
  @override
  String get alertBtnDetail =>
      'التفاصيل';
  @override
  String get alertBtnDone =>
      'تم';
  @override
  String get alertBtnAccept =>
      'قبول';
  @override
  String get alertBtnDecline =>
      'رفض';
  @override
  String get alertClosedMsg =>
      'مغلق! اضغط على الزر أدناه لإعادة الإظهار.';
  @override
  String get alertBtnReshow =>
      'إعادة إظهار التنبيه';
  @override
  String get alertCustomTitle =>
      'تنبيه مخصص بالكامل';
  @override
  String get alertCustomDesc =>
      'سمة أرجوانية مع حدود ونصف قطر وأنماط مخصصة.';
  @override
  String get alertConstrainedTitle =>
      'قيد الحجم المخصص';
  @override
  String get alertConstrainedDesc =>
      'محدود بعرض أقصى 400 بكسل.';
  @override
  String get alertBtnLearnMore =>
      'لمعرفة المزيد';

  @override
  String get dialogDesc =>
      'مربع حوار قابل للتخصيص بشكل كبير مع دعم لرسوم متحركة متعددة وتأثيرات خلفية. استخدم SDialog.show() لمصنع ثابت مريح، أو أنشئ SDialog مباشرة.';
  @override
  String get dialogTip1 =>
      'لمطالبات التأكيد قبل الإجراءات التي لا يمكن الرجوع عنها.';
  @override
  String get dialogTip2 =>
      'لإظهار النماذج أو محتوى التفاصيل التي تتطلب تركيز المستخدم.';
  @override
  String get dialogTip3 =>
      'للتنبيهات أو الرسائل الإعلامية التي تمنع التفاعل في الخلفية.';
  @override
  String get dialogSectionConfirm =>
      'حوار التأكيد';
  @override
  String get dialogSectionContent =>
      'حوار مع المحتوى';
  @override
  String get dialogSectionInfo =>
      'حوار معلومات مع أيقونة';
  @override
  String get dialogTitleDelete =>
      'حذف العنصر';
  @override
  String get dialogDescDelete =>
      'لا يمكن التراجع عن هذا الإجراء. هل أنت متأكد أنك تريد الحذف؟';
  @override
  String get dialogBtnOpenConfirm =>
      'فتح التأكيد';
  @override
  String get dialogTitleEditProfile =>
      'تعديل الملف الشخصي';
  @override
  String get dialogLabelFullName =>
      'الاسم الكامل';
  @override
  String get dialogLabelEmail =>
      'عنوان البريد الإلكتروني';
  @override
  String get dialogBtnOpenForm =>
      'فتح حوار النموذج';
  @override
  String get dialogTitleInfo =>
      'معلومات';
  @override
  String get dialogDescSession =>
      'ستنتهي جلستك خلال 5 دقائق. يرجى حفظ عملك.';
  @override
  String get dialogBtnGotIt =>
      'فهمت';
  @override
  String get dialogBtnOpenInfo =>
      'فتح حوار المعلومات';

  @override
  String get toastDesc =>
      'تراكب إشعار موجز ينزلق من أعلى الشاشة. ⚠️ ملاحظة: SToast مهمل. يفضل استخدام SSonner لجميع إشعارات التوست الجديدة.\n\nلا يزال SToast قابلاً للاستخدام للتوافق مع الإصدارات السابقة - فهو يدعم المتغيرات الافتراضية والمدمرة.';
  @override
  String get toastTip1 =>
      'لإشعارات شريط الأدوات العلوي السريعة التي تظهر بأدنى قدر من مقاطعة المستخدم.';
  @override
  String get toastTip2 =>
      'استخدم SSonner بدلاً من ذلك للكود الجديد - فهو يدعم المزيد من المتغيرات والتكديس.';
  @override
  String get toastSectionDefault =>
      'توست افتراضي';
  @override
  String get toastSectionTitle =>
      'مع عنوان';
  @override
  String get toastSectionDestructive =>
      'متغير مدمر';
  @override
  String get toastSectionRecommendation =>
      'استخدم SSonner بدلاً من ذلك';
  @override
  String get toastLabelMessage =>
      'هذه رسالة توست!';
  @override
  String get toastBtnShow =>
      'إظهار التوست';
  @override
  String get toastLabelSuccess =>
      'نجاح!';
  @override
  String get toastLabelSaved =>
      'تم حفظ تغييراتك.';
  @override
  String get toastBtnShowWithTitle =>
      'إظهار مع العنوان';
  @override
  String get toastLabelError =>
      'خطأ';
  @override
  String get toastLabelWrong =>
      'حدث خطأ ما. يرجى المحاولة مرة أخرى.';
  @override
  String get toastBtnShowError =>
      'إظهار توست الخطأ';
  @override
  String get toastRecommendationText =>
      'يدعم SSonner متغيرات النجاح والخطأ والتحذير والمعلومات وأزرار العمل - مما يجعله نظام التوست المفضل في SDesign.';

  @override
  String get sonnerDesc =>
      'نظام إخطار توست مستوحى من مكتبة Sonner. يعرض إخطارات متراكمة تختفي تلقائيًا. يدعم متغيرات النجاح والخطأ والتحذير والمعلومات.';
  @override
  String get sonnerTip1 =>
      'لتقديم ملاحظات حول العمليات غير المتزامنة (تم الحفظ، تم الحذف، خطأ).';
  @override
  String get sonnerTip2 =>
      'للإخطارات غير المتطفلة التي لا تعيق تدفق المستخدم.';
  @override
  String get sonnerTip3 =>
      'عند احتمال وصول إخطارات متتالية متعددة.';
  @override
  String get sonnerSectionVariants =>
      'المتغيرات';
  @override
  String get sonnerSectionConfig =>
      'عبر SSonnerConfig';
  @override
  String get sonnerSectionAction =>
      'مع زر الإجراء';
  @override
  String get sonnerSectionPosition =>
      'الموضع: الأعلى';
  @override
  String get sonnerSectionReplace =>
      'الاستبدال بدلاً من التراكم';
  @override
  String get sonnerSectionShadow =>
      'توست مسطح (بدون ظل)';
  @override
  String get sonnerLabelSuccess =>
      'نجاح';
  @override
  String get sonnerLabelError =>
      'خطأ';
  @override
  String get sonnerLabelWarning =>
      'تحذير';
  @override
  String get sonnerLabelInfo =>
      'معلومات';
  @override
  String get sonnerLabelMsgSaved =>
      'تم حفظ التغييرات!';
  @override
  String get sonnerLabelMsgUploaded =>
      'تم رفع الملف بنجاح.';
  @override
  String get sonnerLabelTitleUpload =>
      'اكتمل الرفع';
  @override
  String get sonnerBtnShowWithTitle =>
      'إظهار مع العنوان';
  @override
  String get sonnerLabelMsgArchived =>
      'تمت أرشفة البريد الإلكتروني';
  @override
  String get sonnerBtnShowWithAction =>
      'إظهار مع إجراء';
  @override
  String get sonnerLabelMsgTop =>
      'يظهر هذا في الأعلى';
  @override
  String get sonnerBtnShowAtTop =>
      'إظهار في الأعلى';
  @override
  String get sonnerLabelMsgReplaced =>
      'تم استبدال التوست الموجود!';
  @override
  String get sonnerBtnShowReplace =>
      'إظهار واستبدال';
  @override
  String get sonnerLabelMsgNoShadow =>
      'ليس لدي ظل!';
  @override
  String get sonnerBtnShowFlat =>
      'إظهار توست مسطح';
  @override
  String sonnerLabelNotify(String variant) =>
      'إشعار $variant';

  @override
  String get floatingTitle =>
      'عرض تقديمي للوحة العائمة';
  @override
  String get floatingLabelActionCompleted =>
      'اكتمل الإجراء!';
  @override
  String get floatingBtnOk =>
      'موافق';
  @override
  String get floatingTitleAdvanced =>
      'الإعدادات المتقدمة';
  @override
  String get floatingLabelUsername =>
      'اسم المستخدم';
  @override
  String get floatingLabelPassword =>
      'كلمة المرور';
  @override
  String get floatingBtnCancel =>
      'إلغاء';
  @override
  String get floatingBtnSave =>
      'حفظ';
  @override
  String get floatingMsgSettingsSaved =>
      'تم حفظ الإعدادات!';
  @override
  String get floatingTitleSpecialOffer =>
      'عرض خاص!';
  @override
  String get floatingDescSpecialOffer =>
      'احصل على خصم 50٪ على مشترياتك القادمة. لفترة محدودة فقط!';
  @override
  String get floatingBtnMaybeLater =>
      'ربما لاحقاً';
  @override
  String get floatingBtnClaimOffer =>
      'المطالبة بالعرض';
  @override
  String get floatingMsgOfferClaimed =>
      'تمت المطالبة بالعرض!';
  @override
  String get floatingBtnShowSimple =>
      'إظهار لوحة بسيطة';
  @override
  String get floatingBtnShowAdvanced =>
      'إظهار لوحة متقدمة';
  @override
  String get floatingBtnShowCustom =>
      'إظهار لوحة سفلية مخصصة';

  @override
  String get progressDesc =>
      'مكون مؤشر التقدم يدعم تخطيطات الخط، والدائرة، ولوحة القيادة. يأخذ `نسبة مئوية` (0-100) و`حالة` اختيارية لتلوين النجاح/الخطأ.';
  @override
  String get progressTip1 =>
      'لعمليات الرفع، التحميل، أو نسب إكمال المهام.';
  @override
  String get progressTip2 =>
      'كأداة تقدم دائرية على لوحات القيادة.';
  @override
  String get progressTip3 =>
      'عند الحاجة إلى مقياس بنمط لوحة القيادة.';
  @override
  String get progressSectionLine =>
      'تقدم الخط';
  @override
  String get progressSectionCircle =>
      'تقدم الدائرة';
  @override
  String get progressSectionStatus =>
      'متغيرات الحالة';
  @override
  String get progressSectionDashboard =>
      'نمط لوحة القيادة';
  @override
  String get progressBtnDecrease =>
      '- 10%';
  @override
  String get progressBtnIncrease =>
      '+ 10%';

  @override
  String get cardDesc =>
      'حاوية سطح مرنة تجمع المحتوى والإجراءات ذات الصلة. تدعم تأثيرات الحوم، والرؤوس المخصصة، والتذييلات، وصور الغلاف، والتفاعلات القابلة للنقر.';
  @override
  String get cardTip1 =>
      'لعرض المحتوى المجمع مثل ملفات تعريف المستخدمين أو المقالات أو المنتجات.';
  @override
  String get cardTip2 =>
      'كلسطح أساسي في تخطيطات القائمة أو الشبكة.';
  @override
  String get cardTip3 =>
      'لأدوات لوحة القيادة، أو عروض الإحصائيات، أو لوحات الإعدادات.';
  @override
  String get cardSectionBasic =>
      'بطاقة أساسية';
  @override
  String get cardSectionHeader =>
      'بطاقة مع رأس لاحق';
  @override
  String get cardSectionInteractivity =>
      'قابلة للحوم / قابلة للنقر';
  @override
  String get cardSectionVariants =>
      'المتغيرات';
  @override
  String get cardSectionGrid =>
      'شبكة البطاقات';
  @override
  String get cardLabelTitle =>
      'عنوان البطاقة';
  @override
  String get cardLabelBasicBody =>
      'هذه بطاقة أساسية. يمكن أن تحتوي على أي أداة - نص، أو صور، أو أزرار، أو تخطيطات كاملة.';
  @override
  String get cardLabelStats =>
      'الإحصائيات الشهرية';
  @override
  String get cardLabelUsers =>
      'المستخدمون';
  @override
  String get cardLabelRevenue =>
      'الإيرادات';
  @override
  String get cardLabelOrders =>
      'الطلبات';
  @override
  String get cardLabelClickMe =>
      'انقر هنا';
  @override
  String get cardLabelClickableBody =>
      'هذه البطاقة قابلة للنقر. حوم فوقها لرؤية التأثير.';
  @override
  String get cardLabelElevated =>
      'مرتفعة (افتراضي)';
  @override
  String get cardLabelOutlined =>
      'مخططة';
  @override
  String get cardLabelFilled =>
      'مملوءة';
  @override
  String get cardLabelShadow =>
      'بطاقة ظل';
  @override
  String get cardLabelBorder =>
      'بطاقة حدود';
  @override
  String get cardLabelSurface =>
      'بطاقة ملء السطح';
  @override
  String cardLabelItem(int index) =>
      'عنصر $index';

  @override
  String get listTileDesc =>
      'مكون بلاطة قائمة لعرض صفوف المحتوى مع أيقونات بادئة وعنوان وعنوان فرعي وأدوات تالية ثابتة. يدعم التخطيطات المجمعة والمستقلة.';
  @override
  String get listTileTip1 =>
      'لبناء قوائم تنقل قائمة على القوائم أو شاشات الإعدادات.';
  @override
  String get listTileTip2 =>
      'لعرض صفوف البيانات المنظمة بتنسيق ثابت.';
  @override
  String get listTileTip3 =>
      'عندما تحتاج العناصر إلى أيقونة بادئة وإجراء تالي اختياري.';
  @override
  String get listTileSectionBasic =>
      'بلاطة قائمة أساسية';
  @override
  String get listTileSectionGrouped =>
      'قائمة مجمعة';
  @override
  String get listTileSectionSelectable =>
      'بلاطات قابلة للاختيار';
  @override
  String get listTileLabelName =>
      'جون دو';
  @override
  String get listTileLabelRole =>
      'مهندس برمجيات';
  @override
  String get listTileLabelNotifications =>
      'التنبيهات';
  @override
  String get listTileLabelPrivacy =>
      'الخصوصية';
  @override
  String get listTileLabelLanguage =>
      'اللغة';
  @override
  String get listTileLabelInbox =>
      'البريد الوارد';
  @override
  String get listTileLabelSent =>
      'تم الإرسال';
  @override
  String get listTileLabelDrafts =>
      'المسودات';
  @override
  String get listTileLabelSpam =>
      'البريد المزعج';

  @override
  String get tabsDesc =>
      'مكون للتنقل عبر علامات التبويب للتبديل بين وجهات نظر متعددة أو أقسام المحتوى. يدعم أنواع علامات التبويب الخطية والبطاقة والقابلة للتحرير، بالإضافة إلى الأماكن الأعلى والأسفل واليسار واليمين.';
  @override
  String get tabsTip1 =>
      'عندما تحتاج إلى تقسيم المحتوى إلى أقسام ذات صلة على نفس المستوى.';
  @override
  String get tabsTip2 =>
      'لشاشات المحتوى الثقيل مثل صفحات تفاصيل المنتج أو لقطات الملف الشخصي.';
  @override
  String get tabsTip3 =>
      'عندما يكمل التنقل الجانبي الأيسر/الأيمن المشهد الرئيسي.';
  @override
  String get tabsSectionBasic =>
      'علامات تبويب أساسية';
  @override
  String get tabsSectionIcons =>
      'علامات تبويب مع أيقونات';
  @override
  String get tabsSectionCard =>
      'نمط البطاقة';
  @override
  String get tabsLabelOverview =>
      'نظرة عامة';
  @override
  String get tabsLabelDetails =>
      'التفاصيل';
  @override
  String get tabsLabelReviews =>
      'المراجعات';
  @override
  String get tabsContentOverview =>
      'محتوى نظرة عامة';
  @override
  String get tabsContentDetails =>
      'محتوى التفاصيل';
  @override
  String get tabsContentReviews =>
      'محتوى المراجعات';
  @override
  String get tabsLabelHome =>
      'الصفحة الرئيسية';
  @override
  String get tabsLabelSearch =>
      'البحث';
  @override
  String get tabsLabelProfile =>
      'الملف الشخصي';
  @override
  String get tabsLabelCardA =>
      'بطاقة أ';
  @override
  String get tabsLabelCardB =>
      'بطاقة ب';
  @override
  String get tabsLabelCardC =>
      'بطاقة ج';
  @override
  String get tabsContentCardA =>
      'محتوى بطاقة أ';
  @override
  String get tabsContentCardB =>
      'محتوى بطاقة ب';
  @override
  String get tabsContentCardC =>
      'محتوى بطاقة ج';
  @override
  String get tabsTitleShowcase =>
      'عرض علامات التبويب';
  @override
  String get tabsControlLabelType =>
      'النوع';
  @override
  String get tabsControlLabelPosition =>
      'الموضع';
  @override
  String get tabsControlLabelSize =>
      'الحجم';
  @override
  String get tabsControlLabelCentered =>
      'متمركز: ';
  @override
  String get tabsControlLabelMany =>
      'كثير من الألسنة (القائمة): ';
  @override
  String tabsLabelTab(int index) =>
      'علامة تبويب $index';
  @override
  String get tabsLabelShort =>
      'قصير';
  @override
  String get tabsLabelMedium =>
      'طول متوسط';
  @override
  String get tabsLabelCard =>
      'نمط البطاقة';
  @override
  String get tabsLabelDisabled =>
      'معطل';
  @override
  String get tabsContentShort =>
      'علامة تبويب ملصق قصير (خلفية من حافة إلى حافة)';
  @override
  String get tabsContentMedium =>
      'علامة تبويب ملصق متوسطة الطول';
  @override
  String get tabsContentPadding =>
      'تحتوي علامة التبويب هذه على هامش داخلي يدوي مضاف.';
  @override
  String get tabsLabelNestedCard =>
      'بطاقة متداخلة';
  @override
  String get tabsLabelComposition =>
      'توضيح التكوين';
  @override
  String get tabsLabelDisabledContent =>
      'علامة تبويب معطلة';
  @override
  String tabsLabelListItem(int index) =>
      'عنصر القائمة $index';
  @override
  String tabsLabelInTab(int index) =>
      'في علامة التبويب $index';
  @override
  String get tabsTooltipExtra =>
      'إجراء إضافي';

  @override
  String get paginationTitle =>
      'SPagination';
  @override
  String get paginationHeader1 =>
      '1. أساسي';
  @override
  String get paginationDesc1 =>
      'ترقيم صفحات أساسي مع 50 عنصرًا إجماليًا.';
  @override
  String get paginationHeader2 =>
      '2. المزيد من الصفحات — الحذف';
  @override
  String get paginationDesc2 =>
      'مع 500 عنصر، تظهر أزرار الحذف (•••). اضغط عليها للقفز بمقدار ± 5 صفحات.';
  @override
  String get paginationHeader3 =>
      '3. مغير الحجم';
  @override
  String get paginationDesc3 =>
      'يضيف showSizeChanger قائمة منسدلة لاختيار 10/20/50/100 عنصر لكل صفحة.';
  @override
  String get paginationHeader4 =>
      '4. القفز السريع';
  @override
  String get paginationDesc4 =>
      'يضيف showQuickJumper حقل "اذهب إلى". اكتب رقم الصفحة واضغط على مفتاح إدخال.';
  @override
  String get paginationHeader5 =>
      '5. متغيرات الحجم — صغير';
  @override
  String get paginationDesc5 =>
      'ينتج size: SPaginationSize.small عناصر مدمجة بحجم 24 بكسل.';
  @override
  String get paginationHeader5b =>
      '5b. متغيرات الحجم — كبير';
  @override
  String get paginationDesc5b =>
      'ينتج size: SPaginationSize.large عناصر بحجم 40 بكسل.';
  @override
  String get paginationHeader6 =>
      '6. الوضع البسيط';
  @override
  String get paginationDesc6 =>
      'يظهر simple: true الإدخال الحالي/الإجمالي بدلاً من أزرار الصفحات.';
  @override
  String get paginationHeader7 =>
      '7. الوضع المتحكم فيه';
  @override
  String get paginationDesc7 =>
      'توفير current + onChange للتحكم الكامل في الصفحة من حالة الوالد.';
  @override
  String get paginationHeader8 =>
      '8. إظهار الإجمالي';
  @override
  String get paginationDesc8 =>
      'يتلقى showTotal (الإجمالي، [الأول، الأخير]) — إنشاء أي ملصق.';
  @override
  String get paginationHeader9 =>
      '9. عرض عنصر مخصص';
  @override
  String get paginationDesc9 =>
      'يحل itemRender محل أزرار السابق / التالي بأدوات مخصصة.';
  @override
  String get paginationHeader10 =>
      '10. المحاذاة';
  @override
  String get paginationDesc10 =>
      'المحاذاة: البداية / المركز / النهاية.';
  @override
  String get paginationHeader11 =>
      '11. دمج جميع الميزات';
  @override
  String get paginationDesc11 =>
      'إظهار مغير الحجم + القفز السريع + إظهار الإجمالي معًا.';
  @override
  String get paginationHeader12 =>
      '12. تخصيص مفتوح';
  @override
  String get paginationDesc12 =>
      'يمكن تجاوز كل رمز مرئي لكل حالة.';
  @override
  String paginationLabelTotal(int total) =>
      'إجمالي $total عنصر';
  @override
  String paginationLabelRange(
          int first,
          int last,
          int total) =>
      '$first–$last من $total عنصر';
  @override
  String paginationLabelState(int page) =>
      'الحالة: صفحة $page';
  @override
  String get paginationLabelPrevious =>
      '‹ السابق';
  @override
  String get paginationLabelNext =>
      'التالي ›';

  @override
  String get scaffoldTitle =>
      'مثال SScaffold Slivers';
  @override
  String get scaffoldDesc =>
      'هذا يوضح SScaffold مع CustomScrollView.';
  @override
  String get scaffoldStickyHeader =>
      'عنوان لزج';
  @override
  String scaffoldLabelHItem(int index) =>
      'عنصر أفقي $index';
  @override
  String scaffoldLabelItem(int index) =>
      'عنصر $index';
  @override
  String scaffoldLabelSubtitle(int index) =>
      'عنوان فرعي $index';
  @override
  String get scaffoldLabelFAB =>
      'زر';

  @override
  String get navTitle =>
      'التنقل السفلي المتحرك';
  @override
  String get navLabelHome =>
      'الرئيسية';
  @override
  String get navLabelLikes =>
      'الإعجابات';
  @override
  String get navLabelSearch =>
      'بحث';
  @override
  String get navLabelProfile =>
      'الملف الشخصي';

  @override
  String get inputTitleShowcase =>
      'عرض SInputField';
  @override
  String get inputSectionDefault =>
      'حقل الإدخال الافتراضي';
  @override
  String get inputSectionPassword =>
      'حقل كلمة المرور';
  @override
  String get inputSectionIcons =>
      'إدخال مع أيقونات';
  @override
  String get inputSectionDatePicker =>
      'مدخل منتقي التاريخ';
  @override
  String get inputSectionRealWorld =>
      'ميزات العالم الحقيقي';
  @override
  String get inputHintNumber =>
      'أدخل الرقم';
  @override
  String get inputHintPassword =>
      'أدخل كلمة المرور';
  @override
  String get inputHintSearch =>
      'بحث';
  @override
  String get inputHintDate =>
      'اختر التاريخ';
  @override
  String get inputHintEmail =>
      'أدخل بريدك الإلكتروني';
  @override
  String get inputHintCustom =>
      'مخصص';
  @override
  String get inputHintCard =>
      '0000 0000 0000 0000';
  @override
  String get inputLabelCard =>
      'رقم البطاقة';
  @override
  String get inputHelperCard =>
      'نحن لا نخزن تفاصيل بطاقتك';
  @override
  String get inputBtnSubmit =>
      'إرسال';
  @override
  String get inputLabelPrice =>
      'السعر';
  @override
  String get inputHintPrice =>
      '0.00';
  @override
  String get inputHelperPrice =>
      'أدخل السعر بالدولار الأمريكي';
  @override
  String get inputLabelStatus =>
      'حالة الخادم';
  @override
  String get inputHintStatus =>
      'جاري التحقق...';
  @override
  String get inputHelperStatus =>
      'جاري التحقق من الاتصال...';
  @override
  String get inputLabelApiKey =>
      'مفتاح API';
  @override
  String get inputErrorApiKey =>
      'مفتاح API غير صالح (خطأ في الخادم)';
  @override
  String get inputErrorEmpty =>
      'هذا الحقل لا يمكن أن يكون فارغًا.';
  @override
  String get inputErrorNumber =>
      'يرجى إدخال رقم صالح';

  @override
  // TODO: implement inputSectionCard
  String get inputSectionCard =>
      'إدخال بطاقة الائتمان';

  @override
  String get inputSectionCustom =>
      'تخصيص الإدخال';
}

/// Chinese implementation of [SLocalizations].
class SLocalizationsZh
    extends SLocalizations {
  const SLocalizationsZh()
      : super('zh');

  @override
  String get ok =>
      '确定';
  @override
  String get cancel =>
      '取消';
  @override
  String get done =>
      '完成';
  @override
  String get close =>
      '关闭';
  @override
  String get search =>
      '搜索';
  @override
  String get searchPlaceholder =>
      '搜索...';
  @override
  String get selectPlaceholder =>
      '请选择';
  @override
  String get noData =>
      '暂无数据';
  @override
  String get loading =>
      '加载中...';

  @override
  String get selectDate =>
      '选择日期';
  @override
  String get selectTime =>
      '选择时间';
  @override
  String get startDate =>
      '开始日期';
  @override
  String get endDate =>
      '结束日期';
  @override
  String get startTime =>
      '开始时间';
  @override
  String get endTime =>
      '结束时间';
  @override
  String get hour =>
      '时';
  @override
  String get minute =>
      '分';
  @override
  String get second =>
      '秒';

  @override
  String get previousPage =>
      '上一页';
  @override
  String get nextPage =>
      '下一页';
  @override
  String get page =>
      '页';
  @override
  String get of =>
      '/';

  @override
  String get home =>
      '首页';
  @override
  String get inputs =>
      '输入组件';
  @override
  String get display =>
      '显示组件';
  @override
  String get feedback =>
      '反馈组件';
  @override
  String get layout =>
      '布局组件';

  @override
  String get galleryTitle =>
      'SDesign 组件库';
  @override
  String get themeSwitchLight =>
      '切换至亮色模式';
  @override
  String get themeSwitchDark =>
      '切换至暗色模式';
  @override
  String get languageSwitch =>
      '切换语言';
  @override
  String get sidebarHeader =>
      'SDesign';
  @override
  String get searchComponents =>
      '搜索组件...';
  @override
  String get langEn =>
      '英语';
  @override
  String get langFr =>
      '法语';
  @override
  String get langAr =>
      '阿拉伯语';
  @override
  String get langZh =>
      '中文';

  @override
  String get compButton =>
      'SButton';
  @override
  String get compCheckbox =>
      'SCheckbox';
  @override
  String get compSwitch =>
      'SSwitch';
  @override
  String get compInput =>
      'SInput';
  @override
  String get compSelect =>
      'SSelect';
  @override
  String get selectLabelElderberry =>
      '接骨木莓';
  @override
  String get selectLabelDurian =>
      '榴莲';
  @override
  String get selectLabelFig =>
      '无花果';
  @override
  String get selectLabelGrape =>
      '葡萄';
  @override
  String get selectLabelTech =>
      '科技';
  @override
  String get selectTip4 =>
      '当下拉列表很长（10个以上选项）且过滤功能很有帮助时。';
  @override
  String get selectLabelSearchSelect =>
      '搜索并选择...';
  @override
  String get selectSectionWithSearch =>
      '带搜索';
  @override
  String get selectSectionSingle =>
      '单选模式';
  @override
  String get selectSectionMulti =>
      '多选模式';

  @override
  String get compRate =>
      'SRate';
  @override
  String get compDatePicker =>
      'SDatePicker';
  @override
  String get compTimePicker =>
      'STimePicker';
  @override
  String get compAvatar =>
      'SAvatar';
  @override
  String get compSlider =>
      'SSlider';
  @override
  String get compSteps =>
      'SSteps';
  @override
  String get compQRCode =>
      'SQRCode';
  @override
  String get compAlert =>
      'SAlert';
  @override
  String get compDialog =>
      'SDialog';
  @override
  String get compToast =>
      'SToast';
  @override
  String get compSonner =>
      'SSonner';
  @override
  String get compFloatingPanel =>
      'SFloatingPanel';
  @override
  String get compProgress =>
      'SProgress';
  @override
  String get compProgressLine =>
      'SProgress.line';
  @override
  String get compCard =>
      'SCard';
  @override
  String get compListTile =>
      'SListTile';
  @override
  String get compTabs =>
      'STabs';
  @override
  String get compPagination =>
      'SPagination';
  @override
  String get compScaffold =>
      'SScaffold';
  @override
  String get compScaffoldSlivers =>
      'SScaffold Slivers';
  @override
  String get compBottomNav =>
      'SBottom Navigation';
  @override
  String get compCardBasic =>
      'SCard (Basic)';

  @override
  String get heroTagline =>
      'sDesign v2.0.0 正式发布！';
  @override
  String get heroTitle =>
      '以极简代码打造惊艳 UI';
  @override
  String get heroDescription =>
      '一个强大且高度可定制的 Flutter 组件库，灵感源自世界顶级设计系统。专为移动端、Web 和桌面端打造。';
  @override
  String get heroGetStarted =>
      '开始使用';
  @override
  String get heroBrowse =>
      '浏览组件';

  @override
  String get featuresTitle =>
      '为什么选择 sDesign？';
  @override
  String get featCustomTitle =>
      '无限自定义';
  @override
  String get featCustomDesc =>
      '开放所有设计令牌。通过 SThemeData 瞬间将品牌色彩无缝注入所有组件。';
  @override
  String get featDarkTitle =>
      '完美的暗色模式';
  @override
  String get featDarkDesc =>
      '智能颜色令牌确保您的 UI 在亮色和暗色模式下都能开箱即用地呈现高品质且完美的平衡感。';
  @override
  String get featLocTitle =>
      '原生语言支持';
  @override
  String get featLocDesc =>
      "全球化语言支持。内置多语言支持，包括 RTL布局，无需额外配置。";
  @override
  String get featAnimTitle =>
      '微交互';
  @override
  String get featAnimDesc =>
      '愉悦的弹簧物理效果、平滑的悬停状态和华丽的过渡效果，让您的应用响应极其灵敏。';

  @override
  String get showcaseTitle =>
      '交互式实时预览';
  @override
  String get showcaseNotifyBtn =>
      '显示通知';
  @override
  String get showcaseNotifySuccess =>
      '太棒了！您触发了一个成功提示。';
  @override
  String get showcaseEmailLabel =>
      '电子邮箱';
  @override
  String get showcaseEmailHint =>
      'you@example.com';
  @override
  String get showcaseDateHint =>
      '选择日期';
  @override
  String get showcaseDeleteBtn =>
      '删除账号';

  @override
  String get footerIntegrate =>
      '极速集成';
  @override
  String get footerBuiltBy =>
      '由激情打造：';
  @override
  String get footerLicense =>
      '。遵循 MIT 开源协议。';

  @override
  String get demoWhenToUse =>
      '何时使用';
  @override
  String get demoShowCode =>
      '显示代码';
  @override
  String get demoHideCode =>
      '隐藏代码';
  @override
  String get demoVariants =>
      '变体';
  @override
  String get demoSizes =>
      '尺寸';
  @override
  String get demoStates =>
      '状态';
  @override
  String get demoBasicUsage =>
      '基础用法';
  @override
  String get demoLoadingState =>
      '加载状态';
  @override
  String get demoWithIcons =>
      '带图标';
  @override
  String get demoDisabled =>
      '禁用状态';
  @override
  String get demoFullWidth =>
      '全宽布局';
  @override
  String get demoUndo =>
      '撤销';
  @override
  String get demoDelete =>
      '删除';
  @override
  String get demoCancel =>
      '取消';
  @override
  String get demoSave =>
      '保存';
  @override
  String get demoHideSeconds =>
      '隐藏秒数';
  @override
  String get demoStatus =>
      '状态';

  @override
  String get buttonDesc =>
      '一个通用的按钮组件，支持多种变体、尺寸、状态和图标。SButton 遵循现代设计原则 —— 每次交互都有清晰的视觉响应。';
  @override
  String get buttonTip1 =>
      '使用默认变体执行主要操作（例如提交、保存）。';
  @override
  String get buttonTip2 =>
      '使用描边按钮执行次要操作或替代方案。';
  @override
  String get buttonLabelDefault =>
      '默认';
  @override
  String get buttonTip3 =>
      '对删除/不可逆操作使用破坏性按钮。';
  @override
  String get buttonTip4 =>
      '对低强调的内联操作使用幽灵或链接按钮。';
  @override
  String get buttonLabelOutline =>
      '描边';
  @override
  String get buttonLabelSecondary =>
      '次要';
  @override
  String get buttonLabelGhost =>
      '幽灵';
  @override
  String get buttonLabelDestructive =>
      '破坏性';
  @override
  String get buttonLabelLink =>
      '链接';
  @override
  String get buttonLabelLarge =>
      '大号';
  @override
  String get buttonLabelSmall =>
      '小号';
  @override
  String get buttonLabelDownload =>
      '下载';
  @override
  String get buttonLabelNext =>
      '下一步';
  @override
  String get buttonLabelProcessing =>
      '处理中...';
  @override
  String get buttonLabelClickToLoad =>
      '点击加载';
  @override
  String get buttonLabelDisabled =>
      '禁用';
  @override
  String get buttonLabelDisabledOutline =>
      '禁用描边';
  @override
  String get buttonLabelFullWidth =>
      '全宽按钮';

  @override
  String get checkboxDesc =>
      '用于选择一个或多个选项的复选框组件。支持选中、未选中和半选状态。';
  @override
  String get checkboxTip1 =>
      '当用户需要从列表中选择一个或多个项目时使用。';
  @override
  String get checkboxTip2 =>
      '用于切换布尔设置。';
  @override
  String get checkboxTip3 =>
      '作为需要多选的表单的一部分。';
  @override
  String get checkboxLabelAgreed =>
      '已同意';
  @override
  String get checkboxLabelPleaseAgree =>
      '请同意';
  @override
  String get checkboxSectionIndeterminate =>
      '半选 / 全选';
  @override
  String get checkboxLabelSelectAll =>
      '全选';
  @override
  String get checkboxLabelOption =>
      '选项';
  @override
  String get checkboxLabelCheckedDisabled =>
      '已选中且禁用';
  @override
  String get checkboxLabelUncheckedDisabled =>
      '未选中且禁用';

  @override
  String get switchDesc =>
      '一个用于二元开/关状态的切换开关组件。在设置样式的 UI 中，SSwitch 比复选框更能清晰地传达状态。';
  @override
  String get switchTip1 =>
      '用于立即切换单个设置或功能（无需确认）。';
  @override
  String get switchTip2 =>
      '用于需要紧凑空间和明确开/关状态的设置屏幕。';
  @override
  String get switchTip3 =>
      '当切换的效果立即反映在 UI 中时使用。';
  @override
  String get switchSectionBasic =>
      '基础切换';
  @override
  String get switchStatusEnabled =>
      '已启用';
  @override
  String get switchStatusDisabled =>
      '已禁用';
  @override
  String get switchSectionSettings =>
      '设置列表模式';
  @override
  String get switchLabelWifi =>
      'Wi-Fi';
  @override
  String get switchLabelBluetooth =>
      '蓝牙';
  @override
  String get switchLabelNotifications =>
      '通知';
  @override
  String get switchLabelEnabledDisabled =>
      '启用和禁用';
  @override
  String get switchLabelDisabledOff =>
      '禁用和关闭';

  @override
  String get inputDesc =>
      '一个文本输入框，支持前缀/后缀图标、前置/后置组件、验证状态（错误、警告）、清除按钮和多种尺寸。';
  @override
  String get inputTip1 =>
      '在表单中收集用户输入的文本数据。';
  @override
  String get inputTip2 =>
      '用于搜索框、筛选器和数据输入屏幕。';
  @override
  String get inputTip3 =>
      '需要内置验证反馈（错误、警告状态）时。';
  @override
  String get inputLabelSearch =>
      '搜索...';
  @override
  String get inputLabelPassword =>
      '输入密码';
  @override
  String get inputLabelAmount =>
      '金额';
  @override
  String get inputLabelEmailError =>
      '请输入有效的电子邮件';
  @override
  String get inputLabelPasswordWarning =>
      '密码强度较弱';
  @override
  String get inputLabelLarge =>
      '大号输入框';
  @override
  String get inputLabelMiddle =>
      '中号输入框（默认）';
  @override
  String get inputLabelSmall =>
      '小号输入框';
  @override
  String get inputLabelDisabled =>
      '已禁用';
  @override
  String get inputLabelReadOnly =>
      '只读状态';
  @override
  String get inputLabelTypeClear =>
      '键入内容后清除';
  @override
  String get inputLabelMessage =>
      '输入您的消息...';
  @override
  String get inputSectionPrefixSuffix =>
      '带前缀和后缀组件';
  @override
  String get inputSectionValidation =>
      '验证状态';
  @override
  String get inputSectionDisabled =>
      '禁用和只读';
  @override
  String get inputSectionClear =>
      '允许清除';
  @override
  String get inputSectionTextArea =>
      '文本域';

  @override
  String get selectDescExtended =>
      '一个强大的选择框组件，支持单选、多选、标签模式、搜索/过滤、分组项目和自定义图标。';
  @override
  String get selectTip1 =>
      '用更丰富的交互体验替代原生的 <select> 元素。';
  @override
  String get selectTip2 =>
      '从长列表中选择一个或多个项目。';
  @override
  String get selectTip3 =>
      '表单输入需要可搜索的下拉菜单时。';
  @override
  String get selectLabelPickFruit =>
      '选择水果';
  @override
  String get selectLabelSearchFruit =>
      '搜索水果...';
  @override
  String get selectLabelPickMultiple =>
      '选择多个水果';
  @override
  String get selectLabelApple =>
      '苹果';
  @override
  String get selectLabelBanana =>
      '香蕉';
  @override
  String get selectLabelCherry =>
      '樱桃';
  @override
  String get selectLabelDate =>
      '枣';
  @override
  String get rateDesc =>
      '一个星级评分组件，允许用户在数字刻度上提供反馈。支持全星、半星、自定义图标和只读显示。';
  @override
  String get rateTip1 =>
      '用于产品、服务或内容的评分界面。';
  @override
  String get rateTip2 =>
      '用于收集一定范围内的定性反馈。';
  @override
  String get rateTip3 =>
      '在只读模式下显示综合评分。';
  @override
  String rateLabelCurrent(num value) =>
      '当前评分：$value 星';
  @override
  String get rateLabel10Scale =>
      '10 星量表';
  @override
  String get rateSectionBasic =>
      '基础评分';
  @override
  String get rateSectionHalf =>
      '半星支持';
  @override
  String get rateSectionReadOnly =>
      '只读显示';
  @override
  String get rateSectionCustomCount =>
      '自定义星星数量';
  @override
  String get rateDescBasic =>
      '默认情况下为 5 颗星的全星评分。';
  @override
  String get rateDescHalf =>
      '启用 `allowHalf: true` 以实现 0.5 的精度。';
  @override
  String get rateDescReadOnly =>
      '传递 `disabled: true` 以渲染非交互式的评分显示。';
  @override
  String get rateDescCustomCount =>
      '使用 `count` 更改星星的总数。';

  @override
  String get datePickerTitle =>
      'SDatePicker 展示';
  @override
  String get datePickerSectionBasic =>
      '基础日期选择';
  @override
  String get datePickerSectionDisabled =>
      '禁用状态';
  @override
  String get datePickerSectionRange =>
      '范围选择';
  @override
  String get datePickerSectionMonth =>
      '月份选择';
  @override
  String get datePickerSectionYear =>
      '年份选择';
  @override
  String get datePickerSectionPresetsDate =>
      '预设日期选择';
  @override
  String get datePickerSectionPresetsRange =>
      '预设范围选择';
  @override
  String get datePickerSectionCustom =>
      '自定义样式';
  @override
  String get datePickerLabelToday =>
      '今天';
  @override
  String get datePickerLabelTomorrow =>
      '明天';
  @override
  String get datePickerLabelNextWeek =>
      '下周';
  @override
  String get datePickerLabelThisWeek =>
      '本周';
  @override
  String get datePickerLabelLast7Days =>
      '最后 7 天';
  @override
  String get datePickerLabelNext30Days =>
      '后续 30 天';
  @override
  String get datePickerLabelCustomTheme =>
      '自定义主题';

  @override
  String get timePickerTitle =>
      'STimePicker';
  @override
  String get timePickerDescBasic =>
      '默认 HH:mm:ss 选择器。列滚动仅供预览，点击确定或关闭面板时提交数值。';
  @override
  String get timePickerDesc12Hour =>
      'use12Hours 添加 AM/PM 列。格式控制是否显示秒数。';
  @override
  String get timePickerDescDisabled =>
      'disabled: true 使输入框变灰并阻止面板打开。';
  @override
  String get timePickerDescSize =>
      'size: 大 (40 px) / 中 (32 px, 默认) / 小 (24 px)。';
  @override
  String get timePickerDescHideSeconds =>
      "format: 'HH:mm' 从面板中移除秒数列。";
  @override
  String get timePickerDescInterval =>
      'hourStep, minuteStep, secondStep 过滤列中的项目。';
  @override
  String get timePickerDescAddon =>
      'renderExtraFooter 在面板底部添加自定义组件，与内置的“现在”和“确定”按钮并列。';
  @override
  String get timePickerLabelCustomFooter =>
      '✏️ 自定义底部';
  @override
  String get timePickerDescStatus =>
      'status: 错误（红框）或警告（黄框）。';
  @override
  String get timePickerDescSuffixPrefix =>
      'suffixIcon 替换默认时钟图标；prefix 在输入框首部添加组件。';
  @override
  String get timePickerDescVariants =>
      '描边（默认）/ 填充 / 无边框 / 下划线。';
  @override
  String get timePickerLabelOutlined =>
      '描边';
  @override
  String get timePickerLabelOutlinedStart =>
      '描边起始';
  @override
  String get timePickerLabelOutlinedEnd =>
      '描边截止';
  @override
  String get timePickerLabelFilled =>
      '填充';
  @override
  String get timePickerLabelFilledStart =>
      '填充起始';
  @override
  String get timePickerLabelFilledEnd =>
      '填充截止';
  @override
  String get timePickerLabelBorderless =>
      '无边框';
  @override
  String get timePickerLabelBorderlessStart =>
      '无边框起始';
  @override
  String get timePickerLabelBorderlessEnd =>
      '无边框截止';
  @override
  String get timePickerLabelUnderlined =>
      '下划线';
  @override
  String get timePickerLabelUnderlinedStart =>
      '下划线起始';
  @override
  String get timePickerLabelUnderlinedEnd =>
      '下划线截止';
  @override
  String get timePickerDescControlled =>
      'value + onChange 让父组件拥有完整控制权。';
  @override
  String timePickerLabelState(String value) =>
      '状态: $value';
  @override
  String get timePickerDescNeedConfirm =>
      '仅在用户点击确定按钮时提交数值。';
  @override
  String get timePickerDescChangeOnScroll =>
      'onChange 在用户滚动每一列时实时触发（needConfirm 为 false — changeOnScroll 的默认设置）。';
  @override
  String get timePickerDescShowNowFalse =>
      '隐藏底部的“现在”快捷方式（对应 showNow 属性）。';
  @override
  String get timePickerDescRange =>
      'STimeRangePicker 并排渲染两个选择器。';
  @override
  String get timePickerHeader12Hour =>
      '2. 12 小时制';
  @override
  String get timePickerHeaderInterval =>
      '6. 间隔选项';
  @override
  String get timePickerHeaderAddon =>
      '7. 附加组件 — renderExtraFooter';
  @override
  String get timePickerHeaderVariants =>
      '10. 变体模式';
  @override
  String get timePickerHeaderControlled =>
      '11. 受控模式';
  @override
  String get timePickerHeaderNeedConfirm =>
      '12. 需要确认';
  @override
  String get timePickerHeaderChangeOnScroll =>
      '13. 滚动即变';
  @override
  String get timePickerHeaderShowNowFalse =>
      '14. 隐藏“现在”';
  @override
  String get timePickerHeaderRange =>
      '14. 时间范围选择';
  @override
  String timePickerMsgTime(String time) =>
      '时间：$time';
  @override
  String timePickerMsgConfirmed(String time) =>
      '已确认：$time';
  @override
  String timePickerMsgScroll(String time) =>
      '滚动→ $time';
  @override
  String timePickerMsgRange(String start,
          String end) =>
      '$start → $end';

  @override
  String get avatarTitle =>
      'SAvatar';
  @override
  String get avatarSectionBasic =>
      '基础形象';
  @override
  String get avatarSectionType =>
      '类型';
  @override
  String get avatarSectionAutoset =>
      '字体大小自适应';
  @override
  String get avatarSectionFallback =>
      '回退方案';
  @override
  String get avatarSectionBadge =>
      '带徽标';
  @override
  String get avatarSectionGroup =>
      '头像组';
  @override
  String get avatarBtnChangeUser =>
      '切换用户';
  @override
  String get avatarBtnChangeGap =>
      '切换间距';

  @override
  String get sliderDesc =>
      '一个滑块组件，用于在连续或离散的范围内选择一个值或一个范围。支持单滑块和双滑块变体、标记、垂直方向和自定义颜色。';
  @override
  String get sliderTip1 =>
      '用于设置用户可以拖动的数值，如音量或亮度。';
  @override
  String get sliderTip2 =>
      '当选择最小/最大范围（如价格筛选）时。';
  @override
  String get sliderTip3 =>
      '用于分步递增（例如 0, 25, 50, 75, 100%）。';
  @override
  String get sliderSectionBasic =>
      '基础单滑块';
  @override
  String get sliderSectionRange =>
      '范围滑块';
  @override
  String get sliderSectionStepped =>
      '分步（离散）';
  @override
  String get sliderSectionMarks =>
      '带标记点';
  @override
  String sliderLabelValue(num value) =>
      '值：$value %';
  @override
  String sliderLabelRange(num start,
          num end) =>
      '范围：$start % – $end %';
  @override
  String sliderLabelStep(num step,
          num max) =>
      '当前步数：$step（共 $max 步）';

  @override
  String get stepsDesc =>
      '步骤条组件，引导用户完成顺序流程。支持水平和垂直方向、可点击步骤以及状态覆盖。';
  @override
  String get stepsTip1 =>
      '用于多步骤向导（结账、入驻、表单填写）。';
  @override
  String get stepsTip2 =>
      '展示任务序列的进进度。';
  @override
  String get stepsTip3 =>
      '当希望用户了解他们处于工作流程中的位置时。';
  @override
  String get stepsSectionHorizontal =>
      '水平步骤条';
  @override
  String get stepsSectionVertical =>
      '垂直步骤条';
  @override
  String get stepsSectionError =>
      '错误状态';
  @override
  String get stepsSectionClickable =>
      '可点击步骤';
  @override
  String get stepsBtnPrevious =>
      '上一步';
  @override
  String get stepsBtnNext =>
      '下一步';
  @override
  String get stepsLabelOrderPlaced =>
      '下单成功';
  @override
  String get stepsDescOrderReceived =>
      '您的订单已收到';
  @override
  String get stepsLabelProcessing =>
      '处理中';
  @override
  String get stepsDescPrepared =>
      '正在准备中';
  @override
  String get stepsLabelShipped =>
      '已发货';
  @override
  String get stepsDescOnWay =>
      '运送途中';
  @override
  String get stepsLabelDelivered =>
      '已送达';
  @override
  String get stepsDescEnjoy =>
      '祝您使用愉快！';
  @override
  String get stepsLabelStep1 =>
      '步骤 1';
  @override
  String get stepsDescCreateAccount =>
      '创建您的账号';
  @override
  String get stepsLabelStep2 =>
      '步骤 2';
  @override
  String get stepsDescSetProfile =>
      '设置个人资料';
  @override
  String get stepsLabelStep3 =>
      '步骤 3';
  @override
  String get stepsDescExplore =>
      '探索功能';
  @override
  String get stepsLabelPlaced =>
      '下单完成';

  @override
  String get qrcodeDesc =>
      '基于 `qr_flutter` 构建的二维码生成组件。支持自定义大小、颜色、图标、边框样式以及状态覆盖（过期、加载中、已扫描）。';
  @override
  String get qrcodeTip1 =>
      '用于显示支付或应用分享二维码。';
  @override
  String get qrcodeTip2 =>
      '当您需要可扫描且能显示加载中或已过期状态的二维码时。';
  @override
  String get qrcodeTip3 =>
      '用于在二维码中嵌入 Logo 或图标。';
  @override
  String get qrcodeSectionBasic =>
      '基础二维码';
  @override
  String get qrcodeSectionColor =>
      '自定义颜色';
  @override
  String get qrcodeSectionIcon =>
      '带图标样式';
  @override
  String get qrcodeSectionExpired =>
      '状态：已过期';
  @override
  String get qrcodeSectionScanned =>
      '状态：已扫描';

  @override
  String get alertTitle =>
      'SAlert';
  @override
  String get alertSectionDescription =>
      '描述';
  @override
  String get alertSectionIcon =>
      '图标';
  @override
  String get alertSectionClosable =>
      '可关闭';
  @override
  String get alertSectionAction =>
      '动作';
  @override
  String get alertSectionBanner =>
      '横幅';
  @override
  String get alertSectionCustomIcon =>
      '自定义图标';
  @override
  String get alertSectionSmoothClose =>
      '平滑关闭';
  @override
  String get alertSectionCustomizability =>
      '可自定义性';
  @override
  String get alertWarningTitle =>
      '警告标题';
  @override
  String get alertSuccessTitle =>
      '成功标题';
  @override
  String get alertInfoTitle =>
      '信息标题';
  @override
  String get alertErrorTitle =>
      '错误标题';

  @override
  String get alertSuccessText =>
      '成功文本';
  @override
  String get alertInfoText =>
      '信息文本';
  @override
  String get alertWarningText =>
      '警告文本';
  @override
  String get alertErrorText =>
      '错误文本';
  @override
  String get alertSuccessDesc =>
      '成功描述成功描述成功描述成功描述';
  @override
  String get alertInfoDesc =>
      '信息描述信息描述信息描述信息描述';
  @override
  String get alertWarningDesc =>
      '警告描述警告描述警告描述警告描述';
  @override
  String get alertErrorDesc =>
      '错误描述错误描述错误描述错误描述';
  @override
  String get alertSuccessTips =>
      '成功提示';
  @override
  String get alertInfoNotes =>
      '信息提示';
  @override
  String get alertWarning =>
      '警告';
  @override
  String get alertError =>
      '错误';
  @override
  String get alertDetailedSuccess =>
      '关于成功文案的详细描述和建议。';
  @override
  String get alertAdditionalInfo =>
      '关于文案的其他描述和信息。';
  @override
  String get alertWarningNotice =>
      '这是一条关于文案的警告通知。';
  @override
  String get alertErrorMessage =>
      '这是一条关于文案的错误消息。';
  @override
  String get alertClosedWarning =>
      '警告提示已关闭';
  @override
  String get alertClosedSuccess =>
      '成功提示已关闭';
  @override
  String get alertClosedInfo =>
      '信息提示已关闭';
  @override
  String get alertClosedError =>
      '错误提示已关闭';
  @override
  String get alertBtnUndo =>
      '撤销';
  @override
  String get alertBtnDetail =>
      '详情';
  @override
  String get alertBtnDone =>
      '完成';
  @override
  String get alertBtnAccept =>
      '接受';
  @override
  String get alertBtnDecline =>
      '拒绝';
  @override
  String get alertClosedMsg =>
      '已关闭！点击下方按钮重新显示。';
  @override
  String get alertBtnReshow =>
      '重新显示提示';
  @override
  String get alertCustomTitle =>
      '完全自定义提示';
  @override
  String get alertCustomDesc =>
      '带有自定义边框、圆角和样式的紫色主题。';
  @override
  String get alertConstrainedTitle =>
      '自定义大小约束';
  @override
  String get alertConstrainedDesc =>
      '限制最大宽度为 400 px。';
  @override
  String get alertBtnLearnMore =>
      '了解更多';

  @override
  String get dialogDesc =>
      '高度可定制的对话框，支持多种动画和背景效果。使用 SDialog.show() 静态方法方便调用，或直接构造 SDialog 实例。';
  @override
  String get dialogTip1 =>
      '用于执行不可逆操作之前的确认提示。';
  @override
  String get dialogTip2 =>
      '用于展示表单或需要用户关注的详细内容。';
  @override
  String get dialogTip3 =>
      '用于展示需要阻断背景交互的警示或提示信息。';
  @override
  String get dialogSectionConfirm =>
      '确认对话框';
  @override
  String get dialogSectionContent =>
      '带内容的对话框';
  @override
  String get dialogSectionInfo =>
      '带图标的信息对话框';
  @override
  String get dialogTitleDelete =>
      '删除项目';
  @override
  String get dialogDescDelete =>
      '此操作无法撤销。您确定要删除吗？';
  @override
  String get dialogBtnOpenConfirm =>
      '打开确认对话框';
  @override
  String get dialogTitleEditProfile =>
      '编辑资料';
  @override
  String get dialogLabelFullName =>
      '全名';
  @override
  String get dialogLabelEmail =>
      '电子邮箱';
  @override
  String get dialogBtnOpenForm =>
      '打开表单对话框';
  @override
  String get dialogTitleInfo =>
      '信息';
  @override
  String get dialogDescSession =>
      '您的登录会话将在 5 分钟后过期。请及时保存您的工作。';
  @override
  String get dialogBtnGotIt =>
      '知道了';
  @override
  String get dialogBtnOpenInfo =>
      '打开信息对话框';

  @override
  String get toastDesc =>
      '一个从屏幕顶部滑出的简短通知覆盖层。⚠️ 注意：SToast 已弃用。对于所有新的吐司通知，请优先使用 SSonner。\n\nSToast 仍可用于向后兼容 — 它支持默认和破坏性变体。';
  @override
  String get toastTip1 =>
      '用于干扰用户程度最小的快速顶部栏通知。';
  @override
  String get toastTip2 =>
      '对于新代码，请改用 SSonner — 它支持更多变体和堆叠。';
  @override
  String get toastSectionDefault =>
      '默认吐司';
  @override
  String get toastSectionTitle =>
      '带标题';
  @override
  String get toastSectionDestructive =>
      '破坏性变体';
  @override
  String get toastSectionRecommendation =>
      '改用 SSonner';
  @override
  String get toastLabelMessage =>
      '这是一条吐司消息！';
  @override
  String get toastBtnShow =>
      '显示吐司';
  @override
  String get toastLabelSuccess =>
      '成功！';
  @override
  String get toastLabelSaved =>
      '您的更改已保存。';
  @override
  String get toastBtnShowWithTitle =>
      '显示带标题的吐司';
  @override
  String get toastLabelError =>
      '错误';
  @override
  String get toastLabelWrong =>
      '出错了，请稍后再试。';
  @override
  String get toastBtnShowError =>
      '显示错误吐司';
  @override
  String get toastRecommendationText =>
      'SSonner 支持成功、错误、警告、信息变体和操作按钮 — 使其成为 SDesign 中首选的吐司系统。';

  @override
  String get sonnerDesc =>
      '受 Sonner 库启发的吐司通知系统。显示堆叠的、自动消失的通知。支持成功、错误、警告和信息变体。';
  @override
  String get sonnerTip1 =>
      '针对异步操作（保存、删除、错误）提供反馈。';
  @override
  String get sonnerTip2 =>
      '用于不阻断用户流程的非侵入式通知。';
  @override
  String get sonnerTip3 =>
      '当可能会接连出现多个通知时。';
  @override
  String get sonnerSectionVariants =>
      '变体';
  @override
  String get sonnerSectionConfig =>
      '通过 SSonnerConfig 配置';
  @override
  String get sonnerSectionAction =>
      '带有操作按钮';
  @override
  String get sonnerSectionPosition =>
      '位置：顶部';
  @override
  String get sonnerSectionReplace =>
      '替换而非堆叠';
  @override
  String get sonnerSectionShadow =>
      '扁平吐司（无阴影）';
  @override
  String get sonnerLabelSuccess =>
      '成功';
  @override
  String get sonnerLabelError =>
      '错误';
  @override
  String get sonnerLabelWarning =>
      '警告';
  @override
  String get sonnerLabelInfo =>
      '信息';
  @override
  String get sonnerLabelMsgSaved =>
      '更改已保存！';
  @override
  String get sonnerLabelMsgUploaded =>
      '文件上传成功。';
  @override
  String get sonnerLabelTitleUpload =>
      '上传完成';
  @override
  String get sonnerBtnShowWithTitle =>
      '显示带标题的吐司';
  @override
  String get sonnerLabelMsgArchived =>
      '邮件已归档';
  @override
  String get sonnerBtnShowWithAction =>
      '显示带操作的吐司';
  @override
  String get sonnerLabelMsgTop =>
      '此通知显示在顶部';
  @override
  String get sonnerBtnShowAtTop =>
      '在顶部显示';
  @override
  String get sonnerLabelMsgReplaced =>
      '已替换现有的吐司通知！';
  @override
  String get sonnerBtnShowReplace =>
      '显示并替换';
  @override
  String get sonnerLabelMsgNoShadow =>
      '我没有阴影！';
  @override
  String get sonnerBtnShowFlat =>
      '显示扁平吐司';
  @override
  String sonnerLabelNotify(String variant) =>
      '$variant 通知';

  @override
  String get floatingTitle =>
      '浮动面板演示';
  @override
  String get floatingLabelActionCompleted =>
      '操作已完成！';
  @override
  String get floatingBtnOk =>
      '确定';
  @override
  String get floatingTitleAdvanced =>
      '高级设置';
  @override
  String get floatingLabelUsername =>
      '用户名';
  @override
  String get floatingLabelPassword =>
      '密码';
  @override
  String get floatingBtnCancel =>
      '取消';
  @override
  String get floatingBtnSave =>
      '保存';
  @override
  String get floatingMsgSettingsSaved =>
      '设置已保存！';
  @override
  String get floatingTitleSpecialOffer =>
      '特惠优惠！';
  @override
  String get floatingDescSpecialOffer =>
      '下次购物可享 5 折优惠。仅限有限时间内！';
  @override
  String get floatingBtnMaybeLater =>
      '以后再说';
  @override
  String get floatingBtnClaimOffer =>
      '领取优惠';
  @override
  String get floatingMsgOfferClaimed =>
      '优惠已领取！';
  @override
  String get floatingBtnShowSimple =>
      '显示简单面板';
  @override
  String get floatingBtnShowAdvanced =>
      '显示高级面板';
  @override
  String get floatingBtnShowCustom =>
      '显示自定义底部面板';

  @override
  String get progressDesc =>
      '支持线条、圆形和仪表盘布局的进度指示器组件。接受 `percent` (0–100) 以及可选的 `status` 以进行成功/错误着色。';
  @override
  String get progressTip1 =>
      '用于上传、下载或任务完成百分比显示。';
  @override
  String get progressTip2 =>
      '作为仪表盘上的圆形进度小部件。';
  @override
  String get progressTip3 =>
      '当需要仪表盘样式的压力表时。';
  @override
  String get progressSectionLine =>
      '线条进度条';
  @override
  String get progressSectionCircle =>
      '圆形进度条';
  @override
  String get progressSectionStatus =>
      '状态变体';
  @override
  String get progressSectionDashboard =>
      '仪表盘样式';
  @override
  String get progressBtnDecrease =>
      '- 10%';
  @override
  String get progressBtnIncrease =>
      '+ 10%';

  @override
  String get cardDesc =>
      '一个灵活的表面容器，用于对相关内容和操作进行分组。支持悬停效果、自定义页眉、页脚、封面图像和可点击交互。';
  @override
  String get cardTip1 =>
      '用于显示分组内容，如用户配置文件、文章或产品。';
  @override
  String get cardTip2 =>
      '作为列表或网格布局中的主要表面。';
  @override
  String get cardTip3 =>
      '用于仪表盘小部件、统计显示或设置面板。';
  @override
  String get cardSectionBasic =>
      '基本卡片';
  @override
  String get cardSectionHeader =>
      '带页眉尾部的卡片';
  @override
  String get cardSectionInteractivity =>
      '可悬停 / 可点击';
  @override
  String get cardSectionVariants =>
      '变体';
  @override
  String get cardSectionGrid =>
      '卡片网格';
  @override
  String get cardLabelTitle =>
      '卡片标题';
  @override
  String get cardLabelBasicBody =>
      '这是一个基本卡片。它可以包含任何小部件 — 文本、图像、按钮或整个布局。';
  @override
  String get cardLabelStats =>
      '月度统计';
  @override
  String get cardLabelUsers =>
      '用户';
  @override
  String get cardLabelRevenue =>
      '收入';
  @override
  String get cardLabelOrders =>
      '订单';
  @override
  String get cardLabelClickMe =>
      '点击我';
  @override
  String get cardLabelClickableBody =>
      '此卡片是可点击的。将鼠标悬停在其上以查看效果。';
  @override
  String get cardLabelElevated =>
      '提升 (默认)';
  @override
  String get cardLabelOutlined =>
      '轮廓';
  @override
  String get cardLabelFilled =>
      '填充';
  @override
  String get cardLabelShadow =>
      '带有阴影的卡片';
  @override
  String get cardLabelBorder =>
      '带有边框的卡片';
  @override
  String get cardLabelSurface =>
      '具有表面填充的卡片';
  @override
  String cardLabelItem(int index) =>
      '项目 $index';

  @override
  String get listTileDesc =>
      '列表平铺组件，用于通过一致的前缀图标、标题、副标题和尾部小部件显示内容行。支持分组和独立布局。';
  @override
  String get listTileTip1 =>
      '用于构建基于列表的导航菜单或设置屏幕。';
  @override
  String get listTileTip2 =>
      '用于显示具有一致格式的结构化数据行。';
  @override
  String get listTileTip3 =>
      '当项目需要前缀图标和可选的尾部操作时。';
  @override
  String get listTileSectionBasic =>
      '基本列表项';
  @override
  String get listTileSectionGrouped =>
      '分组列表';
  @override
  String get listTileSectionSelectable =>
      '可选择的列表项';
  @override
  String get listTileLabelName =>
      '张三';
  @override
  String get listTileLabelRole =>
      '软件工程师';
  @override
  String get listTileLabelNotifications =>
      '通知';
  @override
  String get listTileLabelPrivacy =>
      '隐私';
  @override
  String get listTileLabelLanguage =>
      '语言';
  @override
  String get listTileLabelInbox =>
      '收件箱';
  @override
  String get listTileLabelSent =>
      '已发送';
  @override
  String get listTileLabelDrafts =>
      '草稿';
  @override
  String get listTileLabelSpam =>
      '垃圾邮件';

  @override
  String get tabsDesc =>
      '用于在多个视图或内容部分之间切换的标签页导航组件。支持线条、卡片和可编辑标签类型，以及上/下/左/右位置。';
  @override
  String get tabsTip1 =>
      '当您需要将内容划分为相关的同级部分时。';
  @override
  String get tabsTip2 =>
      '用于内容密集的屏幕，如产品详情页或个人资料视图。';
  @override
  String get tabsTip3 =>
      '当左/右侧栏导航补充主视图时。';
  @override
  String get tabsSectionBasic =>
      '基础标签页';
  @override
  String get tabsSectionIcons =>
      '带有图标的标签页';
  @override
  String get tabsSectionCard =>
      '卡片类型';
  @override
  String get tabsLabelOverview =>
      '概览';
  @override
  String get tabsLabelDetails =>
      '详情';
  @override
  String get tabsLabelReviews =>
      '评论';
  @override
  String get tabsContentOverview =>
      '概览内容';
  @override
  String get tabsContentDetails =>
      '详情内容';
  @override
  String get tabsContentReviews =>
      '评论内容';
  @override
  String get tabsLabelHome =>
      '首页';
  @override
  String get tabsLabelSearch =>
      '搜索';
  @override
  String get tabsLabelProfile =>
      '个人资料';
  @override
  String get tabsLabelCardA =>
      '卡片 A';
  @override
  String get tabsLabelCardB =>
      '卡片 B';
  @override
  String get tabsLabelCardC =>
      '卡片 C';
  @override
  String get tabsContentCardA =>
      '卡片 A 内容';
  @override
  String get tabsContentCardB =>
      '卡片 B 内容';
  @override
  String get tabsContentCardC =>
      '卡片 C 内容';
  @override
  String get tabsTitleShowcase =>
      '标签页展示';
  @override
  String get tabsControlLabelType =>
      '类型';
  @override
  String get tabsControlLabelPosition =>
      '位置';
  @override
  String get tabsControlLabelSize =>
      '尺寸';
  @override
  String get tabsControlLabelCentered =>
      '居中：';
  @override
  String get tabsControlLabelMany =>
      '多标签（列表）：';
  @override
  String tabsLabelTab(int index) =>
      '标签 $index';
  @override
  String get tabsLabelShort =>
      '短文本';
  @override
  String get tabsLabelMedium =>
      '中等长度文本';
  @override
  String get tabsLabelCard =>
      '卡片样式';
  @override
  String get tabsLabelDisabled =>
      '禁用';
  @override
  String get tabsContentShort =>
      '短标签页（边缘到边缘背景）';
  @override
  String get tabsContentMedium =>
      '中等长度标签页';
  @override
  String get tabsContentPadding =>
      '此标签页添加了手动内边距。';
  @override
  String get tabsLabelNestedCard =>
      '嵌套卡片';
  @override
  String get tabsLabelComposition =>
      '演示组件组合';
  @override
  String get tabsLabelDisabledContent =>
      '禁用标签页';
  @override
  String tabsLabelListItem(int index) =>
      '列表项 $index';
  @override
  String tabsLabelInTab(int index) =>
      '在标签 $index 中';
  @override
  String get tabsTooltipExtra =>
      '额外操作';

  @override
  String get paginationTitle =>
      'SPagination';
  @override
  String get paginationHeader1 =>
      '1. 基础';
  @override
  String get paginationDesc1 =>
      '总共有 50 个项目的基础分页。';
  @override
  String get paginationHeader2 =>
      '2. 更多页码 — 省略号';
  @override
  String get paginationDesc2 =>
      '当有 500 个项目时，会出现省略号 (•••) 按钮。点击它们可以跳转 ±5 页。';
  @override
  String get paginationHeader3 =>
      '3. 尺寸切换器';
  @override
  String get paginationDesc3 =>
      'showSizeChanger 会添加一个下拉列表，用于选择每页 10/20/50/100 个项目。';
  @override
  String get paginationHeader4 =>
      '4. 快速跳转';
  @override
  String get paginationDesc4 =>
      'showQuickJumper 会添加一个“跳至”字段。输入页码并按 Enter 键。';
  @override
  String get paginationHeader5 =>
      '5. 尺寸变体 — 小';
  @override
  String get paginationDesc5 =>
      'size: SPaginationSize.small 会产生 24px 的紧凑项目。';
  @override
  String get paginationHeader5b =>
      '5b. 尺寸变体 — 大';
  @override
  String get paginationDesc5b =>
      'size: SPaginationSize.large 会产生 40px 的项目。';
  @override
  String get paginationHeader6 =>
      '6. 简单模式';
  @override
  String get paginationDesc6 =>
      'simple: true 会显示当前页/总页数输入，而不是页码按钮。';
  @override
  String get paginationHeader7 =>
      '7. 受控模式';
  @override
  String get paginationDesc7 =>
      '通过提供 current + onChange 属性，可以完全由父组件状态控制分页。';
  @override
  String get paginationHeader8 =>
      '8. 显示总数';
  @override
  String get paginationDesc8 =>
      'showTotal 方法接收 (total, [first, last]) 参数 — 可用于构建任何标签。';
  @override
  String get paginationHeader9 =>
      '9. 自定义按钮渲染';
  @override
  String get paginationDesc9 =>
      'itemRender 方法可以使用自定义小部件替换“上一页”/“下一页”按钮。';
  @override
  String get paginationHeader10 =>
      '10. 对齐方式';
  @override
  String get paginationDesc10 =>
      'align: start / center / end。';
  @override
  String get paginationHeader11 =>
      '11. 所有功能组合';
  @override
  String get paginationDesc11 =>
      '同时启用显示尺寸切换器、快速跳转和显示总项目数。';
  @override
  String get paginationHeader12 =>
      '12. 高度自定义';
  @override
  String get paginationDesc12 =>
      '每个视觉令牌都可以在每个实例中进行覆盖。';
  @override
  String paginationLabelTotal(int total) =>
      '共 $total 条';
  @override
  String paginationLabelRange(
          int first,
          int last,
          int total) =>
      '第 $first–$last 条 / 共 $total 条';
  @override
  String paginationLabelState(int page) =>
      '状态：第 $page 页';
  @override
  String get paginationLabelPrevious =>
      '‹ 上一页';
  @override
  String get paginationLabelNext =>
      '下一页 ›';

  @override
  String get scaffoldTitle =>
      'SScaffold 滚动示例';
  @override
  String get scaffoldDesc =>
      '这演示了带有 CustomScrollView 的 SScaffold。';
  @override
  String get scaffoldStickyHeader =>
      '粘性标题';
  @override
  String scaffoldLabelHItem(int index) =>
      '横向项目 $index';
  @override
  String scaffoldLabelItem(int index) =>
      '项目 $index';
  @override
  String scaffoldLabelSubtitle(int index) =>
      '子标题 $index';
  @override
  String get scaffoldLabelFAB =>
      '悬浮按钮';

  @override
  String get navTitle =>
      '动画底部导航';
  @override
  String get navLabelHome =>
      '首页';
  @override
  String get navLabelLikes =>
      '点赞';
  @override
  String get navLabelSearch =>
      '搜索';
  @override
  String get navLabelProfile =>
      '个人资料';

  @override
  String get inputTitleShowcase =>
      'SInputField 演示';
  @override
  String get inputSectionDefault =>
      '默认输入框';
  @override
  String get inputSectionPassword =>
      '密码框';
  @override
  String get inputSectionIcons =>
      '带有图标的输入框';
  @override
  String get inputSectionDatePicker =>
      '日期选择器输入';
  @override
  String get inputSectionRealWorld =>
      '真实场景功能';
  @override
  String get inputHintNumber =>
      '请输入数字';
  @override
  String get inputHintPassword =>
      '请输入密码';
  @override
  String get inputHintSearch =>
      '搜索';
  @override
  String get inputHintDate =>
      '请选择日期';
  @override
  String get inputHintEmail =>
      '请输入电子邮件';
  @override
  String get inputHintCustom =>
      '自定义';
  @override
  String get inputHintCard =>
      '0000 0000 0000 0000';
  @override
  String get inputLabelCard =>
      '卡号';
  @override
  String get inputHelperCard =>
      '我们不会存储您的卡片详细信息';
  @override
  String get inputBtnSubmit =>
      '提交';
  @override
  String get inputLabelPrice =>
      '价格';
  @override
  String get inputHintPrice =>
      '0.00';
  @override
  String get inputHelperPrice =>
      '以美元输入价格';
  @override
  String get inputLabelStatus =>
      '服务器状态';
  @override
  String get inputHintStatus =>
      '正在检查...';
  @override
  String get inputHelperStatus =>
      '正在验证连接...';
  @override
  String get inputLabelApiKey =>
      'API 密钥';
  @override
  String get inputErrorApiKey =>
      'API 密钥无效（服务器错误）';
  @override
  String get inputErrorEmpty =>
      '此字段不能为空。';
  @override
  String get inputErrorNumber =>
      '请输入有效的数字';

  @override
  // TODO: implement compDropdown
  String get compDropdown =>
      'SDropdown';

  @override
  String get inputSectionCard =>
      '信用卡输入';

  @override
  String get inputSectionCustom =>
      '输入自定义';
}
