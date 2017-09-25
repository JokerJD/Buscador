class UploadWorker
  include Sidekiq::Worker

  def perform(file_upload, my_file)
      tmp = params[:file_upload][:my_file].tempfile
      require 'ftools'
      file = File.join("public", params[:file_upload][:my_file].original_filename)
      FileUtils.cp tmp.path, file
  end
end
