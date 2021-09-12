function start (song)
    setHudPosition (-1000, -1000)
	print("Song: " .. song .. " @ " .. bpm .. " donwscroll: " .. downscroll)
    setActorScale(0.3,'girlfriend')
    setActorX(-350, 'dad')
    setActorY(-50, 'dad')
    setActorY (400, 'boyfriend')
    setActorX (1250, 'boyfriend')
    setActorY (150, 'girlfriend')
    setActorX (850, 'girlfriend')
    setActorScale(0.75,'boyfriend')
    setActorScale(0.75,'dad')
    setActorAlpha(0,'dad')
    redeyes = makeSprite('redeyes','redeyes', true)
    RedBG = makeSprite('RedBG','redbg', true)
    Overlay = makeSprite('Overlay','overlay', false)
	WhiteBG = makeSprite('WhiteBG','whitebg', true)
    Light = makeSprite('Light','light', true)
    Void = makeSprite('Void','void', true)
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
    setActorX(200,'void')
    setActorY(500,'void')
    setActorAlpha(1,'void')
    setActorScale(3,'void')
    setActorX(200,'light')
    setActorY(500,'light')
    setActorAlpha(0,'light')
    setActorScale(3,'light')
    showOnlyStrums = true
end

function setDefault(id)
end


function songStart()
end


function update (elapsed) 
    local currentBeat = (songPos / 1000)*(bpm/60)
	if shakenote then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 10 * math.sin((currentBeat * 10 + i*100) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 10 * math.cos((currentBeat * 10 + i*100) * math.pi), i)
		end
    end
    if shakecam then
        local currentBeat = (songPos / 1)*(bpm/1)
            cameraAngle = 2 * math.sin((currentBeat))
    end
    if sway then
		for i=0,3 do
			setActorX(_G['defaultStrum'..i..'X'] + 64 * math.sin((currentBeat) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i*5) * math.pi), i)
		end
        for i=4,7 do
            setActorX(_G['defaultStrum'..i..'X'] - 64 * math.sin((currentBeat) * math.pi), i)
            setActorY(_G['defaultStrum'..i..'Y'] - 32 * math.cos((currentBeat - i*5) * math.pi), i)
        end
    end
    if slowsway then
        local currentBeat = (songPos / 800)*(bpm/60)
        for i=0,7 do
        setActorX(_G['defaultStrum'..i..'X'] + 56 * math.sin((currentBeat + i*0.4)), i)
        end
    end
    if slowersway then
        local currentBeat = (songPos / 1200)*(bpm/60)
        for i=0,7 do
        setActorX(_G['defaultStrum'..i..'X'] + 48 * math.sin((currentBeat + i*0.4)), i)
        end
    end
    if slowsway2 then
        local currentBeat = (songPos / 800)*(bpm/60)
        for i=0,7 do
        setActorY(_G['defaultStrum'..i..'Y'] + 15 * math.sin((currentBeat + i*1) * math.pi), i)
        end
    end
    if spinnything then
        camHudAngle = 2 * math.sin(currentBeat / 2)
        for i=0,7 do
        setActorAngle(_G['defaultStrum'..i..'X'] + 45 * math.sin((currentBeat * 10 + i*100) * math.pi), i)
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
            setActorScale(1, i)
            camHudAngle = 0
            setHudPosition(0, 0)
            setCamPosition(0, 0)
            cameraAngle = 0
        end
    end
    if cameraswing then
        for i=0,7 do
			setHudPosition(8 * math.sin((currentBeat * 4)), 8 * math.cos((currentBeat * 4)))
		end
        camHudAngle = 6 * math.cos((currentBeat))
    end
    if finale then
		for i=0,3 do
			setActorX(_G['defaultStrum'..i..'X'] - 300 * math.sin(currentBeat * 1.2) + 350, i)
		end
		for i=4,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 300 * math.sin(currentBeat * 1.2) - 275, i)
		end
end
if beatdrop then 
    if curStep % 4 == 0 then
        setHudZoom(1.1)
    end
