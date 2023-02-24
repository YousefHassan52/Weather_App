class WeatherStates{
}
class WeatherInitialState extends WeatherStates{}
class WeatherGetDataSuccessfullyState extends WeatherStates{}
class WeatherGetDataLoadingState extends WeatherStates{}
class WeatherGetDataErrorState extends WeatherStates{
  final String error;

  WeatherGetDataErrorState(this.error);
}