cask "hackmarket" do
  version "1.0.0,12"
  sha256 "d57443f617fc8f1f3bd744a805ed982e7be07a645203fd191ace4958528e6fec"

  url "https://download.hackmarket.dev/hackmarket-#{version.csv.first}-#{version.csv.second}.dmg"
  name "HackMarket"
  desc "Simulated trading game for the dev stack"
  homepage "https://hackmarket.dev/"

  livecheck do
    url "https://download.hackmarket.dev/latest.json"
    strategy :json do |json|
      "#{json["version"]},#{json["build"]}"
    end
  end

  depends_on macos: :monterey

  app "hackmarket.app"

  zap trash: [
    "~/Library/Application Scripts/app.hackmarket",
    "~/Library/Containers/app.hackmarket",
  ]
end
