#!/usr/bin/lua

--[[
@title Evolutionary operator benmarks
]]--

-- Mutate and compute time
function time_mutations (number,indi)
   inicioTiempo = os.clock()
   for i=1,number do
      indi = random_chromosome(length)
      fitness = compute_fitness( indi )
   end
   return os.clock() - inicioTiempo 
end

require 'LunEO'

length = 16
iterations = 100000
top_length = 65536
repeat 
    print("lua-BitString, " .. length ..", ".. time_mutations( iterations ))
    length = length*2
until length > top_length



