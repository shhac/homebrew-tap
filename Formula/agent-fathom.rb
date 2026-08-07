class AgentFathom < Formula
  desc "Fathom meeting intelligence CLI for AI agents"
  homepage "https://github.com/shhac/agent-fathom"
  version "0.2.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-fathom/releases/download/v0.2.0/agent-fathom-darwin-arm64.tar.gz"
      sha256 "38d4be79b0a20c436f5690191b0d6036b17ebc92a2083f0a38767c163ee88349"
    end
    on_intel do
      url "https://github.com/shhac/agent-fathom/releases/download/v0.2.0/agent-fathom-darwin-amd64.tar.gz"
      sha256 "146bd279ba17803cc95e1f0a227040b6bdd5e9d2b0d3c83210d5a20802ba60ba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-fathom/releases/download/v0.2.0/agent-fathom-linux-arm64.tar.gz"
      sha256 "9cfe8c1bd8d8a90047171212c7a7c5a8557df76585028298908456293f1342f4"
    end
    on_intel do
      url "https://github.com/shhac/agent-fathom/releases/download/v0.2.0/agent-fathom-linux-amd64.tar.gz"
      sha256 "8a536f96bee57c02b9b27e910f460e037b6224742d539f90e0d479755e2eebad"
    end
  end

  def install
    bin.install "agent-fathom"
    # Installs shell completions via `agent-fathom completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-fathom", "completion")
  end

  test do
    assert_match "0.2.0", shell_output("#{bin}/agent-fathom --version")
    assert_match "Fathom meeting intelligence CLI", shell_output("#{bin}/agent-fathom --help")
    assert_match "#compdef agent-fathom", shell_output("#{bin}/agent-fathom completion zsh")
  end
end
