#import "../EmojiLibrary/PSEmojiUtilities.h"

#define in(str, TYPE) [[PSEmojiUtilities TYPE ## Emoji] containsObject:str]

%hook WAEmojiValidator

+ (NSUInteger)emojiTypeFor:(NSString *)emoji {
    NSUInteger value = %orig;
    if (value == 0) {
        if (in(emoji, Flags))
            return 2;
        else if (in(emoji, People) || in(emoji, Nature) || in(emoji, FoodAndDrink)
            || in(emoji, Activity) || in(emoji, TravelAndPlaces) || in(emoji, Objects)
            || in(emoji, Symbols))
            return 1;
        else if ([PSEmojiUtilities isBaseHandshakeOrHandshakeWithSkintonesEmoji:emoji])
            return 2;
    }
    return value;
}

%end