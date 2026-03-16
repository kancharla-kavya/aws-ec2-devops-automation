echo "Installing docker.."
sudo yum update -y
sudo yum install docker -y
sudo systemctl start docker
sudo systenctl enable docker
sudo usermod -aG docker ec2-user
docker --version
