# Doodle App 

This is a simple e-commerce app built with Flutter and Bloc for state management. It fetches product data from the FakeStore API, allows users to search for products, add them to the cart, and view their cart with a total price calculation.  

## Features  
- Fetches products from the FakeStore API using Dio.  
- Search bar for filtering products.  
- Add and remove items from the cart, with data stored locally using Hive.  
- Smooth animations for product listing.  
- Bloc pattern for clean and efficient state management.  
- Snackbars for cart actions (adding/removing items).  

## Project Structure 
```bash
doodle_app/
├── android/              # Android-specific configuration
├── ios/                  # iOS-specific configuration
├── lib/
│   ├── main.dart         # App entry point
│   ├── blocs/
│   │   ├── product_bloc.dart   # Bloc for product fetching & searching
│   │   ├── product_event.dart  # Product events
│   │   ├── product_state.dart  # Product states
│   ├── models/
│   │   ├── product.dart        # Product model with Hive integration
│   ├── presentation/
│   │   ├── cart_screen.dart    # Cart screen displaying selected products & total price
│   │   ├── product_screen.dart # Product listing screen with search bar
│   ├── widgets/
│   │   ├── product_list_view.dart  # Animated product list widget
│   ├── pubspec.yaml          # Project dependencies

