class CompanionsChannel < ApplicationCable::Channel
     def subscribed
          stream_from "companions_channel"
     end
     def unsubscribed
          # Any cleanup needed when channel is unsubscribed
     end
end