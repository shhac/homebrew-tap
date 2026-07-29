class AgentDlocal < Formula
  desc "dLocal payments investigation and triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-dlocal"
  version "0.1.0"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-dlocal/releases/download/v0.1.0/agent-dlocal-darwin-arm64.tar.gz"
      sha256 "192c733be56e91ea43d4e878929e143d22e2f61845fb4d1b1052d288c9f90666"
    end
    on_intel do
      url "https://github.com/shhac/agent-dlocal/releases/download/v0.1.0/agent-dlocal-darwin-amd64.tar.gz"
      sha256 "5510d4b52bfd9b40bb0efc1e9864b0373fb8a34dce3063c5d82ce2b8db2f20c6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-dlocal/releases/download/v0.1.0/agent-dlocal-linux-arm64.tar.gz"
      sha256 "4a02c5077c071b0c9f831ef259e5395002430c792d03912158bcd47367a8067f"
    end
    on_intel do
      url "https://github.com/shhac/agent-dlocal/releases/download/v0.1.0/agent-dlocal-linux-amd64.tar.gz"
      sha256 "699d39dcd9116da66999881e9ad9acdb0daa9c882f306de009f7e79acd29245b"
    end
  end

  def install
    bin.install "agent-dlocal"
    # Installs shell completions via `agent-dlocal completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-dlocal", "completion")
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/agent-dlocal --version")
    assert_match "dLocal payments investigation and triage CLI", shell_output("#{bin}/agent-dlocal --help")
    assert_match "#compdef agent-dlocal", shell_output("#{bin}/agent-dlocal completion zsh")
  end
end
