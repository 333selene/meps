clear all
cd "C:\Users\Selene\Desktop\thesis\data\meps\consol"



*drop those aged below 60 and above 84 at the end of the year
*drop those aged 65 at the end of the year
*only those in the elderly population that reported coverage under part d were included
*those 66+ older who report medicaid coverage are dropped
*in 60-64 range, drop those with no insurance and those who report medicare coverage 
*medicare beneficiaries that are not subject to the coverage gap: dual eligibles, income less that 150% of the poverty level.
*final n = 13,225


/*
Variables:
OOP RX expenditure
Total RX expenditure
No. of RX filled
Age
Male
Married
Black
Hispanic 
High school grad
BA
Advanced degree
NE
Midwest
South
West
Faminc
*/



/*
Eligibility

The eligibility of a person for MEPS pertains to whether or not data were to be collected for that person. All of the Key in-scope persons of a sampled RU were eligible for data collection. The only non-Key persons eligible for data collection were those who happened to be living in an RU with at least one Key, in-scope person. Their eligibility continued only for the time that they were living with at least one such person. The only out-of-scope persons eligible for data collection were those who were living with Key in-scope persons, again only for the time they were living with such a person. Only military persons can meet this description (for example, a person on full-time active duty military, living with a spouse who is Key).

A person may be classified as eligible for an entire round or for some part of a round. For persons who are eligible for only part of a round (for example, persons may have been institutionalized during a round), data were collected for the period of time for which that person was classified as eligible. The round-specific variables ELGRND31, ELGRND42, ELGRND53 and the end-of-year status variable ELGRND14 indicate a person's eligibility status for Rounds 3/1, 4/2, and 5/3 and as of December 31, 2014.

*/

**# 2019

use "2019\h216.dta", clear

gen year = 2019
drop if ELGRND19 == 3
drop if AGE19X < 60
drop if AGE19X > 84
drop if AGE19X == 65
drop if MCRPD19X != 1 & AGE19X > 65
drop if MCAID19X == 1 & AGE19X > 65
drop if INSCOV19 ==3 & AGE19X < 65
drop if MCARE19X == 1 & AGE19X < 65
drop if MCARE19X == 1 & MCAID19X == 1
drop if POVLEV19 < 150
drop if EDUCYR < 0
gen highschool =0
replace highschool = 1 if inlist(EDUCYR, 12, 13, 14, 15)
gen bachelors =0
replace bachelors = 1 if inlist(EDUCYR, 16)
gen grad =0
replace grad = 1 if inlist(EDUCYR, 17)


keep RXSLF19 RXEXP19 RXTOT19 AGE19X SEX MARRY19X RACEBX HISPANX highschool bachelors grad REGION19 FAMINC19 year

ren  RXSLF19 self_spend
ren  RXEXP19 tot_spend
ren  RXTOT19 rx_num
ren  SEX sex
ren    AGE19X age
ren  MARRY19X marry_status
ren REGION19 region
ren FAMINC19 faminc
ren RACEBX black
ren HISPANX hispanic

save "all\2019_consol.dta", replace

**# 2018

use "2018\h209.dta", clear

gen year = 2018
drop if ELGRND18 == 3
drop if AGE18X < 60
drop if AGE18X > 84
drop if AGE18X == 65
drop if MCRPD18X != 1 & AGE18X > 65
drop if MCAID18X == 1 & AGE18X > 65
drop if INSCOV18 ==3 & AGE18X < 65
drop if MCARE18X == 1 & AGE18X < 65
drop if MCARE18X == 1 & MCAID18X == 1
drop if POVLEV18 < 150
drop if EDUCYR < 0
gen highschool =0
replace highschool = 1 if inlist(EDUCYR, 12, 13, 14, 15)
gen bachelors =0
replace bachelors = 1 if inlist(EDUCYR, 16)
gen grad =0
replace grad = 1 if inlist(EDUCYR, 17)

keep RXSLF18 RXEXP18 RXTOT18 AGE18X SEX MARRY18X RACEBX HISPANX highschool bachelors grad REGION18 FAMINC18 year

ren  RXSLF18 self_spend
ren  RXEXP18 tot_spend
ren  RXTOT18 rx_num
ren  SEX sex
ren    AGE18X age
ren  MARRY18X marry_status
ren REGION18 region
ren FAMINC18 faminc
ren RACEBX black
ren HISPANX hispanic

save "all\2018_consol.dta", replace

**# 2017

use "2017\h201.dta", clear

