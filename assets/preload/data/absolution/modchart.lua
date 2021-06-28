function start (song)
	print("Song: " .. song .. " @ " .. bpm .. " donwscroll: " .. downscroll)
    setActorScale(0.3,'girlfriend')
    setActorX(-250, 'dad')
    setActorY(-700, 'dad')
    setActorY (400, 'boyfriend')
    setActorX (850, 'boyfriend')
    setActorY (150, 'girlfriend')
    setActorX (550, 'girlfriend')
    setActorScale(0.75,'boyfriend')
    setActorScale(0.75,'dad')
    redeyes = makeSprite('redeyes','redeyes', true)
    RedBG = makeSprite('RedBG','redbg', true)
    Overlay = makeSprite('Overlay','overlay', false)
	WhiteBG = makeSprite('WhiteBG','whitebg', true)
    setActorX(0,'redeyes')
    setActorY(350,'redeyes')
    setActorAlpha(0,'redeyes')
    setActorScale(3,'redeyes')
    setActorX(50,'redbg')
	setActorY(450,'redbg')
	setActorAlpha(0,'redbg')
	setActorScale(3,'redbg')
	setActorX(200,'whitebg')
	setActorY(500,'whitebg')
	setActorAlpha(0,'whitebg')
	setActorScale(3,'whitebg')
    setActorX(50,'overlay')
	setActorY(450,'overlay')
    setActorAlpha(0,'overlay')
	setActorScale(3,'overlay')
end

function setDefault(id)
end


function songStart()
    useDownscroll(false)
end


function update (elapsed) 
    local currentBeat = (songPos / 1000)*(bpm/60)
	if shakenote then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 10 * math.sin((currentBeat * 10 + i*100) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 10 * math.cos((currentBeat * 10 + i*100) * math.pi), i)
		end
    end
    if sway then
        for i=0,7 do
        setActorAngle(_G['defaultStrum'..i..'X'] + 45 * math.sin((currentBeat * 10 + i*100) * math.pi), i)
        setActorX(_G['defaultStrum'..i..'X'] + 56 * math.sin((currentBeat + i*0.4)), i)
        end
    end
    if flip then
        for i = 4, 7 do
            setActorX(_G['defaultStrum'..i..'X'] - 640, i)
        end
        for i = 0, 3 do
            setActorX(_G['defaultStrum'..i..'X'] + 640, i)
        end
    end
    if resetnotes then
        for i = 0, 7 do
            setActorX(_G['defaultStrum'..i..'X'] + 0, i)
            setActorY(_G['defaultStrum'..i..'Y'] + 10,i)
            setActorAngle(0, i)
            camHudAngle = 0
            setHudPosition(0, 0)
            cameraAngle = 0
        end
    end
    if cameraswing then
        for i=0,7 do
			setHudPosition(8 * math.sin((currentBeat * 4) * math.pi), 8 * math.cos((currentBeat * 4) * math.pi))
		end
        camHudAngle = 6 * math.cos((currentBeat))
    end
    if finale then
        local currentBeat = (songPos / 500)*(bpm/30)
        cameraAngle = 3 * math.sin((currentBeat))
end
end

function beatHit (beat)

end



function bumpArrows()
end

local startBumping = false


local lastStep = 0

function stepHit (step)
 if step == 32 then
    setActorAlpha(1,'redeyes')
    changeDadCharacter('alpaca')
    changeDadCharacter('demon')
    changeDadCharacter('darkness')
    changeDadCharacter('final')
end
if step == 34 then
setActorAlpha(0,'redeyes')
end
if step == 36 then
    setActorAlpha(1,'redeyes')
end
if step == 38 then
setActorAlpha(0,'redeyes')
end
if step == 40 then
    setActorAlpha(1,'redeyes')
end
if step == 42 then
setActorAlpha(0,'redeyes')
end
if step == 44 then
    setActorAlpha(1,'redeyes')
end
if step == 46 then
setActorAlpha(0,'redeyes')
end
if step == 48 then
    setActorAlpha(1,'redeyes')
    shakenote = true
end
if step == 49 then
setActorAlpha(0,'redeyes')
end
if step == 50 then
    setActorAlpha(1,'redeyes')
