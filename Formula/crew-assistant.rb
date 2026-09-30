class CrewAssistant < Formula
  desc "Personal AI assistant for coordinating project agents"
  homepage "https://github.com/shhac/crew-assistant"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.35.0/crew-assistant-darwin-arm64.tar.gz"
      sha256 "50fe91b2b7a59966fef495d7147b7e4143870cdc6d0bb7c675248553a03c7da3"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.35.0/crew-assistant-darwin-amd64.tar.gz"
      sha256 "7423c31474954c4b0887ca987ae2a5790ff47d44e5a56ea5a5338a9736f5d183"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.35.0/crew-assistant-linux-arm64.tar.gz"
      sha256 "d0b3df86b39eed68e10ee08010acba62af2f40c472b9424e00081c6b8da05275"
    end
    on_intel do
      url "https://github.com/shhac/crew-assistant/releases/download/v0.35.0/crew-assistant-linux-amd64.tar.gz"
      sha256 "7e381bbe580985678fe396b33bc4aa5499dc8e7d263e6221e4f1f1965b6eda14"
    end
  end

  def install
    bin.install "crew-assistant"
    # Installs shell completions via `crew-assistant completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"crew-assistant", "completion")
  end

  test do
    assert_match "0.35.0", shell_output("#{bin}/crew-assistant --version")
    assert_match "A personal assistant that coordinates agents", shell_output("#{bin}/crew-assistant --help")
    assert_match "#compdef crew-assistant", shell_output("#{bin}/crew-assistant completion zsh")
  end
end
