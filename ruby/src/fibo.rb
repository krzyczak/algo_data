class Fibo
  def initialize
    @memo = {
      0 => 0,
      1 => 1
    }
  end

  def call(n)
    return 0 if n == 0
    return 1 if n == 1

    return call(n - 1) + call(n - 2)
  end

  def memo(n)
    @memo[n] || (@memo[n] = (memo(n-1) + memo(n-2)))
  end

  def iter(n)
    i = 2

    while i <= n
      @memo[i] = @memo[i-1] + @memo[i-2]
      i += 1
    end

    @memo[n]
  end

  def self.call(n)
    new.call(n)
  end

  def self.memo(n)
    new.memo(n)
  end

  def self.iter(n)
    new.iter(n)
  end
end