end
if step == 51 then
setActorAlpha(0,'redeyes')
end
if step == 52 then
    setActorAlpha(1,'redeyes')
end
if step == 53 then
setActorAlpha(0,'redeyes')
end
if step == 54 then
    setActorAlpha(1,'redeyes')
end
if step == 55 then
setActorAlpha(0,'redeyes')
end
if step == 56 then
    setActorAlpha(1,'redeyes')
end
if step == 57 then
setActorAlpha(0,'redeyes')
end
if step == 58 then
    setActorAlpha(1,'redeyes')
end
if step == 59 then
setActorAlpha(0,'redeyes')
end
if step == 60 then
    setActorAlpha(1,'redeyes')
end
if step == 61 then
setActorAlpha(0,'redeyes')
end
if step == 62 then
    setActorAlpha(1,'redeyes')
end
if step == 63 then
setActorScale(0.75,'dad')
setActorAlpha(0,'redeyes')
shakenote = false
resetnotes = true
end
if step == 64 then
    resetnotes = false
end
    if step == 124 then
        setActorX(-100, 'boyfriend')
        setActorY(0, 'dad')
        setActorAlpha(0, 'dad')
        setActorX(-300, 'girlfriend')
        setActorAlpha(0, 'boyfriend')
        setActorAlpha(0, 'girlfriend')
        setActorScale(0.2,'girlfriend')
        setActorAlpha(1,'redeyes')
        setActorX(200, 'dad')
        setActorFlipX(true, 'boyfriend')
        setActorFlipX(true, 'dad')
        shakenote = true
end
if step == 128 then
    setActorAlpha(0,'redeyes')
    setActorAlpha(1, 'girlfriend')
    setActorAlpha(1, 'dad')
    setActorAlpha(1, 'boyfriend')
    shakenote = false
    flip = true
end
if step == 188 then
    flip = false
    setActorX(1000, 'boyfriend')
    setActorY(0, 'dad')
    setActorAlpha(0, 'dad')
    setActorX(500, 'girlfriend')
    setActorAlpha(0, 'boyfriend')
    setActorAlpha(0, 'girlfriend')
    setActorScale(0.3,'girlfriend')
    setActorScale(0.95,'dad')
    setActorAlpha(1,'redeyes')
    setActorX(-200, 'dad')
    setActorFlipX(false, 'boyfriend')
    setActorFlipX(false, 'dad')
    shakenote = true
end
if step == 192 then
setActorAlpha(0,'redeyes')
setActorAlpha(1, 'girlfriend')
setActorAlpha(1, 'dad')
setActorAlpha(1, 'boyfriend')
shakenote = false
resetnotes = true
end
if step == 193 then
    resetnotes = false
end
if step == 252 then
    setActorX(0, 'boyfriend')
    setActorY(0, 'dad')
    setActorAlpha(0, 'dad')
    setActorX(0, 'girlfriend')
    setActorAlpha(0, 'boyfriend')
    setActorAlpha(0, 'girlfriend')
    setActorScale(0.3,'girlfriend')
    setActorScale(0.8,'dad')
    setActorAlpha(1,'redeyes')
    setActorX(-400, 'dad')
    shakenote = true
end
if step == 256 then
setActorAlpha(0,'redeyes')
setActorAlpha(1, 'girlfriend')
setActorAlpha(1, 'dad')
setActorAlpha(1, 'boyfriend')
shakenote = false
tweenPosYAngle('dad', getActorY('dad') - 100 ,getActorAngle('dad') + 0, 3)
end
if step == 316 then
    setActorScale(0.3,'girlfriend')
    setActorX(-300, 'dad')
    setActorY (400, 'boyfriend')
    setActorX (850, 'boyfriend')
    setActorY (150, 'girlfriend')
    setActorX (550, 'girlfriend')
    setActorScale(0.75,'boyfriend')
    setActorScale(0.75,'dad')
    setActorAlpha(0, 'dad')
    setActorAlpha(0, 'boyfriend')
    setActorAlpha(0, 'girlfriend')
    setActorAlpha(1,'redeyes')
    shakenote = true
