pipeline{
    agent any
    stages{
        stage('Extract image')
        {
            steps{
                echo 'extracting image'
            }
        }
        stage('Trying shell script commands')
        {
            steps{
                sh './shell_scripts/hello.sh'
            }
        }
        stage('Read json file')
        {
            steps{
                echo 'reading json file'
            }
        }
        stage('Pull Image')
        {
            steps{
                echo 'pulling image from gcr'
            }
        }
        stage('Push image to registry')
        {
            steps{
                echo 'psuhing image to registry'
            }
        }
    }
}