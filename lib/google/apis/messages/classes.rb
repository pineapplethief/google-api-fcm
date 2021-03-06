module Google
  module Apis
    module Messages

      class Message
        include Google::Apis::Core::Hashable

        attr_accessor :message_object

        def initialize(**args)
          build_keys = %i(topic title body)

          if (build_keys - args.keys).empty?
            initialize_build(**args)
          else
            update!(**args)
          end

        end

        def initialize_build(topic:, title:, body:)
          notification = Notification.new(title: title, body: body)
          @message_object = MessageObject.new(topic: topic, notification: notification)
        end

        def update!(**args)
          @message_object = args[:message_object] if args.key?(:message_object)
        end
      end

      class MessageObject
        include Google::Apis::Core::Hashable

        attr_accessor :topic
        attr_accessor :notification

        def initialize(**args)
          update!(**args)
        end

        # Update properties of this object
        def update!(**args)
          @topic = args[:topic] if args.key?(:topic)
          @notification = args[:notification] if args.key?(:notification)
        end
      end

      class Notification
        include Google::Apis::Core::Hashable

        attr_accessor :title
        attr_accessor :body

        def initialize(**args)
          update!(**args)
        end

        # Update properties of this object
        def update!(**args)
          @title = args[:title] if args.key?(:title)
          @body = args[:body] if args.key?(:body)
        end
      end
    end
  end
end