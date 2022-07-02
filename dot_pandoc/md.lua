pandoc = require 'pandoc'
pandoc.mediabag = require 'pandoc.mediabag'

for name, fn in pairs(require 'text') do
    string['uc_' .. name] = fn
end

local ignored = false

function Str (s)
    if s.text == "{{" then
        ignored = true
        return ""
    elseif s.text == "}}" then
        ignored = false
        return ""
    end
    return s
end

function Math (m)
    if ignored then
        return ""
    end
    if m.mathtype == "DisplayMath" then
        local env = m.text:sub(2, 15)
        if env == "\\begin{align*}" then
            m.text = m.text:gsub("align%*", "aligned")
        end
    end
    return m
end

function CodeBlock (code)
    if #code.classes == 1 and code.classes[1] == "latex" then
        print("Find CodeBlock with classes = [latex], starting with: '" .. code.text:sub(0, 15) .. "'")
        return pandoc.RawBlock('latex', code.text)
    elseif #code.classes == 1 then
        print("Find CodeBlock with class " .. code.classes[1])
        return pandoc.RawBlock('latex', "\\begin{minted}[linenos]{" .. code.classes[1] .. "}\n" .. code.text .. "\n\\end{minted}")
    end
    return m
end

function Header (header)
    local level = header.level
    local content = header.content
    if level == 3 then
        header.level = 4
    end
    return header
end
