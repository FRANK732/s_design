/// Defines the illustration variants available for the [SAppState] component.
enum SAppStateVariant {
  /// Illustration for adding notes.
  addNotes,

  /// Illustration with an arrow pointer, useful for guiding users.
  arrowPointer,

  /// Illustration for an empty notification state.
  emptyNotification,

  /// Illustration for a failed server connection state.
  failedServer,

  /// Illustration for an empty or missing calendar state.
  noCalendar,

  /// Illustration for a general "no data" state.
  noData,

  /// Illustration for a server down state.
  underConstruction,

  /// Allows providing a custom illustration widget instead of a predefined one.
  custom,
}
