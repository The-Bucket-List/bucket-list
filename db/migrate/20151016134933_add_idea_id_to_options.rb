class AddIdeaIdToOptions < ActiveRecord::Migration
  def change
    add_reference :options, :idea, index: true, foreign_key: true
  end
end
