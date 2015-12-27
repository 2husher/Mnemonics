//
//  AIZSampleNumbersStore.m
//  Mnemonics
//
//  Created by X on 21/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZSampleNumbersStore.h"

@interface AIZSampleNumbersStore ()

@property (nonatomic) NSArray *privateNumbers;

@end

@implementation AIZSampleNumbersStore

+ (instancetype)sharedStore
{
    static AIZSampleNumbersStore *sharedStore = nil;

    if (!sharedStore)
    {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[AIZSampleNumbersStore sharedStore]"
                                 userInfo:nil];
    return nil;
}

- (instancetype)initPrivate
{
    self = [super init];
    if (self)
    {
        self.privateNumbers =
        @[ @{ @"section":@"0", @"ordinal":@1, @"value":@"0", @"letters":@"М", @"word":@"ЯМА" },
           @{ @"section":@"0", @"ordinal":@2, @"value":@"1", @"letters":@"Ж", @"word":@"ЕЖ" },
           @{ @"section":@"0", @"ordinal":@3, @"value":@"2", @"letters":@"Д", @"word":@"ЯД" },
           @{ @"section":@"0", @"ordinal":@4, @"value":@"3", @"letters":@"Х", @"word":@"УХА" },
           @{ @"section":@"0", @"ordinal":@5, @"value":@"4", @"letters":@"Ч", @"word":@"ЧАЙ" },
           @{ @"section":@"0", @"ordinal":@6, @"value":@"5", @"letters":@"Б", @"word":@"ОБОИ" },
           @{ @"section":@"0", @"ordinal":@7, @"value":@"6", @"letters":@"Ш", @"word":@"ШЕЯ" },
           @{ @"section":@"0", @"ordinal":@8, @"value":@"7", @"letters":@"С", @"word":@"УСЫ" },
           @{ @"section":@"0", @"ordinal":@9, @"value":@"8", @"letters":@"В", @"word":@"ИВА" },
           @{ @"section":@"0", @"ordinal":@10, @"value":@"9", @"letters":@"Ц", @"word":@"ЯЙЦО" },

           @{ @"section":@"10", @"ordinal":@11, @"value":@"10", @"letters":@"ГР", @"word":@"ГОРА" },
           @{ @"section":@"10", @"ordinal":@12, @"value":@"11", @"letters":@"ГГ", @"word":@"ГАГА" },
           @{ @"section":@"10", @"ordinal":@13, @"value":@"12", @"letters":@"ГТ", @"word":@"АГАТ" },
           @{ @"section":@"10", @"ordinal":@14, @"value":@"13", @"letters":@"ЖК", @"word":@"ЖУК" },
           @{ @"section":@"10", @"ordinal":@15, @"value":@"14", @"letters":@"ГЩ", @"word":@"ГУЩА" },
           @{ @"section":@"10", @"ordinal":@16, @"value":@"15", @"letters":@"ГБ", @"word":@"ГУБЫ" },
           @{ @"section":@"10", @"ordinal":@17, @"value":@"16", @"letters":@"ГЛ", @"word":@"ИГЛА" },
           @{ @"section":@"10", @"ordinal":@18, @"value":@"17", @"letters":@"ГС", @"word":@"ГУСЬ" },
           @{ @"section":@"10", @"ordinal":@19, @"value":@"18", @"letters":@"ГВ", @"word":@"ГАВАИ" },
           @{ @"section":@"10", @"ordinal":@20, @"value":@"19", @"letters":@"ГР", @"word":@"ГОРА" },

           @{ @"section":@"20", @"ordinal":@21, @"value":@"20", @"letters":@"ДМ", @"word":@"ДОМ" },
           @{ @"section":@"20", @"ordinal":@22, @"value":@"21", @"letters":@"ТГ", @"word":@"УТЮГ" },
           @{ @"section":@"20", @"ordinal":@23, @"value":@"22", @"letters":@"ДТ", @"word":@"ДЕТИ" },
           @{ @"section":@"20", @"ordinal":@24, @"value":@"23", @"letters":@"ТК", @"word":@"УТКА" },
           @{ @"section":@"20", @"ordinal":@25, @"value":@"24", @"letters":@"ТЧ", @"word":@"ТУЧА" },
           @{ @"section":@"20", @"ordinal":@26, @"value":@"25", @"letters":@"ДБ", @"word":@"ДУБ" },
           @{ @"section":@"20", @"ordinal":@27, @"value":@"26", @"letters":@"ДШ", @"word":@"ДУШ" },
           @{ @"section":@"20", @"ordinal":@28, @"value":@"27", @"letters":@"ТЗ", @"word":@"ТУЗ" },
           @{ @"section":@"20", @"ordinal":@29, @"value":@"28", @"letters":@"ДВ", @"word":@"УДАВ" },
           @{ @"section":@"20", @"ordinal":@30, @"value":@"29", @"letters":@"ТР", @"word":@"УТРО" },

           @{ @"section":@"30", @"ordinal":@31, @"value":@"30", @"letters":@"КН", @"word":@"КОНЬ" },
           @{ @"section":@"30", @"ordinal":@32, @"value":@"31", @"letters":@"КЖ", @"word":@"КОЖА" },
           @{ @"section":@"30", @"ordinal":@33, @"value":@"32", @"letters":@"КТ", @"word":@"КОТ" },
           @{ @"section":@"30", @"ordinal":@34, @"value":@"33", @"letters":@"КК", @"word":@"КОК" },
           @{ @"section":@"30", @"ordinal":@35, @"value":@"34", @"letters":@"КЩ", @"word":@"КОЩЕЙ" },
           @{ @"section":@"30", @"ordinal":@36, @"value":@"35", @"letters":@"КБ", @"word":@"КУБ" },
           @{ @"section":@"30", @"ordinal":@37, @"value":@"36", @"letters":@"КЛ", @"word":@"КЛЕЙ" },
           @{ @"section":@"30", @"ordinal":@38, @"value":@"37", @"letters":@"КЗ", @"word":@"КОЗА" },
           @{ @"section":@"30", @"ordinal":@39, @"value":@"38", @"letters":@"КВ", @"word":@"КИВИ" },
           @{ @"section":@"30", @"ordinal":@40, @"value":@"39", @"letters":@"КЦ", @"word":@"АКАЦИЯ" },

           @{ @"section":@"40", @"ordinal":@41, @"value":@"40", @"letters":@"ЧМ", @"word":@"ЧУМА" },
           @{ @"section":@"40", @"ordinal":@42, @"value":@"41", @"letters":@"ЧЖ", @"word":@"ЧУЖОЙ" },
           @{ @"section":@"40", @"ordinal":@43, @"value":@"42", @"letters":@"ЩТ", @"word":@"ЩИТ" },
           @{ @"section":@"40", @"ordinal":@44, @"value":@"43", @"letters":@"ЩК", @"word":@"ЩУКА" },
           @{ @"section":@"40", @"ordinal":@45, @"value":@"44", @"letters":@"ЧЩ", @"word":@"ЧАЩА" },
           @{ @"section":@"40", @"ordinal":@46, @"value":@"45", @"letters":@"ЧБ", @"word":@"ЧУБ" },
           @{ @"section":@"40", @"ordinal":@47, @"value":@"46", @"letters":@"ЧЛ", @"word":@"ЧИЛИ" },
           @{ @"section":@"40", @"ordinal":@48, @"value":@"47", @"letters":@"ЧС", @"word":@"ЧАСЫ" },
           @{ @"section":@"40", @"ordinal":@49, @"value":@"48", @"letters":@"ЧФ", @"word":@"ЧАЙФ" },
           @{ @"section":@"40", @"ordinal":@40, @"value":@"49", @"letters":@"ЩР", @"word":@"ЯЩЕР" },

           @{ @"section":@"50", @"ordinal":@51, @"value":@"50", @"letters":@"ПМ", @"word":@"ПУМА" },
           @{ @"section":@"50", @"ordinal":@52, @"value":@"51", @"letters":@"БГ", @"word":@"БОГ" },
           @{ @"section":@"50", @"ordinal":@53, @"value":@"52", @"letters":@"БД", @"word":@"ОБЕД" },
           @{ @"section":@"50", @"ordinal":@54, @"value":@"53", @"letters":@"БК", @"word":@"БЫК" },
           @{ @"section":@"50", @"ordinal":@55, @"value":@"54", @"letters":@"ПЧ", @"word":@"ПЕЧЬ" },
           @{ @"section":@"50", @"ordinal":@56, @"value":@"55", @"letters":@"ББ", @"word":@"БОБЫ" },
           @{ @"section":@"50", @"ordinal":@57, @"value":@"56", @"letters":@"ПЛ", @"word":@"ПУЛЯ" },
           @{ @"section":@"50", @"ordinal":@58, @"value":@"57", @"letters":@"ПС", @"word":@"ПЕС" },
           @{ @"section":@"50", @"ordinal":@59, @"value":@"58", @"letters":@"ПВ", @"word":@"ПИВО" },
           @{ @"section":@"50", @"ordinal":@60, @"value":@"59", @"letters":@"БР", @"word":@"БУРЯ" },

           @{ @"section":@"60", @"ordinal":@61, @"value":@"60", @"letters":@"ЛН", @"word":@"ЛУНА" },
           @{ @"section":@"60", @"ordinal":@62, @"value":@"61", @"letters":@"ЛЖ", @"word":@"ЛУЖА" },
           @{ @"section":@"60", @"ordinal":@63, @"value":@"62", @"letters":@"ЛТ", @"word":@"ЛЕТО" },
           @{ @"section":@"60", @"ordinal":@64, @"value":@"63", @"letters":@"ЛК", @"word":@"ЛУК" },
           @{ @"section":@"60", @"ordinal":@65, @"value":@"64", @"letters":@"ЛЧ", @"word":@"ЛУЧ" },
           @{ @"section":@"60", @"ordinal":@66, @"value":@"65", @"letters":@"ШБ", @"word":@"ШУБА" },
           @{ @"section":@"60", @"ordinal":@67, @"value":@"66", @"letters":@"ЛЛ", @"word":@"ЛИЛИЯ" },
           @{ @"section":@"60", @"ordinal":@68, @"value":@"67", @"letters":@"ЛС", @"word":@"ЛЕС" },
           @{ @"section":@"60", @"ordinal":@69, @"value":@"68", @"letters":@"ЛВ", @"word":@"ЛЕВ" },
           @{ @"section":@"60", @"ordinal":@70, @"value":@"69", @"letters":@"ШР", @"word":@"ШАР" },

           @{ @"section":@"70", @"ordinal":@71, @"value":@"70", @"letters":@"ЗМ", @"word":@"ЗИМА" },
           @{ @"section":@"70", @"ordinal":@72, @"value":@"71", @"letters":@"СЖ", @"word":@"САЖА" },
           @{ @"section":@"70", @"ordinal":@73, @"value":@"72", @"letters":@"СД", @"word":@"САД" },
           @{ @"section":@"70", @"ordinal":@74, @"value":@"73", @"letters":@"СК", @"word":@"СУК" },
           @{ @"section":@"70", @"ordinal":@75, @"value":@"74", @"letters":@"СЧ", @"word":@"СОЧИ" },
           @{ @"section":@"70", @"ordinal":@76, @"value":@"75", @"letters":@"СП", @"word":@"СУП" },
           @{ @"section":@"70", @"ordinal":@77, @"value":@"76", @"letters":@"СЛ", @"word":@"СОЛЬ" },
           @{ @"section":@"70", @"ordinal":@78, @"value":@"77", @"letters":@"СС", @"word":@"СОУС" },
           @{ @"section":@"70", @"ordinal":@79, @"value":@"78", @"letters":@"СВ", @"word":@"СОВА" },
           @{ @"section":@"70", @"ordinal":@80, @"value":@"79", @"letters":@"СР", @"word":@"СЫР" },

           @{ @"section":@"80", @"ordinal":@81, @"value":@"80", @"letters":@"ВН", @"word":@"ВИНО" },
           @{ @"section":@"80", @"ordinal":@82, @"value":@"81", @"letters":@"ФГ", @"word":@"ФИГА" },
           @{ @"section":@"80", @"ordinal":@83, @"value":@"82", @"letters":@"ВД", @"word":@"ВОДА" },
           @{ @"section":@"80", @"ordinal":@84, @"value":@"83", @"letters":@"ВК", @"word":@"ВЕКО" },
           @{ @"section":@"80", @"ordinal":@85, @"value":@"84", @"letters":@"ВЩ", @"word":@"ОВОЩЬ" },
           @{ @"section":@"80", @"ordinal":@86, @"value":@"85", @"letters":@"ВП", @"word":@"ВЫПЬ" },
           @{ @"section":@"80", @"ordinal":@87, @"value":@"86", @"letters":@"ВЛ", @"word":@"ВИЛЫ" },
           @{ @"section":@"80", @"ordinal":@88, @"value":@"87", @"letters":@"ВЗ", @"word":@"ВАЗА" },
           @{ @"section":@"80", @"ordinal":@89, @"value":@"88", @"letters":@"ВВ", @"word":@"ВОВА" },
           @{ @"section":@"80", @"ordinal":@90, @"value":@"89", @"letters":@"ФР", @"word":@"ФАРА" },

           @{ @"section":@"90", @"ordinal":@91, @"value":@"90", @"letters":@"РН", @"word":@"РАНА" },
           @{ @"section":@"90", @"ordinal":@92, @"value":@"91", @"letters":@"РГ", @"word":@"РОГА" },
           @{ @"section":@"90", @"ordinal":@93, @"value":@"92", @"letters":@"РТ", @"word":@"РОТ" },
           @{ @"section":@"90", @"ordinal":@94, @"value":@"93", @"letters":@"РК", @"word":@"РУКА" },
           @{ @"section":@"90", @"ordinal":@95, @"value":@"94", @"letters":@"РЩ", @"word":@"РОЩА" },
           @{ @"section":@"90", @"ordinal":@96, @"value":@"95", @"letters":@"ЦП", @"word":@"ЦЕПЬ" },
           @{ @"section":@"90", @"ordinal":@97, @"value":@"96", @"letters":@"РЛ", @"word":@"РУЛЬ" },
           @{ @"section":@"90", @"ordinal":@98, @"value":@"97", @"letters":@"РЗ", @"word":@"РОЗА" },
           @{ @"section":@"90", @"ordinal":@99, @"value":@"98", @"letters":@"РВ", @"word":@"РОВ" },
           @{ @"section":@"90", @"ordinal":@100, @"value":@"99", @"letters":@"ЦР", @"word":@"ЦР" },

           @{ @"section":@"EXT", @"ordinal":@101, @"value":@"00", @"letters":@"МН", @"word":@"МИНА" },
           @{ @"section":@"EXT", @"ordinal":@102, @"value":@"01", @"letters":@"НГ", @"word":@"НОГА" },
           @{ @"section":@"EXT", @"ordinal":@103, @"value":@"02", @"letters":@"НТ", @"word":@"НОТА" },
           @{ @"section":@"EXT", @"ordinal":@104, @"value":@"03", @"letters":@"МХ", @"word":@"МУХА" },
           @{ @"section":@"EXT", @"ordinal":@105, @"value":@"04", @"letters":@"МЧ", @"word":@"МЕЧ" },
           @{ @"section":@"EXT", @"ordinal":@106, @"value":@"05", @"letters":@"НБ", @"word":@"НЕБО" },
           @{ @"section":@"EXT", @"ordinal":@107, @"value":@"06", @"letters":@"МЛ", @"word":@"МЕЛ" },
           @{ @"section":@"EXT", @"ordinal":@108, @"value":@"07", @"letters":@"НС", @"word":@"НОС" },
           @{ @"section":@"EXT", @"ordinal":@109, @"value":@"08", @"letters":@"МФ", @"word":@"МАФИЯ" },
           @{ @"section":@"EXT", @"ordinal":@110, @"value":@"09", @"letters":@"МР", @"word":@"МОРЕ" }
           ];
    }
    return self;
}

- (NSArray *)allNumbers
{
    return self.privateNumbers;
}

- (NSNumber *)ordinalByValue:(NSString *)value
{
    NSUInteger len = [self.privateNumbers count];
    for (NSUInteger i = 0; i < len; i++)
    {
        NSString *myValue = self.privateNumbers[i][@"value"];
        if ([myValue isEqualToString:value])
        {
            return self.privateNumbers[i][@"ordinal"];
        }
    }
    return @0;
}

@end
