
# SimpleWeatherApp

SimpleWeatherApp is an iOS weather application built using Swift and VIPER architecture. It allows users to search for cities and retrieve real-time weather information using the OpenWeatherMap API.

## Features

- Search cities: Users can search for cities by name to retrieve weather information.
- Real-time weather: The app fetches real-time weather data from the OpenWeatherMap API.
- VIPER architecture: The app is structured following the VIPER architectural pattern for better modularity and testability.
- Alamofire: The Alamofire library is used for networking tasks, making it easier to handle API requests and responses.
- Snapkit: The SnapKit library is used for programmatic UI layout, allowing for more flexible and responsive UI design.

## Getting Started

To get started with the SimpleWeatherApp project, follow these steps:

1. Clone the repository:

   ```
   git clone https://github.com/hakantekir/SimpleWeatherApp.git
   ```

2. Set up your OpenWeatherMap API Key:
   
   - Obtain an API key from the [OpenWeatherMap website](https://openweathermap.org).
   - Set the API key as an environment variable in the Xcode project scheme(s). To do this:
     - Open the project in Xcode.
     - Go to the "Product" menu and select "Scheme" followed by "Edit Scheme".
     - Select "Run" from the left sidebar.
     - Go to the "Arguments" tab.
     - Under "Environment Variables", click the "+" button and add a new variable with the name "API_KEY" and the value as your OpenWeatherMap API key.
     - Close the scheme editor.

3. Build and run the project in Xcode.

## Contribution

Contributions to the SimpleWeatherApp project are welcome. If you find any issues or want to add new features, feel free to submit a pull request.

Please make sure to follow the coding style and keep the code clean and well-structured. Additionally, include appropriate unit tests for any new functionality.

We also follow the conventional commit format for our commit messages. This helps in generating changelogs automatically and maintaining a consistent commit history. Please ensure that your commit messages adhere to the conventional commit format.

To learn more about conventional commits, you can refer to the [Conventional Commits specification](https://www.conventionalcommits.org/).

When submitting a pull request, provide a clear and concise description of the changes you have made. Make sure to reference any related issues or pull requests as well.

Thank you for your contributions!

## License

This project is licensed under the [MIT License](LICENSE).
