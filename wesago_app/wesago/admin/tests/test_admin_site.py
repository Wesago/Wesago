from ..site import Node


def test_node_is_added_at_end_of_parent_children():
    master = Node(name="Apples", link="wesago:index")
    child = Node(name="Oranges", link="wesago:index")
    master.add_node(child)

    assert master.children()[-1].name == child.name


def test_add_node_after():
    """add_node added node after specific node"""
    master = Node(name="Apples", link="wesago:index")

    child = Node(name="Oranges", link="wesago:index")
    master.add_node(child)

    test = Node(name="Potatoes", link="wesago:index")
    master.add_node(test, after="wesago:index")

    all_nodes = master.children()
    for i, node in enumerate(all_nodes):
        if node.name == test.name:
            assert all_nodes[i - 1].name == child.name


def test_add_node_before():
    """add_node added node  before specific node"""
    master = Node(name="Apples", link="wesago:index")

    child = Node(name="Oranges", link="wesago:index")
    master.add_node(child)

    test = Node(name="Potatoes", link="wesago:index")
    master.add_node(test, before="wesago:index")

    all_nodes = master.children()
    for i, node in enumerate(all_nodes):
        if node.name == test.name:
            assert all_nodes[i + 1].name == child.name
