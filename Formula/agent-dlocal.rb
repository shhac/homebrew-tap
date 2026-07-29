class AgentDlocal < Formula
  desc "dLocal payments investigation and triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-dlocal"
  version "0.2.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-dlocal/releases/download/v0.2.0/agent-dlocal-darwin-arm64.tar.gz"
      sha256 "876787a428b8d42924987827e42c741f824c01b09593d16fa16c93f433eb365d"
    end
    on_intel do
      url "https://github.com/shhac/agent-dlocal/releases/download/v0.2.0/agent-dlocal-darwin-amd64.tar.gz"
      sha256 "33d4b727a78e3f84e2ed51121f0fdd8a9b3564b367482f70422af5a27275b5af"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-dlocal/releases/download/v0.2.0/agent-dlocal-linux-arm64.tar.gz"
      sha256 "fb75b42cdbf4926079fade60529940b7ef314880478d15c103189c22bb66dfdb"
    end
    on_intel do
      url "https://github.com/shhac/agent-dlocal/releases/download/v0.2.0/agent-dlocal-linux-amd64.tar.gz"
      sha256 "14645238ec1f792d00d33e977b8ac790fb214ed27af4550e22bb0543ec069dd0"
    end
  end

  def install
    bin.install "agent-dlocal"
    # Installs shell completions via `agent-dlocal completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-dlocal", "completion")
  end

  test do
    assert_match "0.2.0", shell_output("#{bin}/agent-dlocal --version")
    assert_match "dLocal payments investigation and triage CLI", shell_output("#{bin}/agent-dlocal --help")
    assert_match "#compdef agent-dlocal", shell_output("#{bin}/agent-dlocal completion zsh")
  end
end
