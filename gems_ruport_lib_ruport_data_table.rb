class Table
  def method_missing(id, *args, &block)
    return as($1.to_sym, *args, &block) if id.to_s =~ /^to_(.*)/
    return rows_with($1.to_sym => args[0]) if id.to_s =~ /^rows_with_(.*)/
    super
  end
  
  #...
