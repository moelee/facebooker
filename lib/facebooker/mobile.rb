module Facebooker
  class Mobile
    def initialize(session)
      @session = session
    end
  
    # Used to determine whether the user identified by "uid" has enabled SMS for this application.
    def can_send(user)
      @session.post('facebook.sms.canSend', :uid => User.cast_to_facebook_id(user))
    end
    
    # Send the given message to the user.
    def send(user, message, session_id = nil, request_session = false)
      @session.post('facebook.sms.send', 
        :uid => User.cast_to_facebook_id(user), 
        :message => message)
    end
  end
end
