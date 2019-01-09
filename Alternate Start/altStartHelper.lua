local altStartHelper = {}

altStartHelper.altStartFunction = function(pid, altCell,altPosX, altPosY, altPosZ,altRotX, altRotY)
	if altCell ~= nil then

        tes3mp.SetCell(pid, altCell)
        tes3mp.SendCell(pid)
		
		if altPosX ~= nil and altPosY ~= nil and altPosZ ~= nil and altRotX ~= nil and altRotY ~= nil then
			tes3mp.SetPos(pid, altPosX, altPosY, altPosZ)
			tes3mp.SetRot(pid, altRotX, altRotY)
			tes3mp.SendPos(pid)
		end
    end

end

return altStartHelper