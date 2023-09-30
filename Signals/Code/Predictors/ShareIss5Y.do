* --------------
// DATA LOAD
use permno time_avail_m using "$pathDataIntermediate/SignalMasterTable", clear
merge 1:1 permno time_avail_m using "$pathDataIntermediate/monthlyCRSP", keepusing(shrout cfacshr) nogenerate keep(match)
// SIGNAL CONSTRUCTION
gen temp = shrout*cfacshr // Modified by Rosen at 30 Sep 2023. Adjusted shrout should be shrout * factor
gen ShareIss5Y = (temp - l60.temp)/l60.temp
label var ShareIss5Y "Share Issuance (5 year)"
// SAVE
do "$pathCode/savepredictor" ShareIss5Y