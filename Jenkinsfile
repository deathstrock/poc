pipeline{
    environment {
        registry = "deathstrock47/production" 
        dockerImage = ""
        registryCredential = "dockerhub"
    }
    agent any
    stages{
        stage('checkout'){
            steps{
                git (
                    url: 'deathstrock/myrepo',
                    credentialsId: 'gitCreds'
                )
            }
        }
        stage('build docker image'){
            steps{
                script{
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                    echo "$registry":"$BUILD_NUMBER"
                }
            }
        }
        stage('push docker image'){
            steps{
                script{
                    docker.withRegistry("", registryCredential)
                    dockerImage.push()
                }
            }
        }
    }
}