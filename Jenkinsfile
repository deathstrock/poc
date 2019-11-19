pipeline{
    environment {
        registry = "deathstrock47/$REPO" 
        dockerImage = ""
        registryCredential = "dockerhub"
        gitCredentials = "gitCreds"
    }

    agent any
    stages{
        stage('checkout'){
            git (
                url: 'deathstrock/myrepo',
                credentialsId: 'gitCreds'
            )
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