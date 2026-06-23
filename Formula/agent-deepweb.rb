class AgentDeepweb < Formula
  desc "Authenticated HTTP CLI for AI agents (curl-with-auth)"
  homepage "https://github.com/shhac/agent-deepweb"
  version "0.16.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.16.1/agent-deepweb-darwin-arm64.tar.gz"
      sha256 "d34e7a7cbf3ccde97dcb2d13c36e7022fa57ce829fc5cb185f4ba3e71d421f49"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.16.1/agent-deepweb-darwin-amd64.tar.gz"
      sha256 "daabaf17188cab314fa37aa14bc562b2ee5b9626401b9506a8db4f267ade617c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.16.1/agent-deepweb-linux-arm64.tar.gz"
      sha256 "6ae1e5e225023ef7a0ab238b4ab7f9ec6ccc91036eecf3058918b05b7474ef9e"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.16.1/agent-deepweb-linux-amd64.tar.gz"
      sha256 "5b8e6e2289e7e02eb7cc69472710da21bdad4914b03c3b20e6d67cf693706df0"
    end
  end

  def install
    bin.install "agent-deepweb"
    # Installs shell completions via `agent-deepweb completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-deepweb", "completion")
  end

  test do
    assert_match "0.16.1", shell_output("#{bin}/agent-deepweb --version")
    assert_match "Authenticated HTTP fetcher", shell_output("#{bin}/agent-deepweb --help")
    assert_match "#compdef agent-deepweb", shell_output("#{bin}/agent-deepweb completion zsh")
  end
end
