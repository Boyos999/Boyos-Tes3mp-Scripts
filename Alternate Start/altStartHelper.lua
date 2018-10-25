local altStartHelper = {}

altStartHelper.altStartFunction = function(pid, altCell,altPos,altRot)

	if altCell ~= nil then

        tes3mp.SetCell(pid, altCell)
        tes3mp.SendCell(pid)

        if altPos ~= nil and altRot ~= nil then
            tes3mp.SetPos(pid, altPos[1], altPos[2], altPos[3])
            tes3mp.SetRot(pid, altRot[1], altRot[2])
            tes3mp.SendPos(pid)
        end
    end

end

return altStartHelper