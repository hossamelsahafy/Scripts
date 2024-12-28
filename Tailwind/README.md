# React Vite Tailwind CSS Project Setup Script

This script automates the process of setting up a new React project with Vite and Tailwind CSS. It guides the user through the creation of a project directory, initializing the Vite project, installing dependencies, and configuring Tailwind CSS.

## Prerequisites

Before using this script, ensure the following are installed on your system:

- [Node.js](https://nodejs.org/) (includes npm)
- [npx](https://www.npmjs.com/package/npx) (comes with npm 5.2+ and higher)
- Bash shell (Linux, macOS, or Windows Subsystem for Linux)

## Usage

1. Save the script to a file, for example, `setup-react-vite.sh`.
2. Make the script executable:
   ```bash
   chmod +x setup-react-vite.sh
   ```
3. Run the script:
   ```bash
   ./setup-react-vite.sh
   ```

## Features

### Error Handling
- The script includes functions to display error, success, and informational messages in color-coded output for better readability.

### Step-by-Step Process
1. **Directory Setup**:
   - Prompts the user to enter the directory path for the new project.
   - Creates the directory if it does not exist and navigates to it.
2. **Project Initialization**:
   - Prompts for the project name.
   - Initializes a new React project using Vite.
3. **Dependency Installation**:
   - Installs npm dependencies for Vite, React, and Tailwind CSS.
4. **Tailwind CSS Configuration**:
   - Generates a `tailwind.config.js` file with default settings.
   - Updates `index.css` with Tailwind CSS directives.

### Automatic Navigation
- Automatically navigates into the project directory.
- Opens a new shell in the directory upon completion.

## File Changes

### `tailwind.config.js`
This file is generated with the following content paths:
```javascript
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
```

### `src/index.css`
This file is updated with Tailwind CSS directives:
```css
@tailwind base;
@tailwind components;
@tailwind utilities;
```

## Notes
- If any step fails, the script exits with an error message.
- The script assumes a fresh setup and may overwrite existing files like `tailwind.config.js` and `src/index.css`.

## Example Run
1. **Input the directory path**:
   ```
   Enter the directory path where the React Vite project should be created:
   ~/projects
   ```
2. **Input the project name**:
   ```
   Enter the project name:
   my-vite-app
   ```
3. **Observe success messages**:
   ```
   [SUCCESS] Directory created: /home/user/projects
   [SUCCESS] Vite project created: my-vite-app
   [SUCCESS] Dependencies installed successfully
   [SUCCESS] Tailwind CSS configuration initialized
   ```

## License

This script is open source and can be modified or redistributed under the [MIT License](https://opensource.org/licenses/MIT).

