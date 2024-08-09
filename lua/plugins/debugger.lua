return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"rcarriga/nvim-dap-ui",
	},

	config = function()
		local dap, dapui = require("dap"), require("dapui")

		dapui.setup()
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		-- C/C++/Rust Debugger
		dap.adapters.lldb = {
			type = "executable",
			command = "/opt/homebrew/opt/llvm/bin/lldb-dap",
			name = "lldb",
		}
		dap.configurations.cpp = {
			{
				name = "Launch",
				type = "lldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},
			},
		}
		dap.configurations.c = dap.configurations.cpp
		dap.configurations.rust = dap.configurations.cpp

		-- keybindings
		vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {}) -- toggle breakpoint <db -> debug + breakpoint>
		vim.keymap.set("n", "<leader>ds", dap.continue, {}) -- start or resume debugging session <ds -> debug + start>
		vim.keymap.set("n", "<leader>do", dap.step_over, {}) -- step over <do -> debug + over>
		vim.keymap.set("n", "<leader>di", dap.step_into, {}) -- step into <di -> debug + into>
	end,
}
