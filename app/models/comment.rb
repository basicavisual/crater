class Comment < ApplicationRecord
  attr_accessor :attachment
  belongs_to :task
  mount_uploader :attachment, AttachmentUploader
end
