# Define the GitHub repository URL
$repoUrl = "https://github.com/tinitiate/postgres-docker.git"

# Define the local folder path where the repository will be cloned
$localFolder = "C:\repos\postgres-docker"

# Clone the repository
git clone $repoUrl $localFolder

# Change directory to the cloned folder
cd $localFolder

# Run docker-compose up
docker-compose up
