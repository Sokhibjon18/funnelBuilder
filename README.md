How to use localization:    
1. First step: declare a variable for the word or sentence you want to translate on the "m" column and put the translation of it in compatible columns (en_US, ru_RU, uz_UZ)
2. Second step: go to lib/core/gen/strings.dart and there change the version(+1) in SheetLocalization
3. Third step: open terminal and run flutter pub run build_runner --watch-delete-conflicting-outputs it will generate the words or sentences in lib/core/gen/strings.g.dart file
4. When it comes to using it in code just call the "Strings" class to access all the declared variables that is assigned to the words or sentences
