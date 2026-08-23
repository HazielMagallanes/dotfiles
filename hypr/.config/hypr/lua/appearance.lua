hl.config({
	general = {
		gaps_in = 0,
		gaps_out = 0,
		border_size = 2,

		col = {
			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},

		resize_on_border = false,
		allow_tearing = false,
		layout = "dwindle",
	},

	decoration = {
		rounding = 0,
		rounding_power = 2,

		active_opacity = 0.8,
		inactive_opacity = 0.8,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},

		blur = {
			enabled = true,
			ignore_opacity = true,
			size = 8,
			passes = 2,
			new_optimizations = true,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true,
	},
})

local curves = {
	{ name = "easeOutQuint", points = { { 0.23, 1 }, { 0.32, 1 } } },
	{ name = "easeInOutCubic", points = { { 0.65, 0.05 }, { 0.36, 1 } } },
	{ name = "linear", points = { { 0, 0 }, { 1, 1 } } },
	{ name = "almostLinear", points = { { 0.5, 0.5 }, { 0.75, 1 } } },
	{ name = "quick", points = { { 0.15, 0 }, { 0.1, 1 } } },
}

for _, curve in ipairs(curves) do
	hl.curve(curve.name, { type = "bezier", points = curve.points })
end

local animations = {
	{ leaf = "global", speed = 10, bezier = "default" },
	{ leaf = "border", speed = 5.39, bezier = "easeOutQuint" },
	{ leaf = "windows", speed = 4.79, bezier = "easeOutQuint" },
	{ leaf = "windowsIn", speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" },
	{ leaf = "windowsOut", speed = 1.49, bezier = "linear", style = "popin 87%" },
	{ leaf = "fadeIn", speed = 1.73, bezier = "almostLinear" },
	{ leaf = "fadeOut", speed = 1.46, bezier = "almostLinear" },
	{ leaf = "fade", speed = 3.03, bezier = "quick" },
	{ leaf = "layers", speed = 3.81, bezier = "easeOutQuint" },
	{ leaf = "layersIn", speed = 4, bezier = "easeOutQuint", style = "fade" },
	{ leaf = "layersOut", speed = 1.5, bezier = "linear", style = "fade" },
	{ leaf = "fadeLayersIn", speed = 1.79, bezier = "almostLinear" },
	{ leaf = "fadeLayersOut", speed = 1.39, bezier = "almostLinear" },
	{ leaf = "workspaces", speed = 1.94, bezier = "almostLinear", style = "fade" },
	{ leaf = "workspacesIn", speed = 1.21, bezier = "almostLinear", style = "fade" },
	{ leaf = "workspacesOut", speed = 1.94, bezier = "almostLinear", style = "fade" },
	{ leaf = "zoomFactor", speed = 7, bezier = "quick" },
}

for _, anim in ipairs(animations) do
	anim.enabled = true
	hl.animation(anim)
end
