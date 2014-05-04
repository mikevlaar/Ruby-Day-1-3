#---
# Excerpted from "Seven Languages in Seven Weeks",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/btlang for more book information.
#---
class Tree
	attr_accessor :children, :node_name
  
	def initialize(aHashTree)
		@node_name = aHashTree.keys[0]
		@children = []

		aHashTree[@node_name].collect{ |key, value| 
			@children.push(Tree.new(key => value))
		}
	end
  
	def visit_all(&block)
		visit &block
		children.each {|c| c.visit_all &block}
	end

	def visit(&block)
		block.call self
	end
end
   
ruby_tree = Tree.new({
        "grandpa" => {
            "dad" => {
                "child1" => {},
                "child2" => {}
            },
            "uncle" => {
                "child3" => {},
                "child4" => {}
            }
        }
    })

puts "Visiting a node of tree"
ruby_tree.visit {|node| puts node.node_name}
puts

puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}