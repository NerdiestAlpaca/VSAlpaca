package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.text.FlxTypeText;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.input.FlxKeyManager;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

using StringTools;

class DialogueBox extends FlxSpriteGroup
{
	var box:FlxSprite;

	var curCharacter:String = '';

	var dialogue:Alphabet;
	var dialogueList:Array<String> = [];

	// SECOND DIALOGUE FOR THE PIXEL SHIT INSTEAD???
	var swagDialogue:FlxTypeText;

	var dropText:FlxText;

	public var finishThing:Void->Void;

	var portraitLeft:FlxSprite;
	var portraitLeft2:FlxSprite;
	var portraitLeft3:FlxSprite;
	var portraitLeft4:FlxSprite;
	var portraitLeft5:FlxSprite;
	var portraitLeft6:FlxSprite;
	var portraitLeft7:FlxSprite;
	var portraitRight:FlxSprite;
	var portraitRight2:FlxSprite;
	var portraitRight3:FlxSprite;
	var portraitRight4:FlxSprite;
	var portraitRight5:FlxSprite;
	var portraitRight6:FlxSprite;

	var handSelect:FlxSprite;
	var bgFade:FlxSprite;

	public function new(talkingRight:Bool = true, ?dialogueList:Array<String>)
	{
		super();

		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'whimsy':
				FlxG.sound.playMusic(Paths.music('Pacapac'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'absolution':
				FlxG.sound.playMusic(Paths.music('lastHope'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
		}

		bgFade = new FlxSprite(-200, -200).makeGraphic(Std.int(FlxG.width * 1.3), Std.int(FlxG.height * 1.3), 0xFFB3DFd8);
		bgFade.scrollFactor.set();
		bgFade.alpha = 0;
		add(bgFade);

		new FlxTimer().start(0.83, function(tmr:FlxTimer)
		{
			bgFade.alpha += (1 / 5) * 0.7;
			if (bgFade.alpha > 0.7)
				bgFade.alpha = 0.7;
		}, 5);

		box = new FlxSprite(-20, 45);
		
		var hasDialog = false;
		
		portraitLeft = new FlxSprite(-20, 40);
		portraitLeft.frames = Paths.getSparrowAtlas('portraits/PacaPortraits');
		portraitLeft.animation.addByPrefix('enter', 'alpacaphase1', 24, false);
		portraitLeft.scrollFactor.set();
		portraitLeft.visible = true;

		portraitLeft2 = new FlxSprite(-20, 40);
		portraitLeft2.frames = Paths.getSparrowAtlas('portraits/PacaPortraits');
		portraitLeft2.animation.addByPrefix('enter', 'alpacaconfused', 24, false);
		portraitLeft2.scrollFactor.set();
		portraitLeft2.visible = true;
		
		portraitLeft3 = new FlxSprite(-20, 40);
		portraitLeft3.frames = Paths.getSparrowAtlas('portraits/PacaPortraits');
		portraitLeft3.animation.addByPrefix('enter', 'alpacagrin', 24, false);
		portraitLeft3.scrollFactor.set();
		portraitLeft3.visible = true;
		
		portraitLeft4 = new FlxSprite(-20, 40);
		portraitLeft4.frames = Paths.getSparrowAtlas('portraits/PacaPortraits');
		portraitLeft4.animation.addByPrefix('enter', 'alpacahappy', 24, false);
		portraitLeft4.scrollFactor.set();
		portraitLeft4.visible = true;

		portraitLeft5 = new FlxSprite(-20, 40);
		portraitLeft5.frames = Paths.getSparrowAtlas('portraits/PacaPortraits');
		portraitLeft5.animation.addByPrefix('enter', 'alpacaphase2', 24, false);
		portraitLeft5.scrollFactor.set();
		portraitLeft5.visible = true;

		portraitLeft6 = new FlxSprite(-20, 40);
		portraitLeft6.frames = Paths.getSparrowAtlas('portraits/PacaPortraits');
		portraitLeft6.animation.addByPrefix('enter', 'alpacaphase3', 24, false);
		portraitLeft6.scrollFactor.set();
		portraitLeft6.visible = true;

		portraitLeft7 = new FlxSprite(-20, 40);
		portraitLeft7.frames = Paths.getSparrowAtlas('portraits/PacaPortraits');
		portraitLeft7.animation.addByPrefix('enter', 'alpacaphase4', 24, false);
		portraitLeft7.scrollFactor.set();
		portraitLeft7.visible = true;

		portraitRight = new FlxSprite(0, 40);
		portraitRight.frames = Paths.getSparrowAtlas('portraits/BFPortraits');
		portraitRight.animation.addByPrefix('enter', 'bfnormal', 24, false);
		portraitRight.scrollFactor.set();
		portraitRight.visible = false;

		portraitRight2 = new FlxSprite(0, 40);
		portraitRight2.frames = Paths.getSparrowAtlas('portraits/BFPortraits');
		portraitRight2.animation.addByPrefix('enter', 'bfshock', 24, false);
		portraitRight2.scrollFactor.set();
		portraitRight2.visible = false;

		portraitRight3 = new FlxSprite(0, 40);
		portraitRight3.frames = Paths.getSparrowAtlas('portraits/BFPortraits');
		portraitRight3.animation.addByPrefix('enter', 'bfpeeved', 24, false);
		portraitRight3.scrollFactor.set();
		portraitRight3.visible = false;

		portraitRight4 = new FlxSprite(0, 40);
		portraitRight4.frames = Paths.getSparrowAtlas('portraits/BFPortraits');
		portraitRight4.animation.addByPrefix('enter', 'bfawkward', 24, false);
		portraitRight4.scrollFactor.set();
		portraitRight4.visible = false;

		portraitRight5 = new FlxSprite(0, 40);
		portraitRight5.frames = Paths.getSparrowAtlas('portraits/BFPortraits');
		portraitRight5.animation.addByPrefix('enter', 'bfpumped', 24, false);
		portraitRight5.scrollFactor.set();
		portraitRight5.visible = false;
		
		portraitRight6 = new FlxSprite(0, 40);
		portraitRight6.frames = Paths.getSparrowAtlas('portraits/BFPortraits');
		portraitRight6.animation.addByPrefix('enter', 'bfdetermined', 24, false);
		portraitRight6.scrollFactor.set();
		portraitRight6.visible = false;

		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'senpai':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-pixel');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);
			case 'roses':
				hasDialog = true;
				FlxG.sound.play(Paths.sound('ANGRY_TEXT_BOX'));

				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-senpaiMad');
				box.animation.addByPrefix('normalOpen', 'SENPAI ANGRY IMPACT SPEECH', 24, false);
				box.animation.addByIndices('normal', 'SENPAI ANGRY IMPACT SPEECH', [4], "", 24);

			case 'thorns':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-evil');
				box.animation.addByPrefix('normalOpen', 'Spirit Textbox spawn', 24, false);
				box.animation.addByIndices('normal', 'Spirit Textbox spawn', [11], "", 24);

				var face:FlxSprite = new FlxSprite(320, 170).loadGraphic(Paths.image('weeb/spiritFaceForward'));
				face.setGraphicSize(Std.int(face.width * 6));
				add(face);
			default:
				hasDialog = true;
				PlayState.daPixelZoom = 1;
				box.loadGraphic(Paths.image('portraits/textbox'),true,1280,720);
				box.animation.add('normalOpen', [0], 0);
				box.animation.add('normal', [0], 0);
				portraitLeft.setPosition(25.5,390.45);
				portraitLeft2.setPosition(25.5,390.45);
				portraitLeft3.setPosition(25.5,390.45);
				portraitLeft4.setPosition(25.5,390.45);
				portraitLeft5.setPosition(25.5,390.45);
				portraitLeft6.setPosition(25.5,390.45);
				portraitLeft7.setPosition(25.5,390.45);
				portraitRight.setPosition(929.4, 390.95);
				portraitRight2.setPosition(929.4, 390.95);
				portraitRight3.setPosition(929.4, 390.95);
				portraitRight4.setPosition(929.4, 390.95);
				portraitRight5.setPosition(929.4, 390.95);
				portraitRight6.setPosition(929.4, 390.95);
				box.setPosition();
		}
		this.dialogueList = dialogueList;
		if (!hasDialog)
			return;
		
		box.animation.play('normalOpen');
		//box.setGraphicSize(Std.int(box.width * PlayState.daPixelZoom * 0.9));
		//box.updateHitbox();
		add(box);

		//box.screenCenter(X);
		//portraitLeft.screenCenter(X);

		handSelect = new FlxSprite(FlxG.width * 0.9, FlxG.height * 0.9).loadGraphic(Paths.image('weeb/pixelUI/hand_textbox',"week6"));
		add(handSelect);


		if (!talkingRight)
		{
			// box.flipX = true;
		}

		dropText = new FlxText(342, 502, Std.int(FlxG.width * 0.6), ".", 32);
		dropText.setFormat(Paths.font('pixel.otf'), 32);
		dropText.color = 0xFFD89494;
		add(dropText);

		swagDialogue = new FlxTypeText(340, 500, Std.int(FlxG.width * 0.6), ".", 32);
		swagDialogue.setFormat(Paths.font('pixel.otf'), 32);
		swagDialogue.color = 0xFFFFFFFF;
		swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pixelText'), 0.6)];
		add(swagDialogue);

		add(portraitLeft);
		add(portraitLeft2);
		add(portraitLeft3);
		add(portraitLeft4);
		add(portraitLeft5);
		add(portraitLeft6);
		add(portraitLeft7);
		add(portraitRight);
		add(portraitRight2);
		add(portraitRight3);
		add(portraitRight4);
		add(portraitRight5);
		add(portraitRight6);
		dialogue = new Alphabet(0, 80, "", false, true);
		// dialogue.x = 90;
		// add(dialogue);
	}

	var dialogueOpened:Bool = false;
	var dialogueStarted:Bool = false;

	override function update(elapsed:Float)
	{
		// HARD CODING CUZ IM STUPDI
		if (PlayState.SONG.song.toLowerCase() == 'roses')
			portraitLeft.visible = false;
		if (PlayState.SONG.song.toLowerCase() == 'thorns')
		{
			portraitLeft.color = FlxColor.BLACK;
			swagDialogue.color = FlxColor.WHITE;
			dropText.color = FlxColor.BLACK;
		}
		
		
		dropText.text = swagDialogue.text;

		if (box.animation.curAnim != null)
		{
			if (box.animation.curAnim.name == 'normalOpen' && box.animation.curAnim.finished)
			{
				box.animation.play('normal');
				dialogueOpened = true;
			}
		}

		if (dialogueOpened && !dialogueStarted)
		{
			startDialogue();
			dialogueStarted = true;
		}
		if (FlxG.keys.justPressed.ANY  && dialogueStarted == true)
		{
			remove(dialogue);
				
			FlxG.sound.play(Paths.sound('clickText'), 0.8);

			if (dialogueList[1] == null && dialogueList[0] != null)
			{
				if (!isEnding)
				{
					isEnding = true;

					if (PlayState.SONG.song.toLowerCase() == 'senpai' || PlayState.SONG.song.toLowerCase() == 'thorns')
						FlxG.sound.music.fadeOut(2.2, 0);

					new FlxTimer().start(0.2, function(tmr:FlxTimer)
					{
						box.alpha -= 1 / 5;
						bgFade.alpha -= 1 / 5 * 0.7;
						portraitLeft.visible = false;
						portraitRight.visible = false;
						swagDialogue.alpha -= 1 / 5;
						dropText.alpha = swagDialogue.alpha;
					}, 5);

					new FlxTimer().start(1.2, function(tmr:FlxTimer)
					{
						finishThing();
						kill();
					});
				}
			}
			else
			{
				dialogueList.remove(dialogueList[0]);
				startDialogue();
			}
		}
		
		super.update(elapsed);
	}

	var isEnding:Bool = false;

	function startDialogue():Void
	{
		cleanDialog();
		// var theDialog:Alphabet = new Alphabet(0, 70, dialogueList[0], false, true);
		// dialogue = theDialog;
		// add(theDialog);

		// swagDialogue.text = ;
		swagDialogue.resetText(dialogueList[0]);
		swagDialogue.start(0.04, true);

		switch (curCharacter)
		{
			case 'paca':
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pacaText'), 0.6)];
				portraitLeft2.visible = false;
				portraitLeft3.visible = false;
				portraitLeft4.visible = false;
				portraitLeft5.visible = false;
				portraitLeft6.visible = false;
				portraitLeft7.visible = false;
				portraitRight.visible = false;
				portraitRight2.visible = false;
				portraitRight3.visible = false;
				portraitRight4.visible = false;
				portraitRight5.visible = false;
				portraitRight6.visible = false;
				if (!portraitLeft.visible)
				{
					portraitLeft.visible = true;
					portraitLeft.animation.play('enter');
				}
				case 'pacaconfused':
					swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pacaText'), 0.6)];
					portraitLeft.visible = false;
					portraitLeft3.visible = false;
					portraitLeft4.visible = false;
					portraitLeft5.visible = false;
					portraitLeft6.visible = false;
					portraitLeft7.visible = false;
					portraitRight.visible = false;
					portraitRight2.visible = false;
					portraitRight3.visible = false;
					portraitRight4.visible = false;
					portraitRight5.visible = false;
					portraitRight6.visible = false;
					if (!portraitLeft2.visible)
					{
						portraitLeft2.visible = true;
						portraitLeft2.animation.play('enter');
					}
				
					case 'pacagrin':
					swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pacaText'), 0.6)];
					portraitLeft.visible = false;
					portraitLeft2.visible = false;
					portraitLeft4.visible = false;
					portraitLeft5.visible = false;
					portraitLeft6.visible = false;
					portraitLeft7.visible = false;
					portraitRight.visible = false;
					portraitRight2.visible = false;
					portraitRight3.visible = false;
					portraitRight4.visible = false;
					portraitRight5.visible = false;
					portraitRight6.visible = false;
					if (!portraitLeft3.visible)
					{
						portraitLeft3.visible = true;
						portraitLeft3.animation.play('enter');
					}
				
					case 'pacahappy':
					swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pacaText'), 0.6)];
					portraitLeft.visible = false;
					portraitLeft2.visible = false;
					portraitLeft3.visible = false;
					portraitLeft5.visible = false;
					portraitLeft6.visible = false;
					portraitLeft7.visible = false;
					portraitRight.visible = false;
					portraitRight2.visible = false;
					portraitRight3.visible = false;
					portraitRight4.visible = false;
					portraitRight5.visible = false;
					portraitRight6.visible = false;
					if (!portraitLeft4.visible)
					{
						portraitLeft4.visible = true;
						portraitLeft4.animation.play('enter');
					}
			case 'demon':
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pacaText'), 0.6)];
				portraitLeft.visible = false;
				portraitLeft2.visible = false;
				portraitLeft3.visible = false;
				portraitLeft4.visible = false;
				portraitLeft6.visible = false;
				portraitLeft7.visible = false;
				portraitRight.visible = false;
				portraitRight2.visible = false;
				portraitRight3.visible = false;
				portraitRight4.visible = false;
				portraitRight5.visible = false;
				portraitRight6.visible = false;
				if (!portraitLeft5.visible)
				{
					portraitLeft5.visible = true;
					portraitLeft5.animation.play('enter');
				}
			case 'dark':
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pacaText'), 0.6)];
				portraitLeft.visible = false;
				portraitLeft2.visible = false;
				portraitLeft3.visible = false;
				portraitLeft4.visible = false;
				portraitLeft5.visible = false;
				portraitLeft7.visible = false;
				portraitRight.visible = false;
				portraitRight2.visible = false;
				portraitRight3.visible = false;
				portraitRight4.visible = false;
				portraitRight5.visible = false;
				portraitRight6.visible = false;
				if (!portraitLeft6.visible)
				{
					portraitLeft6.visible = true;
					portraitLeft6.animation.play('enter');
				}
			case 'final':
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pacaText'), 0.6)];
				portraitLeft.visible = false;
				portraitLeft2.visible = false;
				portraitLeft3.visible = false;
				portraitLeft4.visible = false;
				portraitLeft5.visible = false;
				portraitLeft6.visible = false;
				portraitRight.visible = false;
				portraitRight2.visible = false;
				portraitRight3.visible = false;
				portraitRight4.visible = false;
				portraitRight5.visible = false;
				portraitRight6.visible = false;
				if (!portraitLeft7.visible)
				{
					portraitLeft7.visible = true;
					portraitLeft7.animation.play('enter');
				}
			case 'bf':
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pixelText'), 0.6)];
				portraitLeft.visible = false;
				portraitLeft2.visible = false;
				portraitLeft3.visible = false;
				portraitLeft4.visible = false;
				portraitLeft5.visible = false;
				portraitLeft6.visible = false;
				portraitLeft7.visible = false;
				portraitRight2.visible = false;
				portraitRight3.visible = false;
				portraitRight4.visible = false;
				portraitRight5.visible = false;
				portraitRight6.visible = false;
				if (!portraitRight.visible)
				{
					portraitRight.visible = true;
					portraitRight.animation.play('enter');
				}
			case 'bfshock':
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pixelText'), 0.6)];
				portraitLeft.visible = false;
				portraitLeft2.visible = false;
				portraitLeft3.visible = false;
				portraitLeft4.visible = false;
				portraitLeft5.visible = false;
				portraitLeft6.visible = false;
				portraitLeft7.visible = false;
				portraitRight.visible = false;
				portraitRight3.visible = false;
				portraitRight4.visible = false;
				portraitRight5.visible = false;
				portraitRight6.visible = false;
				if (!portraitRight2.visible)
				{
					portraitRight2.visible = true;
					portraitRight2.animation.play('enter');
				}
			case 'bfpeeved':
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pixelText'), 0.6)];
				portraitLeft.visible = false;
				portraitLeft2.visible = false;
				portraitLeft3.visible = false;
				portraitLeft4.visible = false;
				portraitLeft5.visible = false;
				portraitLeft6.visible = false;
				portraitLeft7.visible = false;
				portraitRight.visible = false;
				portraitRight2.visible = false;
				portraitRight4.visible = false;
				portraitRight5.visible = false;
				portraitRight6.visible = false;
				if (!portraitRight3.visible)
				{
					portraitRight3.visible = true;
					portraitRight3.animation.play('enter');
				}
			case 'bfawkward':
				swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pixelText'), 0.6)];
				portraitLeft.visible = false;
				portraitLeft2.visible = false;
				portraitLeft3.visible = false;
				portraitLeft4.visible = false;
				portraitLeft5.visible = false;
				portraitLeft6.visible = false;
				portraitLeft7.visible = false;
				portraitRight.visible = false;
				portraitRight2.visible = false;
				portraitRight3.visible = false;
				portraitRight5.visible = false;
				portraitRight6.visible = false;
				if (!portraitRight4.visible)
				{
					portraitRight4.visible = true;
					portraitRight4.animation.play('enter');
				}	
				case 'bfpumped':
					swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pixelText'), 0.6)];
					portraitLeft.visible = false;
					portraitLeft2.visible = false;
					portraitLeft3.visible = false;
					portraitLeft4.visible = false;
					portraitLeft5.visible = false;
					portraitLeft6.visible = false;
					portraitLeft7.visible = false;
					portraitRight.visible = false;
					portraitRight2.visible = false;
					portraitRight3.visible = false;
					portraitRight4.visible = false;
					portraitRight6.visible = false;
					if (!portraitRight5.visible)
					{
						portraitRight5.visible = true;
						portraitRight5.animation.play('enter');
					}	
					case 'bfdetermined':
						swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pixelText'), 0.6)];
						portraitLeft.visible = false;
						portraitLeft2.visible = false;
						portraitLeft3.visible = false;
						portraitLeft4.visible = false;
						portraitLeft5.visible = false;
						portraitLeft6.visible = false;
						portraitLeft7.visible = false;
						portraitRight.visible = false;
						portraitRight2.visible = false;
						portraitRight3.visible = false;
						portraitRight4.visible = false;
						portraitRight5.visible = false;
						if (!portraitRight6.visible)
						{
							portraitRight6.visible = true;
							portraitRight6.animation.play('enter');
						}	
		}
	}

	function cleanDialog():Void
	{
		var splitName:Array<String> = dialogueList[0].split(":");
		curCharacter = splitName[1];
		dialogueList[0] = dialogueList[0].substr(splitName[1].length + 2).trim();
	}
}
