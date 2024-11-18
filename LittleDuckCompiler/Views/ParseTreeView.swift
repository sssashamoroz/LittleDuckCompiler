import SwiftUI
import Antlr4

struct PTNode: Identifiable {
    var id = UUID()
    var text: String
    var children: [PTNode]
    
    init(node: ParseTree) {
        self.text = node.getText() ?? node.description
        self.children = (0..<node.getChildCount()).compactMap { index in
            guard let child = node.getChild(index) as? ParseTree else { return nil }
            return PTNode(node: child)
        }
    }
    
    init(text: String, children: [PTNode] = []) {
        self.text = text
        self.children = children
    }
}

struct ParseTreeContainerView: View {
    @State private var offset: CGSize = .zero  // Offset for panning
    @GestureState private var dragOffset = CGSize.zero

    var rootNode: PTNode?

    var body: some View {
        ScrollView([.horizontal, .vertical]) {
            if let rootNode = rootNode {
                TreeNodeView(node: rootNode)
                    .offset(x: offset.width + dragOffset.width, y: offset.height + dragOffset.height)
                    .gesture(
                        DragGesture()
                            .updating($dragOffset) { value, state, _ in
                                state = value.translation
                            }
                            .onEnded { value in
                                offset.width += value.translation.width
                                offset.height += value.translation.height
                            }
                    )
            } else {
                Text("No parse tree to display")
                    .foregroundColor(.gray)
            }
        }
    }
}

struct TreeNodeView: View {
    var node: PTNode

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text(node.text)
                .padding(8)
                .background(Circle().fill(Color.gray))
                .foregroundColor(.black)
                .bold()
            
            if !node.children.isEmpty {
                HStack(alignment: .top, spacing: 50) {
                    ForEach(node.children) { child in
                        VStack {
                            TreeNodeView(node: child)
                        }
                        .background(GeometryReader { geometry in
                            let parentCenter = CGPoint(x: geometry.frame(in: .global).midX, y: geometry.frame(in: .global).minY)
                            let childCenter = CGPoint(x: geometry.frame(in: .global).midX, y: geometry.frame(in: .global).maxY)
                            
                            Path { path in
                                path.move(to: parentCenter)
                                path.addLine(to: childCenter)
                            }
                            .stroke(Color.gray.opacity(0.2), lineWidth: 2)
                        })
                    }
                }
            }
        }
    }
}

struct ParseTreeContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ParseTreeContainerView(rootNode: PTNode(text: "Root", children: [
            PTNode(text: "C1", children: [
                PTNode(text: "G1"),
                PTNode(text: "G2")
            ]),
            PTNode(text: "C2")
        ]))
        .frame(width: 400, height: 500)
        .background(Color.white)
    }
}
