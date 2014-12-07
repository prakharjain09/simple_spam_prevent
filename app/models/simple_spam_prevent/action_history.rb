module SimpleSpamPrevent
  class ActionHistory < ActiveRecord::Base
    # attr_accessible :controller, :action, :reference_id, :reference_type
    belongs_to :reference, polymorphic: true

    

  end
end
