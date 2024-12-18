# my_trainings_app

A new Flutter project.

## Getting Started

## Overview

This Flutter application is designed to help users explore and filter available training sessions. Users can interact with a swipeable carousel of training cards, apply filters based on predefined locations, training names, and trainer names, and view detailed information about each training. The app also allows users to view additional details about a training by clicking on its card, providing a seamless training experience.

---

## Features

### 1. **Swipe Carousel of Trainings**

A horizontal carousel displaying a list of available trainings. This carousel allows users to swipe left or right through the available options. When a user taps on a training card in the carousel, they are directed to a detailed full-screen page showing additional details about the selected training.

### 2. **Filter Section**

- Users can filter the list of trainings by predefined locations, training names, and trainer names.
- Clicking the **Filter** button opens a modal dialog where the user can select one or more filters.
- Once filters are applied, the home page dynamically updates to display only the matching trainings in the list section at the bottom.

### 3. **List of Trainings (Scrollable Vertically)**

- Below the carousel, a vertically scrollable list of trainings is displayed.
- This list allows users to scroll through additional trainings, and each training card is clickable. When clicked, it opens a detailed view of the selected training.

### 4. **Training Details Page**

When a user clicks on a training card, a full-screen page will open showing detailed information about the training, including a summary, location, trainer, and other relevant details.

---

## Requirements

### Prerequisites

- **Flutter** version 3.x or later
- **Android Studio**, **VS Code**, or your preferred IDE
- Emulator or a physical device for testing

### Dependencies Used

- `get` - For managing the state of the app.
- `flutter_screenutil` - For Responsive.
- `dotted_line` - For To Show Dotted Border.

---

## Installation

### Step 1: Clone the Repository

Clone the repository to your local machine:

```bash
git clone https://github.com/jayraj345/My-Trainings-App.git