end
if beatdropsmall then 
    if curStep % 8 == 0 then
        setHudZoom(1.05)
    end
end
if beatdropextra then 
    if curStep % 4 == 0 then
        setCamZoom(1.04)
    end
end
if camswayfast then
    camHudAngle = 6 * math.sin(currentBeat * 2)
end
if camswayslow then
    camHudAngle = 5 * math.sin(currentBeat / 1)
end
if crazy then
    local currentBeat = (songPos / 500)*(bpm/60)
    for i=0,3 do
        setActorY(_G['defaultStrum'..i..'Y'] + 24 * math.cos(currentBeat + i), i)
        setActorX(_G['defaultStrum'..i..'X'] + 56 * math.sin(currentBeat * 0.4) + 10, i)
    end
    for i=4,7 do
        setActorY(_G['defaultStrum'..i..'Y'] - 24 * math.cos(currentBeat + i), i)
        setActorX(_G['defaultStrum'..i..'X'] - 56 * math.sin(currentBeat * 0.4) - 10, i)
    end
end
if crisscross then
    for i=0,3 do
        setActorX(_G['defaultStrum'..i..'X'] + 30 * math.sin(currentBeat * 0.503) + 5, i)
    end
    for i=4,7 do
        setActorX(_G['defaultStrum'..i..'X'] - 30 * math.sin(currentBeat * 0.503) - 5, i)
    end
end
if shakehud then
    for i=0,7 do
        setHudPosition(2 * math.sin((currentBeat * 5) * math.pi), 2 * math.cos((currentBeat * 5) * math.pi))
        setCamPosition(-2 * math.sin((currentBeat * 5) * math.pi), -2 * math.cos((currentBeat * 5) * math.pi))
    end
end
end

function beatHit (beat)

end



function bumpArrows()
end

local startBumping = false


local lastStep = 0

function stepHit (step)
if step == 1 then
    tweenFadeIn('dad',1,8)
    strumLine1Visible = false
    strumLine2Visible = false
end
if step == 2 then
    setHudPosition(0,0)
        for i=0,7 do
        tweenFadeIn(i,0,1)
        end
end
if step == 128 then
    setHudPosition(0,0)
    strumLine1Visible = true
    strumLine2Visible = true
    for i=0,7 do
        tweenFadeIn(i,1,1)
        end
    shakenote = true
    setActorAlpha(1, 'boyfriend')
    setActorAlpha(1, 'girlfriend')
end
if step == 192 then
    tweenFadeOut(Void,0,6)
end
if step == 224 then
    shakecam = true
    showOnlyStrums = false
end
if step == 256 then
    shakenote = false
    shakecam = false
    resetnotes = true
end
if step == 257 then
    resetnotes = false
end
if step == 4288 then
    tweenPosXAngle('dad', getActorX('dad') + 500 ,getActorAngle('dad') + 0, 4)
    tweenPosXAngle('boyfriend', getActorX('boyfriend') - 300 ,getActorAngle('boyfriend') + 0, 2)
    tweenPosXAngle('girlfriend', getActorX('girlfriend') - 300 ,getActorAngle('girlfriend') + 0, 3)
    for i=0,3 do
        tweenFadeIn(i,0,4)
        end
    end
if step == 4352 then
    tweenFadeIn(Light,1,16)
end
if step == 4480 then
    tweenFadeIn('dad',0,4)
end
if step == 4608 then
    tweenFadeIn('boyfriend',0,2)
    tweenFadeIn('girlfriend',0,2)
for i=4,7 do
    tweenFadeIn(i,0,4)
    end
