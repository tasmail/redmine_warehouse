class Good < ActiveRecord::Base
    belongs_to :project, :issue

    validates_presence_of :title
    validates_uniqueness_of :title
    validates_numericality_of :price, :quantity, :issue_id
    validates_presence_of :project, :message => :message_goods_should_have_project
end