end
if step == 320 then
setActorAlpha(0,'redeyes')
setActorAlpha(1, 'girlfriend')
setActorAlpha(1, 'dad')
setActorAlpha(1, 'boyfriend')
tweenPosXAngle('dad', getActorX('dad') + 500 ,getActorAngle('dad') + 0, 12)
shakenote = false
sway = true
end
if step == 544 then
    setActorX(-100, 'dad')
end
if step == 548 then
    setActorX(300, 'dad')
end
if step == 550 then
    setActorX(-200, 'dad')
end
if step == 552 then
    setActorX(300, 'dad')
end
if step == 553 then
    setActorX(800, 'dad')
end
if step == 554 then
    setActorX(-300, 'dad')
end
if step == 555 then
    setActorX(300, 'dad')
end
if step == 556 then
    setActorX(-300, 'dad')
end
if step == 574 then
    tweenFadeOut('dad',0,0.5)
end
if step == 576 then
    setActorAlpha(0, 'dad')
    sway = false
    resetnotes = true
end
if step == 577 then
    setActorAlpha(0, 'dad')
    resetnotes = false
end
if step == 578 then
    setActorAlpha(0, 'dad')
end
if step == 579 then
    setActorAlpha(0, 'dad')
end
if step == 580 then
    setActorAlpha(0, 'dad')
end
if step == 581 then
    setActorAlpha(0, 'dad')
end
if step == 582 then
    setActorAlpha(0, 'dad')
end
if step == 583 then
    setActorAlpha(0, 'dad')
end
if step == 584 then
    setActorAlpha(0, 'dad')
end
if step == 585 then
    setActorAlpha(0, 'dad')
end
if step == 586 then
    setActorAlpha(0, 'dad')
end
if step == 587 then
    setActorAlpha(0, 'dad')
end
if step == 588 then
    setActorAlpha(0, 'dad')
end
if step == 589 then
    setActorAlpha(0, 'dad')
end
if step == 590 then
    setActorAlpha(0, 'dad')
end
if step == 591 then
    tweenFadeIn(WhiteBG,1,0.01)
    setCamZoom(1.1)
    tweenFadeIn('dad',1,0.1)
end
if step == 592 then
    tweenFadeOut(WhiteBG,0,0.01)
    tweenFadeIn(RedBG,1,0.01)
    setCamZoom(1.1)
    changeDadCharacter('alpaca')
    setActorAlpha(1, 'dad')
    end
if step == 593 then
    tweenFadeIn(WhiteBG,1,0.01)
    tweenFadeOut(RedBG,0,0.01)
    setCamZoom(1.1)
end
if step == 594 then
    tweenFadeOut(WhiteBG,0,0.01)
    tweenFadeIn(RedBG,1,0.01)
    setCamZoom(1.1)
end
if step == 595 then
    tweenFadeIn(WhiteBG,1,0.01)
    tweenFadeOut(RedBG,0,0.01)
    setCamZoom(1.1)
end
if step == 596 then
    tweenFadeOut(WhiteBG,0,0.01)
    tweenFadeIn(RedBG,1,0.01)
    setCamZoom(1.1)
    changeDadCharacter('demon')
end
if step == 597 then
    tweenFadeIn(WhiteBG,1,0.01)
    tweenFadeOut(RedBG,0,0.01)
    setCamZoom(1.1)
end
if step == 598 then
    tweenFadeOut(WhiteBG,0,0.01)
    tweenFadeIn(RedBG,1,0.01)
    setCamZoom(1.1)
end
if step == 599 then
    tweenFadeIn(WhiteBG,1,0.01)
    tweenFadeOut(RedBG,0,0.01)
    setCamZoom(1.1)
