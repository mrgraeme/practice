module PassionsHelper
  
  def get_time passion
    @practice_time = 0
    @sessions = passion.sessions.all
      
    @sessions.each do |session|
      @practice_time += session.time.to_i
    end
    @practice_time
  end
    
    
end
