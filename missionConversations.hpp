class Conversations
{

	class char_mineros_leader_exit
	{
		exit = 1;
		expression = "nul = [char_mineros_leader, 'Bye.', 'DIRECT', 3] spawn IP_fnc_simpleSentence;";
		sentences[] = {"Good bye!"};
	};

	class char_mineros_leader_open
	{
		//arguments[] = {"(name player)"};
		responses[] = {"char_mineros_leader_0","char_mineros_leader_1","char_mineros_leader_2", "char_mineros_leader_3", "char_mineros_leader_exit"};
		sentences[] = {
			"Hello, are you the leader around here?",
			"Leader? I am Lean Alejandro, one of the elected representative of Los Mineros. We are of hundreds with a socio-economic and cultural bond to each other. To consider oneself any higher than the fellow man is the catalyst for authoritarianism.",
			"Yep, you're the leader."
		};
		sound = "radioclick";
	};

	class char_mineros_leader_back
	{
		//arguments[] = {"(name player)"};
		responses[] = {"char_mineros_leader_0","char_mineros_leader_1","char_mineros_leader_2", "char_mineros_leader_3", "char_mineros_leader_exit"};
		sentences[] = {
			"Let's talk about something else.",
			"About what?"
		};
		sound = "radioclick";
	};

	class char_mineros_leader_0
	{
		responses[] = {"char_mineros_leader_back"};
		sentences[] = {
			"Do you know who we are?",
			"No, I do not know your identities, or even your name.",
			"We are escaped convicts.",
			"Actually, the convictions carried by the state are no more than strongarming their favored ideology. I do not consider the “law” on this island any more binding than an old wives tale. Thus, you are freedmen. You are welcome to stay at Colinos del Oro as long as you respect the folk."
		};
	};

	class char_mineros_leader_1
	{
		responses[] = {"char_mineros_leader_1_0","char_mineros_leader_1_1","char_mineros_leader_1_2","char_mineros_leader_1_3","char_mineros_leader_1_4","char_mineros_leader_back"};
		sentences[] = {
			"What can you tell us about Santa Luz?",
			"The town of Santa Luz has been wrung by the Santa Luz Stars. While it is courageous to witness the proletariat overcome, they sided with the reactionaries and football fanatics in the city. Now, the town is led by a tyrant no better than their former masters."
		};
	};

	class char_mineros_leader_1_0
	{
		responses[] = {"char_mineros_leader_1_1","char_mineros_leader_1_2","char_mineros_leader_1_3","char_mineros_leader_1_4","char_mineros_leader_back"};
		sentences[] = {
			"Who is this “tyrant?”",
			"The tyrant is Agustín Delgado, the football star who led the football team of the same name. Seeing little success with his political career, he abandoned fair democracy and stormed the city hall. Those who cherished him joined in this coup. Those who did not know him believed it was a joke. Well, the humour was clearly misattributed."
		};
	};

	class char_mineros_leader_1_1
	{
		responses[] = {"char_mineros_leader_1_0","char_mineros_leader_1_2","char_mineros_leader_1_3","char_mineros_leader_1_4","char_mineros_leader_back"};
		sentences[] = {
			"What about the church?",
			"The clergy of Santa Luz is led by the Sacerdote. He seems to share a connection with the Santa Luz Stars as he speaks in most city celebrations. You could talk to him yourself, he is at the cathedral."
		};
	};

	class char_mineros_leader_1_2
	{
		responses[] = {"char_mineros_leader_1_0","char_mineros_leader_1_1","char_mineros_leader_1_3","char_mineros_leader_1_4","char_mineros_leader_back"};
		sentences[] = {
			"What about the car dealership?",
			"Since the Santa Luz Stars took over, the automotive dealership has been limited to military rearmament for the Stars. At least that is what the automobile salesman told us when we attempted to purchase a vehicle."
		};
	};

	class char_mineros_leader_1_3
	{
		responses[] = {"char_mineros_leader_1_0","char_mineros_leader_1_1","char_mineros_leader_1_2","char_mineros_leader_1_4","char_mineros_leader_back"};
		sentences[] = {
			"What about the gas station?",
			"You should be more specific, there are many gas stations under the GasCo subsidiery. The one near Santa Luz is the Cuatro Estrellas station. While they offer free fuel for visitors, their repair services have been limited to military purposes for the Stars. You could speak with the mechanic there if he can help you."
		};
	};

	class char_mineros_leader_1_4
	{
		responses[] = {"char_mineros_leader_1_0","char_mineros_leader_1_1","char_mineros_leader_1_2","char_mineros_leader_1_3","char_mineros_leader_back"};
		sentences[] = {
			"What about the hospital?",
			"The hospital discriminates against Filipinos like us. Reactionary rule leads to this. I have nothing nice to say about them."
		};
	};

	class char_mineros_leader_2
	{
		responses[] = {"char_mineros_leader_back"};
		sentences[] = {
			"What can you say about Jesus Malverde?",
			"I do not know anything about a Jesus Malverde.",
			"Nothing at all? Really?",
			"Really."
		};
	};

	class char_mineros_leader_3
	{
		responses[] = {"char_mineros_leader_back"};
		sentences[] = {
			"Could we use a vehicle?",
			"Speak with the quartermaster up north. He might a vehicle available. Just make sure to return it in one piece."
		};
	};

	class char_quartermaster_exit
	{
		exit = 1;
		expression = "nul = [char_quartermaster, 'Adios, amboy.', 'DIRECT', 3] spawn IP_fnc_simpleSentence;";
		sentences[] = {"Good bye!"};
	};

	class char_quartermaster_open
	{
		//arguments[] = {"(name player)"};
		responses[] = {"char_quartermaster_0","char_quartermaster_exit"};
		sentences[] = {
			"Hello, are you the quartermaster?",
			"Kumusta (hello), ya, I'm the quartermaster."
		};
		sound = "radioclick";
	};

	class char_quartermaster_back
	{
		//arguments[] = {"(name player)"};
		responses[] = {"char_quartermaster_0","char_quartermaster_1","char_quartermaster_exit"};
		sentences[] = {
			"Let's talk about something else.",
			"Ya?"
		};
		sound = "radioclick";
	};

	class char_quartermaster_0
	{
		responses[] = {"char_quartermaster_back"};
		sentences[] = {
			"Could we use a vehicle?",
			"Ya, take 'em. They almost empty. Bring them back in one pieces, gets?"
		};
	};

	class char_quartermaster_1
	{
		responses[] = {"char_quartermaster_back"};
		sentences[] = {
			"How do you have all of our equipment in this arsenal?",
			"Haha, you korni. Don't worry, amboy. I look after your stuff."
		};
	};

	class char_sacerdote_exit
	{
		exit = 1;
		expression = "nul = [char_sacerdote, 'Adios, mi nino', 'DIRECT', 3] spawn IP_fnc_simpleSentence;";
		sentences[] = {"Good bye!"};
	};
	
	class char_sacerdote_open
	{
		//arguments[] = {"(name player)"};
		responses[] = {"char_sacerdote_0","char_sacerdote_exit"};
		sentences[] = {
			"Hello, Padre?",
			"Hello, me nino."
		};
		sound = "radioclick";
	};

	class char_sacerdote_back
	{
		//arguments[] = {"(name player)"};
		responses[] = {"char_sacerdote_0","char_sacerdote_exit"};
		sentences[] = {
			"Let's talk about something else.",
			"About what?"
		};
		sound = "radioclick";
	};

	class char_sacerdote_0
	{
		responses[] = {"char_sacerdote_back"};
		sentences[] = {
			"Are you attending the Unity Parade?",
			"Oh no, me nino, I will be busy with clergy duties.",
		};
	};

	class char_rumourer_exit
	{
		exit = 1;
		expression = "nul = [char_rumourer, 'Bye', 'DIRECT', 3] spawn IP_fnc_simpleSentence;";
		sentences[] = {"Good bye!"};
	};

	class char_rumourer_open
	{
		//arguments[] = {"(name player)"};
		responses[] = {"char_rumourer_0","char_rumourer_exit"};
		sentences[] = {
			"Why are you trembling?",
			"HUH, WHO THAT?",
			"It's okay, you're safe.",
			"Thank God, I came from jungle and lost all my friends. I say it was demon but no one believe. Do you believes?"
		};
		sound = "radioclick";
	};

	class char_rumourer_back
	{
		//arguments[] = {"(name player)"};
		responses[] = {"char_rumourer_0","char_rumourer_exit"};
		sentences[] = {
			"Let's talk about something else.",
			"About what?"
		};
		sound = "radioclick";
	};

	class char_rumourer_0
	{
		responses[] = {"char_rumourer_back"};
		sentences[] = {
			"What happened to you and your friends?",
			"8 of us sent to jungle to scavenge mines south of here during night. We reach mines and see everything dark and empty. Then something happen to me and friends, we taken by scary demon. Not with horns but black skin and peaceful face. He say stuff to me and friends but I so freaked out, I forgets. Then he release us to mines during next. But there no mine, no friends, and I run back to camp. I tell everyone this happened but no one believe because there were no mine and no friends in jungle. I so freaked out, man!"
		};
	};

	// Fritz Squodel

	class char_css_squodel_exit
	{
		exit = 1;
		expression = "nul = [char_css_squodel, 'Bye', 'DIRECT', 3] spawn IP_fnc_simpleSentence;";
		sentences[] = {"Good bye!"};
	};

	class char_css_squodel_open
	{
		//arguments[] = {"(name player)"};
		responses[] = {"char_css_squodel_0","char_css_squodel_exit"};
		sentences[] = {
			"What are you working on?",
			"This is the long-range radio antennae.",
			"What will it do?",
			"OPSCOM believes we can communicate with HQ again once we get the antennae established. This means we could get air support, military equipment, munitions, and other supplies. It has been at least two months since we heard from HQ."
		};
		sound = "radioclick";
	};

	class char_css_squodel_back
	{
		//arguments[] = {"(name player)"};
		responses[] = {"char_css_squodel_0","char_css_squodel_exit"};
		sentences[] = {
			"Let's talk about something else.",
			"About what?"
		};
		sound = "radioclick";
	};

	class char_css_squodel_0
	{
		responses[] = {"char_css_squodel_back"};
		sentences[] = {
			"What do you need to finish it?",
			"The antennae! We have all the metal we need to construct a tower but no radio equipment to use.",
			"Okay, I will bring one.",
			"You can't just 'bring one.' Most radio antennaes are huge, you can't pick them up with your hands. And yes, vehicles won't work either. You need to find a special type of ground antennae called VHF30108. The briefing will tell you if you can find the antennae. Bring it to OPSCOM and I can complete this support."
		};
	};

	// Francois de la Nix

	class char_css_lanix_exit
	{
		exit = 1;
		expression = "nul = [char_css_lanix, 'Bye', 'DIRECT', 3] spawn IP_fnc_simpleSentence;";
		sentences[] = {"Good bye!"};
	};

	class char_css_lanix_open
	{
		//arguments[] = {"(name player)"};
		responses[] = {"char_css_lanix_0","char_css_lanix_exit"};
		sentences[] = {
			"What are you working on?",
			"The helipad",
			"What will it do?",
			"This will let us use a helicopter again, like we did with Hotel."
		};
		sound = "radioclick";
	};

	class char_css_lanix_back
	{
		//arguments[] = {"(name player)"};
		responses[] = {"char_css_lanix_0","char_css_lanix_exit"};
		sentences[] = {
			"Let's talk about something else.",
			"About what?"
		};
		sound = "radioclick";
	};

	class char_css_lanix_0
	{
		responses[] = {"char_css_lanix_back"};
		sentences[] = {
			"What do you need to finish it?",
			"Portable helipad lights. It is too dark here for a helipad on the ground. We need blinking lights on the floor to mark the landing area.",
			"Where can I find some?",
			"You won't find them easily. Most people do not use helicopters here. The briefing will tell you if you can come across any. Bring it to OPSCOM and we can have helicopters again."
		};
	};

	// Gambit

	class char_css_gambit_exit
	{
		exit = 1;
		expression = "nul = [char_css_gambit, 'Bye', 'DIRECT', 3] spawn IP_fnc_simpleSentence;";
		sentences[] = {"Good bye!"};
	};

	class char_css_gambit_open
	{
		//arguments[] = {"(name player)"};
		responses[] = {"char_css_gambit_0","char_css_gambit_exit"};
		sentences[] = {
			"What are you working on?",
			"The garage.",
			"What will it do?",
			"You can bring cars to this garage to keep them. When you find garage like this one, like, how you say, parkhaus? You can borrow a vehicle at any garage. If you bring car back to garage, you can use them in future."
		};
		sound = "radioclick";
	};

	class char_css_gambit_back
	{
		//arguments[] = {"(name player)"};
		responses[] = {"char_css_gambit_0","char_css_gambit_exit"};
		sentences[] = {
			"Let's talk about something else.",
			"About what?"
		};
		sound = "radioclick";
	};

	class char_css_gambit_0
	{
		responses[] = {"char_css_gambit_back"};
		sentences[] = {
			"What do you need to finish it?",
			"I need cement. The big cars are too heavy for wood. Cement will be strong enough.",
			"Okay, where can I find some?",
			"I don't know. Everything here is made of clay and wood. OPSCOM will say if you can find cement in the briefing. Bring it to OPSCOM and I can finish building this garage."
		};
	};

	// Jacks

	class char_css_jacks_exit
	{
		exit = 1;
		expression = "nul = [char_css_jacks, 'Bye', 'DIRECT', 3] spawn IP_fnc_simpleSentence;";
		sentences[] = {"Good bye!"};
	};

	class char_css_jacks_open
	{
		//arguments[] = {"(name player)"};
		responses[] = {"char_css_jacks_0","char_css_jacks_exit"};
		sentences[] = {
			"What are you working on?",
			"The shooting range, what do you think I'm working on.",
			"What will it do?",
			"Uhh, nothing. It's a shooting range. You shoot in it? What do you think!?",
			"No, I mean, how will it helps us?",
			"Oh, uhh, you can shoot from it and uhh. Oh yes! OPSCOM said you can get different weapons here like AKs and M4s. You don't have to loot bodies for those guns anymore if you want them."
		};
		sound = "radioclick";
	};

	class char_css_jacks_back
	{
		//arguments[] = {"(name player)"};
		responses[] = {"char_css_jacks_0","char_css_jacks_exit"};
		sentences[] = {
			"Let's talk about something else.",
			"About what?"
		};
		sound = "radioclick";
	};

	class char_css_jacks_0
	{
		responses[] = {"char_css_jacks_back"};
		sentences[] = {
			"What do you need to finish it?",
			"I need a giant cargo container. I want to get a bunch of guns but OPSCOM said there's no space in the bunker. I said, okay, why not keep it outside? He said because it's dangerous to leave guns outside. So find a container so we can get cool guns.",
			"Okay, where can I find one?",
			"There's a bunch on Isla Nueva but they're shitty. You need to find one already loaded on a truck. Those ones are not shitty. OPSCOM will tell you in the briefing if you can find one. Bring it to OPSCOM so I can finish this range."
		};
	};

	// Miller the Magnificent

	class char_css_cooper_exit
	{
		exit = 1;
		expression = "nul = [char_css_cooper, 'Join 5312th Green Beret Ranger Seal Special Forces Reserve [SERIOUS][CST][PILOTS + TANK CREW AVAILABLE]', 'DIRECT', 3] spawn IP_fnc_simpleSentence;";
		sentences[] = {"Good bye!"};
	};

	class char_css_cooper_open
	{
		//arguments[] = {"(name player)"};
		responses[] = {"char_css_cooper_0","char_css_cooper_exit"};
		sentences[] = {
			"What are you working on?",
			"I'm working on my latest sci-fi novel. I'm already at 4500 words but my friend, Toe, on the Kentucky Police Roleplay server keep breaking speeding laws, driving past 75 miles per hour on a resticted road. So now I have to write a 1200 word OOC complaint to the police chief about this.",
			"What?",
			"Oh, this? That's a port. We can store boats here. You ever played FiveM? I'm so glad we can still get ARPANET. I'm Lance Corporal Cooper on Kentucky Police Roleplay [24/7][EST][ABCDFEGF1983][NO TROLLING]."
		};
		sound = "radioclick";
	};

	class char_css_cooper_back
	{
		//arguments[] = {"(name player)"};
		responses[] = {"char_css_cooper_0","char_css_cooper_exit"};
		sentences[] = {
			"Let's talk about something else.",
			"About FiveM?"
		};
		sound = "radioclick";
	};

	class char_css_cooper_0
	{
		responses[] = {"char_css_cooper_back"};
		sentences[] = {
			"What do you need to finish it?",
			"First, you will need a computer with an ARPANET subscription. You will need a graphics card strong enough to play this game. It has double the colors, way more powerful than last year's game. ",
			"No, I mean, what do you need to finish the port.",
			"Oh, that's what you were talking about? I was working on this port for so long that I forgot. I am stuck on this sci-fi novel. If I had a copy of the E.I.T.S. science books, I can finish my sci-fi novel faster. Bring it to OPSCOM so I can finish this novel - I mean - port."
		};
	};

	// Dylan

	class char_css_dylan_exit
	{
		exit = 1;
		expression = "nul = [char_css_dylan, 'Bye', 'DIRECT', 3] spawn IP_fnc_simpleSentence;";
		sentences[] = {"Bye, Dylan."};
	};

	class char_css_dylan_open
	{
		arguments[] = {"(name player)"};
		responses[] = {"char_css_dylan_0","char_css_dylan_1","char_css_dylan_2","char_css_dylan_3","char_css_dylan_4","char_css_dylan_exit"};
		sentences[] = {
			"Hello Dylan.",
			"Hello %1."
		};
		sound = "radioclick";
	};

	class char_css_dylan_back
	{
		//arguments[] = {"(name player)"};
		responses[] = {"char_css_dylan_0","char_css_dylan_1","char_css_dylan_2","char_css_dylan_3","char_css_dylan_4","char_css_dylan_exit"};
		sentences[] = {
			"Let's talk about something else.",
			"Okay."
		};
		sound = "radioclick";
	};

	class char_css_dylan_0
	{
		responses[] = {"char_css_dylan_back"};
		sentences[] = {
			"What are you doing?",
			"OPSCOM made me head quartermaster. But I'm on vacation right now so....",
			"Why are still here then?",
			"Umm, uhhh, I'm bored."
		};
	};

	class char_css_dylan_1
	{
		responses[] = {"char_css_dylan_back"};
		sentences[] = {
			"Where can I heal?",
			"Umm, so, there's FOB Gold. This place is a medical facility. If you are a medic, you upgrade to a doctor so you heal faster. If you are not a medic, you upgrade to a medic so you can stitch yourself and give blood like a real medic. On your map, you can see green hospital icons. Those are local hospitals that give us a free medical facility and medical supplies. If you go there, you can heal faster too.",
			"What about an insta-heal box?",
			"Uhh, bro, there's no way to instantly heal yourself."
		};
	};

	class char_css_dylan_2
	{
		responses[] = {"char_css_dylan_back"};
		sentences[] = {
			"Where can I repair?",
			"Uhh, umm, you can repair cars in FOB Gold. This place is a repair facility. If you are a engineer, you upgrade to an advanced engineer so you can fully fix a vehicle. If you are not a engineer, you upgrade to a engineer so you partially repair vehicles like other engineers. On your map, you can see green gas station icons. Those are local gas stations that give us a free repair facility and fuel. If you go and park there there, you can repair too.",
			"What about fuel?",
			"Umm, uhhh, bro, We have fuel cans here. There's also fuel at the gas stations."
		};
	};

	class char_css_dylan_3
	{
		responses[] = {"char_css_dylan_back"};
		sentences[] = {
			"What vehicles can I use?",
			"So, um, bro, you can use the Ural covered transport truck and the undercover bus. The bus makes you undercover and invisible to enemies while you drive on the roads. The Ural doesn't. If they get destroyed, there will be a new one here in 45 seconds.",
			"What if I bring back vehicles.",
			"Bro, we have no space for more vehicles in this bunker. Until Gambit finishes the garage, all vehicles except the Ural and bus get scrapped. They won't be usable again."
		};
	};

	class char_css_dylan_4
	{
		responses[] = {"char_css_dylan_4_0","char_css_dylan_4_1","char_css_dylan_4_2","char_css_dylan_4_3","char_css_dylan_4_4","char_css_dylan_back"};
		sentences[] = {
			"What equipment should I take with me?",
			"Okay, bro, so, first is medical items. You need at least 15 elastic bandages, 15 packing bandages, 1 morphine autoinjector, 4 tourniquets, 1 splint. Umm, oh, keep them in your backpack so other people can take 'em if they need them.",
			"What about non-medical stuff?.",
			"That depends on what your role. Which role are you asking about?"
		};
	};

	class char_css_dylan_4_0
	{
		responses[] = {"char_css_dylan_back"};
		sentences[] = {
			"Squad/Team Leaders.",
			"So, umm, for both squad and team leaders they use the same stuff. They will need a backpack with an AN/PRC-77 radio but also their regular AN/PRC-343 radios. They will need hand-held signal in case it gets dark. And they will need map tools to make shapes on the map."
		};
	};

	class char_css_dylan_4_1
	{
		responses[] = {"char_css_dylan_back"};
		sentences[] = {
			"Medics.",
			"Okay, so, bro, medics need more medical supplies than others. They will need at least 25 elastic bandages, 25 packing bandages, 5 morphine autoinjectors, 5 epinephrine autoinjectors, 5 adenosine autoinjectors, 6 tourniquets, 4 splits, 2000ml of blood, and a surgical kit. They can also wear white helmets to identify as medics but they don't have to."
		};
	};

	class char_css_dylan_4_2
	{
		responses[] = {"char_css_dylan_back"};
		sentences[] = {
			"Engineers.",
			"Umm, engineers are also like explosive experts. They will need a toolkit, wirecutter, defusal kit, M57 firing device, and any explosives like satchel charges."
		};
	};

	class char_css_dylan_4_3
	{
		responses[] = {"char_css_dylan_back"};
		sentences[] = {
			"Marksmen.",
			"Uhh, marksmen need a scope on their rifle, specifically the Leupold Mark 4 8.5-25x50 LR/T scope, a rangetable, and a Kestrel 4500NV."
		};
	};

	class char_css_dylan_4_4
	{
		responses[] = {"char_css_dylan_back"};
		sentences[] = {
			"Machinegunners.",
			"Umm, uhhh, machinegunners need a lot of ammo with green tracers like the 5.56mm 200Rnd M249 (Green TE4) box. They should also take an M122 MG Tripod (Packed/M240/M249 mount) in place of a rocket launcher."
		};
	};




};