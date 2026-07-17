class AgentMongo < Formula
  desc "Read-only MongoDB CLI for AI agents"
  homepage "https://github.com/shhac/agent-mongo"
  version "0.11.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.11.0/agent-mongo-darwin-arm64.tar.gz"
      sha256 "c877684c45c1d0bcd2b193c06e85d0df7276539ce88e01bea63ec1f8b076f5fa"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.11.0/agent-mongo-darwin-amd64.tar.gz"
      sha256 "55c13b647c7e65abcd747bafa3dc005d90c9b2ac85231839e733dfb5b6099d5c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.11.0/agent-mongo-linux-arm64.tar.gz"
      sha256 "53d40992f47c54b4d0d95ba55276302c3ea4db07d9289c4d1f37bd42b920e125"
    end
    on_intel do
      url "https://github.com/shhac/agent-mongo/releases/download/v0.11.0/agent-mongo-linux-amd64.tar.gz"
      sha256 "3a8b08610ed67fa85221f2c615382d6b80143b871a4f4e453466d30c907d2b6f"
    end
  end

  def install
    bin.install "agent-mongo"
    # Installs shell completions via `agent-mongo completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-mongo", "completion")
  end

  test do
    assert_match "0.11.0", shell_output("#{bin}/agent-mongo --version")
    assert_match "Read-only MongoDB CLI for AI agents", shell_output("#{bin}/agent-mongo --help")
    assert_match "#compdef agent-mongo", shell_output("#{bin}/agent-mongo completion zsh")
  end
end
