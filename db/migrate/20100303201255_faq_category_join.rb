class FaqCategoryJoin < ActiveRecord::Migration
  def self.up
    create_table :faq_categories_faqs, :id => false do |t|
      t.integer :faq_category_id
      t.integer :faq_id
    end
  end

  def self.down
    drop_table :faq_categories_faqs
  end
end
