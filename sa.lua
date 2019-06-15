function useCoins(id)  
    local cont = Container.GetFirst()  
 
    while (cont:isOpen()) do 
        for spot = 0, cont:ItemCount() do 
            local item = cont:GetItemData(spot)  
            if (item.id == id) then 
                if (item.count == 100) then
                    cont:UseItem(spot, True)
                    sleep(10)
                    return true
                end
            end 
        end 
 
        cont = cont:GetNext()  
    end 
      
    return false 
end 
 
Module.New('changedehshiet', function(mod)
    useCoins(3031)
    wait(50)
    useCoins(3035)
end)