library(sqldf)
library(dplyr)

#Pakistan Cricket Team performance Analysis.

data <- read.csv(file.choose(),header = TRUE)
sum(is.na(data))
                  #Analyzing overall performance (Tests+ODIs+T20Is)#

total_matches <- sqldf("Select count(*) from data")

count_result <- sqldf("Select count(*), match_result from data 
                      group by match_result")

#Calculating win and win-to-lost percentage

win_matches <- sqldf("Select count(*) from data where match_result = 'won' ")

lost_matches <- sqldf("Select count(*) from data where match_result = 'lost' ")

win_percentage = (win_matches/total_matches)*100

lost_percentage = (lost_matches/total_matches)*100

win_to_lost = (win_matches/lost_matches)

#number of won matches with respect to batting first or second

bat_first_win <- sqldf("Select match_result, bat_innings, count(*) from data
                       where match_result = 'won' 
                       group by bat_innings")

#best venues for pakistan

venues <- sqldf("Select venue, count(*) as matches_won from data
                where match_result = 'won'
                group by venue 
                order by count(*) DESC LIMIT 10")


#favourite opponent. 
opponents <- sqldf("Select opposition,count(match_result) as no_of_matches_won
                   from data
                   where match_result = 'won'
                   group by opposition 
                   order by count(match_result) DESC LIMIT 5")

#worst opponent. 
opponents_lost <- sqldf("Select opposition,count(match_result) as no_of_matches_lost
                   from data
                   where match_result = 'lost'
                   group by opposition 
                   order by count(match_result) DESC LIMIT 5")

  
  
                  #Analyzing Pakistan in Test cricket#

testmatches_num <- sqldf("Select count(*) from data where format = 'Test'")

testmatches_result <- sqldf("Select match_result,count(*) from data
                            where format = 'Test'
                            group by match_result")  

testmaches_opponents_count <- sqldf("Select opposition, count(*) as num_of_matches from data
                                    where format = 'Test'
                                    group by opposition
                                    order by num_of_matches DESC")

testmatches_opponents_win <-  sqldf("Select opposition,count(*) as Num_of_wins from data
                                    where format = 'Test' AND match_result = 'won'
                                    group by opposition
                                    order by Num_of_wins DESC")

testmatches_opponents_lost <-  sqldf("Select opposition,count(*) as Num_of_lost from data
                                    where format = 'Test' AND match_result = 'lost'
                                    group by opposition
                                    order by Num_of_lost DESC")

testmatches_venues <- sqldf("Select venue,count(*) as num_of_matches from data
                            where format = 'Test' 
                            group by venue 
                            order by num_of_matches DESC LIMIT 5")

testmatches_venues_win <- sqldf("Select venue,count(*) as num_of_matches from data
                            where format = 'Test' and match_result = 'won' 
                            group by venue 
                            order by num_of_matches DESC LIMIT 5")

                          #Analyzing Pakistan in ODIs#

odimatches_num <- sqldf("Select count(*) from data where format = 'ODI'")

odimatches_result <- sqldf("Select match_result,count(*) from data
                            where format = 'ODI'
                            group by match_result")  

odimaches_opponents_count <- sqldf("Select opposition, count(*) as num_of_matches from data
                                    where format = 'ODI'
                                    group by opposition
                                    order by num_of_matches DESC")

odimatches_opponents_win <-  sqldf("Select opposition,count(*) as Num_of_wins from data
                                    where format = 'ODI' AND match_result = 'won'
                                    group by opposition
                                    order by Num_of_wins DESC")

odimatches_opponents_lost <-  sqldf("Select opposition,count(*) as Num_of_lost from data
                                    where format = 'ODI' AND match_result = 'lost'
                                    group by opposition
                                    order by Num_of_lost DESC")

odimatches_venues <- sqldf("Select venue,count(*) as num_of_matches from data
                            where format = 'ODI' 
                            group by venue 
                            order by num_of_matches DESC LIMIT 5")

odimatches_venues_win <- sqldf("Select venue,count(*) as num_of_matches from data
                            where format = 'ODI' and match_result = 'won' 
                            group by venue 
                            order by num_of_matches DESC LIMIT 5")

odimatches_batfirst_wins <- sqldf("Select count(*), match_result, bat_innings from data
                                  where match_result = 'won' and format = 'ODI'
                                  group by bat_innings")


                              #Analyzing Pakistan in T20Is#

T20matches_num <- sqldf("Select count(*) from data where format = 'T20I'")

T20matches_result <- sqldf("Select match_result,count(*) from data
                            where format = 'T20I'
                            group by match_result")  

T20maches_opponents_count <- sqldf("Select opposition, count(*) as num_of_matches from data
                                    where format = 'T20I'
                                    group by opposition
                                    order by num_of_matches DESC")

T20matches_opponents_win <-  sqldf("Select opposition,count(*) as Num_of_wins from data
                                    where format = 'T20I' AND match_result = 'won'
                                    group by opposition
                                    order by Num_of_wins DESC")

T20matches_opponents_lost <-  sqldf("Select opposition,count(*) as Num_of_lost from data
                                    where format = 'T20I' AND match_result = 'lost'
                                    group by opposition
                                    order by Num_of_lost DESC")

T20matches_venues <- sqldf("Select venue,count(*) as num_of_matches from data
                            where format = 'T20I' 
                            group by venue 
                            order by num_of_matches DESC ")

T20matches_venues_win <- sqldf("Select venue,count(*) as num_of_matches from data
                            where format = 'T20I' and match_result = 'won' 
                            group by venue 
                            order by num_of_matches DESC LIMIT 5")

T20imatches_batfirst_wins <- sqldf("Select count(*), match_result, bat_innings from data
                                  where match_result = 'won' and format = 'T20I'
                                  group by bat_innings")


