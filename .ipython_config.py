c = get_config()

c.TerminalIPythonApp.display_banner = False

c.TerminalInteractiveShell.cache_size = 0
c.TerminalInteractiveShell.colors = 'Linux'
#c.TerminalInteractiveShell.pager = 'most'
#c.TerminalInteractiveShell.confirm_exit = False

c.IPCompleter.greedy = True

c.InteractiveShellApp.extensions = [
    'autoreload'
]

c.InteractiveShellApp.exec_lines = [
    '%autoreload 1',
    'import pathlib',
]
