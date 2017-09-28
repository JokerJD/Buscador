require 'fileutils'

class UploadWorker
  include Sidekiq::Worker

  def perform(file)
  end
end