end
if step == 600 then
    tweenFadeOut(WhiteBG,0,0.01)
    tweenFadeIn(RedBG,1,0.01)
    setCamZoom(1.1)
    changeDadCharacter('darkness')
    setActorY(250, 'dad')
    end
    if step == 601 then
        tweenFadeIn(WhiteBG,1,0.01)
        tweenFadeOut(RedBG,0,0.01)
        setCamZoom(1.1)
    end
    if step == 602 then
        tweenFadeOut(WhiteBG,0,0.01)
        tweenFadeIn(RedBG,1,0.01)
        setCamZoom(1.1)
    end
    if step == 603 then
        tweenFadeIn(WhiteBG,1,0.01)
        tweenFadeOut(RedBG,0,0.01)
        setCamZoom(1.1)
    end
    if step == 604 then
        tweenFadeOut(WhiteBG,0,0.01)
        tweenFadeIn(RedBG,1,0.01)
        setCamZoom(1.1)
    changeDadCharacter('final')
    setActorY(-100, 'dad')
    setActorScale(0.75,'dad')
    end
if step == 608 then
    tweenFadeOut(RedBG,0,0.1)
    setActorAlpha(1,'overlay')
    cameraswing = true
    showOnlyStrums = true
        setActorX(-100, 'boyfriend')
        setActorY(0, 'dad')
        setActorAlpha(0, 'dad')
        setActorX(-300, 'girlfriend')
        setActorAlpha(0, 'boyfriend')
        setActorAlpha(0, 'girlfriend')
        setActorScale(0.2,'girlfriend')
        setActorAlpha(1,'redeyes')
        setActorX(200, 'dad')
        setActorFlipX(true, 'boyfriend')
        setActorFlipX(true, 'dad')
        shakenote = true
end
if step == 610 then
    setActorAlpha(0,'redeyes')
    setActorAlpha(1, 'girlfriend')
    setActorAlpha(1, 'dad')
    setActorAlpha(1, 'boyfriend')
    shakenote = false
    flip = true
end
if step == 734 then
    setActorX(1000, 'boyfriend')
    setActorY(0, 'dad')
    setActorAlpha(0, 'dad')
    setActorX(500, 'girlfriend')
    setActorAlpha(0, 'boyfriend')
    setActorAlpha(0, 'girlfriend')
    setActorScale(0.5,'girlfriend')
    setActorScale(1.2,'dad')
    setActorScale(1.05,'boyfriend')
    setActorAlpha(1,'redeyes')
    setActorX(-200, 'dad')
    setActorFlipX(false, 'boyfriend')
    setActorFlipX(false, 'dad')
    shakenote = true
end
if step == 736 then
setActorAlpha(0,'redeyes')
setActorAlpha(1, 'girlfriend')
setActorAlpha(1, 'dad')
setActorAlpha(1, 'boyfriend')
shakenote = false
resetnotes = true
flip = false
end
if step == 737 then
    resetnotes = false
end
if step == 863 then
    setActorScale(0.3,'girlfriend')
    setActorX(-300, 'dad')
    setActorY (400, 'boyfriend')
    setActorX (850, 'boyfriend')
    setActorY (150, 'girlfriend')
    setActorX (550, 'girlfriend')
    setActorScale(0.75,'boyfriend')
    setActorScale(0.75,'dad')
    setActorAlpha(0, 'dad')
    setActorAlpha(0, 'boyfriend')
    setActorAlpha(0, 'girlfriend')
    cameraswing = false
    showOnlyStrums = false
    resetnotes = true
end
if step == 864 then
tweenFadeOut(Overlay,0,1)
setActorAlpha(0,'redeyes')
setActorAlpha(1, 'girlfriend')
setActorAlpha(1, 'dad')
setActorAlpha(1, 'boyfriend')
tweenPosXAngle('dad', getActorX('dad') + 300 ,getActorAngle('dad') + 0, 16)
tweenPosXAngle('boyfriend', getActorX('boyfriend') -400 ,getActorAngle('boyfriend') + 0, 16)
tweenPosXAngle('girlfriend', getActorX('girlfriend') -200 ,getActorAngle('girlfriend') + 360, 16)
resetnotes = false
shakenote = true
sway = true
end
if step == 1116 then
    setActorAlpha(0, 'dad')
    setActorAlpha(0, 'boyfriend')
    setActorAlpha(0, 'girlfriend')
    setActorAlpha(1, 'redeyes')
end
if step == 1120 then
setActorAlpha(0,'redeyes')
setActorAlpha(1, 'girlfriend')
setActorAlpha(1, 'dad')
setActorAlpha(1, 'boyfriend')
setActorX(-300, 'dad')
setActorX (850, 'boyfriend')
setActorX (550, 'girlfriend')
shakenote = false
end
if step == 1600 then
    resetnotes = true
    shakenote = false
