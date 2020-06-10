local toolbar = plugin:CreateToolbar('PrimaryPart Master')
local button = toolbar:CreateButton("Add a PrimaryPart", "Select a model to add a PrimaryPart", "rbxassetid://167300717")

local sel = game:GetService("Selection")
 
--sel.SelectionChanged:Connect(function()
button.Click:Connect(function()
	for _, o in pairs(sel:Get()) do
		if o:IsA("Model") then
			if not o.PrimaryPart then
				local p = Instance.new('Part', o)
				p.Name = 'PrimaryPart'
				p.Anchored = true
				p.CanCollide = false
				p.Size = Vector3.new(1, 1, 1)
				p.Transparency = 1
				p.BottomSurface = Enum.SurfaceType.Smooth
				p.TopSurface = Enum.SurfaceType.Smooth
				p.CFrame = o:GetModelCFrame()
				o.PrimaryPart = p
				if o:FindFirstChildOfClass('VehicleSeat') then
					local ds = o:FindFirstChild('VehicleSeat')
					p.Orientation = ds.Orientation
					print('VehicleSeat orientation used for PrimaryPart.')
				end
			end
		end
	end
end)
