class AgentMongo < Formula
  desc "Read-only MongoDB CLI for AI agents"
  homepage "https://github.com/shhac/agent-mongo"
  version "0.10.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.10.1/agent-mongo-darwin-arm64.tar.gz"
      sha256 "1f3ef05c83446e384cc459334023cc96b1cc03339b2dad19f1d116fa9a884912"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.10.1/agent-mongo-darwin-amd64.tar.gz"
      sha256 "a9d137739559f00e5bfcc98ea60c9f2f5bb0d3077d4a6cbddaa37b6aa11e4833"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.10.1/agent-mongo-linux-arm64.tar.gz"
      sha256 "684c6eeae902329f0952dcb2141d45a0d56bed14247ac8bf0e32a650106177b3"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.10.1/agent-mongo-linux-amd64.tar.gz"
      sha256 "e467249d068af2ee38f3f827b336ec7c5dd95aebb80198ae2c18981719ca005b"
    end
  end

  def install
    bin.install "agent-mongo"
    # Installs shell completions via `agent-mongo completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-mongo", "completion")
  end

  test do
    assert_match "0.10.1", shell_output("#{bin}/agent-mongo --version")
    assert_match "Read-only MongoDB CLI for AI agents", shell_output("#{bin}/agent-mongo --help")
    assert_match "#compdef agent-mongo", shell_output("#{bin}/agent-mongo completion zsh")
  end
end
