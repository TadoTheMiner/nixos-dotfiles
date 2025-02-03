{...}: {
  xdg.configFile."musikcube/settings.json".text = builtins.toJSON {
    AppQuitKey = "^D";
    AsyncTrackListQueries = true;
    AuddioApiToken = "";
    AutoHideCommandBar = false;
    AutoUpdateCheck = false;
    CategoryTrackListSortOrder = 0;
    ColorTheme = "catppuccin";
    DisableAlbumArtistFallback = false;
    DisableCustomColors = false;
    DisableRatingColumn = true;
    DisableWindowTitleUpdates = true;
    FirstRunSettingsDisplayed = true;
    IndexerLogEnabled = false;
    IndexerThreadCount = 4;
    IndexerTransactionInterval = 300;
    InheritBackgroundColor = true;
    LastFmSessionId = "";
    LastFmToken = "";
    LastFmUsername = "";
    LibraryType = 1;
    Locale = "en_US";
    MinimizeToTray = false;
    PiggyEnabled = false;
    PiggyHostname = "localhost";
    PlaybackTrackQueryTimeoutMs = 5000;
    RatingNegativeChar = "·";
    RatingPositiveChar = "★";
    RemoteLibraryHostname = "127.0.0.1";
    RemoteLibraryHttpPort = 7906;
    RemoteLibraryHttpTls = false;
    RemoteLibraryIgnoreVersionMismatch = 0;
    RemoteLibraryLatencyTimeoutMs = 5000;
    RemoteLibraryPassword = "";
    RemoteLibraryTranscoderBitrate = 192;
    RemoteLibraryTranscoderEnabled = false;
    RemoteLibraryTranscoderFormat = "ogg";
    RemoteLibraryWssPort = 7905;
    RemoteLibraryWssTls = false;
    RemoveMissingFiles = true;
    ResumePlaybackOnStartup = false;
    SaveSessionOnExit = true;
    StartMinimized = false;
    SyncOnStartup = true;
    TrackSearchSortOrder = 0;
    UsePaletteColors = false;
  };
}
