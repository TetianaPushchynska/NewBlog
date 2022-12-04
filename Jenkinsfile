pipeline {
	agent any
	stages {
		stages('version') {
			steps {
				sh 'ruby --version'
			}
		}
	}
	stages {
		stages('hello') {
			steps {
        sh 'ruby Hello.rb'
      }
		}
	}
}
