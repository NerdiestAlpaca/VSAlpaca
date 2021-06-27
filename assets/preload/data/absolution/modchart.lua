local swaying = false
local swaying2 = false
local swaying3 = false
local bounce = false
function start (song)
	print("Song: " .. song .. " @ " .. bpm .. " donwscroll: " .. downscroll)
    setActorY(-300, 'girlfriend')
    setActorX(1000, 'girlfriend')
    setActorScale(0.3,'girlfriend')
end


function setDefault(id)

end


function songStart()
end


function update (elapsed) 
    local currentBeat = (songPos / 1000)*(bpm/60)
end

function beatHit (beat)

end



function bumpArrows()
end

local startBumping = false


local lastStep = 0

function stepHit (step)

end
function keyPressed (key)

end