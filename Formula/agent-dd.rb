class AgentDd < Formula
  desc "Datadog triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-dd"
  version "0.14.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.14.1/agent-dd-darwin-arm64.tar.gz"
      sha256 "9d61aa13bf2dc67bc43781261ffcb6074ca2befbc821bdf30cedce679df17a7c"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.14.1/agent-dd-darwin-amd64.tar.gz"
      sha256 "8504a5d94d1b9aa1d0a16b6797bf17867328c8256b0c365dd8c68e83a1ea9fa8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-dd/releases/download/v0.14.1/agent-dd-linux-arm64.tar.gz"
      sha256 "058a577bb29b6669dbaaa5102f979afe369f4376c4c9c3beacdd2dd4258130bb"
    end
    on_intel do
      url "https://github.com/shhac/agent-dd/releases/download/v0.14.1/agent-dd-linux-amd64.tar.gz"
      sha256 "b548235244268d3e3d7ddc54e3b826b1bb8ad47d59c0e7c096dfd64047870623"
    end
  end

  def install
    bin.install "agent-dd"
    # Installs shell completions via `agent-dd completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-dd", "completion")
  end

  test do
    assert_match "0.14.1", shell_output("#{bin}/agent-dd --version")
    assert_match "Datadog triage CLI", shell_output("#{bin}/agent-dd --help")
    assert_match "#compdef agent-dd", shell_output("#{bin}/agent-dd completion zsh")
  end
end
