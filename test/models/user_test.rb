require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
        password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end

  test "name should not be too long" do 
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do 
    @user.email = "a" * 250 + "@example.com"
    assert_not @user.valid?
  end

  test "email should be valid" do 
    @user.email = "example.com"
    assert_not @user.valid?
    @user.email = "snip@snap"
    assert_not @user.valid?
    @user.email = "-@|.com"
    assert_not @user.valid?
  end

  test "email addresses should be unique" do
    dup_user = @user.dup
    @user.save
    assert_not dup_user.valid?
  end

  test "email addresses should be saved as lowercase" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "password should be present, non-blank" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end
