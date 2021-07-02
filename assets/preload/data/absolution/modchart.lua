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
        for i=0,7 do
        setActorY(_G['defaultStrum'..i..'Y'] + 15 * math.sin((currentBeat + i*1) * math.pi), i)
        setActorX(_G['defaultStrum'..i..'X'] + 56 * math.sin((currentBeat + i*0.4)), i)
        end
    end
    if slowsway then
        local currentBeat = (songPos / 1500)*(bpm/60)
        for i=0,7 do
        setActorX(_G['defaultStrum'..i..'X'] + 56 * math.sin((currentBeat + i*0.4)), i)
        end
    end
    if slowsway2 then
        local currentBeat = (songPos / 1500)*(bpm/60)
        for i=0,7 do
        setActorY(_G['defaultStrum'..i..'Y'] + 15 * math.sin((currentBeat + i*1) * math.pi), i)
        end
    end
    if spinnything then
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
            camHudAngle = 0
            setHudPosition(0, 0)
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
if step == 1 then
    tweenFadeIn('dad',1,8)
    strumLine1Visible = false
    strumLine2Visible = false
end
if step == 2 then
    setHudPosition(0,0)
end
if step == 128 then
    setHudPosition(0,0)
    strumLine1Visible = true
    strumLine2Visible = true
    shakenote = true
    setActorAlpha(1, 'boyfriend')
    setActorAlpha(1, 'girlfriend')
end
if step == 192 then
    tweenFadeOut(Void,0,8)
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
end
if step == 508 then
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
if step == 512 then
setActorAlpha(0,'redeyes')
setActorAlpha(1, 'girlfriend')
setActorAlpha(1, 'dad')
setActorAlpha(1, 'boyfriend')
end
if step == 528 then
shakecam = true
end
if step == 544 then
    shakenote = false
    shakecam = false
    resetnotes = true
end
if step == 545 then
    resetnotes = false
end
if step == 640 then
    sway = true
end
if step == 1151 then
    sway = false
    resetnotes = true
end
if step == 1152 then
    resetnotes = false
    spinnything = true
end
if step == 1424 then
    tweenFadeIn(WhiteBG,1,0.01)
    tweenFadeIn(RedBG,0,0.01)
    setCamZoom(2)
end
if step == 1425 then
    tweenFadeIn(WhiteBG,0,0.01)
    tweenFadeIn(RedBG,1,0.01)
    setCamZoom(2)
end
if step == 1426 then
    tweenFadeIn(WhiteBG,0,0.01)
    tweenFadeIn(RedBG,1,0.01)
    setCamZoom(2)
end
if step == 1427 then
    tweenFadeIn(WhiteBG,1,0.01)
    tweenFadeIn(RedBG,0,0.01)
    setCamZoom(2)
end
if step == 1428 then
    tweenFadeIn(WhiteBG,0,0.01)
    tweenFadeIn(RedBG,1,0.01)
    setCamZoom(2)
end
if step == 1429 then
    tweenFadeIn(WhiteBG,0,0.01)
    tweenFadeIn(RedBG,1,0.01)
    setCamZoom(2)
end
if step == 1430 then
    tweenFadeIn(WhiteBG,1,0.01)
    tweenFadeIn(RedBG,0,0.01)
    setCamZoom(2)
end
if step == 1431 then
    tweenFadeIn(WhiteBG,0,0.01)
    tweenFadeIn(RedBG,1,0.01)
    setCamZoom(2)
end
if step == 1432 then
    tweenFadeIn(WhiteBG,0,0.01)
    tweenFadeIn(RedBG,1,0.01)
    setCamZoom(2)
end
if step == 1433 then
    tweenFadeIn(WhiteBG,1,0.01)
    tweenFadeIn(RedBG,0,0.01)
    setCamZoom(2)
end
if step == 1434 then
    tweenFadeIn(WhiteBG,0,0.01)
    tweenFadeIn(RedBG,1,0.01)
    setCamZoom(2)
end
if step == 1435 then
    tweenFadeIn(WhiteBG,0,0.01)
    tweenFadeIn(RedBG,1,0.01)
    setCamZoom(2)
end
if step == 1436 then
    tweenFadeIn(WhiteBG,0,0.01)
    tweenFadeIn(RedBG,1,0.01)
    setCamZoom(2)
end
if step == 1437 then
    tweenFadeIn(WhiteBG,1,0.01)
    tweenFadeIn(RedBG,0,0.01)
    setCamZoom(2)
end
if step == 1438 then
    tweenFadeIn(WhiteBG,0,0.01)
    tweenFadeIn(RedBG,1,0.01)
    setCamZoom(2)
end
if step == 1439 then
    tweenFadeIn(WhiteBG,0,0.01)
    tweenFadeIn(RedBG,1,0.01)
    setCamZoom(2)
end
if step == 1440 then
    tweenFadeIn(RedBG,0,0.01)
end
if step == 1496 then
    spinnything = false
    resetnotes = true
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
    showOnlyStrums = true
end
end
function keyPressed (key)

end