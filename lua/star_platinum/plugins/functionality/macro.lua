return {
	"chrisgrieser/nvim-recorder",
	dependencies = "rcarriga/nvim-notify", -- optional
	opts = {
		slots = { "y", "z" },
	}, -- required even with default settings, since it calls `setup()`
}
