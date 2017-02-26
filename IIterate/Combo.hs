f (x, y) = (x+y, x)
gen_fib b0, b1 = [y | (x, y) <- (iterate f (b1, b0))]


-- zip is handy
-- zip [1 .. 10] [10 .. 1] = [(1, 10), (2, 9) ... (10, 1)]
c list =    let rlist = reverse list
            in (sum [x*y | (x, y) <- (zip list rlist)]) : list

-- zippWith applies an operation to the zip
c list =    let rlist = reverse list
            in (sum (zipWith (*) list rlist)) : list

-- gen_cat baseCases = iterate 