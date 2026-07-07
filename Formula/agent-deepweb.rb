class AgentDeepweb < Formula
  desc "Authenticated HTTP CLI for AI agents (curl-with-auth)"
  homepage "https://github.com/shhac/agent-deepweb"
  version "0.18.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.18.1/agent-deepweb-darwin-arm64.tar.gz"
      sha256 "5f30205f2e84adb9e71ad4c73a147d305d6eb2f5c78bbc06dfb9d9698e333b81"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.18.1/agent-deepweb-darwin-amd64.tar.gz"
      sha256 "7e0169334232dfd51043b84f8a5cb49d2954662e1132c2269f45bcc5fa0d66eb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.18.1/agent-deepweb-linux-arm64.tar.gz"
      sha256 "47321128e6a169367d9e2f9c2b5bba0e719bb4889dcee8393fbfa836a095134a"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.18.1/agent-deepweb-linux-amd64.tar.gz"
      sha256 "8aa8599ac66b937f557cb90fa68256b6be9b4d89a554173327d948d5a4129c4f"
    end
  end

  def install
    bin.install "agent-deepweb"
    # Installs shell completions via `agent-deepweb completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-deepweb", "completion")
  end

  test do
    assert_match "0.18.1", shell_output("#{bin}/agent-deepweb --version")
    assert_match "Authenticated HTTP fetcher", shell_output("#{bin}/agent-deepweb --help")
    assert_match "#compdef agent-deepweb", shell_output("#{bin}/agent-deepweb completion zsh")
  end
end
