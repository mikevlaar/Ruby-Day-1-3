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
  
  def initialize(name, children=[])
	if name.respond_to?('keys')
		rootNode = name.first
		name = rootNode[0]
		children = rootNode[1]
	end
	
	if children.respond_to?('keys')
		children = children.map {|childName, grandchildren| 
			Tree.new(childName, grandchildren) 
		}
	end
  
    @children = children
    @node_name = name
  end
  
  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end
  
  def visit(&block)
    block.call self
  end
end

ruby_tree = Tree.new( "Ruby", 
  [Tree.new("Reia"), 
   Tree.new("MacRuby")] )
   
ruby_tree2 = Tree.new({
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
puts

puts "Visiting a node of tree 2"
ruby_tree2.visit {|node| puts node.node_name}
puts

puts "visiting entire tree 2"
ruby_tree2.visit_all {|node| puts node.node_name}