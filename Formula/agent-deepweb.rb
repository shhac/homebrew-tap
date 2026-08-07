class AgentDeepweb < Formula
  desc "Authenticated HTTP CLI for AI agents (curl-with-auth)"
  homepage "https://github.com/shhac/agent-deepweb"
  version "0.18.2"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.18.2/agent-deepweb-darwin-arm64.tar.gz"
      sha256 "c4575ac709dd7511e320689d3f531b0b59c65c153f536e6db25fdc5b736bd7a3"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.18.2/agent-deepweb-darwin-amd64.tar.gz"
      sha256 "7cf039acb1942d65ee9e553c4b8bb679016126dc34f895a10339ff4057519acc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.18.2/agent-deepweb-linux-arm64.tar.gz"
      sha256 "e4d8eb9a15ac66ca61d112e5e7d88b5c320a6e15c056aaf2c8f240683b830e90"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.18.2/agent-deepweb-linux-amd64.tar.gz"
      sha256 "3d820c7b21780edfd3f8bcc600a839363398d8e04a32427f13ee523e1d064bec"
    end
  end

  def install
    bin.install "agent-deepweb"
    # Installs shell completions via `agent-deepweb completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-deepweb", "completion")
  end

  test do
    assert_match "0.18.2", shell_output("#{bin}/agent-deepweb --version")
    assert_match "Authenticated HTTP fetcher", shell_output("#{bin}/agent-deepweb --help")
    assert_match "#compdef agent-deepweb", shell_output("#{bin}/agent-deepweb completion zsh")
  end
end
