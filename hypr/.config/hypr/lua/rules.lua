hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

hl.window_rule({
	match = { class = "firefox" },
	opacity = "1.5 0.8",
})

hl.window_rule({
	name = "waydroid-ui",
	match = { class = "^(Waydroid)$" },
	float = true,
	size = { 1280, 720 },
	center = true,
})

local blurred_layers = { "waybar", "wofi", "rofi", "quickshell:overview" }

for _, namespace in ipairs(blurred_layers) do
	hl.layer_rule({
		match = { namespace = namespace },
		blur = true,
		ignore_alpha = 0.5,
	})
end
