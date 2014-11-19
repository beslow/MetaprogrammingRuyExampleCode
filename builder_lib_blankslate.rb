class BlankSlate
  #在一个白板类中隐藏名为给定name的方法。
  #但不隐藏instance_eval方法或任何以"_"打头的方法。
  def self.hide(name)
    if instance_methods.include?(name.to_s) and
      name !~ /^(_|instance_eval)/
      @hidden_methods ||= {}
      @hidden_methods[name.to_sym] = instance_method(name)
      undef_method name
    end
  end
  
  instance_methods.each { |m| hide(m) }
  
  #...
