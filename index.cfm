<cfscript>
variables.jobCharacteristics = {
    1 = "remote, flexible working hours, react",
    2 = "office base two days per week, react developer",
    3 = "remote, flexible working hours, react, react"
}
variables.individualCharacteristics = {
    1 = "wants to work remote, react experience, looking for frontend",
    2 = "backend developer, cloud experience, AWS certified"
}
variables.jobSuitabilityService = CreateObject("component","com.cf.jobSuitabilityService").init();
variables.result1 = variables.jobSuitabilityService.getMatchScore(
    jobCharacteristics = variables.jobCharacteristics[1],
    individualCharacteristics = variables.individualCharacteristics[1]
);
variables.result2 = variables.jobSuitabilityService.getMatchScore(
    jobCharacteristics = variables.jobCharacteristics[2],
    individualCharacteristics = variables.individualCharacteristics[2]
);
variables.result3 = variables.jobSuitabilityService.getMatchScore(
    jobCharacteristics = variables.jobCharacteristics[1],
    individualCharacteristics = variables.jobCharacteristics[2]
);
variables.result4 = variables.jobSuitabilityService.getMatchScore(
    jobCharacteristics = variables.jobCharacteristics[3],
    individualCharacteristics = variables.individualCharacteristics[1]
);
writedump(variables.result1);
writedump(variables.result2);
writedump(variables.result3);
writedump(variables.result4); // ISSUE WITH THIS AS PER THE TODO IN COMPONENT - IF Duplicate in list it inflates the count and percentage - fix required
</cfscript>