end
if difficulty == 2 then
if step == 316 then
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
if step == 320 then
setActorAlpha(0,'redeyes')
setActorAlpha(1, 'girlfriend')
setActorAlpha(1, 'dad')
setActorAlpha(1, 'boyfriend')
shakenote = false
flip = true
end
if step == 380 then
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
if step == 384 then
setActorAlpha(0,'redeyes')
setActorAlpha(1, 'girlfriend')
setActorAlpha(1, 'dad')
setActorAlpha(1, 'boyfriend')
shakenote = false
resetnotes = true
end
if step == 385 then
resetnotes = false
end
if step == 444 then
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
if step == 448 then
setActorAlpha(0,'redeyes')
setActorAlpha(1, 'girlfriend')
setActorAlpha(1, 'dad')
setActorAlpha(1, 'boyfriend')
shakenote = false
tweenPosYAngle('dad', getActorY('dad') - 100 ,getActorAngle('dad') + 0, 3)
tweenPosXAngle('boyfriend', getActorX('boyfriend') + 1000 ,getActorAngle('boyfriend') + 0, 4)
tweenPosXAngle('girlfriend', getActorX('girlfriend') + 850 ,getActorAngle('girlfriend') + 720, 3)
end
if step == 508 then
    setActorScale(0.3,'girlfriend')
    setActorX(-350, 'dad')
    setActorY(-50, 'dad')
    setActorY (400, 'boyfriend')
    setActorY (150, 'girlfriend')
    setActorX (850, 'girlfriend')
    setActorScale(0.75,'boyfriend')
    setActorScale(0.75,'dad')
setActorAlpha(0, 'dad')
setActorAlpha(0, 'boyfriend')
setActorAlpha(0, 'girlfriend')
setActorAlpha(1,'redeyes')
shakenote = true
end
if step == 512 then
setActorAlpha(0,'redeyes')
setActorAlpha(1, 'girlfriend')
setActorAlpha(1, 'dad')
setActorAlpha(1, 'boyfriend')
end
if step == 528 then
shakecam = true
end
if step == 532 then
    setCamZoom(2)
    setActorX (1250, 'boyfriend')
end
if step == 544 then
    shakenote = false
    shakecam = false
    resetnotes = true
end
if step == 545 then
    resetnotes = false
    pulse = true
end
if step == 639 then
    resetnotes = true
    pulse = false
end
if step == 640 then
    resetnotes = false
    sway = true
end
if step == 896 then
    sway = false
    slowsway = true
    slowsway2 = true
end
if step == 1152 then
    spinnything = true
end
if step == 1424 then
    tweenFadeIn(WhiteBG,1,0.01)
    tweenFadeIn(RedBG,0,0.01)
    setCamZoom(1.2)
end
if step == 1425 then
    tweenFadeIn(WhiteBG,0,0.01)
    tweenFadeIn(RedBG,1,0.01)
    setCamZoom(1.2)
end
if step == 1426 then
    tweenFadeIn(WhiteBG,0,0.01)
    tweenFadeIn(RedBG,1,0.01)
    setCamZoom(1.2)
end
if step == 1427 then
    tweenFadeIn(WhiteBG,1,0.01)
    tweenFadeIn(RedBG,0,0.01)
    setCamZoom(1.2)
end
if step == 1428 then
    tweenFadeIn(WhiteBG,0,0.01)
    tweenFadeIn(RedBG,1,0.01)
    setCamZoom(1.2)
end
if step == 1429 then
    tweenFadeIn(WhiteBG,0,0.01)
    tweenFadeIn(RedBG,1,0.01)
    setCamZoom(1.2)
end
if step == 1430 then
    tweenFadeIn(WhiteBG,1,0.01)
    tweenFadeIn(RedBG,0,0.01)
    setCamZoom(1.2)
end
if step == 1431 then
    tweenFadeIn(WhiteBG,0,0.01)
    tweenFadeIn(RedBG,1,0.01)
    setCamZoom(1.2)
end
if step == 1432 then
    tweenFadeIn(WhiteBG,0,0.01)
    tweenFadeIn(RedBG,1,0.01)
    setCamZoom(1.2)
end
if step == 1433 then
    tweenFadeIn(WhiteBG,1,0.01)
    tweenFadeIn(RedBG,0,0.01)
    setCamZoom(1.2)
end
if step == 1434 then
    tweenFadeIn(WhiteBG,0,0.01)
    tweenFadeIn(RedBG,1,0.01)
    setCamZoom(1.2)
