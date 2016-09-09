#ifdef SAF_DEF
	class breach_safplug
	{
		name = "Breach Plugin";
		version = 1;
		authors[] = {"Sushi"};	
		description = "Plugin umożliwia otwieranie drzwi ładunkami, strzałem ze strzelby (RHS) lub otwożyć zamek narzędziami.";
	};
	#include "..\breach-settings.cpp"
#endif

#ifdef SAF_FNCS
	#include "cfg\cfgFunctions.cpp"
#endif
