ViteCreator Script

Overview

The ViteCreator.sh script automates the process of creating a new React project using Vite. It simplifies the steps involved in setting up a React Vite project by:

Prompting the user for a directory path where the project will be created.

Creating the specified directory if it doesn’t already exist.

Scaffolding a new React project using Vite.

Navigating to the project directory.

Installing necessary dependencies.

Launching a new shell session in the project directory for further development.

How to Use

Prerequisites

Ensure you have Node.js installed on your system. You can download it from Node.js Official Website.

Install npx, which is included with Node.js.

Steps

Download or copy the ViteCreator.sh script to your system.

Make the script executable by running the following command:

chmod +x ViteCreator.sh

Run the script:

./ViteCreator.sh

When prompted:

Enter the path where you want the project to be created (e.g., /home/user/projects or ~/projects).

Enter the project name (e.g., MyReactApp).

Input Examples

Path: You can input absolute or relative paths. For example:

/home/user/projects (absolute path)

~/projects (home directory shortcut)

../projects (relative path)

Project Name: Enter a valid directory name for the project, such as MyReactApp or CoffeShop.

Output

Once the script completes, the following will be set up:

A new React Vite project will be created in the specified directory.

All necessary dependencies will be installed.

The script will open a new shell session in the project directory.

Notes

If the specified directory already exists, the script will not recreate it but will still proceed with the project setup.

If the project directory or name already exists, you may need to choose a different name or remove the existing directory.

After running the script, follow the displayed instructions to start the development server:

npm run dev

Troubleshooting

Ensure Node.js and npm are installed and correctly added to your PATH.

Check permissions for the directory where the project will be created.

If an error occurs, the script will print the issue and exit.

Enjoy coding with React and Vite!
