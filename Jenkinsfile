
pipeline {
    agent any

    triggers {
        pollSCM('H/2 * * * *')
    }

    environment {
        IMAGE_NAME = 'devops-toolchain-simulator:ci'
        CONTAINER_NAME = 'devops-ci-app'
        APP_PORT = '5001'
    }

    stages {

        stage('Source Code Checkout') {
            steps {
                checkout scm
                echo 'Source code downloaded successfully!'
            }
        }

        stage('Automated Unit Testing') {
            steps {
                sh 'docker run --rm -v "$WORKSPACE:/app" -w /app python:3.12-slim sh scripts/run_tests.sh'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'sh scripts/build_image.sh'
            }
        }

        stage('Test Docker Container') {
            steps {
                sh 'sh scripts/test_container.sh'
            }
        }

        stage('Deploy Application') {
            steps {
                sh 'sh scripts/deploy.sh'
            }
        }

        stage('Verify Deployment') {
            steps {
                sh 'sh scripts/verify_deployment.sh'
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'test-results.xml',
                allowEmptyArchive: true
        }

        success {
            echo 'CI/CD Pipeline completed successfully!'
            echo 'Application URL: http://localhost:5001'
        }

        failure {
            echo 'CI/CD Pipeline failed. Check the Console Output.'
        }
    }
}
