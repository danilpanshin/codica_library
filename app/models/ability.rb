class Ability
  include CanCan::Ability

  def initialize(user)
    user = user || User.new
    if user.admin?
      can :manage, :all
    elsif user.book_moderator?
      can :manage, Book
      can :read, [Author, Category]
    elsif user.category_moderator?   
      can :manage, Category
      can :read, [Author, Book]    
    elsif user.guest?
      can :read, Category
      can :read, Author
      can :read, Book  
    end
  end
end