gen year = 2017
drop if ELGRND17 == 3
drop if AGE17X < 60
drop if AGE17X > 84
drop if AGE17X == 65
drop if MCRPD17X != 1 & AGE17X > 65
drop if MCAID17X == 1 & AGE17X > 65
drop if INSCOV17 ==3 & AGE17X < 65
drop if MCARE17X == 1 & AGE17X < 65
drop if MCARE17X == 1 & MCAID17X == 1
drop if POVLEV17 < 150
drop if EDUCYR < 0
gen highschool =0
replace highschool = 1 if inlist(EDUCYR, 12, 13, 14, 15)
gen bachelors =0
replace bachelors = 1 if inlist(EDUCYR, 16)
gen grad =0
replace grad = 1 if inlist(EDUCYR, 17)


keep RXSLF17 RXEXP17 RXTOT17 AGE17X SEX MARRY17X RACEBX HISPANX highschool bachelors grad REGION17 FAMINC17 year

ren  RXSLF17 self_spend
ren  RXEXP17 tot_spend
ren  RXTOT17 rx_num
ren  SEX sex
ren    AGE17X age
ren  MARRY17X marry_status
ren REGION17 region
ren FAMINC17 faminc
ren RACEBX black
ren HISPANX hispanic

save "all\2017_consol.dta", replace

**# 2016

use "2016\H192.dta", clear

gen year = 2016
drop if ELGRND16 == 3
drop if AGE16X < 60
drop if AGE16X > 84
drop if AGE16X == 65
drop if MCRPD16X != 1 & AGE16X > 65
drop if MCAID16X == 1 & AGE16X > 65
drop if INSCOV16 ==3 & AGE16X < 65
drop if MCARE16X == 1 & AGE16X < 65
drop if MCARE16X == 1 & MCAID16X == 1
drop if POVLEV16 < 150
drop if EDUCYR < 0
gen highschool =0
replace highschool = 1 if inlist(EDUCYR, 12, 13, 14, 15)
gen bachelors =0
replace bachelors = 1 if inlist(EDUCYR, 16)
gen grad =0
replace grad = 1 if inlist(EDUCYR, 17)


keep RXSLF16 RXEXP16 RXTOT16 AGE16X SEX MARRY16X RACEBX HISPANX highschool bachelors grad REGION16 FAMINC16 year

ren  RXSLF16 self_spend
ren  RXEXP16 tot_spend
ren  RXTOT16 rx_num
ren  SEX sex
ren    AGE16X age
ren  MARRY16X marry_status
ren REGION16 region
ren FAMINC16 faminc
ren RACEBX black
ren HISPANX hispanic

save "all\2016_consol.dta", replace


**# 2015

use "2015\H181.dta", clear

gen year = 2015
drop if ELGRND15 == 3
drop if AGE15X < 60
drop if AGE15X > 84
drop if AGE15X == 65
drop if MCRPD15X != 1 & AGE15X > 65
drop if MCAID15X == 1 & AGE15X > 65
drop if INSCOV15 ==3 & AGE15X < 65
drop if MCARE15X == 1 & AGE15X < 65
drop if MCARE15X == 1 & MCAID15X == 1
drop if POVLEV15 < 150
drop if EDUYRDG < 0
gen highschool =0
replace highschool = 1 if inlist(EDUYRDG, 3, 4, 5, 6, 7)
gen bachelors =0
replace bachelors = 1 if inlist(EDUYRDG, 8)
gen grad =0
replace grad = 1 if inlist(EDUYRDG, 9)


keep RXSLF15 RXEXP15 RXTOT15 AGE15X SEX MARRY15X RACEBX HISPANX highschool bachelors grad REGION15 FAMINC15 year

ren  RXSLF15 self_spend
ren  RXEXP15 tot_spend
ren  RXTOT15 rx_num
ren  SEX sex
ren    AGE15X age
ren  MARRY15X marry_status
ren REGION15 region
ren FAMINC15 faminc
ren RACEBX black
ren HISPANX hispanic

save "all\2015_consol.dta", replace

**# 2014

use "2014\H171.dta", clear

gen year = 2014
drop if ELGRND14 == 3
drop if AGE14X < 60
drop if AGE14X > 84
drop if AGE14X == 65
drop if MCRPD14X != 1 & AGE14X > 65
drop if MCAID14X == 1 & AGE14X > 65
drop if INSCOV14 ==3 & AGE14X < 65
drop if MCARE14X == 1 & AGE14X < 65
drop if MCARE14X == 1 & MCAID14X == 1
drop if POVLEV14 < 150
drop if EDUYRDG < 0
gen highschool =0
replace highschool = 1 if inlist(EDUYRDG, 3, 4, 5, 6, 7)
gen bachelors =0
replace bachelors = 1 if inlist(EDUYRDG, 8)
gen grad =0
replace grad = 1 if inlist(EDUYRDG, 9)


