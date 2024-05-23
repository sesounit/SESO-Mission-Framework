class CfgSounds
{
	sounds[] =  {WhistleShort,WhistleLong};

	class WhistleShort {
        name = "";
        sound[] = {src\snd\short.ogg, 7, 1, 300};
        titles[] = {};
    };

    class WhistleLong {
        name = "";
        sound[] = {src\snd\long.ogg, 7, 1, 300};
        titles[] = {};
    };

	class IMW_SB_E
	{
		name = "Immersed WeatherSingle Breath (External)";
		sound[] = { "src\snd\singleBreath.ogg", 0.5, 1, 100 };
		titles[] = { 0, "" };
	};
	class IMW_SB_I
	{
		name = "Immersed WeatherSingle Breath (Internal)";
		sound[] = { "src\snd\singleBreath.ogg", 0.65, 1, 100 };
		titles[] = { 0, "" };
	};
	class IMW_C
	{
		name = "Immersed Weather - Cough";
		sound[] = { "src\snd\cough.ogg", 0.75, 1, 100 };
		titles[] = { 0, "" };
	};
	class IMW_SW_L
	{
		name = "Immersed Weather - Snowy Wind (Low Volume)";
		sound[] = { "src\snd\snowWind.ogg", 1.75, 1, 100 };
		titles[] = { 0, "" };
	};
	class IMW_SW_H
	{
		name = "Immersed Weather - Snowy Wind (High Volume)";
		sound[] = { "src\snd\snowWind.ogg", 2.75, 1, 100 };
		titles[] = { 0, "" };
	};
};