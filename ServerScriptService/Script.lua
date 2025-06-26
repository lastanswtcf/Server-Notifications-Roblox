local rs = game:GetService("ReplicatedStorage")
local remev = rs:WaitForChild("nf")
local msgs = {
	"message1",
	"rmessage2"
}

while true do
	local msg = msgs[math.random(1, #msgs)]
	remev:FireAllClients(msg)
	wait(1)
end

StarterGui > LocalScript

local rs = game:GetService("ReplicatedStorage")
local ts = game:GetService("TweenService")
local ps = game:GetService("Players")
local plr = ps.LocalPlayer
local remev = rs:WaitForChild("nf")
local gui = Instance.new("ScreenGui")

gui.Name = "notifui"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = plr:WaitForChild("PlayerGui")

local function make_notif(msg)
	local thumb = ps:GetUserThumbnailAsync(plr.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
	local box = Instance.new("Frame")
	box.Size = UDim2.new(0, 240, 0, 56)
	box.Position = UDim2.new(1, 300, 1, -20)
	box.AnchorPoint = Vector2.new(1, 1)
	box.BackgroundColor3 = Color3.fromRGB(44, 30, 30)
	box.BorderColor3 = Color3.fromRGB(82, 23, 23)
	box.BorderSizePixel = 1
	box.Parent = gui
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 10)
	corner.Parent = box
	local pfp = Instance.new("ImageLabel")
	pfp.Size = UDim2.new(0, 40, 0, 40)
	pfp.Position = UDim2.new(0, 8, 0.5, -20)
	pfp.Image = thumb
	pfp.BackgroundTransparency = 1
	pfp.Parent = box
	local txt = Instance.new("TextLabel")
	txt.Size = UDim2.new(1, -56, 1, 0)
	txt.Position = UDim2.new(0, 52, 0, 0)
	txt.BackgroundTransparency = 1
	txt.TextColor3 = Color3.fromRGB(255, 107, 107)
	txt.Text = msg
	txt.TextXAlignment = Enum.TextXAlignment.Left
	txt.Font = Enum.Font.FredokaOne
	txt.TextScaled = true
	txt.ClipsDescendants = true
	txt.Parent = box

	local tween_in = ts:Create(box, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
		Position = UDim2.new(1, -16, 1, -16)
	})
	tween_in:Play()
	wait(5)

	local tween_out = ts:Create(box, TweenInfo.new(0.35), {
		Position = UDim2.new(1, 300, 1, -20)
	})
	tween_out:Play()
	tween_out.Completed:Wait()
	box:Destroy()
end
remev.OnClientEvent:Connect(make_notif)