keep RXSLF14 RXEXP14 RXTOT14 AGE14X SEX MARRY14X RACEBX HISPANX highschool bachelors grad REGION14 FAMINC14 year

ren  RXSLF14 self_spend
ren  RXEXP14 tot_spend
ren  RXTOT14 rx_num
ren  SEX sex
ren    AGE14X age
ren  MARRY14X marry_status
ren REGION14 region
ren FAMINC14 faminc
ren RACEBX black
ren HISPANX hispanic

save "all\2014_consol.dta", replace

**# 2013

use "2013\H163.dta", clear

gen year =  2013
drop if ELGRND13 == 3
drop if    AGE13X < 60
drop if    AGE13X > 84
drop if    AGE13X == 65
drop if  MCRPD13X != 1 &   AGE13X > 65
drop if  MCAID13X == 1 &   AGE13X > 65
drop if INSCOV13 ==3 &     AGE13X < 65
drop if  MCARE13X == 1 &   AGE13X < 65
drop if  MCARE13X == 1 & MCAID13X == 1
drop if POVLEV13 < 150
drop if EDUYRDG < 0
gen highschool =0
replace highschool = 1 if inlist(EDUYRDG, 3, 4, 5, 6, 7)
gen bachelors =0
replace bachelors = 1 if inlist(EDUYRDG, 8)
gen grad =0
replace grad = 1 if inlist(EDUYRDG, 9)


keep RXSLF13 RXEXP13 RXTOT13 AGE13X SEX MARRY13X RACEBX HISPANX highschool bachelors grad REGION13 FAMINC13 year

ren  RXSLF13 self_spend
ren  RXEXP13 tot_spend
ren  RXTOT13 rx_num
ren  SEX sex
ren    AGE13X age
ren  MARRY13X marry_status
ren REGION13 region
ren FAMINC13 faminc
ren RACEBX black
ren HISPANX hispanic

save "all\2013_consol.dta", replace

**# 2012

use "2012\H155.dta", clear

gen year =  2012
drop if ELGRND12 == 3
drop if    AGE12X < 60
drop if    AGE12X > 84
drop if    AGE12X == 65
drop if  MCRPD12X != 1 &   AGE12X > 65
drop if  MCAID12X == 1 &   AGE12X > 65
drop if INSCOV12 ==3 &     AGE12X < 65
drop if  MCARE12X == 1 &   AGE12X < 65
drop if  MCARE12X == 1 & MCAID12X == 1
drop if POVLEV12 < 150
drop if EDRECODE < 0
gen highschool =0
replace highschool = 1 if inlist(EDRECODE, 12, 13, 14)
gen bachelors =0
replace bachelors = 1 if inlist(EDRECODE, 15)
gen grad =0
replace grad = 1 if inlist(EDRECODE, 16)

keep RXSLF12 RXEXP12 RXTOT12 AGE12X SEX MARRY12X RACEBX HISPANX highschool bachelors grad REGION12 FAMINC12 year

ren  RXSLF12 self_spend
ren  RXEXP12 tot_spend
ren  RXTOT12 rx_num
ren  SEX sex
ren    AGE12X age
ren  MARRY12X marry_status
ren REGION12 region
ren FAMINC12 faminc
ren RACEBX black
ren HISPANX hispanic

save "all\2012_consol.dta", replace

**# 2011

use "2011\H147.dta", clear

gen year =  2011
drop if ELGRND11 == 3
drop if    AGE11X < 60
drop if    AGE11X > 84
drop if    AGE11X == 65
drop if  MCRPD11X != 1 &   AGE11X > 65
drop if  MCAID11X == 1 &   AGE11X > 65
drop if INSCOV11 ==3 &     AGE11X < 65
drop if  MCARE11X == 1 &   AGE11X < 65
drop if  MCARE11X == 1 & MCAID11X == 1
drop if POVLEV11 < 150
drop if EDRECODE < 0
gen highschool =0
replace highschool = 1 if inlist(EDRECODE, 12, 13, 14)
gen bachelors =0
replace bachelors = 1 if inlist(EDRECODE, 15)
gen grad =0
replace grad = 1 if inlist(EDRECODE, 16)

keep RXSLF11 RXEXP11 RXTOT11 AGE11X SEX MARRY11X RACEBX HISPANX highschool bachelors grad REGION11 FAMINC11 year

