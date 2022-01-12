module Environment
    class Depot
        attr_accessor :packs
        def initialize 
            @packs = {
                :simple_transportation_pack => {
                    :intelligence => "cellphone",
                    :items => "mediapack, chevy_versa"
                },
                :standard_transportation_pack =>{
                    :intelligence => "cellphone, antena",
                    :arsenal => "colt_1911",
                    :items => "handcuff, mediapack, chemistry, financial"
                },
                :simple_mission_pack =>{
                    :intelligence => "infopack, laptop, cellphone, antenna",
                    :arsenal => "colt_191",
                    :items => "handcuffs, mediapack, chemistry, financial"
                },
                :standard_mission_pack =>{
                    :intelligence => "infopack, laptop, cellphone, antenna",
                    :arsenal => "remington_870, colt_1911, machete, hatchet",
                    :items => "handcuffs, mediapack, chemistry, financial"
                }
            }
        end
        
    end

    class Control
        attr_accessor :missions
        @@mission_state = [:paused, :aborted, :failed, :accomplished]
        def initialize
            @missions = Hash.new
        end
    
        def new_mission(name:, objective:, pack:)
            @missions[name]= {
                    :objective => objective,
                    :pack => pack,
                    :status => :active
                }
        end
        @@mission_state.each do |state|
            define_method("set_mission_to_#{state}") do |arg|
                @missions[arg][:status] = state
            end
        end

    end

    class Human
        attr_accessor :id, :name, :personal_data, :professional_data, :human
        
        def initialize(name:)
            @id = object_id
            @name = name
        end
        
        define_method("set_personal_data") do |surname:, age:, country:, language:, marital_status:, children:|
            @personal_data = {
                :surname => surname,
                :age => age,
                :country => country,
                :language => language,
                :marital_status => marital_status,
                :children => children
            }
        end
        define_method("set_professional_data") do |position:, occupation:, skills:, observations:|
            @professional_data = {
                :position => position,
                :occupation => occupation,
                :skills => skills,
                :observations => observations
            }
        end

        class Worker < Human
            attr_accessor :standard_shift, :extra_shift
            def initialize(name:)
                super name: name
                @standard_shift = {
                    :id => object_id,
                    :hours => 8,
                    :payment => 8,
                    :facility => String.new,
                    :status => nil
                }
                @extra_shift = {
                    :id => object_id,
                    :hours => 0,
                    :payment => 0.0,
                    :facility => String.new,
                    :status => nil
                }
            end
        end

    end
    #Optional Practice: Activity 1
    class Dictionary
        attr_accessor :expressions
        @@expressions_sentences = [:hello, :goodbye, :my_name_is, :i_come_from]
        def initialize
            @expressions = {
                :hello => { 
                    :en => 'hello', 
                    :es => 'hola', 
                    :cz => 'ahoj' 
                },
                :goodbye => {
                    :en => 'goodbye', 
                    :es => 'adios', 
                    :cz => 'nashledanou' 
                },
                :my_name_is =>{
                    :en => 'my name is', 
                    :es => 'mi nombre es', 
                    :cz => 'jmenuju se' 
                },
                :i_come_from =>{
                    :en => 'i come from', 
                    :es => 'yo vengo de', 
                    :cz => 'ja odchazim od' 
                }
            }
        end
        
        @@expressions_sentences.each do |sentence|
            define_method("say_#{sentence}") do |lang|
                @expressions[sentence][lang]
            end
        end


    end
end

