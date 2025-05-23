{
  lib,
  config,
  ...
}:
let
  catpppuccin_flavor =
    (lib.importJSON "${config.catppuccin.sources.palette}/palette.json")
    .${config.catppuccin.flavor}.colors;
in
{
  xdg.configFile = {
    "vesktop/themes/catppuccin.css".text =
      "@import url(\"https://catppuccin.github.io/discord/dist/catppuccin-${config.catppuccin.flavor}-${config.catppuccin.accent}.theme.css\")";
    "vesktop/themes/purecord.css".source = ../assets/discord.css;
    "vesktop/settings.json".text = builtins.toJSON {
      arRPC = true;
      discordBranch = "stable";
      minimizeToTray = false;
      spellCheckLanguages = [
        "en-US"
        "en"
      ];
      splashBackground = catpppuccin_flavor.base.hex;
      splashColor = catpppuccin_flavor.${config.catppuccin.accent}.hex;
      splashTheming = true;
      tray = false;
    };
    "vesktop/settings/settings.json".text = builtins.toJSON {
      autoUpdate = true;
      autoUpdateNotification = true;
      cloud = {
        authenticated = false;
        settingsSync = false;
        settingsSyncVersion = 1739731321926;
        url = "https://api.vencord.dev/";
      };
      disableMinSize = false;
      enableReactDevtools = false;
      enabledThemes = [ "catppuccin.css" ];
      frameless = false;
      notifications = {
        logLimit = 50;
        position = "bottom-right";
        timeout = 5000;
        useNative = "not-focused";
      };
      plugins = {
        AccountPanelServerProfile.enabled = false;
        AlwaysAnimate.enabled = false;
        AlwaysExpandRoles.enabled = true;
        AlwaysTrust = {
          domain = true;
          enabled = true;
          file = true;
        };
        AnonymiseFileNames.enabled = false;
        AppleMusicRichPresence.enabled = false;
        BANger.enabled = false;
        BadgeAPI.enabled = true;
        BetterFolders.enabled = false;
        BetterGifAltText.enabled = false;
        BetterGifPicker.enabled = false;
        BetterNotesBox.enabled = false;
        BetterRoleContext.enabled = false;
        BetterRoleDot.enabled = false;
        BetterSessions.enabled = false;
        BetterSettings.enabled = false;
        BetterUploadButton.enabled = false;
        BiggerStreamPreview.enabled = false;
        BlurNSFW.enabled = false;
        CallTimer = {
          enabled = true;
          format = "stopwatch";
        };
        ChatInputButtonAPI.enabled = false;
        ClearURLs.enabled = true;
        ClientTheme.enabled = false;
        ColorSighted.enabled = false;
        CommandsAPI.enabled = true;
        ConsoleJanitor = {
          disableLoggers = false;
          disableSpotifyLogger = true;
          enabled = true;
          whitelistedLoggers = "GatewaySocket; Routing/Utils";
        };
        ConsoleShortcuts.enabled = false;
        CopyEmojiMarkdown = {
          copyUnicode = true;
          enabled = false;
        };
        CopyFileContents.enabled = false;
        CopyUserURLs.enabled = false;
        CrashHandler.enabled = true;
        CtrlEnterSend.enabled = false;
        CustomIdle.enabled = false;
        CustomRPC.enabled = false;
        Dearrow = {
          dearrowByDefault = true;
          enabled = true;
          hideButton = false;
          replaceElements = 0;
        };
        Decor.enabled = false;
        DisableCallIdle.enabled = false;
        DontRoundMyTimestamps.enabled = false;
        DynamicImageModalAPI.enabled = false;
        EmoteCloner.enabled = false;
        Experiments.enabled = false;
        F8Break.enabled = false;
        FakeNitro.enabled = false;
        FakeProfileThemes.enabled = false;
        FavoriteEmojiFirst.enabled = false;
        FavoriteGifSearch.enabled = false;
        FixCodeblockGap.enabled = false;
        FixImagesQuality.enabled = false;
        FixSpotifyEmbeds.enabled = false;
        FixYoutubeEmbeds.enabled = false;
        ForceOwnerCrown.enabled = false;
        FriendInvites.enabled = false;
        FriendsSince.enabled = false;
        FullSearchContext.enabled = false;
        FullUserInChatbox.enabled = false;
        GameActivityToggle.enabled = false;
        GifPaste.enabled = false;
        GreetStickerPicker.enabled = false;
        HideMedia.enabled = false;
        IgnoreActivities.enabled = false;
        ImageLink.enabled = false;
        ImageZoom.enabled = false;
        ImplicitRelationships.enabled = false;
        InvisibleChat = {
          enabled = false;
          savedPasswords = "password, Password";
        };
        IrcColors.enabled = false;
        KeepCurrentChannel.enabled = false;
        LastFMRichPresence.enabled = false;
        LoadingQuotes.enabled = false;
        MemberCount.enabled = false;
        MemberListDecoratorsAPI.enabled = false;
        MentionAvatars.enabled = false;
        MessageAccessoriesAPI.enabled = true;
        MessageClickActions.enabled = false;
        MessageDecorationsAPI.enabled = false;
        MessageEventsAPI.enabled = true;
        MessageLatency.enabled = false;
        MessageLinkEmbeds.enabled = false;
        MessageLogger.enabled = false;
        MessagePopoverAPI.enabled = false;
        MessageTags.enabled = false;
        MessageUpdaterAPI.enabled = false;
        MoreCommands.enabled = false;
        MoreKaomoji.enabled = false;
        MoreUserTags.enabled = false;
        Moyai.enabled = false;
        MutualGroupDMs.enabled = false;
        NSFWGateBypass.enabled = false;
        NewGuildSettings.enabled = false;
        NoBlockedMessages.enabled = false;
        NoDevtoolsWarning.enabled = false;
        NoF1.enabled = false;
        NoMaskedUrlPaste.enabled = false;
        NoMosaic.enabled = false;
        NoOnboardingDelay.enabled = false;
        NoPendingCount.enabled = false;
        NoProfileThemes.enabled = false;
        NoReplyMention.enabled = false;
        NoScreensharePreview.enabled = false;
        NoServerEmojis.enabled = false;
        NoTrack = {
          disableAnalytics = true;
          enabled = true;
        };
        NoTypingAnimation.enabled = false;
        NoUnblockToJump.enabled = false;
        NormalizeMessageLinks.enabled = false;
        NotificationVolume.enabled = false;
        OnePingPerDM.enabled = false;
        OpenInApp.enabled = false;
        OverrideForumDefaults.enabled = false;
        PartyMode.enabled = false;
        PauseInvitesForever.enabled = false;
        PermissionFreeWill.enabled = false;
        PermissionsViewer.enabled = false;
        PictureInPicture.enabled = false;
        PinDMs.enabled = false;
        PlainFolderIcon.enabled = false;
        PlatformIndicators.enabled = false;
        PreviewMessage.enabled = false;
        QuickMention.enabled = false;
        QuickReply.enabled = false;
        ReactErrorDecoder.enabled = false;
        ReadAllNotificationsButton.enabled = false;
        RelationshipNotifier.enabled = false;
        ReplaceGoogleSearch.enabled = false;
        ReplyTimestamp.enabled = false;
        RevealAllSpoilers.enabled = false;
        ReverseImageSearch.enabled = false;
        ReviewDB.enabled = false;
        RoleColorEverywhere.enabled = false;
        SecretRingToneEnabler.enabled = false;
        SendTimestamps.enabled = false;
        ServerInfo.enabled = false;
        ServerListAPI.enabled = false;
        ServerListIndicators.enabled = false;
        Settings = {
          enabled = true;
          settingsLocation = "aboveNitro";
        };
        ShikiCodeblocks.enabled = false;
        ShowAllMessageButtons.enabled = false;
        ShowConnections.enabled = false;
        ShowHiddenChannels.enabled = false;
        ShowHiddenThings.enabled = false;
        ShowMeYourName.enabled = false;
        ShowTimeoutDuration.enabled = false;
        SilentMessageToggle.enabled = false;
        SilentTyping.enabled = false;
        SortFriendRequests.enabled = false;
        SpotifyControls.enabled = false;
        SpotifyCrack.enabled = false;
        SpotifyShareCommands.enabled = false;
        StartupTimings.enabled = false;
        StickerPaste.enabled = false;
        StreamerModeOnStream.enabled = false;
        Summaries.enabled = false;
        SuperReactionTweaks.enabled = false;
        SupportHelper.enabled = true;
        TextReplace.enabled = false;
        ThemeAttributes.enabled = false;
        Translate.enabled = false;
        TypingIndicator.enabled = false;
        TypingTweaks.enabled = false;
        USRBG.enabled = false;
        Unindent.enabled = true;
        UnlockedAvatarZoom.enabled = false;
        UnsuppressEmbeds.enabled = false;
        UserMessagesPronouns.enabled = false;
        UserSettingsAPI.enabled = true;
        UserVoiceShow.enabled = false;
        ValidReply.enabled = false;
        ValidUser.enabled = false;
        VcNarrator.enabled = false;
        VencordToolbox.enabled = false;
        ViewIcons.enabled = false;
        ViewRaw.enabled = false;
        VoiceChatDoubleClick.enabled = false;
        VoiceDownload.enabled = false;
        VoiceMessages.enabled = false;
        VolumeBooster.enabled = false;
        WebContextMenus = {
          addBack = true;
          enabled = true;
        };
        WebKeybinds.enabled = true;
        "WebRichPresence (arRPC)".enabled = false;
        WebScreenShareFixes.enabled = false;
        WhoReacted.enabled = true;
        XSOverlay.enabled = false;
        YoutubeAdblock.enabled = true;
        iLoveSpam.enabled = false;
        oneko.enabled = false;
        petpet.enabled = false;
      };
      themeLinks = [ ];
      transparent = false;
      useQuickCss = true;
      winCtrlQ = false;
      winNativeTitleBar = false;
    };
  };
}
