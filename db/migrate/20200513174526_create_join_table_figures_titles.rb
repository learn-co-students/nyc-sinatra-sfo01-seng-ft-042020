class CreateJoinTableFiguresTitles < ActiveRecord::Migration
  def change
    create_join_table :titles, :figures, table_name: :figure_titles do |t|
      t.index :title_id
      t.index :figure_id
    end
  end
end
