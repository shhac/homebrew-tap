class AgentDeepweb < Formula
  desc "Authenticated HTTP CLI for AI agents (curl-with-auth)"
  homepage "https://github.com/shhac/agent-deepweb"
  version "0.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.14.0/agent-deepweb-darwin-arm64.tar.gz"
      sha256 "3150e40af05fe4418b2f9e19d38c2fddadb2c926b4e699b3d83743ceb9752624"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.14.0/agent-deepweb-darwin-amd64.tar.gz"
      sha256 "29ef09e522b9f13b9ef0c46fb2570bf09967794fa1e9f606a8dda367a0e37558"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.14.0/agent-deepweb-linux-arm64.tar.gz"
      sha256 "785dbb55acf1f4ed55016ffecacf48ed82f03f21507744560a0e717425d67244"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.14.0/agent-deepweb-linux-amd64.tar.gz"
      sha256 "e0e1a36c0c004d5a877173d0a837b1f10f23565d84f9596ba98af504689a9382"
    end
  end

  def install
    bin.install "agent-deepweb"
    # Installs shell completions via `agent-deepweb completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-deepweb", "completion")
  end

  test do
    assert_match "0.14.0", shell_output("#{bin}/agent-deepweb --version")
    assert_match "Authenticated HTTP fetcher", shell_output("#{bin}/agent-deepweb --help")
    assert_match "#compdef agent-deepweb", shell_output("#{bin}/agent-deepweb completion zsh")
  end
end
