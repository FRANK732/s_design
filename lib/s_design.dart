// Clean Architecture Exports - sDesign Package

// ============================================================================
// CORE LAYER
// ============================================================================
export 'src/core/constants/design_constants.dart';

// ============================================================================
// DOMAIN LAYER - Entities
// ============================================================================

// Button entities
export 'src/domain/entities/config/button_config_entity.dart';

// Input entities
export 'src/domain/entities/config/s_input_field_size.dart';

// Checkbox entities
export 'src/domain/entities/config/s_checkbox_state.dart';

// Switch entities
export 'src/domain/entities/config/s_switch_enums.dart';

// Card entities
export 'src/domain/entities/config/s_card_shadow.dart';
export 'src/domain/entities/config/s_card_shape.dart';

// Dialog entities
export 'src/domain/entities/config/s_dialog_type.dart';

// Select entities
export 'src/domain/entities/config/s_select_direction.dart';
export 'src/domain/entities/config/s_select_type.dart';

// Dropdown entities
export 'src/domain/entities/config/s_dropdown_menu_item_type.dart';

// Tabs entities
export 'src/domain/entities/config/s_tabs_model.dart';
export 'src/domain/entities/config/s_tabs_enums.dart';

// Sonner entities
export 'src/domain/entities/config/s_sonner_options.dart';

// Toaster entities
export 'src/domain/entities/config/s_toaster_enum.dart';

// Loading entities
export 'src/domain/entities/config/s_loading_types.dart';

// ============================================================================
// DOMAIN LAYER - Use Cases
// ============================================================================
export 'src/domain/usecases/validation/validate_button_config.dart';

// ============================================================================
// PRESENTATION LAYER - Components
// ============================================================================

// Base Components
export 'src/presentation/components/base/s_scaffold/base_scaffold.dart';
export 'src/presentation/components/base/s_scaffold/widgets/loading_config.dart';
export 'src/presentation/components/base/s_scaffold/widgets/persistent_footer_config.dart';
export 'src/presentation/components/base/s_scaffold/widgets/refresh_config.dart';

// Input Components
export 'src/presentation/components/inputs/s_button/s_button.dart';
export 'src/presentation/components/inputs/s_button/s_button_poc.dart';
export 'src/presentation/components/inputs/s_input/s_input_field.dart';
export 'src/presentation/components/inputs/s_checkbox/s_checkbox.dart';
export 'src/presentation/components/inputs/s_switch/s_switch.dart';
export 'src/presentation/components/inputs/s_select/s_select.dart';
export 'src/presentation/components/inputs/s_dropdown/s_dropdown_menu.dart';
export 'src/presentation/components/inputs/s_dropdown/s_dropdown_controller.dart';

// Layout Components
export 'src/presentation/components/layout/s_card/s_card.dart';
export 'src/presentation/components/layout/s_list_tile/s_list_tile.dart';
export 'src/presentation/components/layout/s_tabs/s_tabs.dart';
export 'src/presentation/components/layout/s_tabs/s_tab_list.dart';
export 'src/presentation/components/layout/s_tabs/s_tabs_content.dart';

export 'src/presentation/components/feedback/s_dialog/s_dialog.dart';
export 'src/presentation/components/feedback/s_progress_bar/progress.dart';
export 'src/presentation/components/feedback/s_sonner/s_sonner.dart';
export 'src/presentation/components/feedback/s_toaster/s_toaster.dart';

// Overlay Components
export 'src/presentation/components/overlays/s_bottom_sheet/s_floating_panel.dart';

// ============================================================================
// PRESENTATION LAYER - Common
// ============================================================================
export 'src/presentation/common/loading/loading_indicator.dart';
export 'src/presentation/builders/overlay_builder.dart';

// ============================================================================
// PRESENTATION LAYER - Themes
// ============================================================================
// DEPRECATED: s_theme.dart uses old SColorsBase system
// New components use ColorScheme with ThemeExtension instead
// export 'src/presentation/themes/s_theme.dart';

// Theme Tokens
export 'src/presentation/themes/tokens/colors.dart';
export 'src/presentation/themes/tokens/typography.dart';
export 'src/presentation/themes/tokens/spacing.dart';
export 'src/presentation/themes/tokens/radii.dart';
export 'src/presentation/themes/tokens/dimensions.dart';

// Component Themes
export 'src/presentation/themes/extensions/component_themes/s_button_theme.dart';
export 'src/presentation/themes/extensions/component_themes/s_card_theme.dart';
export 'src/presentation/themes/extensions/component_themes/s_checkbox_theme.dart';
export 'src/presentation/themes/extensions/component_themes/s_dialog_theme.dart';
export 'src/presentation/themes/extensions/component_themes/s_dropdown_menu_theme.dart';
export 'src/presentation/themes/extensions/component_themes/s_input_field_theme.dart';
export 'src/presentation/themes/extensions/component_themes/s_list_tile_theme.dart';
export 'src/presentation/themes/extensions/component_themes/s_progress_bar_theme.dart';
export 'src/presentation/themes/extensions/component_themes/s_select_theme.dart';
export 'src/presentation/themes/extensions/component_themes/s_sonner_theme.dart';
export 'src/presentation/themes/extensions/component_themes/s_switch_theme.dart';
export 'src/presentation/themes/extensions/component_themes/s_tabs_theme.dart';
export 'src/presentation/themes/extensions/component_themes/s_toast_theme.dart';

// ============================================================================
// UTILITIES (for convenience)
// ============================================================================
export 'src/core/utils/s_input_field_utils.dart';
export 'src/core/utils/s_progress_bar_utils.dart';
