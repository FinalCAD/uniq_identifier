module ClassGenerator
  extend self

  def generate(**opts)
    if defined? Mongoid
      generate_mongoid_document!(opts)
    else
      generate_active_record!(opts)
    end
  end

  private

  def generate_active_record!(**opts)
    klass = ::Class.new(::User)

    def klass.name
      'User'
    end

      klass.inheritance_column = '__'
    klass.define_model_callbacks :initialize # reset initialize callbacks
    klass.uniq_identifier opts
    klass
  end

  def generate_mongoid_document!(**opts)
    klass = ::Class.new(::User)

    def klass.name
      'User'
    end

    klass.define_model_callbacks :initialize # reset initialize callbacks
    klass.uniq_identifier opts
    klass
  end
end
