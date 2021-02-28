module DiscourseVideo
  class MuxApi

    # This gem is erroring out for some reason
    def self.create_direct_upload
      puts 'create_direct_upload'
      MuxRuby.configure do |config|
        config.username = 'a35c6c6f-ce9c-47af-8f78-f90a266efbc4'
        config.password = 'URH8cPOEuvcxIoJ//Z7aizMDcksA25Tkz1Ev9QDOxye30Bg8Ns+0S3Vw76K9+vMJApsjkO+axJ2'
      end
      puts 'after_configure'

      api_instance = MuxRuby::DirectUploadsApi.new
      puts 'api_instance'
      create_upload_request = MuxRuby::CreateUploadRequest.new # CreateUploadRequest |
      puts 'create_upload_request'

      begin
        result = api_instance.create_direct_upload(create_upload_request)
        puts result
        result
      rescue MuxRuby::ApiError => e
        "Exception when calling DirectUploadsApi->create_direct_upload: #{e}"
      end
    end

    # Convert to ruby and don't use MuxRuby Gem
    def self.create_direct_upload_2
       c = <<~HERDOC
         curl https://api.mux.com/video/v1/uploads \
         -X POST \
         -H "Content-Type: application/json" \
         -u "a35c6c6f-ce9c-47af-8f78-f90a266efbc4:URH8cPOEuvcxIoJ//Z7aizMDcksA25Tkz1Ev9QDOxye30Bg8Ns+0S3Vw76K9+vMJApsjkO+axJ2" \
         -d '{ "new_asset_settings": { "playback_policy": ["public"] }, "cors_origin": "*" }'
       HERDOC
       puts c
       puts
       response = `#{c}`
       puts response
       response
    end
  end
end
