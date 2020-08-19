<cfscript>
variables.jobSuitabilityService = CreateObject("component","com.cf.jobSuitabilityService").init();
variables.result = variables.jobSuitabilityService.getMatchScore(
    jobCharacteristics = "remote, flexible working hours, react",
    individualCharacteristics = "wants to work remote, react experience, looking for frontend"
);
writedump(variables.result)
</cfscript>