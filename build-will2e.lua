--[====================================[
     L3BUILD CUSTOMISATION FOR WILL2e
--]====================================]

gittag  = module.."-v"..version

today = os.date("%Y/%m/%d")
theyear = os.date("%Y")
pkgdate = pkgdate or today

if pkgdate ~= today then
  print("Package date is not today:"..
        "\nPkg date: "..pkgdate..
        "\nToday:    "..today)
end

local function prequire(m) -- from: https://stackoverflow.com/a/17878208
  local ok, err = pcall(require, m)
  if not ok then return nil, err end
  return err
end

prequire("l3build-wspr.lua")


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

  local content = content

  -- copyright
  local newpattern  = "(C) "..copyrightyear.."-"..theyear
  local findpattern = "%(C%)%s"..copyrightyear.."%-%d%d%d%d"
  local foundpattern = content:match(findpattern)
  if foundpattern and not(newpattern==foundpattern) then
    print("File copyright: " .. foundpattern)
    print("New copyright:  " .. newpattern)
    content = content:gsub(findpattern,newpattern)
  end

  -- versioning
  local newtag = pkgdate .. " v" .. version
  local findpattern = "%d%d%d%d/%d%d/%d%d%sv%d%.%d%a*"
  local foundtag = content:match(findpattern)
  if foundtag and not(newtag==foundtag) then
    print("Old package date/version: " .. foundtag)
    print("Replaced with:            " .. newtag)
    content = content:gsub(findpattern,newtag)
  end

  return content
end
