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

        stage('Synk') {
         
            // report on all vulnerabilities
            sh "snyk test --json > report.json 2>/dev/null || exit 0"
            
            // print high vulnerabilies
            sh "snyk test --severity-threshold=high 2>/dev/null || exit 0"
            
            // fail the build on high vulnerabilities
            // sh "snyk test --severity-threshold=high"

            

            
      }
    
  
    /*
    stage('Pull') {
         sh "docker-compose down"
         sh "docker-compose up -d"	
      }
     */

}
