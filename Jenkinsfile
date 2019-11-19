pipeline{
    environment {
        registry = "deathstrock47/production" 
        dockerImage = ""
        registryCredential = "dockerhub"
        gitCredentials = "gitCreds"
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
                dockerImage = docker.build registry + ":$BUILD_NUMBER"
                echo "$registry":"$BUILD_NUMBER"
            }
        }
        stage('push docker image'){
            steps{
                docker.withRegistry("", registryCredential)
                dockerImage.push()
            }
        }
    }
}