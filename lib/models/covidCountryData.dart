class CovidCountryData {
  final String? countryName;
  final int? cases;
  final int? todayCases;
  final int? deaths;
  final int? todayDeaths;
  final int? recovered;
  final int? todayRecovered;
  final int? active;
  final int? critical;
  final int? casesPerOneMillion;
  final int? deathsPerOneMillion;
  final int? tests;
  final int? testPerOneMillion;
  final int? population;
  final String? continent;
  final int? oneCasePerPeople;
  final int? oneDeathPerPeople;
  final int? oneTestPerPeople;
  final int? undefined;
  final int? activePerOneMillion;
  final int? recoveredPerOneMillion;
  final int? criticalPerOneMillion;

  CovidCountryData({
    required this.active,
    required this.activePerOneMillion,
    required this.cases,
    required this.casesPerOneMillion,
    required this.continent,
    required this.countryName,
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
    required this.testPerOneMillion,
    required this.tests,
    required this.todayCases,
    required this.todayDeaths,
    required this.todayRecovered,
    required this.undefined,
  });
}
