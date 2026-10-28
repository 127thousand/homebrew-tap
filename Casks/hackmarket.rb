cask "hackmarket" do
  version "1.0.0,14"
  sha256 "2659e1b164a28cec0bdd9f01ec628a59d4e0b9e594bac7f7a77624dfccd569fd"

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
