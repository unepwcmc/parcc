class SpeciesTurnover < ActiveRecord::Base
  belongs_to :protected_area
  belongs_to :taxonomic_class

  def percentage stat, round_to=1
    send(stat) >= 1 ? 100 : (send(stat)*100).round(round_to)
  end
end
