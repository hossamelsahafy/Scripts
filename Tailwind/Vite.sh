#!/bin/bash

# Function to handle errors
echo_error() {
  echo -e "\033[31m[ERROR]\033[0m $1"
}

echo_success() {
  echo -e "\033[32m[SUCCESS]\033[0m $1"
}

echo_info() {
  echo -e "\033[34m[INFO]\033[0m $1"
}

# Prompt for the directory path
echo_info "Enter the directory path where the React Vite project should be created:"
read -r dir_path

# Expand tilde (~) to home directory
dir_path=$(eval echo "$dir_path")

# Create the directory if it doesn't exist
if [ ! -d "$dir_path" ]; then
  mkdir -p "$dir_path" || {
    echo_error "Failed to create directory: $dir_path"
    exit 1
  }
  echo_success "Directory created: $dir_path"
else
  echo_info "Directory already exists: $dir_path"
fi

# Navigate to the directory
cd "$dir_path" || {
  echo_error "Failed to navigate to directory: $dir_path"
  exit 1
}
echo_success "Navigated to directory: $dir_path"

# Prompt for the project name
echo_info "Enter the project name:"
read -r project_name

# Create the React Vite project using npx
npx create-vite@latest "$project_name" --template react || {
  echo_error "Failed to create Vite project: $project_name"
  exit 1
}
echo_success "Vite project created: $project_name"

# Navigate to the project directory
cd "$project_name" || {
  echo_error "Failed to navigate to project directory: $project_name"
  exit 1
}
echo_success "Navigated to project directory: $project_name"

# Install dependencies
npm install || {
  echo_error "Failed to install dependencies"
  exit 1
}
echo_success "Dependencies installed successfully"

# Install Tailwind CSS and related dependencies
echo_info "Initialized Tailwind css dependencies"
npm install -D tailwindcss postcss autoprefixer || {
  echo_error "Failed To Initialize Tailwind css dependencies "
  exit 1
}

# Initialize Tailwind CSS configuration
echo_info "Initailze Tailwind css Configuration"
npx tailwindcss init -p || {
  echo_error "Failed To initialize Tailwind Css Configuration "
  exit 1
}

# Update tailwind.config.js with content paths
cat > tailwind.config.js <<EOL
/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
EOL

# Update index.css with Tailwind directives
cat > ./src/index.css << EOL
@tailwind base;
@tailwind components;
@tailwind utilities;
EOL

# Open a new shell in the project directory
exec $SHELL
