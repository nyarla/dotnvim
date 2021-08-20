command! -nargs=* DateTime exec ":normal i" . datetime#datetime()
command! -nargs=* Date exec ":normal i" . datetime#date()
