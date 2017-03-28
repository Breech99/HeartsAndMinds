class GHST
{
	tag = "GHST";
	class functions
	{
		file = "functions";
		class functions {description = "core functions, called on mission start."; preInit = 1;};
	};
	class client
	{
		file = "functions\client";
		class halo {description = "player halo";};
		class playeraddactions {description = "adds various player actions on call";};
	};
};