* --------------
// DATA LOAD
use permno time_avail_m using "$pathDataIntermediate/SignalMasterTable", clear
merge 1:1 permno time_avail_m using "$pathDataIntermediate/monthlyCRSP", keepusing(shrout cfacshr) nogenerate keep(match)
// SIGNAL CONSTRUCTION
gen temp = shrout*cfacshr // Modified by Rosen at 30 Sep 2023. Adjusted shrout should be shrout * factor
gen ShareIss1Y = (l6.temp - l18.temp)/l18.temp
label var ShareIss1Y "Share Issuance (1 year)"
// SAVE
do "$pathCode/savepredictor" ShareIss1Y