require "application_system_test_case"

class TrainersTest < ApplicationSystemTestCase
  setup do
    @trainer = trainers(:one)
  end

  test "visiting the index" do
    visit trainers_url
    assert_selector "h1", text: "Trainers"
  end

  test "should create trainer" do
    visit trainers_url
    click_on "New trainer"

    fill_in "Age", with: @trainer.age
    fill_in "Hometown", with: @trainer.hometown
    fill_in "Last name", with: @trainer.last_name
    fill_in "Name", with: @trainer.name
    fill_in "Region", with: @trainer.region
    click_on "Create Trainer"

    assert_text "Trainer was successfully created"
    click_on "Back"
  end

  test "should update Trainer" do
    visit trainer_url(@trainer)
    click_on "Edit this trainer", match: :first

    fill_in "Age", with: @trainer.age
    fill_in "Hometown", with: @trainer.hometown
    fill_in "Last name", with: @trainer.last_name
    fill_in "Name", with: @trainer.name
    fill_in "Region", with: @trainer.region
    click_on "Update Trainer"

    assert_text "Trainer was successfully updated"
    click_on "Back"
  end

  test "should destroy Trainer" do
    visit trainer_url(@trainer)
    click_on "Destroy this trainer", match: :first

    assert_text "Trainer was successfully destroyed"
  end
end
