require 'spec_helper'

RSpec.describe BinaryTree do
  let(:binary_tree) { BinaryTree.new(5) }

  describe '#initialize' do
    it 'sets data' do
      expect(binary_tree.data).to eq 5
    end

    it 'sets the parent to nil' do
      expect(binary_tree.parent).to be_nil
    end

    it 'sets the left child to nil' do
      expect(binary_tree.left).to be_nil
    end

    it 'sets the right child to nil' do
      expect(binary_tree.right).to be_nil
    end
  end

  describe '#add' do
    it 'adds 2 to the left' do
      binary_tree.add(2)
      expect(binary_tree.left.data).to eq 2
    end

    it 'adds 7 to the right' do
      binary_tree.add(7)
      expect(binary_tree.right.data).to eq 7
    end

    it 'assigns a parent to the new tree' do
      binary_tree.add(2)
      expect(binary_tree.left.parent).to eq binary_tree
    end

    it 'does not add the same value' do
      binary_tree.add(5)
      expect(binary_tree.left).to be_nil
      expect(binary_tree.right).to be_nil
    end

    it 'works deeply nested' do
      binary_tree.add(4)
      expect(binary_tree.left.data).to eq 4

      binary_tree.add(6)
      expect(binary_tree.right.data).to eq 6

      binary_tree.add(2)
      expect(binary_tree.left.left.data).to eq 2

      binary_tree.add(3)
      expect(binary_tree.left.left.right.data).to eq 3

      binary_tree.add(7)
      expect(binary_tree.right.right.data).to eq 7
    end
  end

  describe '#root?' do
    it 'returns true for root' do
      expect(binary_tree.root?).to be_truthy
    end

    it 'returns false for children' do
      binary_tree.add(6)
      expect(binary_tree.right.root?).to be_falsey
    end
  end

  describe '#remove' do
    context 'root has to be removed' do
      it 'sets the root data to nil' do
        binary_tree.remove(5)
        expect(binary_tree.data).to be_nil
      end

      it 'sets both children to nil' do
        binary_tree.add(4)
        binary_tree.add(6)
        binary_tree.remove(5)
        expect(binary_tree.left).to be_nil
        expect(binary_tree.right).to be_nil
      end
    end

    context 'a child has to be removed' do
      it "sets the parent's left child to nil" do
        binary_tree.add(4)
        binary_tree.remove(4)
        expect(binary_tree.left).to be_nil
      end

      it "sets the parent's right child to nil" do
        binary_tree.add(6)
        binary_tree.remove(6)
        expect(binary_tree.right).to be_nil
      end

      it 'returns nil if value not found' do
        expect(binary_tree.remove(100)).to be_nil
      end
    end
  end
end
