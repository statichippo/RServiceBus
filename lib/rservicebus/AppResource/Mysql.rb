module RServiceBus
    
    require "mysql2"
    
    #Implementation of an AppResource - Redis
    class AppResource_Mysql<AppResource
        
        @connection

        def initialize( uri )
            super(uri)
            host = uri.host
            database = uri.path.sub( "/", "" )
            
            
            @connection = Mysql2::Client.new(:host => uri.host,
                                                :database => uri.path.sub( "/", "" ),
                                                :username => uri.user )
            puts "AppResource_Mysql. Connected to, " + uri.to_s
        end

        def getResource
            return @connection
        end
        
    end
    
end
