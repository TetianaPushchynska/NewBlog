ThinkingSphinx::Index.define :post, with: :active_record do
  indexes title, sortable: true
  indexes summary
  has status
end