sway = false
    tweenFadeIn(WhiteBG,1,2)
end
if step == 1601 then
    resetnotes = false
end
if step == 1872 then
    tweenFadeOut(WhiteBG,0,1)
    tweenFadeIn(Overlay,1,8)
end
if step == 2128 then
    tweenFadeOut(WhiteBG,0,0.01)
    tweenFadeIn(RedBG,1,0.01)
    setCamZoom(1.5)
end
if step == 2129 then
    tweenFadeIn(WhiteBG,1,0.01)
    tweenFadeOut(RedBG,0,0.01)
    setCamZoom(1.5)
end
if step == 2130 then
    tweenFadeOut(WhiteBG,0,0.01)
    tweenFadeIn(RedBG,1,0.01)
    setCamZoom(1.5)
end
if step == 2131 then
    tweenFadeIn(WhiteBG,1,0.01)
    tweenFadeOut(RedBG,0,0.01)
    setCamZoom(1.5)
end
if step == 2132 then
    tweenFadeOut(WhiteBG,0,0.01)
    tweenFadeIn(RedBG,1,0.01)
    setCamZoom(1.5)
end
if step == 2133 then
    tweenFadeIn(WhiteBG,1,0.01)
    tweenFadeOut(RedBG,0,0.01)
    setCamZoom(1.5)
end
if step == 2134 then
    tweenFadeOut(WhiteBG,0,0.01)
    tweenFadeIn(RedBG,1,0.01)
    setCamZoom(1.5)
end
if step == 2135 then
    tweenFadeIn(WhiteBG,1,0.01)
    tweenFadeOut(RedBG,0,0.01)
    setCamZoom(1.5)
end
if step == 2136 then
    tweenFadeOut(WhiteBG,0,0.01)
    tweenFadeIn(RedBG,1,0.01)
    setCamZoom(1.5)
end
if step == 2137 then
    tweenFadeIn(WhiteBG,1,0.01)
    tweenFadeOut(RedBG,0,0.01)
    setCamZoom(1.5)
end
if step == 2138 then
    tweenFadeOut(WhiteBG,0,0.01)
    tweenFadeIn(RedBG,1,0.01)
    setCamZoom(1.5)
end
if step == 2139 then
    tweenFadeIn(WhiteBG,1,0.01)
    tweenFadeOut(RedBG,0,0.01)
    setCamZoom(1.5)
end
if step == 2140 then
    tweenFadeOut(WhiteBG,0,0.01)
    tweenFadeIn(RedBG,1,0.01)
    setCamZoom(1.5)
end
if step == 2141 then
    tweenFadeIn(WhiteBG,1,0.01)
    tweenFadeOut(RedBG,0,0.01)
    setCamZoom(1.5)
end
if step == 2142 then
    tweenFadeOut(WhiteBG,0,0.01)
    tweenFadeIn(RedBG,1,0.01)
    setCamZoom(1.5)
end
if step == 2143 then
    tweenFadeIn(WhiteBG,1,0.01)
    tweenFadeOut(RedBG,0,0.01)
    setCamZoom(1.5)
end
if step == 2144 then
    tweenFadeOut(WhiteBG,0,0.1)
    setActorAlpha(1,'overlay')
    cameraswing = true
    sway = true
    shakenote = true
    showOnlyStrums = true
    finale = true
end
if step == 2655 then 
resetnotes = true
    end
if step == 2656 then 
shakenote = false
finale = false
resetnotes = false
camHudAngle = 0
setHudPosition(0, 0)
cameraAngle = 0
tweenFadeIn(WhiteBG,1,16)
tweenFadeOut(Overlay,0,8)
end
if step == 2912 then
    sway = false
    cameraswing = false
    showOnlyStrums = false
    resetnotes = true
    tweenFadeOut('girlfriend',0,0.1)
    tweenFadeOut('boyfriend',0,1)
    tweenFadeOut('dad',0,0.01)
end

end

function keyPressed (key)

end