describe "HomeScreen" do
  tests HomeScreen

  before do
    @controller = HomeScreen.new
  end

  it "should include the text label we added" do
    view('Hello World').should.not.be.nil
  end

  it "player is a AVAudioPlayer" do
    @controller.on_load
    @controller.player.is_a?(AVAudioPlayer).should.be.true
  end

  it "at the beginning, currentTime of AudioPlayer is Float value" do
    @controller.on_load
    @controller.player.currentTime.is_a?(Float).should.be.true
  end
end
