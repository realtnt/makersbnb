class Message < ActiveRecord::Base
  belongs_to :sender_id, :class_name => "User", foreign_key: "user_id"
  belongs_to :recipient_id, :class_name => "User", foreign_key: "user_id"
end