end
if step == 1435 then
    tweenFadeIn(WhiteBG,0,0.01)
    tweenFadeIn(RedBG,1,0.01)
    setCamZoom(1.2)
end
if step == 1436 then
    tweenFadeIn(WhiteBG,0,0.01)
    tweenFadeIn(RedBG,1,0.01)
    setCamZoom(1.2)
end
if step == 1437 then
    tweenFadeIn(WhiteBG,1,0.01)
    tweenFadeIn(RedBG,0,0.01)
    setCamZoom(1.2)
end
if step == 1438 then
    tweenFadeIn(WhiteBG,0,0.01)
    tweenFadeIn(RedBG,1,0.01)
    setCamZoom(1.2)
end
if step == 1439 then
    tweenFadeIn(WhiteBG,0,0.01)
    tweenFadeIn(RedBG,1,0.01)
    setCamZoom(1.2)
end
if step == 1440 then
    tweenFadeIn(RedBG,0,0.01)
end
if step == 1496 then
    spinnything = false
    resetnotes = true
    slowsway = false
    slowsway2 = false
end
if step == 1503 then
    resetnotes = false
end
if step == 1504 then
    slowsway = true
end
if step == 1596 then
    setActorScale(0.3,'girlfriend')
    setActorX(-350, 'boyfriend')
    setActorY(-50, 'dad')
    setActorY (400, 'boyfriend')
    setActorX (1250, 'dad')
    setActorY (150, 'girlfriend')
    setActorX (-200, 'girlfriend')
    setActorScale(0.75,'dad')
    setActorScale(0.75,'boyfriend')
    setActorFlipX(true, 'boyfriend')
    setActorFlipX(true, 'dad')
    setActorAlpha(1,'redeyes')
    setActorAlpha(0, 'dad')
    setActorAlpha(0, 'boyfriend')
    setActorAlpha(0, 'girlfriend')
    shakenote = true
    slowsway = false
end
if step == 1600 then
setActorAlpha(0,'redeyes')
setActorAlpha(1, 'girlfriend')
setActorAlpha(1, 'dad')
setActorAlpha(1, 'boyfriend')
shakenote = false
flip = true
slowsway2 = true
end
if step == 1692 then
    setActorScale(0.3,'girlfriend')
    setActorX(-350, 'dad')
    setActorY(-50, 'dad')
    setActorY (400, 'boyfriend')
    setActorX (1250, 'boyfriend')
    setActorY (150, 'girlfriend')
    setActorX (850, 'girlfriend')
    setActorScale(0.75,'boyfriend')
    setActorScale(0.75,'dad')
setActorAlpha(0, 'dad')
setActorAlpha(0, 'boyfriend')
setActorAlpha(0, 'girlfriend')
setActorAlpha(1,'redeyes')
setActorFlipX(false, 'boyfriend')
setActorFlipX(false, 'dad')
shakenote = true
slowsway2 = false
end
if step == 1695 then
flip = false
setActorAlpha(0,'redeyes')
setActorAlpha(1, 'girlfriend')
setActorAlpha(1, 'dad')
setActorAlpha(1, 'boyfriend')
shakenote = false
resetnotes = true
end
if step == 1696 then
    resetnotes = false
    cameraswing = true
    pulse = true
end
if step == 1951 then
    resetnotes = true
    cameraswing = false
    pulse = false
end
if step == 1952 or step == 2016 then
    shakenote = true
    resetnotes = false
end
if step == 1984 or step == 2048 then 
    shakenote = false
    resetnotes = true
end
if step == 1985 or step == 2049 then 
    resetnotes = false
end
if step == 2076 then
setActorX(750, 'boyfriend')
setActorY(0, 'dad')
setActorAlpha(0, 'dad')
setActorX(250, 'girlfriend')
setActorAlpha(0, 'boyfriend')
setActorAlpha(0, 'girlfriend')
setActorScale(0.3,'girlfriend')
setActorAlpha(1,'redeyes')
setActorX(0, 'dad')
shakenote = true
tweenFadeIn(Light,1,1)
end
if step == 2080 then
    setActorAlpha(0,'redeyes')
