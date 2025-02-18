local manager = {}

local container = Instance.new("Folder"); container.Parent = game:GetService("CoreGui").HiddenUI; container.Name = "threads"

local hash_function = function(length : Number)
    if length ~= nil and length <= 32  then
        local result = {}
        for i=1, length do
            local rand = math.random(1, 32)
            local dict = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "K", "L", "M", "N", "O", "P", "Q", "S", "T", "V", "X", "Y", "Z", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"}

            table.insert(result, dict[rand])
        end

        return table.concat(result, "")
    end
end

local create_identifier = function(): Instance
    local identifier = Instance.new("BoolValue"); identifier.Name = "thread_" .. hash_function(20); identifier.Parent = container
    return identifier
end

manager.run = function(thread)
    if typeof(thread) == "thread" then
        local script_identifier = create_identifier()

        print("your identifier is " .. script_identifier.Name)

        return script_identifier
    end
end

return manager
