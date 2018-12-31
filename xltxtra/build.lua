--[============================[
     L3BUILD FILE FOR XLTXTRA
--]============================]

module = "xltxtra"
version = "0.7"
pkgdate = "2018/12/31"
gittag  = module.."-v"..version

uploadconfig = {
  version     = version,
  author      = "Will Robertson",
  license     = "lppl1.3c",
  summary     = "“Extras” for LaTeX users of XeTeX",
  ctanPath    = "/macros/latex/contrib/xltxtra",
  repository  = "https://github.com/wspr/will2e/",
  bugtracker  = "https://github.com/wspr/will2e/issues",
}

announce = {}
announce["0.7"] = [[
  Remove/change some deprecated internals. No user-level changes.
]]
uploadconfig.announcement = announce[version]


typesetexe = "xelatex"
checkengines = {"xetex"}
recordstatus = true

tagfiles = { "*.dtx" , "*.ins" , "README.md" }

require("../build-will2e.lua")
