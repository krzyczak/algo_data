import java.util.Arrays;
import java.util.stream.*;

class Vertex {
  public Vertex(int value, Vertex left, Vertex right) {
    this.value = value;
    this.left = left;
    this.right = right;
  }

  public Vertex(int value) {
    this.value = value;
    this.left = null;
    this.right = null;
  }

  public int value;
  public Vertex left;
  public Vertex right;
}

class Util {
  public static int[] concat3Arrays(int[] a1, int[] a2, int [] a3) {
    int[] a2a3 = IntStream.concat(Arrays.stream(a2), Arrays.stream(a3)).toArray();

    int[] a1a2a3 = IntStream.concat(Arrays.stream(a1), Arrays.stream(a2a3)).toArray();

    return a1a2a3;
  }
}

class DepthFirstTraversal {
  public static int[] collect(Vertex node) {
    if(node == null) {
      int[] x = new int[0];
      return x;
    }

    int[] currentValue = {node.value};
    int[] l = collect(node.left);
    int[] r = collect(node.right);

    int[] nlr = Util.concat3Arrays(currentValue, l, r);

    return nlr;
  }

  public static int countLeftMostNodes(Vertex node) {
    if(node == null) {
      return 0;
    }

    return 1 + Math.max(countLeftMostNodes(node.left), countLeftMostNodes(node.right));
  }
}

class Main {
  public static void main(String[] args) {
    Vertex tree1 = new Vertex(
      4,
      new Vertex(2, new Vertex(1), new Vertex(5, null, new Vertex(7))),
      new Vertex(3, new Vertex(8, new Vertex(3, new Vertex(1), null), null), new Vertex(2))
    );

    Vertex tree2 = new Vertex(
      4,
      new Vertex(7, new Vertex(10), new Vertex(2, null, new Vertex(6, new Vertex(2), null))),
      new Vertex(9, null, new Vertex(6))
    );

    int[] result1 = DepthFirstTraversal.collect(tree1);
    int[] expectedResult1 = {4, 2, 1, 5, 7, 3, 8, 3, 1, 2};

    int[] result2 = DepthFirstTraversal.collect(tree2);
    int[] expectedResult2 = {4, 7, 10, 2, 6, 2, 9, 6};

    System.out.println("\nDepth-First collect:");
    System.out.println(Arrays.equals(expectedResult1, result1));
    System.out.println(Arrays.equals(expectedResult2, result2));

    System.out.println("\nLeft-most nodes count:");

    Vertex tree3 = new Vertex(
      8,
      new Vertex(3, new Vertex(1), new Vertex(6, new Vertex(4), new Vertex(7))),
      new Vertex(10, null, new Vertex(14, new Vertex(13), null))
    );

    Vertex tree4 = new Vertex(
      10,
      new Vertex(8, new Vertex(4, null, new Vertex(5, null, new Vertex(6))), null),
      new Vertex(15, new Vertex(14), new Vertex(16))
    );

    Vertex tree5 = new Vertex(
      2,
      new Vertex(8),
      new Vertex(1, null, new Vertex(5, null, new Vertex(3)))
    );

    Vertex tree6 = new Vertex(
      4,
      new Vertex(3, null, new Vertex(1)),
      new Vertex(2, new Vertex(6), new Vertex(7))
    );

    int leftMostCount3 = DepthFirstTraversal.countLeftMostNodes(tree3);
    int expectedLeftMostCount3 = 4;
    System.out.println(expectedLeftMostCount3 == leftMostCount3);

    int leftMostCount4 = DepthFirstTraversal.countLeftMostNodes(tree4);
    int expectedLeftMostCount4 = 5;
    System.out.println(expectedLeftMostCount4 == leftMostCount4);

    int leftMostCount5 = DepthFirstTraversal.countLeftMostNodes(tree5);
    int expectedLeftMostCount5 = 4;
    System.out.println(expectedLeftMostCount5 == leftMostCount5);

    int leftMostCount6 = DepthFirstTraversal.countLeftMostNodes(tree6);
    int expectedLeftMostCount6 = 3;
    System.out.println(expectedLeftMostCount6 == leftMostCount6);
  }
}
