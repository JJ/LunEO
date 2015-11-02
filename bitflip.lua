#!/usr/bin/lua

--[[
@title Evolutionary operator benmarks
]]--

-- Mutate and compute time
function time_mutations (number,indi)
   inicioTiempo = os.clock()
   for i=1,number do
      mutate1( indi )
   end
   return os.clock() - inicioTiempo 
end

require 'LunEO'

length = 16
iterations = 1000000
top_length = 32768
repeat 
    indi = random_chromosome(length)
    print("lua, BitString, " .. length ..", ".. time_mutations( iterations, indi ))
    length = length*2
until length > top_length



