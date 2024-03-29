namespace WeatherForecast.Api;

public class WeatherForecast
{
    public string Country { get; set; } = string.Empty;
    public string Region { get; set; } = string.Empty;
    public DateOnly Date { get; set; }

    public int TemperatureC { get; set; }

    public int TemperatureF => 32 + (int)(TemperatureC / 0.5556);

    public string? Summary { get; set; }
}