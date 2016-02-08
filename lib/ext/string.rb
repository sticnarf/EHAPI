class String
  def full_strip
    self.gsub(/[\u00A0\s]+$/,'')
  end
end