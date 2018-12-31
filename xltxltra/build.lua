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

tagfiles = { "*.dtx" , "*.ins" }


--[=================[--
     CUSTOMISATION
--]=================]--

today = os.date("%Y/%m/%d")
theyear = os.date("%Y")

if pkgdate ~= today then
  print("Package date is not today:"..
        "\nPkg date: "..pkgdate..
        "\nToday:    "..today)
end

require("l3build-wspr.lua")

--[===========[--
     TAGGING
--]===========]--

status_bool = false

function check_status()
  if status_bool then
    return true
  end

  local handle = io.popen('git status --porcelain --untracked-files=no')
  local gitstatus = string.gsub(handle:read("*a"),'%s*$','')
  handle:close()
  if gitstatus=="" then
    print("Checking git status: clean")
    status_bool = true
    return status_bool
  else
    print("ABORTING, git status is not clean:")
    print(gitstatus)
    status_bool = false
    return status_bool
  end
end

function tag_hook(tagname)
  if check_status() then
    print("Update git with commit & tag? [y/n]")
    tag_check = io.read()
    if tag_check == "y" then
      os.execute('git commit -a -m "Step release tag"')
      os.execute('git tag -a -m "" ' .. gittag)
    end
  end
end


function update_tag(file,content,tagname,tagdate)
  if content==nil then
    print("content should not be nil!")
  end

  if not(check_status()) then
    return content
  end

  local findpattern = "2006-%d%d%d%d"
  local newpattern  = "2006-"..theyear
  content:gsub(findpattern,newpattern)

  if string.match(file, "%.dtx$") then
    local findpattern = "%d%d%d%d/%d%d/%d%d%sv%d.%d%s"
    local foundtag = content:match(findpattern)
    print("Old package date/version: " .. foundtag)
    local newtag = pkgdate .. " v" .. version .. " "
    print("Replaced with:            " .. newtag)
    local newcontent = content:gsub(findpattern,newtag)
    return newcontent
  end
  return content
end
