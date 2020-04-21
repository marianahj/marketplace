class Store < ApplicationRecord
  belongs_to :user

  CATEGORIES = [
    {id: 1, name: 'Groceries'},
    {id: 2, name: 'Drug'},
    {id: 3, name: 'Clothing'},
    {id: 4, name: 'Farm'} ,
    {id: 5, name: 'Pets'},
    {id: 6, name: 'Crafts'} ,
    {id: 7, name: 'Other'}
  ]

  def status_s
    status == 0 ? 'Inactive' : 'Active'
  end

  def is_active?
    status == 1
  end
end
