require "language/node"

class Czg < Formula
  desc "Interactive Commitizen CLI that generate standardized commit messages"
  homepage "https://github.com/Zhengqbbb/cz-git"
  url "https://registry.npmjs.org/czg/-/czg-1.7.0.tgz"
  sha256 "a6861c5090450c8f0e72580d7754070c52c817217ca018bf63605bd738c29c5b"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "801d746f8c8ffb4117c511f32f900667051e0bc4e4fc7a83b207b93682ff84bf"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_equal "#{version}\n", shell_output("#{bin}/czg --version")
    # test: git staging verifies is working
    system "git", "init"
    assert_match ">>> No files added to staging! Did you forget to run `git add` ?",
      shell_output("NO_COLOR=1 #{bin}/czg 2>&1", 1)
  end
end
