-- Double the Integer input
doubleMe x = x*2

-- Double tuple input and sum values
doubleUs (x, y) = x*2 + y*2

-- Double numbers smaller than 100
doubleSmallNumber x = if x < 100
                        then x * 2
                        else x