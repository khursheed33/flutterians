class CovidGlobalData {
  final int? cases;
  final int? todayCases;
  final int? deaths;
  final int? todayDeaths;
  final int? recovered;
  final int? todayRecovered;
  final int? active;
  final int? critical;
  final double? casesPerOneMillion;
  final double? deathsPerOneMillion;
  final int? tests;
  final double? testsPerOneMillion;
  final int? population;
  final int? oneCasePerPeople;
  final int? oneDeathPerPeople;
  final int? oneTestPerPeople;
  final int? undefined;
  final double? activePerOneMillion;
  final double? recoveredPerOneMillion;
  final double? criticalPerOneMillion;
  final int? affectedCountries;

  CovidGlobalData({
    required this.active,
    required this.activePerOneMillion,
    required this.affectedCountries,
    required this.cases,
    required this.casesPerOneMillion,
    required this.critical,
    required this.criticalPerOneMillion,
    required this.deaths,
    required this.deathsPerOneMillion,
    required this.oneCasePerPeople,
    required this.oneDeathPerPeople,
    required this.oneTestPerPeople,
    required this.population,
    required this.recovered,
    required this.recoveredPerOneMillion,
    required this.tests,
    required this.testsPerOneMillion,
    required this.todayCases,
    required this.todayDeaths,
    required this.todayRecovered,
    required this.undefined,
  });
}
