
/*
A.Styles: Job Characteristics Service.
*/

component name="jobSuitabilityService" output=false description="service to return percentage of suitability a candidate has for a particular role" {
	
	public any function init() {		
		return this;
	}

/* getcharacteristicMatch function 
 this function is passed two arguments - jobCharacteristics and individualCharacteristics which is used check which values match in each list */
	
	public numeric function getcharacteristicMatch
	(
		required string jobCharacteristics,
		required string individualCharacteristics
	) 
	{
		local.characteristicsMatchCount = 0;
		for (local.characteristic IN ListToArray(arguments.jobCharacteristics)) {
			for (local.individualCharacteristic IN ListToArray(arguments.individualCharacteristics)) {					
				if (FindNoCase(local.characteristic, local.individualCharacteristic)) {
					local.characteristicsMatchCount = local.characteristicsMatchCount + 1;
					// TODO, remove item from list when found otherwise you get extra counts
				}
			}
		}
		return local.characteristicsMatchCount;
	}

/* getPercentageMatch function 
 this function is passed two arguments - jobCharacteristicsCount and matchCount which is used to calcuate the match percentage */
	
	public numeric function getPercentageMatch
	(
		required numeric jobCharacteristicsCount,
		required numeric matchCount
	) 
	{
		local.matchPercentage = (arguments.matchCount / arguments.jobCharacteristicsCount) * 100;
		return local.matchPercentage;
	}

/* getMatchScore function 
 this function is passed two arguments - jobCharacteristics and individualCharacteristics which is used to calculate the percentage of suitability */
	
	public struct function getMatchScore
	(
		required string jobCharacteristics,
		required string individualCharacteristics
	) 
	{
		local.callResult = {};
		local.callResult.info = {
			status: "success"
		};
		local.jobCharacteristicsCount = ListLen(arguments.jobCharacteristics);

		try {
			// call getcharacteristicMatch method
			local.matchCount = getcharacteristicMatch(arguments.jobCharacteristics, arguments.individualCharacteristics);
			local.percentage = getPercentageMatch(local.jobCharacteristicsCount, local.matchCount)
			local.callResult.data.matchCount = local.matchCount;
			local.callResult.data.percentage = local.percentage;			

			// catch any errors
			} catch(any e) {
				local.callResult.data = e.type;
				local.callResult.info = e.message;
			}
		
		return local.callResult;
	} 
}


