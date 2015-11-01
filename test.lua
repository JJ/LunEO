
luneo = require('LunEO')
local lu = require('luaunit')

TestThis = {} --class
function TestThis:TestOne()
   chromosome_length =  16;
   population_size =  32;
   
   population = {};
   math.randomseed( os.time() ) -- true randomness
   
   for i=1,population_size do 
      print( i )
      population[i] = random_chromosome( chromosome_length )
      lu.assertNotNil(  population[i]:len() )
      lu.assertEquals( population[i]:len(), chromosome_length)
      mutated = mutate1(population[i])
      lu.assertNotEquals( population[i], mutated )
   end
end

os.exit( lu.LuaUnit.run() )



