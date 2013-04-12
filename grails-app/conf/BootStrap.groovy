import atq.app.Utilisateur

class BootStrap {

    def init = { servletContext ->
		def ut1=new Utilisateur(nom:"user1",prenom:"prenom1", email:"email1@exemple.com", login:"login1", password:"pass")
		ut1.save()
    }
    def destroy = {
    }
}
