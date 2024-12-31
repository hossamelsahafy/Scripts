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

npm install @headlessui/react @heroicons/react

mkdir -p ./src/Header
echo "import { Disclosure, DisclosureButton, DisclosurePanel, Menu, MenuButton, MenuItem, MenuItems } from '@headlessui/react'
import { Bars3Icon, BellIcon, XMarkIcon } from '@heroicons/react/24/outline'

const navigation = [
  { name: 'Dashboard', href: '#', current: true },
  { name: 'Team', href: '#', current: false },
  { name: 'Projects', href: '#', current: false },
  { name: 'Calendar', href: '#', current: false },
]

function classNames(...classes) {
  return classes.filter(Boolean).join(' ')
}

export default function Example() {
  return (
    <Disclosure as=\"nav\" className=\"bg-gray-800\">
      <div className=\"mx-auto max-w-7xl px-2 sm:px-6 lg:px-8\">
        <div className=\"relative flex h-16 items-center justify-between\">
          <div className=\"absolute inset-y-0 left-0 flex items-center sm:hidden\">
            {/* Mobile menu button*/}
            <DisclosureButton className=\"group relative inline-flex items-center justify-center rounded-md p-2 text-gray-400 hover:bg-gray-700 hover:text-white focus:outline-none focus:ring-2 focus:ring-inset focus:ring-white\">
              <span className=\"absolute -inset-0.5\" />
              <span className=\"sr-only\">Open main menu</span>
              <Bars3Icon aria-hidden=\"true\" className=\"block size-6 group-data-[open]:hidden\" />
              <XMarkIcon aria-hidden=\"true\" className=\"hidden size-6 group-data-[open]:block\" />
            </DisclosureButton>
          </div>
          <div className=\"flex flex-1 items-center justify-center sm:items-stretch sm:justify-start\">
            <div className=\"flex shrink-0 items-center\">
              <img
                alt=\"Your Company\"
                src=\"https://tailwindui.com/plus/img/logos/mark.svg?color=indigo&shade=500\"
                className=\"h-8 w-auto\"
              />
            </div>
            <div className=\"hidden sm:ml-6 sm:block\">
              <div className=\"flex space-x-4\">
                {navigation.map((item) => (
                  <a
                    key={item.name}
                    href={item.href}
                    aria-current={item.current ? 'page' : undefined}
                    className={classNames(
                      item.current ? 'bg-gray-900 text-white' : 'text-gray-300 hover:bg-gray-700 hover:text-white',
                      'rounded-md px-3 py-2 text-sm font-medium',
                    )}
                  >
                    {item.name}
                  </a>
                ))}
              </div>
            </div>
          </div>
          <div className=\"absolute inset-y-0 right-0 flex items-center pr-2 sm:static sm:inset-auto sm:ml-6 sm:pr-0\">
            <button
              type=\"button\"
              className=\"relative rounded-full bg-gray-800 p-1 text-gray-400 hover:text-white focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-800\"
            >
              <span className=\"absolute -inset-1.5\" />
              <span className=\"sr-only\">View notifications</span>
              <BellIcon aria-hidden=\"true\" className=\"size-6\" />
            </button>

            {/* Profile dropdown */}
            <Menu as=\"div\" className=\"relative ml-3\">
              <div>
                <MenuButton className=\"relative flex rounded-full bg-gray-800 text-sm focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-800\">
                  <span className=\"absolute -inset-1.5\" />
                  <span className=\"sr-only\">Open user menu</span>
                  <img
                    alt=\"\"
                    src=\"https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80\"
                    className=\"size-8 rounded-full\"
                  />
                </MenuButton>
              </div>
              <MenuItems
                transition
                className=\"absolute right-0 z-10 mt-2 w-48 origin-top-right rounded-md bg-white py-1 shadow-lg ring-1 ring-black/5 transition focus:outline-none data-[closed]:scale-95 data-[closed]:transform data-[closed]:opacity-0 data-[enter]:duration-100 data-[leave]:duration-75 data-[enter]:ease-out data-[leave]:ease-in\"
              >
                <MenuItem>
                  <a
                    href=\"#\"
                    className=\"block px-4 py-2 text-sm text-gray-700 data-[focus]:bg-gray-100 data-[focus]:outline-none\"
                  >
                    Your Profile
                  </a>
                </MenuItem>
                <MenuItem>
                  <a
                    href=\"#\"
                    className=\"block px-4 py-2 text-sm text-gray-700 data-[focus]:bg-gray-100 data-[focus]:outline-none\"
                  >
                    Settings
                  </a>
                </MenuItem>
                <MenuItem>
                  <a
                    href=\"#\"
                    className=\"block px-4 py-2 text-sm text-gray-700 data-[focus]:bg-gray-100 data-[focus]:outline-none\"
                  >
                    Sign out
                  </a>
                </MenuItem>
              </MenuItems>
            </Menu>
          </div>
        </div>
      </div>

      <DisclosurePanel className=\"sm:hidden\">
        <div className=\"space-y-1 px-2 pb-3 pt-2\">
          {navigation.map((item) => (
            <DisclosureButton
              key={item.name}
              as=\"a\"
              href={item.href}
              aria-current={item.current ? 'page' : undefined}
              className={classNames(
                item.current ? 'bg-gray-900 text-white' : 'text-gray-300 hover:bg-gray-700 hover:text-white',
                'block rounded-md px-3 py-2 text-base font-medium',
              )}
            >
              {item.name}
            </DisclosureButton>
          ))}
        </div>
      </DisclosurePanel>
    </Disclosure>
  )
}" > ./src/Header/navbar.jsx

# Clear the contents of App.css
> ./src/App.css

# Add the Navbar to App.jsx
cat <<EOL > ./src/App.jsx
import React from 'react';
import Example from './Header/navbar';

function App() {
  return (
    <div>
      <Example />
    </div>
  );
}

export default App;
EOL

# Open a new shell in the project directory
exec $SHELL
