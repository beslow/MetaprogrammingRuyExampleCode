class Computer
  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
  end
  
  def method_missing(method, *args)
    super if !@data_source.respond_to?("get_#{name}_info")
    info = @data_source.send("get_#{method}_info", args[0])
    price = @data_source.send("get_#{method}_price", args[0])
    result = "#{method.capitalize}: #{info} ($#{price})"
    return "* #{result}" if price >= 100
    result
  end
end
