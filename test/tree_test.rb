require_relative 'test_helper'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "Test Tree BFS Implementation" do
  let (:tree) { Tree.new }

  let (:tree_with_nodes) do
    tree.add(5, 'Peter')
    tree.add(3, 'Paul')
    tree.add(1, 'Mary')
    tree.add(10, 'Karla')
    tree.add(15, 'Ada')
    tree.add(25, 'Kari')
    tree
  end

  let (:empty_tree) { Tree.new }

  it 'returns the value of a target node that exists in the tree' do
    expect(tree_with_nodes.bfs_queue(3)).must_equal 'Paul'
  end

  it 'returns nil for an empty tree' do
    expect(empty_tree.bfs_queue(5)).must_be_nil
  end

  it 'returns nil for a tree that does not have target node' do
    expect(tree_with_nodes.bfs_queue(13)).must_be_nil
  end
end