setActorAlpha(1, 'dad')
setActorAlpha(1, 'boyfriend')
shakenote = false
sway = true
end
if step == 2200 then
    setActorAlpha(1, 'girlfriend')
    tweenFadeIn(Light,0,1)
    tweenFadeIn(Overlay,1,1)
end
if step == 2336 then
    sway = false
    resetnotes = true
    tweenFadeIn(Overlay,0,1)
end
if step == 2337 then
    resetnotes = false
end
if step == 2460 then
        setActorScale(0.3,'girlfriend')
        setActorX(-350, 'dad')
        setActorY(-50, 'dad')
        setActorY (400, 'boyfriend')
        setActorX (1250, 'boyfriend')
        setActorY (150, 'girlfriend')
        setActorX (850, 'girlfriend')
        setActorScale(0.75,'boyfriend')
        setActorScale(0.75,'dad')
    setActorAlpha(0, 'dad')
    setActorAlpha(0, 'boyfriend')
    setActorAlpha(0, 'girlfriend')
    setActorAlpha(1,'redeyes')
    shakenote = true
end
if step == 2464 then
    setActorAlpha(0,'redeyes')
setActorAlpha(1, 'girlfriend')
setActorAlpha(1, 'dad')
setActorAlpha(1, 'boyfriend')
shakenote = false
beatdrop = true
cameraswing = true
end
if step == 2591 then
    resetnotes = true
    cameraswing = false
end
if step == 2592 then
    beatdrop = false
    resetnotes = false
    setHudZoom(1)
end
if step == 2848 then
slowsway = true
slowsway2 = true
shakehud = true
end
if step == 2975 then
    resetnotes = true
end
if step == 2976 then
    resetnotes = false
slowsway = false
slowsway2 = false
crazy = true
camswayslow = true
end
if step == 3359 then
    crazy = false
    shakehud = false
    camswayslow = false
    resetnotes = true
end
if step == 3360 then
    resetnotes = false
    slowersway = true
    pulse2 = true
end
if step == 3551 then
    slowersway = false
    pulse2 = false
    resetnotes = true
end
if step == 3552 then
    resetnotes = false
    slowsway2 = true
    beatdropsmall = true
end
if step == 3808 then
    crisscross = true
end
if step == 4191 then
    crisscross = false
    resetnotes = true
end
if step == 4192 then
    resetnotes = false
    beatdropsmall = false
    shakecam = true
end
if step == 4288 then
    shakecam = false
    tweenPosXAngle('dad', getActorX('dad') + 500 ,getActorAngle('dad') + 0, 4)
    tweenPosXAngle('boyfriend', getActorX('boyfriend') - 300 ,getActorAngle('boyfriend') + 0, 2)
    tweenPosXAngle('girlfriend', getActorX('girlfriend') - 300 ,getActorAngle('girlfriend') + 0, 3)
    for i=0,3 do
        tweenFadeIn(i,0,4)
        end
    end
if step == 4352 then
    slowsway = true
    finale = true
    camswayfast = true
    beatdropextra = true
    beatdropsmall = true
tweenFadeIn(Light,1,16)
end
if step == 4480 then
    finale = false
    camswayfast = false
    camswayslow = true
    beatdropextra = false
    tweenFadeIn('dad',0,4)
end
if step == 4608 then
    camswayslow = false
    tweenFadeIn('boyfriend',0,2)
    tweenFadeIn('girlfriend',0,2)
    slowsway = false
beatdropsmall = false
resetnotes = true
setHudZoom(1)
for i=4,7 do
    tweenFadeIn(i,0,4)
    end
end
end
if (pulse and curStep % 16 == 0) then
    for i = 0, 7 do
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 0 ,getActorAngle(i) + 360, 0.2)
    end
end
if (pulse2 and curStep % 8 == 0) then
    for i = 0, 7 do
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 0 ,getActorAngle(i) + 360, 0.1)
    end
end
end
function keyPressed (key)

end
