class Campaign < ActiveRecord::Base
  
  belongs_to :spot
  has_many :impressions
  
  validates_presence_of :name, :starts_on, :ends_on, :spot_id
  
  after_save :save_to_storage
  
  # Neccecary method for file_control helper
  def uploaded_data
    return ""
  end
  
  # Processing method for uploaded images
  def uploaded_data=(data)
    return if data.blank?
    @uploaded_data = data
    @save_to_storage = true
  end
  
  def save_to_storage
    return unless @save_to_storage
    @save_to_storage = false # prevent recursion
    # get the info
    tempfile_path = @uploaded_data[:tempfile].path
    extname = File.extname(@uploaded_data[:filename])
    destination_path = "/advertisements/" + self.id.to_s + extname
    # copy the file over
    FileUtils.mkdir_p(Merb.root / "public" / "advertisements")
    FileUtils.rm(Merb.root / "public" + self.filename) if File.exists?(Merb.root / "public" + self.filename)
    FileUtils.mv(tempfile_path, Merb.root / "public" + destination_path)
    # update the record
    self.filename = destination_path
    self.save
  end
  
end