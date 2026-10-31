
pipeline {
    agent any

    stages {

        stage('Source Code Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Jagan-mohan-rao/-devops-toolchain-simulator.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t devops-toolchain-simulator:ci .'
            }
        }

        stage('Test Application') {
            steps {
                sh '''
                    docker run -d --name devops-ci-test \
                        devops-toolchain-simulator:ci

                    sleep 5

                    docker exec devops-ci-test python -c "import urllib.request; print(urllib.request.urlopen('http://localhost:5000/health').read().decode())"

                    docker rm -f devops-ci-test
                '''
            }
        }

        stage('Deploy Application') {
            steps {
                sh '''
                    docker rm -f devops-ci-app || true
                    docker run -d --name devops-ci-app \
                        -p 5001:5000 \
                        devops-toolchain-simulator:ci
                '''
            }
        }

        stage('Verify Deployment') {
            steps {
                sh '''
                    sleep 5
                    docker exec devops-ci-app python -c "import urllib.request; print(urllib.request.urlopen('http://localhost:5000/health').read().decode())"
                '''
            }
        }
    }

    post {
        success {
            echo 'CI/CD Pipeline completed successfully!'
        }
        failure {
            echo 'CI/CD Pipeline failed. Check the stage logs.'
        }
    }
}

