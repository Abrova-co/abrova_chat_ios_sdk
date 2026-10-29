/**
 AbrovaChatUI - SwiftUI Chat Components for AbrovaChat SDK

 A comprehensive UI toolkit for building chat interfaces with SwiftUI.
 This library provides ready-to-use components that work seamlessly with
 the AbrovaChat Core SDK.

 ## Quick Start

 ```swift
 // 1. Wrap your app with AbrovaChatScope
 AbrovaChatScope(
     config: AbrovaChatConfig(
         apiKey: "your-api-key",
         userId: "user-123"
     )
 ) {
     // 2. Use ChatScreen for a complete chat experience
     ChatScreen(
         roomId: "room-456",
         currentUserId: "user-123"
     )
 }
 ```

 ## Available Components

 ### State Management
 - `AbrovaChatScope` - Provides AbrovaChatClient to the view hierarchy
 - `AbrovaChatProvider` - Alternative for external client management
 - `ChatChannelState` - Manages state for a single chat room

 ### Core Chat Components
 - `ChatScreen` - Complete chat UI with messages, input, and typing indicator
 - `ChatMessageBubble` - Individual message display with attachments and reactions
 - `ChatInputField` - Message input with emoji, attachments, and voice support

 ### Status Indicators
 - `TypingIndicator` - Shows who is typing
 - `PresenceIndicator` - Online/offline status dot
 - `UnreadBadge` - Unread message count badge

 ### Message Interactions
 - `MessageContextMenu` - Long-press menu with actions
 - `MessageReactionPicker` - Quick emoji reaction picker

 ### List Components
 - `ChatRoomListTile` - Room list item with customization
 - `ChatRoomListTileSkeleton` - Loading placeholder

 ## Theming

 Wrap your content with `AbrovaChatTheme` for consistent styling:

 ```swift
 AbrovaChatTheme(
     colors: AbrovaChatColors(...),  // Optional custom colors
     dimensions: AbrovaChatDimensions(...)  // Optional custom dimensions
 ) {
     ChatScreen(...)
 }
 ```
 */

import SwiftUI
import AbrovaChat

// MARK: - Public Exports

// State Management
public typealias _AbrovaChatScope = AbrovaChatScope
public typealias _AbrovaChatProvider = AbrovaChatProvider
public typealias _ChatChannelState = ChatChannelState
public typealias _ChatChannelScope = ChatChannelScope
public typealias _AbrovaChatClientWrapper = AbrovaChatClientWrapper

// Theme
public typealias _AbrovaChatTheme = AbrovaChatTheme
public typealias _AbrovaChatColors = AbrovaChatColors
public typealias _AbrovaChatDimensions = AbrovaChatDimensions

// Components
public typealias _ChatScreen = ChatScreen
public typealias _ChatMessageBubble = ChatMessageBubble
public typealias _ChatInputField = ChatInputField
public typealias _TypingIndicator = TypingIndicator
public typealias _TypingDots = TypingDots
public typealias _CompactTypingIndicator = CompactTypingIndicator
public typealias _PresenceIndicator = PresenceIndicator
public typealias _PresenceStatus = PresenceStatus
public typealias _UnreadBadge = UnreadBadge
public typealias _UnreadDot = UnreadDot
public typealias _MessageContextMenu = MessageContextMenu
public typealias _MessageAction = MessageAction
public typealias _MessageReactionPicker = MessageReactionPicker
public typealias _MessageReactions = MessageReactions
public typealias _ChatRoomListTile = ChatRoomListTile
public typealias _ChatRoomListTileSkeleton = ChatRoomListTileSkeleton
public typealias _AttachmentPickerContent = AttachmentPickerContent

// New Components (matching Flutter SDK)
public typealias _SwipeableMessage = SwipeableMessage
public typealias _ReplyPreviewView = ReplyPreviewView
public typealias _ReplyInputPreview = ReplyInputPreview
public typealias _ReadReceipts = ReadReceipts
public typealias _ReadReceiptUser = ReadReceiptUser
public typealias _ReadReceiptDetails = ReadReceiptDetails
public typealias _MessageDeliveryStatus = MessageDeliveryStatus
public typealias _MentionsList = MentionsList
public typealias _MentionUser = MentionUser
public typealias _MentionsController = MentionsController
public typealias _VoiceMessageRecorder = VoiceMessageRecorder
public typealias _VoiceMessagePlayer = VoiceMessagePlayer
public typealias _VoiceRecorderState = VoiceRecorderState
public typealias _VoiceRecordingResult = VoiceRecordingResult
public typealias _MessageSearchBar = MessageSearchBar
public typealias _MessageSearchOverlay = MessageSearchOverlay
public typealias _HighlightedSearchText = HighlightedSearchText
public typealias _LinkPreview = LinkPreview
public typealias _LinkPreviewData = LinkPreviewData
public typealias _LinkPreviewComposer = LinkPreviewComposer
public typealias _LinkExtractor = LinkExtractor
public typealias _LinkMetadataService = LinkMetadataService
public typealias _ChatAttachmentPicker = ChatAttachmentPicker
public typealias _ChatAttachmentPickerContent = ChatAttachmentPickerContent
public typealias _AttachmentType = AttachmentType
public typealias _AttachmentResult = AttachmentResult

// Protocols
public typealias _FileUploader = FileUploader
