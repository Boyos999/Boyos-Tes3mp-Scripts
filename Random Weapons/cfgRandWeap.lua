--contains various variables that are used by randomWeapons.lua
--[[
The first value is the lower bound (inclusive) and the second value is the higher bound (inclusive)
If the values are set such that the max value can be rolled lower than the min value the min is set to whatever the max rolled
]]--
cfgRandWeap = {}

--war axe ranges
cfgRandWeap.axe1hChopMin = {1,10}
cfgRandWeap.axe1hChopMax = {20,50}
cfgRandWeap.axe1hSlashMin = {1,5}
cfgRandWeap.axe1hSlashMax = {10,40}
cfgRandWeap.axe1hThrustMin = {1,2}
cfgRandWeap.axe1hThrustMax = {3,10}
cfgRandWeap.axe1hEnch = {25,150}

--battle axe ranges
cfgRandWeap.axe2hChopMin = {1,15}
cfgRandWeap.axe2hChopMax = {20,80}
cfgRandWeap.axe2hSlashMin = {1,10}
cfgRandWeap.axe2hSlashMax = {15,60}
cfgRandWeap.axe2hThrustMin = {1,2}
cfgRandWeap.axe2hThrustMax = {3,10}
cfgRandWeap.axe2hEnch = {50,175}

--mace ranges
cfgRandWeap.maceChopMin = {1,10}
cfgRandWeap.maceChopMax = {20,50}
cfgRandWeap.maceSlashMin = {1,5}
cfgRandWeap.maceSlashMax = {10,40}
cfgRandWeap.maceThrustMin = {1,2}
cfgRandWeap.maceThrustMax = {3,10}
cfgRandWeap.maceEnch = {25,150}

--hammer ranges
cfgRandWeap.hammerChopMin = {1,15}
cfgRandWeap.hammerChopMax = {20,70}
cfgRandWeap.hammerSlashMin = {1,10}
cfgRandWeap.hammerSlashMax = {15,60}
cfgRandWeap.hammerThrustMin = {1,2}
cfgRandWeap.hammerThrustMax = {3,10}
cfgRandWeap.hammerEnch = {50,175}

--staff ranges
cfgRandWeap.staffChopMin = {1,15}
cfgRandWeap.staffChopMax = {10,20}
cfgRandWeap.staffSlashMin = {1,10}
cfgRandWeap.staffSlashMax = {10,20}
cfgRandWeap.staffThrustMin = {1,6}
cfgRandWeap.staffThrustMax = {3,15}
cfgRandWeap.staffEnch = {50,600}

--long blade 1 handed
cfgRandWeap.lb1hChopMin = {1,20}
cfgRandWeap.lb1hChopMax = {15,45}
cfgRandWeap.lb1hSlashMin = {1,20}
cfgRandWeap.lb1hSlashMax = {15,45}
cfgRandWeap.lb1hThrustMin = {1,20}
cfgRandWeap.lb1hThrustMax = {15,45}
cfgRandWeap.lb1hEnch = {50,200}

--long blade 2 handed
cfgRandWeap.lb2hChopMin = {1,25}
cfgRandWeap.lb2hChopMax = {20,65}
cfgRandWeap.lb2hSlashMin = {1,25}
cfgRandWeap.lb2hSlashMax = {20,65}
cfgRandWeap.lb2hThrustMin = {1,20}
cfgRandWeap.lb2hThrustMax = {10,35}
cfgRandWeap.lb2hEnch = {50,200}

--Bows
cfgRandWeap.bowChopMin = {1,20}
cfgRandWeap.bowChopMax = {10,55}
cfgRandWeap.bowEnch = {20,300}

--XBows (only roll max, min = max)
cfgRandWeap.xbowChopMax = {15,40}
cfgRandWeap.xbowEnch = {50,150}

--daggers
cfgRandWeap.daggerChopMin = {1,10}
cfgRandWeap.daggerChopMax = {10,25}
cfgRandWeap.daggerSlashMin = {1,10}
cfgRandWeap.daggerSlashMax = {10,25}
cfgRandWeap.daggerThrustMin = {1,10}
cfgRandWeap.daggerThrustMax = {10,25}
cfgRandWeap.daggerEnch = {10,100}

--shortswords
cfgRandWeap.sbChopMin = {5,15}
cfgRandWeap.sbChopMax = {10,35}
cfgRandWeap.sbSlashMin = {5,15}
cfgRandWeap.sbSlashMax = {10,35}
cfgRandWeap.sbThrustMin = {1,15}
cfgRandWeap.sbThrustMax = {10,35}
cfgRandWeap.sbEnch = {30,175}

--spears
cfgRandWeap.spearChopMin = {1,5}
cfgRandWeap.spearChopMax = {5,10}
cfgRandWeap.spearSlashMin = {1,5}
cfgRandWeap.spearSlashMax = {5,10}
cfgRandWeap.spearThrustMin = {1,15}
cfgRandWeap.spearThrustMax = {15,55}
cfgRandWeap.spearEnch = {50,175}

return cfgRandWeap