-- $Id: BinaryRelationOpsTests.hs,v 1.2 2013/08/22 19:59:54 leavens Exp leavens $
module BinaryRelationOpsTests where
import Testing; import BinaryRelation; import Relations
import BinaryRelationOps  -- you have to put your solutions in this module
version = "BinaryRelationOpsTests $Revision: 1.2 $"
main :: IO() -- do main to run all our tests
main = do startTesting version
          pj1_errs <- run_test_list 0 project1_tests
          pj2_errs <- run_test_list pj1_errs project2_tests
          select_errs <- run_test_list pj2_errs select_tests
          total_errs <- run_test_list select_errs compose_tests
          doneTesting total_errs
-- do test_f to test just the function named f
test_project1, test_project2, test_select, test_compose :: IO()
(test_project1, test_project2, test_select, test_compose) =
   (runts project1_tests, runts project2_tests, runts select_tests, runts compose_tests)
   where runts :: Show a => [TestCase [a]] -> IO() -- prevents type errors
         runts = dotests version
project1_tests :: [TestCase [String]]
project1_tests =
    [(eqTest (project1 []) "==" [])
    ,(eqTest (project1 bar_stuff) "==" ["bar", "bar", "bar", "salad", "bar"])
    ,(eqTest (project1 city_country) 
      "==" ["Beijing","Buenos Aires","Cairo","Delhi","Dhaka","Guangzhou","Istanbul","Jakarta","Karachi"
           ,"Kinshasa","Kolkata","Lagos","Lima","London","Los Angeles","Manila","Mexico City","Moscow"
           ,"Mumbai","New York City","Osaka","Rio de Janeiro","Sao Paulo","Seoul","Shanghai"
           ,"Shenzhen","Tehran","Tianjin","Tokyo"])]
project2_tests :: [TestCase [String]]
project2_tests =
    [(eqTest (project2 []) "==" [])
    ,(eqTest (project2 bar_stuff) "==" ["mitzva", "stool", "tender", "bar", "keeper"])
    ,(eqTest (project2 city_country) 
      "==" ["China","Argentina","Egypt","India","Bangladesh","China","Turkey","Indonesia","Pakistan"
           ,"Democratic Republic of the Congo","India","Nigeria","Peru","United Kingdom","United States"
           ,"Philippines","Mexico","Russia","India","United States","Japan","Brazil","Brazil"
           ,"South Korea","China","China","Iran","China","Japan"])]
select_tests :: [TestCase (BinaryRelation String String)]
select_tests = 
    [(eqTest (select (\(x,y) -> length x > length y) []) "==" [])
    ,(eqTest (select (\(x,y) -> length x <= length y) us_cities) 
      "==" [("Chicago","Illinois"),("Miami","Florida"),("Ames","Iowa"),("Orlando","Florida")])
    ,(eqTest (select (\(_,y) -> y == "Iowa") us_cities) "==" [("Ames","Iowa"),("Des Moines","Iowa")])
    ,(eqTest (select (\(x,y) -> x == "Tokyo" && y == "Japan") city_country) "==" [("Tokyo","Japan")])
    ,(eqTest (select (\(c:city,y:country) -> c == y) city_country)
      "==" [("Mexico City","Mexico"),("Seoul","South Korea")])]
compose_tests :: [TestCase (BinaryRelation String Int)]
compose_tests = 
    [(eqTest (compose [] country_population) "==" [])
    ,(eqTest (compose bar_stuff [("stool",3),("tender",16)]) "==" [("bar",3),("bar",16)])
    ,(eqTest (compose city_country country_population)
      "==" [("Beijing",1359470000),("Delhi",1232830000),("Dhaka",152518015)
           ,("Guangzhou",1359470000),("Jakarta",237641326),("Karachi",184013000)
           ,("Kolkata",1232830000),("Lagos",173615000),("Los Angeles",316497000)
           ,("Manila",98234000),("Mexico City",117409830),("Moscow",143400000)
           ,("Mumbai",1232830000),("New York City",316497000),("Osaka",127350000)
           ,("Rio de Janeiro",193946886),("Sao Paulo",193946886),("Shanghai",1359470000)
           ,("Shenzhen",1359470000),("Tianjin",1359470000),("Tokyo",127350000)])]
