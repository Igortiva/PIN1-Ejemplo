pipeline {
    agent any

    stages {
        stage('Build and Tag Docker Image') {
            steps {
                script {
                    // Construir la imagen Docker
                    docker.build('app1:1.0', '.')

                    // Etiquetar la imagen con el nombre del registro local
                    docker.image('app1:1.0').tag("localhost:5000/app1")
                }
            }
        }
        stage('Push Docker Image to Local Registry') {
            steps {
                script {
                    // Empujar la imagen al registro local
                    docker.withRegistry('http://localhost:5000', 'my-credentials-id') {
                        docker.image('localhost:5000/app1').push()
                    }
                }
            }
        }
        stage('Run Tests') {
            steps {
                // Aquí puedes agregar comandos para ejecutar las pruebas
            }
        }
    }
}
