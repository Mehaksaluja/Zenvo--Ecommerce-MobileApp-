# 🛍️ Zenvo: A Flutter E-commerce App

Welcome to Zenvo, a complete, modern e-commerce application built with Flutter. This project was developed as a comprehensive learning journey to master core and advanced concepts of mobile app development, including state management, professional UI/UX design, and scalable project architecture.

This application demonstrates a full user flow, from signing up and logging in, to Browse products, managing a shopping cart and wishlist, and simulating a final checkout process.

---

## ✨ Features

- **Full Authentication Flow**:
    - Clean, modern UI for both Sign In and Sign Up pages.
    - Social login placeholders.
    - State management for loading, success, and error states.
- **Dynamic Home Page**:
    - Elegant, "editorial-style" layout.
    - A "Hero" section to promote sales or featured items.
    - Horizontal scrolling "New Arrivals" section.
    - Main product grid for Browse all items.
- **Product Browse**:
    - **Category Filtering**: Functional filter chips to sort products by category.
    - **Search Functionality**: A debounced search bar in the `AppBar` to filter products by title in real-time.
    - **Product Detail Page**: A dedicated screen to view detailed information about a single product.
- **Shopping Cart**:
    - Add and remove items from the cart.
    - A dedicated `CartPage` to view all items and the total price.
    - A badge on the `AppBar` icon that updates with the number of items in the cart.
- **Wishlist**:
    - Add and remove items from a personal wishlist.
    - Interactive "favorite" icons on product cards that reflect the wishlist state.
    - A dedicated `WishlistPage` accessible from a navigation drawer.
- **Simulated Checkout Process**:
    - A `CheckoutPage` to review the order and enter mock shipping details.
    - A final `OrderConfirmationPage` to confirm a successful order.

---

## 🚀 Getting Started

To run this project locally, follow these steps:

1.  **Prerequisites**:
    - Ensure you have the [Flutter SDK](https://flutter.dev/docs/get-started/install) installed on your machine.
    - An editor like [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio).

2.  **Clone the Repository**:
    ```bash
    git clone "https://github.com/Mehaksaluja/Zenvo-Ecom-MobileApp"
    cd Zenvo-Ecom-MobileApp
    ```

3.  **Install Dependencies**:
    Run the following command in your terminal to fetch all the necessary packages.
    ```bash
    flutter pub get
    ```

4.  **Run the App**:
    Connect a device or start an emulator and run the app.
    ```bash
    flutter run
    ```

---

## 🏛️ Project Architecture

This project follows a clean, feature-first architecture to ensure scalability and maintainability.


lib/
├── core/               # Shared code: themes, constants, etc.
│   └── theme/
└── features/           # Each feature of the app has its own folder.
├── auth/           # Authentication (Login, Sign Up)
├── cart/           # Shopping Cart
├── checkout/       # Checkout Process
├── products/       # Product Browse (Home, Detail)
└── wishlist/       # User Wishlist


Each feature folder is typically divided into:
- `bloc/`: Contains all the business logic components (events, states, and the BLoC).
- `presentation/`: Contains all the UI code.
    - `pages/`: The main screens for the feature.
    - `widgets/`: Reusable widgets specific to that feature.

---

## 🧠 State Management: BLoC

This app exclusively uses the **BLoC (Business Logic Component)** pattern for state management, powered by the `flutter_bloc` package.

- **Separation of Concerns**: The business logic is completely decoupled from the UI, making the app easier to test, debug, and scale.
- **Reactivity**: The UI reacts to state changes from the BLoCs, ensuring the app is always in a predictable state.
- **Key Packages**:
    - `flutter_bloc`: The core BLoC library.
    - `bloc_concurrency`: Used for advanced event processing, like the `restartable` transformer for debouncing the search functionality.

---

## 💡 Future Improvements

- [ ] **State Persistence**: Integrate `hydrated_bloc` to save the user's cart and wishlist to the device's local storage.
- [ ] **Real Authentication**: Replace the simulated auth logic with a real backend service like Firebase Authentication.
- [ ] **Data Repository**: Implement the Repository Pattern to abstract the data layer (API calls) from the BLoCs.
- [ ] **Form Validation**: Add proper validation to the Login and Sign Up forms.