ren  RXSLF11 self_spend
ren  RXEXP11 tot_spend
ren  RXTOT11 rx_num
ren  SEX sex
ren    AGE11X age
ren  MARRY11X marry_status
ren REGION11 region
ren FAMINC11 faminc
ren RACEBX black
ren HISPANX hispanic

save "all\2011_consol.dta", replace

**# 2010

use "2010\H138.dta", clear

gen year =  2010
drop if ELGRND10 == 3
drop if    AGE10X < 60
drop if    AGE10X > 84
drop if    AGE10X == 65
drop if  MCRPD10X != 1 &   AGE10X > 65
drop if  MCAID10X == 1 &   AGE10X > 65
drop if INSCOV10 ==3 &     AGE10X < 65
drop if  MCARE10X == 1 &   AGE10X < 65
drop if  MCARE10X == 1 & MCAID10X == 1
drop if POVLEV10 < 150
drop if EDUCYR < 0
gen highschool =0
replace highschool = 1 if inlist(EDUCYR, 12, 13, 14, 15)
gen bachelors =0
replace bachelors = 1 if inlist(EDUCYR, 16)
gen grad =0
replace grad = 1 if inlist(EDUCYR, 17)

keep RXSLF10 RXEXP10 RXTOT10 AGE10X SEX MARRY10X RACEBX HISPANX highschool bachelors grad REGION10 FAMINC10 year

ren  RXSLF10 self_spend
ren  RXEXP10 tot_spend
ren  RXTOT10 rx_num
ren  SEX sex
ren    AGE10X age
ren  MARRY10X marry_status
ren REGION10 region
ren FAMINC10 faminc
ren RACEBX black
ren HISPANX hispanic

save "all\2010_consol.dta", replace

**# 2009

use "2009\H129.dta", clear

gen year =  2009
drop if ELGRND09 == 3
drop if    AGE09X < 60
drop if    AGE09X > 84
drop if    AGE09X == 65
drop if  MCRPD09X != 1 &   AGE09X > 65
drop if  MCAID09X == 1 &   AGE09X > 65
drop if INSCOV09 ==3 &     AGE09X < 65
drop if  MCARE09X == 1 &   AGE09X < 65
drop if  MCARE09X == 1 & MCAID09X == 1
drop if POVLEV09 < 150
drop if EDUCYR < 0
gen highschool =0
replace highschool = 1 if inlist(EDUCYR, 12, 13, 14, 15)
gen bachelors =0
replace bachelors = 1 if inlist(EDUCYR, 16)
gen grad =0
replace grad = 1 if inlist(EDUCYR, 17)

keep RXSLF09 RXEXP09 RXTOT09 AGE09X SEX MARRY09X RACEBX HISPANX highschool bachelors grad REGION09 FAMINC09 year

ren  RXSLF09 self_spend
ren  RXEXP09 tot_spend
ren  RXTOT09 rx_num
ren  SEX sex
ren    AGE09X age
ren  MARRY09X marry_status
ren REGION09 region
ren FAMINC09 faminc
ren RACEBX black
ren HISPANX hispanic

save "all\2009_consol.dta", replace

**# 2008

use "2008\H121.dta", clear

gen year =  2008
drop if ELGRND08 == 3
drop if    AGE08X < 60
drop if    AGE08X > 84
drop if    AGE08X == 65
drop if  MCRPD08X != 1 &   AGE08X > 65
drop if  MCAID08X == 1 &   AGE08X > 65
drop if INSCOV08 ==3 &     AGE08X < 65
drop if  MCARE08X == 1 &   AGE08X < 65
drop if  MCARE08X == 1 & MCAID08X == 1
drop if POVLEV08 < 150
drop if EDUCYR < 0
gen highschool =0
replace highschool = 1 if inlist(EDUCYR, 12, 13, 14, 15)
gen bachelors =0
replace bachelors = 1 if inlist(EDUCYR, 16)
gen grad =0
replace grad = 1 if inlist(EDUCYR, 17)

keep RXSLF08 RXEXP08 RXTOT08 AGE08X SEX MARRY08X RACEBX HISPANX highschool bachelors grad REGION08 FAMINC08 year

ren  RXSLF08 self_spend
ren  RXEXP08 tot_spend
ren  RXTOT08 rx_num
ren  SEX sex
ren    AGE08X age
ren  MARRY08X marry_status
ren REGION08 region
ren FAMINC08 faminc
ren RACEBX black
ren HISPANX hispanic

