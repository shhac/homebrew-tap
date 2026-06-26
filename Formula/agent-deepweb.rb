class AgentDeepweb < Formula
  desc "Authenticated HTTP CLI for AI agents (curl-with-auth)"
  homepage "https://github.com/shhac/agent-deepweb"
  version "0.17.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.17.0/agent-deepweb-darwin-arm64.tar.gz"
      sha256 "eeb88758fa77d71048037d623c534016e3d7dd9a6df98063b8983f83d3d5a89f"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.17.0/agent-deepweb-darwin-amd64.tar.gz"
      sha256 "2d22d9b5e50fed29b6a80fbae50675b71cb04cce7c00eaed640443cb90c588df"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.17.0/agent-deepweb-linux-arm64.tar.gz"
      sha256 "06fa7219b986bd68254946d96abd8fb549a14fcbfc22c7802b0a0dc596e059fe"
    end
    on_intel do
      url "https://github.com/shhac/agent-deepweb/releases/download/v0.17.0/agent-deepweb-linux-amd64.tar.gz"
      sha256 "40f9086a9e02db0ab1b5f152ebd5cb4e0bcefab72257e91c1d273ead6d750f74"
    end
  end

  def install
    bin.install "agent-deepweb"
    # Installs shell completions via `agent-deepweb completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-deepweb", "completion")
  end

  test do
    assert_match "0.17.0", shell_output("#{bin}/agent-deepweb --version")
    assert_match "Authenticated HTTP fetcher", shell_output("#{bin}/agent-deepweb --help")
    assert_match "#compdef agent-deepweb", shell_output("#{bin}/agent-deepweb completion zsh")
  end
end
