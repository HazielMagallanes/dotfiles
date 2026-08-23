hl.config({
	input = {
		kb_layout = "latam",

		follow_mouse = 1,
		sensitivity = 0.5,
		force_no_accel = true,
		accel_profile = "flat",

		touchpad = {
			natural_scroll = false,
		},
	},
})

hl.config({
	dwindle = {
		preserve_split = true,
	},

	master = {
		new_status = "master",
	},

	misc = {
		force_default_wallpaper = -1,
		disable_hyprland_logo = false,
	},

	cursor = {
		no_hardware_cursors = true,
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})
