class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.5.0/lin-darwin-arm64.tar.gz"
      sha256 "ff8d583416256759b2dc45123399c85307716377770d341c9e4cd2e4c3a40dcc"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.5.0/lin-darwin-x64.tar.gz"
      sha256 "d12436eabe9e2169fa3553a837c4a8ff8a4b4dc9226e8c31f8a3aa4140e50b45"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.5.0/lin-linux-arm64.tar.gz"
      sha256 "a06637a34b18bb8954f45115391ce3591ab16bfe5436798d668d94be31f41889"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.5.0/lin-linux-x64.tar.gz"
      sha256 "cc6f9fe1cabb80808a5bb0d91b3f2217fd0363ee0b18979dcfeb4af20778e999"
    end
  end

  def install
    bin.install Dir["lin-*"].first => "lin"
  end

  test do
    assert_match "0.5.0", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI", shell_output("#{bin}/lin --help")
  end
end
