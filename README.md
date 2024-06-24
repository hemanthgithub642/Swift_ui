# Dashboard Application

This project is a SwiftUI-based iOS application that displays a dashboard with user-specific data. The application fetches data from an API and displays it in various views, including charts and lists of links. The application is designed with a focus on usability and a clean user interface.

## Key Features

- **Greeting Message**: Displays a dynamic greeting message based on the time of day.
- **Chart Display**: Visual representation of data through a chart view.
- **Top and Recent Links**: Displays top and recent links in a tab view.
- **API Integration**: Fetches data from a remote API and handles errors gracefully.
- **Navigation and Layout**: Utilizes SwiftUI's NavigationView, VStack, HStack, and other layout tools to create a responsive and intuitive interface.

## Application Structure

- **Main View**: The main view `ContentView` contains the overall structure and navigation of the application.
- **Greeting**: Displays a greeting message based on the time of day.
- **Chart View**: A placeholder view for displaying chart data.
- **ListView**: A reusable view for displaying lists of links, both top and recent.
- **Buttons**: Provides buttons for additional interactions, such as "Talk with us," "Frequently Asked QA's," and "About us."

## Code Breakdown

### Main View (`ContentView`)

- **State Variables**:
  - `greeting`: Stores the greeting message.
  - `chartData`: Stores the data for the chart.
  - `topLinks`: Stores the top links data.
  - `recentLinks`: Stores the recent links data.
  - `apiError`: Stores any API errors encountered.

- **Body**:
  - **NavigationView**: The main container for the app's UI.
  - **VStack**: Arranges elements vertically.
  - **Greeting Message**: Displayed at the top.
  - **ChartView**: Displays chart data.
  - **TabView**: Contains `ListView` for top and recent links.
  - **Buttons**: Provides navigation and action buttons.

- **Methods**:
  - `fetchData()`: Fetches data from the API.
  - `greetingTime()`: Determines the appropriate greeting based on the time of day.

### Supporting Views and Structures

- **ChartView**: Placeholder view for displaying chart data.
- **ListView**: Displays a list of links with a given title.
- **Data Models**:
  - `ChartData`: Model for chart data.
  - `LinkData`: Model for link data.
  - `DashboardResponse`: Model for the API response.
  - `APIError`: Model for API error handling.

## Usage

1. **Fetch and Display Data**: On launching the app, it automatically fetches data from the API and displays it in the respective views.
2. **Interact with Links**: Users can navigate between top links and recent links using the tab view.
3. **Buttons**: Additional buttons are provided for user interactions.

## Project Setup and Execution

1. **Clone the Repository**:

    ```bash
    git clone https://github.com/hemanthgithub642/Swift_ui
    cd your-repo
    ```

2. **Open in Xcode**:
   
   Open the project in Xcode by double-clicking the `.xcodeproj` file.

3. **Run the Application**:

    Select the target device or simulator and press the "Run" button in Xcode.

## Technologies Used

- **SwiftUI**: Framework for building the user interface.
- **Combine**: Framework for handling asynchronous events.
- **URLSession**: For making network requests.
- **JSONDecoder**: For parsing JSON data.

## Conclusion

This application provides a clean and intuitive interface for displaying user-specific dashboard data. It leverages SwiftUI for the UI and integrates seamlessly with an external API to fetch and display data in real-time.

