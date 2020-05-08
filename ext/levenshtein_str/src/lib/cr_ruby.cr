lib CrRuby
  # every ruby Object is a VALUE
  type VALUE = Void*
  # ruby method typing
  type METHOD_FUNC = VALUE, VALUE -> VALUE

  # a ruby Class is a VALUE
  $rb_cObject : VALUE

  # a ruby Module is also a VALUE
  $rb_mObject : VALUE

  # convert Ruby str to C str
  fun rb_str_new_cstr(str : UInt8*) : VALUE

  # convert Ruby str to plain string
  fun rb_str_to_str(value: VALUE) : VALUE

  # convert plain string pointer to C string pointer
  fun rb_string_value_cstr(value_ptr : VALUE*) : UInt8*

  # ruby Integer to crystal int
  fun rb_num2int(value : VALUE) : Int32

  # crystal int to ruby Integer
  fun rb_int2inum(value : Int32) : VALUE

  # define ruby class in C
  fun rb_define_class(name: UInt8*, super: VALUE) : VALUE

  # define ruby module in C
  fun rb_define_module(name: UInt8*) : VALUE

  # define ruby method in C
  fun rb_define_method(klass: VALUE, name: UInt8*, func: METHOD_FUNC, argc: Int32)
end

class String
  def to_ruby
    CrRuby.rb_str_new_cstr self
  end

  def self.from_ruby(ruby_str : CrRuby::VALUE)
    plain_string = CrRuby.rb_str_to_str(ruby_str)
    c_string = CrRuby.rb_string_value_cstr(pointerof(plain_string))
    new(c_string)
  end
end

struct Int32
  def to_ruby
    CrRuby.rb_int2inum(self)
  end

  def self.from_ruby(ruby_int : CrRuby::VALUE)
    CrRuby.rb_num2int(ruby_int)
  end
end
