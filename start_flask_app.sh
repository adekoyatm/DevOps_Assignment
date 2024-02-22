#!/bin/bash

#Running the Script: 
#Navigate to the directory containing script & type:  
#"./start_flask_app.sh"
#if permission is denied, type:
#"chmod +x start_flask_app.sh"
#then type:
#"./start_flask_app.sh"


# Check if PM2 is installed
if ! command -v pm2 &> /dev/null
then
    echo "PM2 is not installed. Installing now..."
    npm install pm2@latest -g
else
    echo "PM2 is already installed. Skipping installation..."
fi

# Start the Flask application with PM2
echo "Starting Flask application with PM2..."
pm2 start app.py --name flask-app

# Configure PM2 to start the application on system boot
echo "Configuring PM2 to start on system boot..."
pm2 startup

# Save the current process list
echo "Saving the current process list..."
pm2 save

# List the processes managed by PM2
echo "Listing processes managed by PM2..."
pm2 list

# Show logs for the Flask application
echo "Displaying logs for the Flask application..."
pm2 logs flask-app

echo "Commands to stop or restart the application:"
echo "pm2 stop flask-app"
echo "pm2 restart flask-app"


