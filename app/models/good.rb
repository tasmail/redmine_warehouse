class Good < ActiveRecord::Base
    belongs_to :project

    validates_presence_of :title
    validates_uniqueness_of :title
    validates_numericality_of :price
    validates_numericality_of :quantity
    validates_numericality_of :issue_id
    validates_presence_of :project, :message => :message_goods_should_have_project
end
