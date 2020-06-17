node ('ubuntu-slave'){  
    def app
    stage('Cloning Git') {
       checkout scm
    }  
    
 stage('Build') {
       app = docker.build("mikebroomfield/snake")
   }
    
    stage('Push') {
     docker.withRegistry('https://registry.hub.docker.com', 'docker-creds') {
            app.push("latest")
        			}
         }
    
     stage('Trivy Scan') {

         echo "running trivy"
         sh "trivy --no-progress --exit-code 0 --severity HIGH,CRITICAL python:3.4-alpine"
      }
  
    /*
    stage('Pull') {
         sh "docker-compose down"
         sh "docker-compose up -d"	
      }
     */

}
