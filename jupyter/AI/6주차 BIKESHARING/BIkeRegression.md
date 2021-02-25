## Data Field

```
* datetime - hourly date + timestamp  (범주 or 수치)
* season -  1 = spring, 2 = summer, 3 = fall, 4 = winter (범주)
* holiday - whether the day is considered a holiday(범주)
* workingday - whether the day is neither a weekend nor holiday(범주)
* weather (order?)
	* 1: Clear, Few clouds, Partly cloudy, Partly cloudy
    * 2: Mist + Cloudy, Mist + Broken clouds, Mist + Few clouds, Mist
    * 3: Light Snow, Light Rain + Thunderstorm + Scattered clouds, Light Rain + Scattered 		clouds
    * 4: Heavy Rain + Ice Pallets + Thunderstorm + Mist, Snow + Fog 
* temp - temperature in Celsius(수치)
* atemp - "feels like" temperature in Celsius(수치)
* humidity - relative humidity(수치)
* windspeed - wind speed(수치)


* casual - number of non-registered user rentals initiated(test에는 없음=> 예측해보자)
* registered - number of registered user rentals initiated(test에는 없음=> 예측해보자)
* count - number of total rentals(label=> 예측 대상)
```

## Evaluation

```
RMSLE => log를 취해서 과대 예측한 경우에 높은 패널티를 부여.
```