save "all\2008_consol.dta", replace

**# 2007

use "2007\H113.dta", clear

gen year =  2007
drop if ELGRND07 == 3
drop if    AGE07X < 60
drop if    AGE07X > 84
drop if    AGE07X == 65
drop if  MCRPD07X != 1 &   AGE07X > 65
drop if  MCAID07X == 1 &   AGE07X > 65
drop if INSCOV07 ==3 &     AGE07X < 65
drop if  MCARE07X == 1 &   AGE07X < 65
drop if  MCARE07X == 1 & MCAID07X == 1
drop if POVLEV07 < 150
drop if EDUCYR < 0
gen highschool =0
replace highschool = 1 if inlist(EDUCYR, 12, 13, 14, 15)
gen bachelors =0
replace bachelors = 1 if inlist(EDUCYR, 16)
gen grad =0
replace grad = 1 if inlist(EDUCYR, 17)

keep RXSLF07 RXEXP07 RXTOT07 AGE07X SEX MARRY07X RACEBX HISPANX highschool bachelors grad REGION07 FAMINC07 year

ren  RXSLF07 self_spend
ren  RXEXP07 tot_spend
ren  RXTOT07 rx_num
ren  SEX sex
ren    AGE07X age
ren  MARRY07X marry_status
ren REGION07 region
ren FAMINC07 faminc
ren RACEBX black
ren HISPANX hispanic

save "all\2007_consol.dta", replace

**# 2006
/*

use "2006\H105.dta", clear

gen year =  2006
drop if ELGRND06 == 3
drop if    AGE06X < 60
drop if    AGE06X > 84
drop if    AGE06X == 65
drop if  MCRPD06X != 1 &   AGE06X > 65
drop if  MCAID06X == 1 &   AGE06X > 65
drop if INSCOV06 ==3 &     AGE06X < 65
drop if  MCARE06X == 1 &   AGE06X < 65
drop if  MCARE06X == 1 & MCAID06X == 1
drop if POVLEV06 < 150   !!!!!!!!!!!!!!!
drop if EDUCYR < 0
gen highschool =0
replace highschool = 1 if inlist(EDUCYR, 12, 13, 14, 15)
gen bachelors =0
replace bachelors = 1 if inlist(EDUCYR, 16)
gen grad =0
replace grad = 1 if inlist(EDUCYR, 17)

keep RXSLF06 RXEXP06 RXTOT06 AGE06X SEX MARRY06X RACEBX HISPANX highschool bachelors grad REGION06 FAMINC06 year

ren  RXSLF06 self_spend
ren  RXEXP06 tot_spend
ren  RXTOT06 rx_num
ren  SEX sex
ren    AGE06X age
ren  MARRY06X marry_status
ren REGION06 region
ren FAMINC06 faminc
ren RACEBX black
ren HISPANX hispanic

save "all\2006_consol.dta", replace
*/ 

**# combine all

cd all

use "2007_consol", clear
append using "2008_consol"
append using "2009_consol"
append using "2010_consol"
append using "2011_consol"
append using "2012_consol"
append using "2013_consol"
append using "2014_consol"
append using "2015_consol"
append using "2016_consol"
append using "2017_consol"
append using "2018_consol"
append using "2019_consol"

*region variables:
gen northeast =0
gen midwest = 0
gen south = 0
gen west = 0
replace northeast = 1 if region == 1
replace midwest = 1 if region == 2
replace south = 1 if region == 3
replace west = 1 if region == 4
drop region

*male/female
recode sex (1 = 1) (2 = 0), gen(male)
drop sex

*black
recode black (1 2 = 1) (3 = 0)

*married
recode marry_status (1 = 1) (2 3 4 5 = 0), gen(married)
drop marry_status

*control and treatment
gen older = 0
replace older = 1 if age>65

save "estimation_sample.dta", replace

*graph from the paper, roughly matches 
preserve
collapse (mean) rx_num, by(year older )
line rx_num year if older == 1, lc(red) || line rx_num year if older == 0, lc(blue) || scatter rx_num year if older == 1, mc(red) || scatter rx_num year if older == 0, mc(blue)
restore

import delimited "coverage_gap.csv", clear
merge 1:m year using "estimation_sample.dta"
drop if _merge!=3

save "estimation_sample.dta", replace
gen d_gap_min =  max_covered - tot_spend 
gen d_gap_max =  catastrophic - tot_spend

preserve 
collapse (mean) d_gap_max d_gap_min, by(year)
twoway line d_gap_min year || line d_gap_max year
restore