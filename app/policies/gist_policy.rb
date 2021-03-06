class GistPolicy
  attr_reader :user, :gist

  def initialize(user, gist)
    @user = user
    @gist = gist
  end

  def edit?
    user == gist.user
  end

  def update?
    user == gist.user
  end
end
