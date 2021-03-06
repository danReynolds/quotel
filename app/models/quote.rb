class Quote < ActiveRecord::Base
  
  validates_presence_of :description
  
  FLATTERY = 'flattery'
  INSULT = 'insult'
  FLATINSULT = 'flatinsult'
  
  TYPES = [FLATTERY, INSULT, FLATINSULT].freeze
  
  def flattery?
    self.source == Quote::FLATTERY
  end
  
  def insult?
    self.source == Quote::INSULT
  end
  
  def flatinsult?
    self.source == Quote::FLATINSULT
  end
  
end
