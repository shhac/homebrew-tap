class AgentDd < Formula
  desc "Datadog triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-dd"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.7.0/agent-dd-darwin-arm64.tar.gz"
      sha256 "c08816931ef7e79296a33afcf8c6491b0e6c1410c19980741e5a51350f031eb5"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.7.0/agent-dd-darwin-amd64.tar.gz"
      sha256 "12d071e8e438512710c1705c87df65eeccf81da9d3da800f91b317e934e025f1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.7.0/agent-dd-linux-arm64.tar.gz"
      sha256 "826e337d08b8c0f4a32f3d1c5d288b83e7bd46cb94bb949dc4eda0f37a0fe954"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.7.0/agent-dd-linux-amd64.tar.gz"
      sha256 "a705c92322a28879030fe1603ea0bedd6c1e724a8e60ffc2caee077750a2b677"
    end
  end

  def install
    bin.install Dir["agent-dd-*"].first => "agent-dd"
  end

  test do
    assert_match "0.7.0", shell_output("#{bin}/agent-dd --version")
    assert_match "Datadog", shell_output("#{bin}/agent-dd --help")
  end
end
