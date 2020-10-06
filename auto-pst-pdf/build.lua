#!/usr/bin/env texlua

--[=================================[
     L3BUILD FILE FOR AUTO-PST-PDF
--]=================================]

module = "auto-pst-pdf"
version = "0.7"
copyrightyear = "2007"

demofiles = {"example.tex","example.eps","example-psfrag.tex"}

uploadconfig = {
  version     = version,
  author      = "Will Robertson",
  license     = "lppl1.3c",
  summary     = "Wrapper for pst-pdf",
  ctanPath    = "/macros/latex/contrib/auto-pst-pdf",
  repository  = "https://github.com/wspr/will2e/",
  bugtracker  = "https://github.com/wspr/will2e/issues",
}

announce = {}
announce["0.7"] = [[
  * Security fix for Windows
]]
uploadconfig.announcement = announce[version]

tagfiles = { "*.dtx" , "*.ins" , "README.txt" }

require("../build-will2e.lua")
